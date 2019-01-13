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

//--- MOT Hõmérséklet kezelése ---------------------------------------------------------------------------------------------------------------------------

//A konfigban megadott ventilátor riasztási °C érték elõtt ennyivel bekapcsolunk, vagy ennyivel utána kikapcsolunk
#define VENTILATOR_TRIGGER_OFFSET_VALUE	10

/**
 * Ventilátor vezérlése
 */
void ventilatorController(float *currentMotTemp) {

	const int triggerValue = pConfig->configVars.motTempAlarm - VENTILATOR_TRIGGER_OFFSET_VALUE;

	if (triggerValue > (*currentMotTemp + 1.0)) {
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
	PRE_WELD, 		//Elõimpulzus
	PAUSE_WELD,  	//Szünet a két impulzus között
	WELD, 			//Hegesztõ impulzus
	PACKET_PAUSE,	//Hegesztési csomagok közötti várakozás
	WELD_END 		//Nincs hegesztés
} WeldState_T;

volatile WeldState_T weldCurrentState = WELD_END; //hegesztési állapot jelzõ
volatile uint8_t weldPeriodCnt = 0; //Periódus Számláló, hegesztés alatt megszakításkor inkrementálódik
volatile uint8_t weldBundleCnt = 0; //hegesztési csomagok számlálója

/**
 * ZCD interrupt rutin
 */
void zeroCrossDetect(void) {

	//Ha nincs pre (ez esetben már a pause sem érdekel), akkor mehet egybõl a weld
	if (weldCurrentState == PRE_WELD && pConfig->configVars.preWeldPulseCnt == 0) {
		weldPeriodCnt = 0;
		weldCurrentState = WELD;
	}

	switch (weldCurrentState) {

	//A pre-ben vagyunk
	case PRE_WELD:
		//A Triakot csak akkor kapcsoljuk be, ha van elõinpulzus szám a konfigban, és nincs még bekapcsolva
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

		//A fõ hegesztésben vagyunk
	case WELD:
		//bekapcsoljuk a triakot, ha még nincs bekapcsolva
		if (!digitalRead(PIN_TRIAC)) {
			weldPeriodCnt = 1;
			digitalWrite(PIN_TRIAC, HIGH); //TRIAC BE
			return;
		}

		//Ha elértük a pulzusszámot, akkor kikapcsolunk és megvizsgáljuk, hogy kell-e a csomagokkal foglalkoznunk?
		if (++weldPeriodCnt >= pConfig->configVars.weldPulseCnt) {

			digitalWrite(PIN_TRIAC, LOW); //TRIAC KI

			if (pConfig->configVars.packetCnt == 1 //csak egy csomag van megadva?
			|| ++weldBundleCnt >= pConfig->configVars.packetCnt //több csomag esetén elértük már a csomagok számát?
					) {
				weldCurrentState = WELD_END;
			} else {
				//Ha több hegesztési csomag van beállítva, akkor elkezdjük a csomagok közötti várakozást
				weldPeriodCnt = 0;
				weldCurrentState = PACKET_PAUSE;
			}
		}
		break;

		//Két hegesztési csomag közötti várakozában vagyunk
	case PACKET_PAUSE:
		//elértük már a két csomag közötti várakozó impulzuszok számát?
		if (++weldPeriodCnt >= pConfig->configVars.packetPauseCnt) {
			weldPeriodCnt = 0;
			weldCurrentState = PRE_WELD;
		}
		break;

		//Hegesztés vége
	case WELD_END:
		//Igaziból itt már nem csinálunk semmit sem
		digitalWrite(PIN_TRIAC, LOW);	//triak ki, csak a biztonság kedvéért
		break;
	}
}

/**
 * Hegesztési protokoll
 */
void weldButtonPushed(void) {
#define SLEEP_TIME_MICROSEC 100

	//LED-be
	digitalWrite(PIN_WELD_LED, HIGH);

	//Ha pulzusszámlálás van
	if (pConfig->configVars.pulseCountWeldMode) {

		//Ráköltözünk a ZCD interrupt-ra
		attachInterrupt(digitalPinToInterrupt(PIN_ZCD), zeroCrossDetect, FALLING);

		//Beállítjuk, hogy a PRE_WELD állapotból induljunk
		weldCurrentState = PRE_WELD;
		weldBundleCnt = 0;

		//Megvárjuk a hegesztési folyamat végét
		while (weldCurrentState != WELD_END) {
			delayMicroseconds(SLEEP_TIME_MICROSEC);
		}

		//Leszállunk a ZCD interrupt-ról
		detachInterrupt(digitalPinToInterrupt(PIN_ZCD));

	} else { //Kézi hegesztés vezérlés van

		digitalWrite(PIN_TRIAC, HIGH); //TRIAC BE

		//Addig amíg a gomb le van nyomva, addig nem mozdulunk innen
		while (digitalRead(PIN_WELD_BUTTON)) {
			delayMicroseconds(SLEEP_TIME_MICROSEC * 20);
		}

		digitalWrite(PIN_TRIAC, LOW); //TRIAC KI
	}

	{ //Csak a biztonság kedvéért...
		digitalWrite(PIN_TRIAC, LOW);	//TRIAC ki
		weldCurrentState = WELD_END;    //Nincs hegesztés állapot
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

	//Hõmérõ felhúzása
	pMOTTemp = new MOTTemp();

	//Rotary Encoder felhúzása
	pRotaryEncoder = new RotaryEncoder(PIN_ENCODER_CLK, PIN_ENCODER_DT, PIN_ENCODER_SW);
	pRotaryEncoder->setDoubleClickEnabled(true);
	pRotaryEncoder->setAccelerationEnabled(false);
	Timer1.initialize(1000);
	Timer1.attachInterrupt(encoderISR);

	//Weld button PIN
	pinMode(PIN_WELD_BUTTON, INPUT);

	//--- ZCD input felhúzása
	pinMode(PIN_ZCD, INPUT_PULLUP);

	//--- Triac PIN
	pinMode(PIN_TRIAC, OUTPUT);
	digitalWrite(PIN_TRIAC, LOW);

	//--- Weld LED PIN
	pinMode(PIN_WELD_LED, OUTPUT);
	digitalWrite(PIN_WELD_LED, LOW);

	//--- Ventilátor
	pinMode(PIN_VENTILATOR, OUTPUT);
	digitalWrite(PIN_VENTILATOR, LOW);

	//Main page kirajzolása
	pDisplay->menuState = Display::FORCE_MAIN_DISPLAY;
	delay(3000);
}

/**
 * Loop
 */
void loop() {

	static byte weldButtonPrevState = HIGH;   //A hegesztés gomb elõzõ állapota

	//Kiolvassuk a weld button állapotát
	byte weldButtonCurrentState = digitalRead(PIN_WELD_BUTTON);

	//Ha változott az állapot LOW -> HIGH irányban
	if (weldButtonCurrentState != weldButtonPrevState && weldButtonCurrentState == HIGH && weldButtonPrevState == LOW) {

		//ha benne voltunk a menüben, akkor a hegesztés végén kilépünk belõle
		pDisplay->menuState = Display::FORCE_MAIN_DISPLAY;

		//Mehet a hegesztés
		weldButtonPushed();

		delay(100); //weld button debounce -> rövid impulzus csomagok esetén jól jöhet
	}
	//Eltesszük az aktuális button állapotot
	weldButtonPrevState = weldButtonCurrentState;

	//MOT hõmérsékletének olvasása
	MOTTemp::MOTTempResult *pMotTempResult = pMOTTemp->getTemperature();

	//Ventilátor kezelése
	if (pMotTempResult->changed) {
		ventilatorController(&pMotTempResult->currentMotTemp);
	}

	//LCD kezelése + Rotary Encoder olvasása
	pDisplay->loop(pMotTempResult);
}
