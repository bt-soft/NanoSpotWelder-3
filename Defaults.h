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
 *  Created on: 2018. �pr. 15.
 *      Author: bt-soft
 */

#ifndef DEFAULTS_H_
#define DEFAULTS_H_

#define DEF_LCD_CONTRAST				30 		/* LCD kontraszt */
#define DEF_LCD_BIAS					4		/* LCD el�fesz�t�s */

#define DEF_PULSE_COUNT_WELD_MODE		true	/* pulzussz�ml�l�sos hegeszt�si m�d */
#define DEF_BEEP_STATE					true  	/* Beep */
#define DEF_BACKLIGHT_STATE				true 	/* LCD h�tt�rvil�g�t�s */

///  1 peri�dus: 100Hz -> 10ms
#define DEF_PREWELD_PULSE_CNT 			6
#define DEF_PAUSE_PULSE_CNT 			4
#define DEF_WELD_PULSE_CNT 				5

#define DEF_PACKET_CNT					2		/* hegeszt�s csomagok ism�tl�si sz�ma */
#define DEF_PACKET_PAUSE_CNT			5       /* hegeszt�s csomagok ism�tl�se k�z�tti v�rakoz�si impulzusok sz�ma */


#define DEF_MOT_TEMP_ALARM 				40 		/* MOT h�m�rs�klet riaszt�s bekapcsol�si hat�r �C-ban */

#define SYSTEM_FREQUENCY				50.0	/* A ~230V-os h�l�zat frekvenci�ja Hz-ben */

//sz�m�tott h�l�zati peri�dus id�
#define SYSTEM_PERIOD_TIME				1.0/SYSTEM_FREQUENCY

#endif /* DEFAULTS_H_ */
