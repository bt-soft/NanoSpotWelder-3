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
 * RotaryEncoder.h
 *
 *  Created on: 2018. jún. 27.
 *      Author: BT-Soft
 */

#ifndef ROTARYENCODER_H_
#define ROTARYENCODER_H_

#include <TimerOne.h>
#include "ClickEncoder.h"

class RotaryEncoder: public ClickEncoder {

private:
	int8_t  oldValue = 0;
	int8_t  value = 0;


public:

	/**
	 * Irány enum
	 */
	typedef enum Direction_t {
		UP, DOWN, NONE
	} Direction;

	/**
	 * Visszatérési érték
	 */
	typedef struct t {
		Direction_t direction; //
		Button_e buttonState;
	} RotaryEncoderResult;

	/**
	 *
	 */
	RotaryEncoder(uint8_t CLK, uint8_t DT, uint8_t SW) :
			ClickEncoder(CLK, DT, SW) {

		//ClickEncoder
		ClickEncoder::setAccelerationEnabled(true);
		oldValue = ClickEncoder::getValue();
	}

	/**
	 *
	 */
	RotaryEncoderResult readRotaryEncoder() {
		RotaryEncoderResult result;

		result.buttonState = ClickEncoder::getButton();
		result.direction = NONE;

		if (result.buttonState == ClickEncoder::Open) { //Tekerni és klikkelni egyszerre nem lehet

			value += ClickEncoder::getValue();

			if (value / 2 > oldValue) {
				oldValue = value / 2;
				result.direction = UP;
				//delay(50);
			} else if (value / 2 < oldValue) {
				oldValue = value / 2;
				result.direction = DOWN;
				//delay(50);
			}
		}

		return result;
	}
};

extern RotaryEncoder *pRotaryEncoder;

#endif /* ROTARYENCODER_H_ */
