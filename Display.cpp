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
 * Display.cpp
 *
 *  Created on: 2018. nov. 3.
 *      Author: BT
 */

#include "Display.h"
#include <Fonts/FreeSans9pt7b.h>
#include <Fonts/TomThumb.h>
#include <Fonts/Org_01.h>

/**
 *
 */
void Display::init(void) {
	//LCD init
	begin();
	setBlackLightState(pConfig->configVars.blackLightState);
	setContrast(pConfig->configVars.contrast);
	setBias(pConfig->configVars.bias);

	menuItems[0] = {"Weld mode", WELD, &localConfigVars.pulseCountWeldMode, 0, 1, NULL};
	menuItems[1] = {"PreWeld pulse", PULSE, &localConfigVars.preWeldPulseCnt, 0, 255, NULL};
	menuItems[2] = {"Pause pulse", PULSE, &localConfigVars.pausePulseCnt, 0, 255, NULL};
	menuItems[3] = {"Weld pulse", PULSE, &localConfigVars.weldPulseCnt, 1, 255, NULL};
	menuItems[4] = {"Packets cnt", BYTE, &localConfigVars.packetCnt, 1, 99, NULL};
	menuItems[5] = {"Packets pause", PULSE, &localConfigVars.packetPauseCnt, 1, 255, NULL};
	menuItems[6] = {"MOT Tmp Alarm", TEMP, &localConfigVars.motTempAlarm, DEF_MOT_TEMP_ALARM, 90, NULL};
	menuItems[7] = {"LCD contrast", BYTE, &localConfigVars.contrast, 0, 127, &Display::lcdContrastCallBack};
	menuItems[8] = {"LCD bias", BYTE, &localConfigVars.bias, 0, 7, &Display::lcdBiasCallBack};
	menuItems[9] = {"LCD light", BOOL, &localConfigVars.blackLightState, 0, 1, &Display::lcdBackLightCallBack};
	menuItems[10] = {"Beep", BOOL, &localConfigVars.beepState, 0, 1, NULL};
	menuItems[11] = {"Factory reset", FUNCT, NULL, 0, 0, &Display::factoryResetCallBack};
	menuItems[12] = {"Save & Exit", FUNCT, NULL, 0, 0, &Display::saveAndExitCallBack};
	menuItems[13] = {"Drop & Exit", FUNCT, NULL, 0, 0, &Display::dropAndExitCallBack};

	resetMenu();

}

/**
 * Men� alap�llapotba
 */
void Display::resetMenu(void) {
	//viewPort be�ll�t�s
	menuViewport.firstItem = 0;
	menuViewport.lastItem = MENU_VIEWPORT_SIZE - 1;
	menuViewport.selectedItem = 0;
}

/**
 * Az arduino loop() ciklus�ban h�vott f�ggv�ny
 */
void Display::loop(MOTTemp::MOTTempResult *motTempResult) {

	//Ha van riszat�s, akkor azt csak a f�k�perny�ben jelen�tj�k meg, egy�bk�nt csak csipogunk
	if (motTempResult->currentMotTemp >= pConfig->configVars.motTempAlarm) {
		if (menuState == OFF) {
			menuState = HIGH_TEMP_ALARM;
			drawHighMotTempWarning(&motTempResult->currentMotTemp);
		} else {
			pBeeper->alarm();
		}
	} else if (menuState == HIGH_TEMP_ALARM) {
		//Kil�p�nk a riszt�si k�perny�b�l
		menuState = FORCE_MAIN_DISPLAY;
	}

	//K�nyszer�tett main display van
	if (menuState == FORCE_MAIN_DISPLAY) {
		drawMainPage();
		drawMotTemp(&motTempResult->currentMotTemp, true);
		menuState = OFF;
		return;
	}

	if (menuState == OFF) {
		if (motTempResult->changed) {
			drawMotTemp(&motTempResult->currentMotTemp);
		}
	}

	//Rotary Encoder olvas�sa
	RotaryEncoder::RotaryEncoderResult rotaryEncoderResult = pRotaryEncoder->readRotaryEncoder();

	//Ha klikkeltek VAGY van ir�ny, akkor a men�t piszk�ljuk
	if (rotaryEncoderResult.buttonState != RotaryEncoder::Open || rotaryEncoderResult.direction != RotaryEncoder::Direction::NONE) {
		menuController(rotaryEncoderResult.buttonState, rotaryEncoderResult.direction);
	}
}

/**
 * Splash k�perny� kirajzol�sa
 */
void Display::drawSplashScreen(void) {
	clearDisplay();
	setTextSize(1);
	setTextColor(BLACK);

	setCursor(5, 0);
	print(F("Arduino Nano"));
	setCursor(8, 8);
	print(F("Spot Welder"));

	setCursor(8, 25);
	print(F("v"));

	setTextSize(2);
	setCursor(16, 18);
	sprintf(tempBuff, "%s", &pConfig->configVars.version);
	print(tempBuff);

	setFont(&Org_01);
	setTextSize(1);
	setCursor(10, 40);
	print(F("BT-Soft 2018"));
	setCursor(15, 46);
	print(F(__DATE__));

	display();
}

/**
 * main page kirajzoltat�sa
 */
void Display::drawMainPage(void) {

	clearDisplay();

	//Main Header
	setFont(NULL);
	setTextSize(1);
	setTextColor(WHITE, BLACK);
	setCursor(0, 0);
	print(pConfig->configVars.pulseCountWeldMode ? F("  Pulse Count ") : F("Manual Welding"));
	setTextColor(BLACK, WHITE);

	if (pConfig->configVars.pulseCountWeldMode) {

		setFont(&Org_01);
		setCursor(0, 13);
		print(F("Pulse"));
		setCursor(46, 13);
		print(F("Repeats"));

		setFont(&TomThumb);
		setCursor(0, 20);
		print(F("PreWeld:"));
		setCursor(32, 20);
		print(pConfig->configVars.preWeldPulseCnt);
		setCursor(0, 26);
		print(F("Pause:"));
		setCursor(32, 26);
		print(pConfig->configVars.pausePulseCnt);
		setCursor(0, 32);
		print(F("Weld:"));
		setCursor(32, 32);
		print(pConfig->configVars.weldPulseCnt);

		setCursor(46, 20);
		print(F("Rpts:"));
		setCursor(46, 26);
		print(F("Pause:"));
		if (pConfig->configVars.packetCnt <= 1) {
			setCursor(70, 20);
			print(F("-"));
			setCursor(70, 26);
			print(F("-"));
		} else {
			setCursor(70, 20);
			print(pConfig->configVars.packetCnt);
			setCursor(70, 26);
			print(pConfig->configVars.packetPauseCnt);
		}
	}

	setFont(&Org_01);
	setCursor(8, 40);
	print(F("MOT"));
	setCursor(0, 45);
	print(F("Temp:"));

	display();
}

/**
 * MOT h�m�rs�klet�nek kijelz�se
 */
void Display::drawMotTemp(float *motTemp, boolean force) {

	setFont(NULL);
	setTextSize(2);
	dtostrf(*motTemp, 1, 1, tempBuff);
	setCursor(35, 34);
	print(tempBuff);

	display();
	setTextSize(0);
}

/**
 * Magas h�m�rs�klet riaszt�s
 */
void Display::drawHighMotTempWarning(float *motTemp) {

	clearDisplay();
	setTextColor(BLACK);
	setTextSize(1);

	println(F("!!!!!!!!!!!!!!"));
	println(F(" MOT Temp is"));
	println(F("  too high!"));
	println(F("!!!!!!!!!!!!!!"));

	//H�m�rs�klet ki�r�sa
	drawMotTemp(motTemp);

	display();
}

/**
 *
 */
void Display::menuController(RotaryEncoder::Button buttonState, RotaryEncoder::Direction direction) {

	if (menuState == OFF) {

		//Csak a az egy klikkre reag�lunk
		if (buttonState == RotaryEncoder::Clicked) {
			menuState = MAIN_MENU;
			drawMainMenu();

			//Bel�pt�nk a men�be -> lem�soljuk az aktu�lis konfigur�ci�t
			memcpy(&localConfigVars, &pConfig->configVars, sizeof(localConfigVars));

			beep();
		}
		return;

	} else if (menuState == MAIN_MENU) {
		if (pRotaryEncoder->getAccelerationEnabled()) {
			pRotaryEncoder->setAccelerationEnabled(false);
		}

		//Ha klikkeltek egy men� elemre, akkor bel�p�nk az item be�ll�t�sra
		if (buttonState == RotaryEncoder::Clicked) {
			menuState = ITEM_MENU;

			//Ha  az almen�h�z csak funkci� van, akkor csak azt h�vjuk meg
			if (getSelectedItemPtr()->valuePtr == NULL) {
				invokeMenuItemCallBackFunct();
			} else {
				drawMenuItemValue();
			}
			beep();
		} else {
			if (direction == RotaryEncoder::UP) {
				stepDown();
				drawMainMenu();
			} else if (direction == RotaryEncoder::DOWN) {
				stepUp();
				drawMainMenu();
			}
		}
		return;

	} else if (menuState == ITEM_MENU) {
		if (buttonState == RotaryEncoder::Clicked) {
			menuState = MAIN_MENU;
			drawMainMenu();
			beep();
		} else {
			if (!pRotaryEncoder->getAccelerationEnabled()) {
				pRotaryEncoder->setAccelerationEnabled(true);
			}
			if (direction == RotaryEncoder::UP) {
				decSelectedValue();
			} else if (direction == RotaryEncoder::DOWN) {
				incSelectedValue();
			}

			//Men�elem be�ll�t� k�perny� kirajzoltat�sa
			drawMenuItemValue();

			//Ha van az almen�h�z hozz� callback, akkor azt is megh�vjuk
			if (getSelectedItemPtr()->valuePtr != NULL) {
				invokeMenuItemCallBackFunct();
			}
		}

		return;
	}
}

/**
 * Main men� kirajzol�sa
 */
void Display::drawMainMenu(void) {

	clearDisplay();
	setFont(NULL);
	setTextSize(1);
	setTextColor(BLACK, WHITE);
	setCursor(15, 0);
	print(F("Main menu"));
	drawFastHLine(0, 8, 83, BLACK);

	for (byte i = 0; i < MENU_VIEWPORT_SIZE; i++) {

		byte itemNdx = menuViewport.firstItem + i;
		setCursor(0, MENU_VIEVPORT_LINEPOS[i]);

		//selected?
		if (itemNdx == menuViewport.selectedItem) {
			setTextColor(WHITE, BLACK);
			print(F(">"));
		} else {
			setTextColor(BLACK, WHITE);
			print(F(" "));
		}
		print(menuItems[itemNdx].title);
	}
	display();
}

/**
 * men�elem be�ll�t� k�perny�
 */
void Display::drawMenuItemValue(void) {

	MenuItemT p = menuItems[menuViewport.selectedItem];

	clearDisplay();
	setFont(NULL);
	setTextColor(BLACK, WHITE);
	setCursor(0, 0);
	print(p.title);
	drawFastHLine(0, 8, 83, BLACK);

//Prompt
	setCursor(5, 15);
	switch (p.valueType) {
	case TEMP:
	case BYTE:
	case BOOL:
		print(F("Value"));
		break;

	case WELD:
		print(F("Mode"));
		break;

	case PULSE:
		print(F("Pulse"));
		break;
	}

	setTextSize(2);

	//T�pus szerinti ki�r�s
	switch (p.valueType) {
	case BOOL:
		setCursor(10, 25);
		sprintf(tempBuff, *(bool *) p.valuePtr ? "ON" : "OFF");
		break;

	case WELD:
		setCursor(10, 25);
		sprintf(tempBuff, *(bool *) p.valuePtr ? "Pulse" : "Manual");
		break;

	case PULSE:
	case TEMP:
	case BYTE:
		setCursor(35, 15);
		sprintf(tempBuff, "%3d", *(byte *) p.valuePtr);
		break;
	default:
		sprintf(tempBuff, "unknown");
	}
	print(tempBuff);

	//M�rt�kegys�g
	setTextSize(1);
	switch (p.valueType) {

	case TEMP: //�C ki�r�s
		sprintf(tempBuff, "%cC", DEGREE_SYMBOL_CODE);
		setCursor(10, 40);
		print(tempBuff);
		break;

	case PULSE: //msec ki�r�s
		if (SYSTEM_PERIOD_TIME > 0.0) {
			setCursor(10, 40);
			print(msecToStr(*(byte *) p.valuePtr));
		}
		break;

	default:
		break;
	}

	display();
}

/**
 * Men�ben lefel� l�pked�s
 */
void Display::stepUp(void) {
	//Az utols� elem a kiv�lasztott? Ha igen, akkor nem megy�nk tov�bb
	if (menuViewport.selectedItem == LAST_MENUITEM_NDX) {
		return;
	}

	beep();
	//A k�vetkez� men�elem lesz a kiv�lasztott
	menuViewport.selectedItem++;

	//A viewport alj�n�l t�ljutottunk? Ha igen, akkor scrollozunk egyet lefel�
	if (menuViewport.selectedItem > menuViewport.lastItem) {
		menuViewport.firstItem++;
		menuViewport.lastItem++;
	}
}

/**
 * Men�ben felfel� l�pked�s
 */
void Display::stepDown(void) {

	//Az els� elem a kiv�lasztott? Ha igen, akkor nem megy�nk tov�bb
	if (menuViewport.selectedItem == 0) {
		return;
	}

	beep();

	//Az el�z� men�elem lesz a kiv�lasztott
	menuViewport.selectedItem--;

	//A viewport tetej�n�l t�ljutottunk? Ha igen, akkor scrollozunk egyet felfel�
	if (menuViewport.selectedItem < menuViewport.firstItem) {
		menuViewport.firstItem--;
		menuViewport.lastItem--;
	}
}

/**
 * A kiv�lasztott men�elem �rt�k�nek n�vel�se
 */
void Display::incSelectedValue(void) {
	MenuItemT *pSelectedMenuItem = getSelectedItemPtr();

	switch (pSelectedMenuItem->valueType) {
	case Display::BYTE:
	case Display::PULSE:
	case Display::TEMP:
		if (*(byte *) pSelectedMenuItem->valuePtr < pSelectedMenuItem->maxValue) {
			(*(byte *) pSelectedMenuItem->valuePtr)++;
			beep();
		}
		break;

	case Display::WELD:
	case Display::BOOL:
		if (!*(bool *) pSelectedMenuItem->valuePtr) { //ha most false, akkor true-t csin�lunk bel�le
			*(bool *) pSelectedMenuItem->valuePtr = true;
			beep();
		}
		break;
	}
}
/**
 * A kiv�lasztott men�elem �rt�k�nek cs�kkent�se
 */
void Display::decSelectedValue(void) {

	MenuItemT *pSelectedMenuItem = getSelectedItemPtr();

	switch (pSelectedMenuItem->valueType) {
	case Display::BYTE:
	case Display::PULSE:
	case Display::TEMP:
		if (*(byte *) pSelectedMenuItem->valuePtr > pSelectedMenuItem->minValue) {
			(*(byte *) pSelectedMenuItem->valuePtr)--;
			beep();
		}
		break;

	case Display::WELD:
	case Display::BOOL:
		if (*(bool *) pSelectedMenuItem->valuePtr) { //ha most true, akkor false-t csin�lunk bel�le
			*(bool *) pSelectedMenuItem->valuePtr = false;
			beep();
		}
		break;
	}
}

/**
 * Men�elemhez tartoz� seg�df�ggv�ny megh�v�sa - ha van
 */
void Display::invokeMenuItemCallBackFunct(void) {

	MenuItemT *pSelectedMenuItem = getSelectedItemPtr();
	if (pSelectedMenuItem->callbackFunct != NULL) {
		(this->*(pSelectedMenuItem->callbackFunct))();
	}
}

//------------------------------------------------------------------- Men�elemek callback f�ggv�nyei
/**
 * LCD Contrast
 */
void Display::lcdContrastCallBack(void) {
	setContrast(localConfigVars.contrast);
}
/**
 * LCD BIAS
 */
void Display::lcdBiasCallBack(void) {
	setBias(localConfigVars.bias);
}
/**
 *
 */
void Display::lcdBackLightCallBack(void) {
	setBlackLightState(localConfigVars.blackLightState);
}
/**
 * Gy�ri be�ll�t�sok vissza�ll�t�sa
 */
void Display::factoryResetCallBack(void) {

	clearDisplay();
	setFont(NULL);
	setTextSize(1);
	setTextColor(BLACK, WHITE);
	setCursor(3, 0);
	print(F("Factory Reset"));
	drawFastHLine(0, 10, 83, BLACK);

	setTextSize(2);
	setCursor(0, 20);
	print(F("I do..."));

	pConfig->createDefaultConfig(&localConfigVars);

	//Konfig be�ll�t�sok �rv�nyes�t�se
	lcdBackLightCallBack();
	lcdContrastCallBack();
	lcdBiasCallBack();

	display();
	delay(2000);

	resetMenu();
	menuState = FORCE_MAIN_DISPLAY;
}
/**
 * Kil�p�s ment�ssel
 */
void Display::saveAndExitCallBack(void) {

	clearDisplay();
	setFont(NULL);
	setTextSize(1);
	setTextColor(BLACK, WHITE);
	setCursor(10, 0);
	print(F("Save Config"));
	drawFastHLine(0, 10, 83, BLACK);

	//Ha volt a konfigban v�ltoz�s, akkor ment�nk
	if (memcmp(&localConfigVars, &pConfig->configVars, sizeof(localConfigVars)) != 0) {

		//Bem�soljuk a jelenlegi konfigur�ci�t a konfig oszt�ly t�rol�j�ba
		memcpy(&pConfig->configVars, &localConfigVars, sizeof(localConfigVars));
		pConfig->save();

		setTextSize(2);
		setCursor(0, 15);
		print(F("Save OK"));

	} else {
		setTextSize(1);
		setCursor(0, 15);
		println(F("No change is"));
		println(F(" to be saved!"));
	}

	display();
	delay(2000);

	resetMenu();
	menuState = FORCE_MAIN_DISPLAY;
}
/**
 * kil�p�s ment�s n�lk�l
 */
void Display::dropAndExitCallBack(void) {
	resetMenu();
	menuState = FORCE_MAIN_DISPLAY;
}

// ------------------------------------------------------ utils
/**
 * msec -> String konverter
 */
char *Display::msecToStr(long pulseCnt) {

	//A ZCD miatt SYSTEM_FREQUENCY-n (100Hz vagy 120Hz-en) vagyunk
	long fullPulseTime = (SYSTEM_PERIOD_TIME / 2) * 1000 * pulseCnt;

	byte sec = fullPulseTime / 1000;
	int msec = fullPulseTime - (sec * 1000);

	if (sec == 0 && msec > 0) {
		sprintf(tempBuff, "%dms", msec);
	} else if (sec > 0 && msec == 0) {
		sprintf(tempBuff, "%ds", sec);
	} else {
		sprintf(tempBuff, "%ds %dms", sec, msec);
	}

	return tempBuff;
}
