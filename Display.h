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
 * Display.h
 *
 *  Created on: 2018. nov. 3.
 *      Author: BT
 */

#ifndef DISPLAY_H_
#define DISPLAY_H_

#include <Adafruit_GFX.h>
#include <Adafruit_PCD8544.h>
#include "PinOuts.h"
#include "Beeper.h"
#include "MOTTemp.h"
#include "RotaryEncoder.h"
#include "Config.h"

#define MENU_VIEWPORT_SIZE 	4			/* Menü elemekbõl ennyi látszik egyszerre */
#define LAST_MENUITEM_NDX 	13 			/* Az utolsó menüelem indexe, 0-tól indul */
#define DEGREE_SYMBOL_CODE 	247			/* Az LCD-n a '°' jel kódja */

class Display: public Adafruit_PCD8544 {

private:
	uint8_t blackLightPin = -1;
	Config::ConfigT localConfigVars;

public:
	Display(int8_t SCLK, int8_t DIN, int8_t DC, int8_t CS, int8_t RST, uint8_t blackLightPin = -1) :
			Adafruit_PCD8544(SCLK, DIN, DC, CS, RST) {

		if (blackLightPin != -1) {
			pinMode(blackLightPin, OUTPUT);
			this->blackLightPin = blackLightPin;
		}

		//Beeper
		pBeeper = new Beeper();
	}

	virtual ~Display() {
	}

	typedef enum MenuState_t {
		OFF,	//Nem látható
		FORCE_MAIN_DISPLAY, //Izombõl kirajzoljuk a MainDisplay-t
		MAIN_MENU, //Main menü látható
		ITEM_MENU, //Elem Beállító menü látható
		HIGH_TEMP_ALARM //Magas hõmésrésklet risztás látható
	};

private:
	Beeper *pBeeper;
	char tempBuff[32] = { '\x0' };


public:
	void init(void);
	void loop(MOTTemp::MOTTempResult *motTempResult);

	void drawSplashScreen(void);
	void drawMainPage(void);

	MenuState_t menuState = OFF;

private:
	/* változtatható érték típusa */
	typedef enum valueType_t {
		BOOL, BYTE, PULSE, TEMP, WELD, FUNCT
	};

	typedef void (Display::*voidFuncPtr)(void);
	typedef struct MenuItem_t {
		const char PROGMEM *title;  // Menüfelirat
		valueType_t valueType;		// Érték típus
		void *valuePtr;				// Az érték pointere
		byte minValue;				// Minimális numerikus érték
		byte maxValue;				// Maximális numerikus érték
		voidFuncPtr callbackFunct; 	// Egyéb mûveletek függvény pointere, vagy NULL, ha nincs
	} MenuItemT;

	typedef struct MenuViewport_t {
		byte firstItem;
		byte lastItem;
		byte selectedItem;
	} MenuViewPortT;
	MenuViewPortT menuViewport;
	MenuItemT menuItems[LAST_MENUITEM_NDX + 1];
	const byte PROGMEM MENU_VIEVPORT_LINEPOS[MENU_VIEWPORT_SIZE] = { 10, 19, 28, 37 };	//Menüelemek sorai

	/**
	 * Kiválasztott menüelem pointerének elkérése
	 */
	MenuItemT *getSelectedItemPtr() {
		return &menuItems[menuViewport.selectedItem];
	}

	void menuController(RotaryEncoder::Button buttonState, RotaryEncoder::Direction direction);
	void resetMenu(void);

	void drawMotTemp(float *motTemp, boolean force = false);
	void drawHighMotTempWarning(float *motTemp);

	void drawMainMenu(void);
	void drawMenuItemValue(void);

	void stepDown(void);
	void stepUp(void);
	void incSelectedValue(void);
	void decSelectedValue(void);
	void invokeMenuItemCallBackFunct(void);

	void lcdContrastCallBack(void);
	void lcdBiasCallBack(void);
	void lcdBackLightCallBack(void);
	void factoryResetCallBack(void);
	void exitAndSaveCallBack(void);
	void exitAndCancelCallBack(void);

	char *msecToStr(long pulseCnt);

	/**
	 * Háttérvilágítás állítása
	 */
	void setBlackLightState(bool state) {
		if (blackLightPin != -1) {
			if(LCD_BACKLIGHT_ON == HIGH){
				digitalWrite(blackLightPin, state ? LOW : HIGH);
			} else {
				digitalWrite(blackLightPin, state ? HIGH : LOW);
			}
		}
	}

	/**
	 * LCD Elõfeszítés beállítása
	 */
	void setBias(byte bias) {
		bias = max(bias, 7);
		command(PCD8544_FUNCTIONSET | PCD8544_EXTENDEDINSTRUCTION);
		command(PCD8544_SETBIAS | bias);
		command(PCD8544_FUNCTIONSET);
		display();
	}

	void beep(void){
		if (localConfigVars.beepState) {
			pBeeper->menu();
		}
	}

};

#endif /* DISPLAY_H_ */
