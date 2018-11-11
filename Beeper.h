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
 * Beeper.h
 *
 *  Created on: 2018. ápr. 26.
 *      Author: bt-soft
 */

#ifndef BEEPER_H_
#define BEEPER_H_

#include <Arduino.h>

#include "Pinouts.h"
#include "Config.h"

class Beeper {

public:

	/**
	 * Konstruktor
	 */
	Beeper() {
		pinMode(PIN_BEEPER, OUTPUT);
		digitalWrite(PIN_BEEPER, LOW);
	}

	/**
	 * Sipolás - Ha engedélyezve van
	 */
	void buzzer(void) {

		if (!pConfig->configVars.beepState) {
			return;
		}

		tone(PIN_BEEPER, 1000);
		delay(500);
		tone(PIN_BEEPER, 800);
		delay(500);
		noTone(PIN_BEEPER);
	}

	/**
	 * Riasztási hang
	 */
	void alarm(void) {
		tone(PIN_BEEPER, 1000);
		delay(300);
		tone(PIN_BEEPER, 1000);
		delay(300);
		tone(PIN_BEEPER, 1000);
		delay(300);
		noTone(PIN_BEEPER);
	}

	/**
	 * menu hang
	 */
	void menu() {
		if (!pConfig->configVars.beepState) {
			return;
		}

		tone(PIN_BEEPER, 500);
		delay(15);
		noTone(PIN_BEEPER);
	}

};

extern Beeper *pBeeper;

#endif /* BEEPER_H_ */
