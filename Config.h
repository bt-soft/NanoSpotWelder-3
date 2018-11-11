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
 * Config.h
 *
 *  Created on: 2018. ápr. 15.
 *      Author: bt-soft
 */

#ifndef CONFIG_H_
#define CONFIG_H_

#include <Arduino.h>
#include <EEPROM.h>

#include "Defaults.h"
#include "Version.h"

/**
 * Konfig osztály
 * Nem csinálunk a változóknak getter/setter metódusokat, nem növeljük a kód méretét feleslegesen
 */
class Config {

public:

	//Konfigurációs típus deklaráció
	typedef struct config_t {
		unsigned char version[NSP_VERSION_SIZE];

		//A logikai változókat nem lehet bitfield-be szervezni, mert a menüben nem lehet rájuk pointert húzni
		bool pulseCountWeldMode;	//pulzusszámlálás (true) vagy kézi(false) hegesztés
		bool blackLightState;		//háttévilágítás
		bool beepState;				//beep

		byte contrast;				//LCD kontraszt érték
		byte bias;					//LCD elõfeszítés érték
		uint8_t preWeldPulseCnt;	//elõhegesztés impulzus szám
		uint8_t pausePulseCnt;		//szünet impulzus szám
		uint8_t weldPulseCnt;		//hegesztés impulzus szám

		uint8_t packetCnt;			//hegesztés csomagok ismétlési száma
		uint8_t packetPauseCnt;		//hegesztés csomagok ismétlése közötti várakozási impulzusok száma

		byte motTempAlarm;			//MOT hõmérséklet magas riasztás

	} ConfigT;

	//config
	ConfigT configVars;

#define CONFIG_REC_SIZE sizeof(Config::configVars)

	/**
	 * Default config létrehozása
	 */
	void createDefaultConfig(ConfigT *pCfgVars) {
		//Mindent törlünk, ami eddig volt/jött a konfigban
		memset(pCfgVars, '\x0', CONFIG_REC_SIZE);

		//Verzió info
		memcpy(pCfgVars->version, NSP_VERSION, NSP_VERSION_SIZE);

		//logikai változók
		pCfgVars->pulseCountWeldMode = DEF_PULSE_COUNT_WELD_MODE;
		pCfgVars->blackLightState = DEF_BACKLIGHT_STATE;
		pCfgVars->beepState = DEF_BEEP_STATE;

		//LCD
		pCfgVars->contrast = DEF_CONTRAST;
		pCfgVars->bias = DEF_BIAS;

		//Weld
		pCfgVars->preWeldPulseCnt = DEF_PREWELD_PULSE_CNT;
		pCfgVars->pausePulseCnt = DEF_PAUSE_PULSE_CNT;
		pCfgVars->weldPulseCnt = DEF_WELD_PULSE_CNT;

		pCfgVars->packetCnt = DEF_PACKET_CNT;
		pCfgVars->packetPauseCnt = DEF_PACKET_PAUSE_CNT;

		//MOT Temp alarm
		pCfgVars->motTempAlarm = DEF_MOT_TEMP_ALARM;
	}

	/**
	 * Inicializáció
	 */
	void read() {
		EEPROM.get(0, configVars);

		//Érvényes konfig van az EEprom-ban?
		if (memcmp(configVars.version, NSP_VERSION, NSP_VERSION_SIZE) != 0) {

			//nem -> legyártjuk a default konfigot
			createDefaultConfig(&configVars);
			save();
		}
	}

	/**
	 * Konfig mentése
	 */
	void save(void) {
		//le is mentjük
		EEPROM.put(0, configVars);
	}

};
extern Config *pConfig;

#endif /* CONFIG_H_ */
