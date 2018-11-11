/*
 *
 * Copyright 2018 - BT-Soft
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * NanoSpotWelder-3.cpp
 *
 *  Created on: 2018. nov. 1.
 *      Author: BT
 */
#include <Arduino.h>
#include <Wire.h>
#include <TimerOne.h>

#include "PinOuts.h"
#include "Display.h"
#include "RotaryEncoder.h"
#include "Config.h"

Config *pConfig;
Display *pDisplay;
MOTTemp *pMOTTemp;

//Rotary Encoder
RotaryEncoder *pRotaryEncoder;

//--- MOT H�m�rs�klet kezel�se ---------------------------------------------------------------------------------------------------------------------------

//A konfigban megadott ventil�tor riaszt�si �C �rt�k el�tt ennyivel bekapcsolunk, vagy ennyivel ut�na kikapcsolunk
#define VENTILATOR_TRIGGER_OFFSET_VALUE	10

/**
 * Ventil�tor vez�rl�se
 */
void ventilatorController(float *currentMotTemp) {

	int triggerValue = pConfig->configVars.motTempAlarm - VENTILATOR_TRIGGER_OFFSET_VALUE;

	if (triggerValue > *currentMotTemp) {
		if (digitalRead(PIN_VENTILATOR)) {
			digitalWrite(PIN_VENTILATOR, LOW);
		}

	} else if (triggerValue <= *currentMotTemp) {
		if (!digitalRead(PIN_VENTILATOR)) {
			digitalWrite(PIN_VENTILATOR, HIGH);
		}
	}
}

//--- Spot Welding ---------------------------------------------------------------------------------------------------------------------------------------
typedef enum weldState_t {
	PRE_WELD, 		//El�impulzus
	PAUSE_WELD,  	//Sz�net a k�t impulzus k�z�tt
	WELD, 			//Hegeszt� impulzus
	PACKET_PAUSE,	//Hegeszt�si csomagok k�z�tti v�rakoz�s
	WELD_END 		//Nincs hegeszt�s
} WeldState_T;

volatile WeldState_T weldCurrentState = WELD_END; //hegeszt�si �llapot jelz�
volatile uint8_t weldPeriodCnt = 0; //Peri�dus Sz�ml�l�, hegeszt�s alatt megszak�t�skor inkrement�l�dik
volatile uint8_t weldBundleCnt = 0; //hegeszt�si csomagok sz�ml�l�ja

/**
 * ZCD interrupt rutin
 */
void zeroCrossDetect(void) {

	//Ha nincs pre (ez esetben m�r a pause sem �rdekel), akkor mehet egyb�l a weld
	if (weldCurrentState == PRE_WELD && pConfig->configVars.preWeldPulseCnt == 0) {
		weldPeriodCnt = 0;
		weldCurrentState = WELD;
	}

	switch (weldCurrentState) {

	//A pre-ben vagyunk
	case PRE_WELD:
		//A Triakot csak akkor kapcsoljuk be, ha van el�inpulzus sz�m a konfigban, �s nincs m�g bekapcsolva
		if (!digitalRead(PIN_TRIAC) && pConfig->configVars.preWeldPulseCnt > 0) {
			weldPeriodCnt = 0;
			digitalWrite(PIN_TRIAC, HIGH); //TRIAC BE
			return;
		}

		if (++weldPeriodCnt >= pConfig->configVars.preWeldPulseCnt) {
			digitalWrite(PIN_TRIAC, LOW); //TRIAC KI
			weldPeriodCnt = 0;
			weldCurrentState = PAUSE_WELD;
		}
		break;

		//A pause-ban vagyunk
	case PAUSE_WELD:
		if (++weldPeriodCnt >= pConfig->configVars.pausePulseCnt) {
			weldPeriodCnt = 0;
			weldCurrentState = WELD;
		}
		break;

		//A f� hegeszt�sben vagyunk
	case WELD:
		//bekapcsoljuk a triakot, ha m�g nincs bekapcsolva
		if (!digitalRead(PIN_TRIAC)) {
			weldPeriodCnt = 1;
			digitalWrite(PIN_TRIAC, HIGH); //TRIAC BE
			return;
		}

		//Ha el�rt�k a pulzussz�mot, akkor kikapcsolunk �s megvizsg�ljuk, hogy kell-e a csomagokkal foglalkoznunk?
		if (++weldPeriodCnt >= pConfig->configVars.weldPulseCnt) {

			digitalWrite(PIN_TRIAC, LOW); //TRIAC KI

			if (pConfig->configVars.packetCnt == 1 //csak egy csomag van megadva?
			|| ++weldBundleCnt >= pConfig->configVars.packetCnt //t�bb csomag eset�n el�rt�k m�r a csomagok sz�m�t?
					) {
				weldCurrentState = WELD_END;
			} else {
				//Ha t�bb hegeszt�si csomag van be�ll�tva, akkor elkezdj�k a csomagok k�z�tti v�rakoz�st
				weldPeriodCnt = 0;
				weldCurrentState = PACKET_PAUSE;
			}
		}
		break;

		//K�t hegeszt�si csomag k�z�tti v�rakoz�ban vagyunk
	case PACKET_PAUSE:
		//el�rt�k m�r a k�t csomag k�z�tti v�rakoz� impulzuszok sz�m�t?
		if (++weldPeriodCnt >= pConfig->configVars.packetPauseCnt) {
			weldPeriodCnt = 0;
			weldCurrentState = PRE_WELD;
		}
		break;

		//Hegeszt�s v�ge
	case WELD_END:
		//Igazib�l itt m�r nem csin�lunk semmit sem
		digitalWrite(PIN_TRIAC, LOW);	//triak ki, csak a biztons�g kedv��rt
		break;
	}
}

/**
 * Hegeszt�si protokoll
 */
void weldButtonPushed(void) {
#define SLEEP_TIME_MICROSEC 100

	//LED-be
	digitalWrite(PIN_WELD_LED, HIGH);

	//Ha pulzussz�ml�l�s van
	if (pConfig->configVars.pulseCountWeldMode) {

		//R�k�lt�z�nk a ZCD interrupt-ra
		attachInterrupt(digitalPinToInterrupt(PIN_ZCD), zeroCrossDetect, FALLING);

		//Be�ll�tjuk, hogy a PRE_WELD �llapotb�l induljunk
		weldCurrentState = PRE_WELD;
		weldBundleCnt = 0;

		//Megv�rjuk a hegeszt�si folyamat v�g�t
		while (weldCurrentState != WELD_END) {
			delayMicroseconds(SLEEP_TIME_MICROSEC);
		}

		//Lesz�llunk a ZCD interrupt-r�l
		detachInterrupt(digitalPinToInterrupt(PIN_ZCD));

	} else { //K�zi hegeszt�s vez�rl�s van

		digitalWrite(PIN_TRIAC, HIGH); //TRIAC BE

		//Addig am�g a gomb le van nyomva, addig nem mozdulunk innen
		while (digitalRead(PIN_WELD_BUTTON)) {
			delayMicroseconds(SLEEP_TIME_MICROSEC * 20);
		}

		digitalWrite(PIN_TRIAC, LOW); //TRIAC KI
	}

	{ //Csak a biztons�g kedv��rt...
		digitalWrite(PIN_TRIAC, LOW);	//TRIAC ki
		weldCurrentState = WELD_END;    //Nincs hegeszt�s �llapot
	}

	digitalWrite(PIN_WELD_LED, LOW); //LED ki
}

/**
 *
 */
void encoderISR() {
	pRotaryEncoder->service();
}

/**
 * Setup
 */
void setup() {
#ifdef SERIAL_DEBUG
	Serial.begin(SERIAL_BAUD_RATE);
	Serial.println(F("Serial debug active"));
#endif

	//Config
	pConfig = new Config();
	pConfig->read();

	pDisplay = new Display(PIN_LCD_SCLK, PIN_LCD_DIN, PIN_LCD_DC, PIN_LCD_CS, PIN_LCD_RST, PIN_LCD_BLACKLIGHT);
	pDisplay->init();
	pDisplay->drawSplashScreen();

	//H�m�r� felh�z�sa
	pMOTTemp = new MOTTemp();

	//Rotary Encoder felh�z�sa
	pRotaryEncoder = new RotaryEncoder(PIN_ENCODER_CLK, PIN_ENCODER_DT, PIN_ENCODER_SW);
	pRotaryEncoder->setDoubleClickEnabled(true);
	pRotaryEncoder->setAccelerationEnabled(false);
	Timer1.initialize(1000);
	Timer1.attachInterrupt(encoderISR);

	//Weld button PIN
	pinMode(PIN_WELD_BUTTON, INPUT);

	//--- ZCD input felh�z�sa
	pinMode(PIN_ZCD, INPUT_PULLUP);

	//--- Triac PIN
	pinMode(PIN_TRIAC, OUTPUT);
	digitalWrite(PIN_TRIAC, LOW);

	//--- Weld LED PIN
	pinMode(PIN_WELD_LED, OUTPUT);
	digitalWrite(PIN_WELD_LED, LOW);

	//--- Ventil�tor
	pinMode(PIN_VENTILATOR, OUTPUT);
	digitalWrite(PIN_VENTILATOR, LOW);

	//Main page kirajzol�sa
	pDisplay->menuState = Display::FORCE_MAIN_DISPLAY;
	delay(3000);
}

/**
 * Loop
 */
void loop() {

	static byte weldButtonPrevState = HIGH;   //A hegeszt�s gomb el�z� �llapota

	//Kiolvassuk a weld button �llapot�t
	byte weldButtonCurrentState = digitalRead(PIN_WELD_BUTTON);

	//Ha v�ltozott az �llapot LOW -> HIGH ir�nyban
	if (weldButtonCurrentState != weldButtonPrevState && weldButtonCurrentState == HIGH && weldButtonPrevState == LOW) {

		//ha benne voltunk a men�ben, akkor a hegeszt�s v�g�n kil�p�nk bel�le
		pDisplay->menuState = Display::FORCE_MAIN_DISPLAY;

		//Mehet a hegeszt�s
		weldButtonPushed();

		delay(100); //weld button debounce -> r�vid impulzus csomagok eset�n j�l j�het
	}
	//Eltessz�k az aktu�lis button �llapotot
	weldButtonPrevState = weldButtonCurrentState;

	//MOT h�m�rs�klet�nek olvas�sa
	MOTTemp::MOTTempResult *pMotTempResult = pMOTTemp->getTemperature();

	//Ventil�tor kezel�se
	if (pMotTempResult->changed) {
		ventilatorController(&pMotTempResult->currentMotTemp);
	}

	//LCD kezel�se + Rotary Encoder olvas�sa
	pDisplay->loop(pMotTempResult);
}
