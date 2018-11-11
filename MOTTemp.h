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
 * MOTTemp.h
 *
 *  Created on: 2018. máj. 6.
 *      Author: bt-soft
 */

#ifndef MOTTEMP_H_
#define MOTTEMP_H_

#include <Arduino.h>
#include "PinOuts.h"
#include "Environment.h"

#ifdef USE_DIGITAL_TEMPERATURE_SENSOR
#include <OneWire.h>
#define REQUIRESALARMS 			false	/* nem kell a DallasTemperature ALARM supportja */
#include <DallasTemperature.h>
#define MOT_TEMP_SENSOR_NDX 	0		/* Dallas DS18B20 hõmérõ szenzor indexe */
//#pragma message "Using Dallas DS18B20 Temperature Sensor"
#else
#include <MD_LM335A.h>
//#pragma message "Using LM335 Temperature Sensor"
#endif

class MOTTemp {

private:
#ifdef USE_DIGITAL_TEMPERATURE_SENSOR
	DallasTemperature *pTempSensors;
#else
	LM335A *pLM335A;
#endif

public:
	/**
	 * Konstruktor
	 */
	MOTTemp() {
#ifdef USE_DIGITAL_TEMPERATURE_SENSOR
		pTempSensors = new DallasTemperature(new OneWire(PIN_TEMP_SENSOR));
		pTempSensors->begin();
#else
		pLM335A = new LM335A(PIN_TEMP_SENSOR);
#endif
	}

	typedef struct t {
		float currentMotTemp; // aktuális hõmérséklet
		bool changed;
	} MOTTempResult;

	MOTTempResult measureResult;

	/**
	 * MOT hõmérsékletének olvasása
	 */
	MOTTempResult *getTemperature(void) {

		static long lastDisplayTime = 0L;


		measureResult.changed = false;

		if (millis() - lastDisplayTime > MOT_TEMP_DISPLAY_TIME) {

#ifdef USE_DIGITAL_TEMPERATURE_SENSOR
			//MOT hõmérsékletének lekérése -> csak egy DS18B20 mérõnk van -> 0 az index
			pTempSensors->requestTemperaturesByIndex(MOT_TEMP_SENSOR_NDX);
			//MOT hõmérsékletének lekérése
			float currentMotTemp = pTempSensors->getTempCByIndex(MOT_TEMP_SENSOR_NDX);
#else
			pLM335A->Read();
			float currentMotTemp = pLM335A->dC / 100.0f;
#endif

			measureResult.changed = measureResult.currentMotTemp != currentMotTemp;
			measureResult.currentMotTemp = currentMotTemp;
			lastDisplayTime = millis();
		}

		return &measureResult;
	}

};

extern MOTTemp *pMOTTemp;

#endif /* MOTTEMP_H_ */
