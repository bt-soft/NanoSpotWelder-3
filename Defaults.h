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
 * Defaults.h
 *
 *  Created on: 2018. ápr. 15.
 *      Author: bt-soft
 */

#ifndef DEFAULTS_H_
#define DEFAULTS_H_

#define DEF_LCD_CONTRAST				30 		/* LCD kontraszt */
#define DEF_LCD_BIAS					4		/* LCD elõfeszítés */

#define DEF_PULSE_COUNT_WELD_MODE		true	/* pulzusszámlálásos hegesztési mód */
#define DEF_BEEP_STATE					true  	/* Beep */
#define DEF_BACKLIGHT_STATE				true 	/* LCD háttérvilágítás */

///  1 periódus: 100Hz -> 10ms
#define DEF_PREWELD_PULSE_CNT 			6
#define DEF_PAUSE_PULSE_CNT 			4
#define DEF_WELD_PULSE_CNT 				5

#define DEF_PACKET_CNT					2		/* hegesztés csomagok ismétlési száma */
#define DEF_PACKET_PAUSE_CNT			5       /* hegesztés csomagok ismétlése közötti várakozási impulzusok száma */


#define DEF_MOT_TEMP_ALARM 				40 		/* MOT hõmérséklet riasztás bekapcsolási határ °C-ban */

#define SYSTEM_FREQUENCY				50.0	/* A ~230V-os hálózat frekvenciája Hz-ben */

//számított hálózati periódus idõ
#define SYSTEM_PERIOD_TIME				1.0/SYSTEM_FREQUENCY

#endif /* DEFAULTS_H_ */
