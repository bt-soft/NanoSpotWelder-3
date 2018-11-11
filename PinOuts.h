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
 * PinOuts.h
 *
 *  Created on: 2018. nov. 1.
 *      Author: BT
 */

#ifndef PINOUTS_H_
#define PINOUTS_H_

//------------------- Rotary Encoder
#define PIN_ENCODER_CLK        	3  		/* This pin must have a minimum 0.47 uF capacitor */
#define PIN_ENCODER_DT         	A0      /* data pin */
#define PIN_ENCODER_SW         	A1      /* switch pin (active LOW) */

//------------------- H�m�r�s
#define PIN_TEMP_SENSOR			A2

//------------------- Ventil�tor
#define PIN_VENTILATOR			A3

//------------------- LCD Display
#define PIN_LCD_BLACKLIGHT 		9
#define PIN_LCD_SCLK			8
#define PIN_LCD_DIN				7
#define PIN_LCD_DC				6
#define PIN_LCD_CS				5
#define PIN_LCD_RST				4

//------------------- Spot welding param�terek
#define PIN_ZCD 				2		/* Zero Cross Detection PIN, megszak�t�sban */
#define PIN_TRIAC 				12 		/* D12 Triac/MOC vez�rl�s PIN */
#define PIN_WELD_LED 			11		/* D11 Hegeszt�s LED visszajelz�s */
#define PIN_WELD_BUTTON 		10 		/* D10 Hegeszt�s gomb */

//------------------- Beeper
#define PIN_BEEPER 				13

#endif /* PINOUTS_H_ */
