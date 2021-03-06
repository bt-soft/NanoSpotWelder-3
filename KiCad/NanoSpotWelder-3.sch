EESchema Schematic File Version 4
LIBS:NanoSpotWelder-3-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega328-PU U5
U 1 1 5B9D6237
P 5650 3550
F 0 "U5" H 5009 3596 50  0000 R CNN
F 1 "ATmega328-PU" H 5009 3505 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 5650 3550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 5650 3550 50  0001 C CNN
	1    5650 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5B9DFDCC
P 4800 2350
F 0 "C8" V 4548 2350 50  0000 C CNN
F 1 "100n" V 4639 2350 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 4838 2200 50  0001 C CNN
F 3 "~" H 4800 2350 50  0001 C CNN
	1    4800 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 2350 5050 2350
$Comp
L power:GND #PWR0101
U 1 1 5B9DFEF5
P 4600 2350
F 0 "#PWR0101" H 4600 2100 50  0001 C CNN
F 1 "GND" V 4605 2222 50  0000 R CNN
F 2 "" H 4600 2350 50  0001 C CNN
F 3 "" H 4600 2350 50  0001 C CNN
	1    4600 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 2350 4650 2350
$Comp
L power:GND #PWR0102
U 1 1 5B9DFF6D
P 5650 5200
F 0 "#PWR0102" H 5650 4950 50  0001 C CNN
F 1 "GND" H 5655 5027 50  0000 C CNN
F 2 "" H 5650 5200 50  0001 C CNN
F 3 "" H 5650 5200 50  0001 C CNN
	1    5650 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5200 5650 5050
$Comp
L power:+5V #PWR0103
U 1 1 5B9DFFAA
P 5700 1800
F 0 "#PWR0103" H 5700 1650 50  0001 C CNN
F 1 "+5V" H 5715 1973 50  0000 C CNN
F 2 "" H 5700 1800 50  0001 C CNN
F 3 "" H 5700 1800 50  0001 C CNN
	1    5700 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1800 5700 1950
Wire Wire Line
	5650 2050 5650 1950
Wire Wire Line
	5650 1950 5700 1950
Wire Wire Line
	5750 1950 5750 2050
$Comp
L power:+5V #PWR0104
U 1 1 5B9E0483
P 6650 800
F 0 "#PWR0104" H 6650 650 50  0001 C CNN
F 1 "+5V" H 6665 928 50  0000 L CNN
F 2 "" H 6650 800 50  0001 C CNN
F 3 "" H 6650 800 50  0001 C CNN
	1    6650 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5B9E0538
P 6650 1750
F 0 "#PWR0105" H 6650 1500 50  0001 C CNN
F 1 "GND" H 6655 1622 50  0000 R CNN
F 2 "" H 6650 1750 50  0001 C CNN
F 3 "" H 6650 1750 50  0001 C CNN
	1    6650 1750
	1    0    0    -1  
$EndComp
Text GLabel 6550 2350 2    50   Output ~ 0
D8
Text GLabel 6550 2450 2    50   Output ~ 0
D9
Text GLabel 6550 2550 2    50   Input ~ 0
D10
Text GLabel 6550 2650 2    50   BiDi ~ 0
D11
Text GLabel 6550 2750 2    50   BiDi ~ 0
D12
Text GLabel 6550 2850 2    50   BiDi ~ 0
D13
Text GLabel 6550 3250 2    50   Input ~ 0
A0
Text GLabel 6550 3350 2    50   Input ~ 0
A1
Text GLabel 6550 3450 2    50   Input ~ 0
A2
Text GLabel 6550 3550 2    50   Output ~ 0
A3
Text GLabel 6550 4250 2    50   Input ~ 0
D2
Text GLabel 6550 4350 2    50   Input ~ 0
D3
Text GLabel 6550 4450 2    50   Output ~ 0
D4
Text GLabel 6550 4550 2    50   Output ~ 0
D5
Text GLabel 6550 4650 2    50   Output ~ 0
D6
Text GLabel 6550 4750 2    50   Output ~ 0
D7
Wire Wire Line
	6550 2350 6250 2350
Wire Wire Line
	6250 2450 6550 2450
Wire Wire Line
	6550 2550 6250 2550
Wire Wire Line
	6250 2650 6550 2650
Wire Wire Line
	6550 2750 6250 2750
Wire Wire Line
	6250 2850 6550 2850
Wire Wire Line
	6550 3250 6250 3250
Wire Wire Line
	6250 3350 6550 3350
Wire Wire Line
	6550 3450 6250 3450
Wire Wire Line
	6250 3550 6550 3550
Wire Wire Line
	6550 4250 6250 4250
Wire Wire Line
	6250 4350 6550 4350
Wire Wire Line
	6550 4450 6250 4450
Wire Wire Line
	6250 4550 6550 4550
Wire Wire Line
	6550 4650 6250 4650
Wire Wire Line
	6250 4750 6550 4750
$Comp
L Device:R R15
U 1 1 5B9E2CCA
P 6950 3600
F 0 "R15" H 7020 3646 50  0000 L CNN
F 1 "1k" H 7020 3555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 3600 50  0001 C CNN
F 3 "~" H 6950 3600 50  0001 C CNN
	1    6950 3600
	1    0    0    -1  
$EndComp
Text GLabel 7150 3850 2    50   Input ~ 0
RESET
Wire Wire Line
	7150 3850 6950 3850
Wire Wire Line
	6950 3750 6950 3850
Connection ~ 6950 3850
Wire Wire Line
	6950 3850 6250 3850
$Comp
L power:+5V #PWR0106
U 1 1 5B9E39C1
P 6950 3400
F 0 "#PWR0106" H 6950 3250 50  0001 C CNN
F 1 "+5V" H 6965 3573 50  0000 C CNN
F 2 "" H 6950 3400 50  0001 C CNN
F 3 "" H 6950 3400 50  0001 C CNN
	1    6950 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 3400 6950 3450
$Comp
L Device:Crystal Y1
U 1 1 5B9E451B
P 7000 3000
F 0 "Y1" V 6954 3131 50  0000 L CNN
F 1 "16MHz" V 7045 3131 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 7000 3000 50  0001 C CNN
F 3 "~" H 7000 3000 50  0001 C CNN
	1    7000 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	6850 2950 6850 2850
Wire Wire Line
	6850 2850 7000 2850
$Comp
L Device:C C9
U 1 1 5B9E5619
P 7350 2850
F 0 "C9" V 7098 2850 50  0000 C CNN
F 1 "33p" V 7189 2850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 7388 2700 50  0001 C CNN
F 3 "~" H 7350 2850 50  0001 C CNN
	1    7350 2850
	0    1    1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 5B9E5D3A
P 7350 3150
F 0 "C10" V 7500 3150 50  0000 C CNN
F 1 "33p" V 7600 3150 50  0000 C BNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 7388 3000 50  0001 C CNN
F 3 "~" H 7350 3150 50  0001 C CNN
	1    7350 3150
	0    1    1    0   
$EndComp
Connection ~ 7000 2850
$Comp
L power:GND #PWR0107
U 1 1 5B9E6BB9
P 7550 2850
F 0 "#PWR0107" H 7550 2600 50  0001 C CNN
F 1 "GND" V 7555 2722 50  0000 R CNN
F 2 "" H 7550 2850 50  0001 C CNN
F 3 "" H 7550 2850 50  0001 C CNN
	1    7550 2850
	0    -1   1    0   
$EndComp
Wire Wire Line
	7550 2850 7500 2850
$Comp
L power:GND #PWR0108
U 1 1 5B9E81C7
P 7550 3150
F 0 "#PWR0108" H 7550 2900 50  0001 C CNN
F 1 "GND" V 7555 3022 50  0000 R CNN
F 2 "" H 7550 3150 50  0001 C CNN
F 3 "" H 7550 3150 50  0001 C CNN
	1    7550 3150
	0    -1   1    0   
$EndComp
Wire Wire Line
	7550 3150 7500 3150
$Comp
L Device:Buzzer BZ1
U 1 1 5B9ED9B8
P 7950 4650
F 0 "BZ1" H 8103 4679 50  0000 L CNN
F 1 "Buzzer" H 8103 4588 50  0000 L CNN
F 2 "Buzzer_Beeper:Buzzer_12x9.5RM7.6" V 7925 4750 50  0001 C CNN
F 3 "~" V 7925 4750 50  0001 C CNN
	1    7950 4650
	1    0    0    -1  
$EndComp
Text GLabel 7250 4550 0    50   Input ~ 0
D13
$Comp
L Device:R R16
U 1 1 5B9EEBF2
P 8250 2050
F 0 "R16" V 8150 2000 50  0000 L CNN
F 1 "1k" V 8320 2005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8180 2050 50  0001 C CNN
F 3 "~" H 8250 2050 50  0001 C CNN
	1    8250 2050
	0    1    1    0   
$EndComp
$Comp
L Device:LED D4
U 1 1 5B9EED0C
P 8500 2200
F 0 "D4" V 8538 2082 50  0000 R CNN
F 1 "WELD_LED" V 8447 2082 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8500 2200 50  0001 C CNN
F 3 "~" H 8500 2200 50  0001 C CNN
	1    8500 2200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5B9EFEB3
P 8500 2400
F 0 "#PWR0110" H 8500 2150 50  0001 C CNN
F 1 "GND" H 8505 2227 50  0000 C CNN
F 2 "" H 8500 2400 50  0001 C CNN
F 3 "" H 8500 2400 50  0001 C CNN
	1    8500 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2400 8500 2350
Wire Wire Line
	8500 2050 8400 2050
Text GLabel 8000 2050 0    50   Input ~ 0
D11
Wire Wire Line
	8000 2050 8100 2050
$Comp
L Device:R R25
U 1 1 5B9F4AE4
P 10150 4700
F 0 "R25" H 10220 4746 50  0000 L CNN
F 1 "1k" H 10220 4655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10080 4700 50  0001 C CNN
F 3 "~" H 10150 4700 50  0001 C CNN
	1    10150 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 5B9F4CBA
P 10150 4300
F 0 "#PWR0111" H 10150 4150 50  0001 C CNN
F 1 "+5V" H 10165 4473 50  0000 C CNN
F 2 "" H 10150 4300 50  0001 C CNN
F 3 "" H 10150 4300 50  0001 C CNN
	1    10150 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4450 10150 4550
$Comp
L power:GND #PWR0112
U 1 1 5B9F60FE
P 10150 4900
F 0 "#PWR0112" H 10150 4650 50  0001 C CNN
F 1 "GND" H 10155 4727 50  0000 C CNN
F 2 "" H 10150 4900 50  0001 C CNN
F 3 "" H 10150 4900 50  0001 C CNN
	1    10150 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4900 10150 4850
Text GLabel 10050 4450 0    50   Output ~ 0
D10
Wire Wire Line
	10150 4450 10050 4450
Wire Wire Line
	7000 2850 7200 2850
Wire Wire Line
	7000 3150 7200 3150
Wire Wire Line
	6850 2950 6250 2950
Wire Wire Line
	6250 3050 6850 3050
Wire Wire Line
	6850 3050 6850 3150
Wire Wire Line
	6850 3150 7000 3150
Connection ~ 7000 3150
$Comp
L Sensor_Temperature:DS18B20 U6
U 1 1 5BA024A1
P 10300 1400
F 0 "U6" H 10071 1446 50  0000 R CNN
F 1 "DS18B20" H 10071 1355 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9300 1150 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS18B20.pdf" H 10150 1650 50  0001 C CNN
	1    10300 1400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5BA02527
P 10300 1800
F 0 "#PWR0113" H 10300 1550 50  0001 C CNN
F 1 "GND" H 10305 1627 50  0000 C CNN
F 2 "" H 10300 1800 50  0001 C CNN
F 3 "" H 10300 1800 50  0001 C CNN
	1    10300 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 5BA0256A
P 10300 850
F 0 "#PWR0114" H 10300 700 50  0001 C CNN
F 1 "+5V" H 10315 1023 50  0000 C CNN
F 2 "" H 10300 850 50  0001 C CNN
F 3 "" H 10300 850 50  0001 C CNN
	1    10300 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 5BA025A3
P 9900 1100
F 0 "R24" H 9970 1146 50  0000 L CNN
F 1 "4k7" H 9970 1055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9830 1100 50  0001 C CNN
F 3 "~" H 9900 1100 50  0001 C CNN
	1    9900 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 850  10300 950 
Wire Wire Line
	10300 1700 10300 1800
Wire Wire Line
	10000 1400 9900 1400
Wire Wire Line
	9900 1400 9900 1250
Wire Wire Line
	9900 950  10300 950 
Connection ~ 10300 950 
Wire Wire Line
	10300 950  10300 1100
Text GLabel 9750 1400 0    50   Output ~ 0
A2
Wire Wire Line
	9900 1400 9750 1400
Connection ~ 9900 1400
$Comp
L power:GND #PWR0115
U 1 1 5BA07293
P 8150 750
F 0 "#PWR0115" H 8150 500 50  0001 C CNN
F 1 "GND" V 8155 622 50  0000 R CNN
F 2 "" H 8150 750 50  0001 C CNN
F 3 "" H 8150 750 50  0001 C CNN
	1    8150 750 
	0    1    -1   0   
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 5BA072DA
P 8150 850
F 0 "#PWR0116" H 8150 700 50  0001 C CNN
F 1 "+5V" V 8165 978 50  0000 L CNN
F 2 "" H 8150 850 50  0001 C CNN
F 3 "" H 8150 850 50  0001 C CNN
	1    8150 850 
	0    -1   -1   0   
$EndComp
Text GLabel 8150 950  0    50   Output ~ 0
A1
Text GLabel 8150 1050 0    50   Output ~ 0
A0
Text GLabel 8150 1150 0    50   Output ~ 0
D3
$Comp
L power:GND #PWR0117
U 1 1 5BA119C9
P 8250 1550
F 0 "#PWR0117" H 8250 1300 50  0001 C CNN
F 1 "GND" H 8255 1377 50  0000 C CNN
F 2 "" H 8250 1550 50  0001 C CNN
F 3 "" H 8250 1550 50  0001 C CNN
	1    8250 1550
	-1   0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BD137 Q3
U 1 1 5BA1AD21
P 10200 3400
F 0 "Q3" H 10392 3446 50  0000 L CNN
F 1 "BD137" H 10392 3355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-218-3_Vertical" H 10400 3325 50  0001 L CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00001225.pdf" H 10200 3400 50  0001 L CNN
	1    10200 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 5BA1AE14
P 9750 3400
F 0 "R23" V 9650 3350 50  0000 L CNN
F 1 "1k" V 9820 3355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9680 3400 50  0001 C CNN
F 3 "~" H 9750 3400 50  0001 C CNN
	1    9750 3400
	0    1    1    0   
$EndComp
Text GLabel 9450 3400 0    50   Input ~ 0
A3
Wire Wire Line
	9600 3400 9450 3400
Wire Wire Line
	9900 3400 10000 3400
$Comp
L power:GND #PWR0118
U 1 1 5BA1E61E
P 10300 3800
F 0 "#PWR0118" H 10300 3550 50  0001 C CNN
F 1 "GND" H 10305 3627 50  0000 C CNN
F 2 "" H 10300 3800 50  0001 C CNN
F 3 "" H 10300 3800 50  0001 C CNN
	1    10300 3800
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D5
U 1 1 5BA1F94F
P 10800 3400
F 0 "D5" V 10754 3479 50  0000 L CNN
F 1 "1N4148" V 10845 3479 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10800 3225 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/1N4148_1N4448.pdf" H 10800 3400 50  0001 C CNN
	1    10800 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	10300 3200 10300 3100
Wire Wire Line
	10300 3100 10800 3100
Wire Wire Line
	10800 3100 10800 3250
Wire Wire Line
	10800 3700 10300 3700
Wire Wire Line
	10300 3600 10300 3700
Wire Wire Line
	10800 3550 10800 3700
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 5BA24C17
P 10500 2700
F 0 "J7" H 10580 2692 50  0000 L CNN
F 1 "VENT" H 10580 2601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10500 2700 50  0001 C CNN
F 3 "~" H 10500 2700 50  0001 C CNN
	1    10500 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 2800 10300 3100
Connection ~ 10300 3100
$Comp
L power:+12V #PWR0119
U 1 1 5BA2A288
P 10300 2500
F 0 "#PWR0119" H 10300 2350 50  0001 C CNN
F 1 "+12V" H 10315 2673 50  0000 C CNN
F 2 "" H 10300 2500 50  0001 C CNN
F 3 "" H 10300 2500 50  0001 C CNN
	1    10300 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 2500 10300 2700
$Comp
L Connector_Generic:Conn_01x05 J5
U 1 1 5BA2F54E
P 8500 950
F 0 "J5" H 8579 992 50  0000 L CNN
F 1 "KY-040 Rotary Encoder" H 8579 901 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 8500 950 50  0001 C CNN
F 3 "~" H 8500 950 50  0001 C CNN
	1    8500 950 
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U1
U 1 1 5BA3B324
P 2300 1200
F 0 "U1" H 2300 1442 50  0000 C CNN
F 1 "LM7805_TO220" H 2300 1351 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 2300 1425 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 2300 1150 50  0001 C CNN
	1    2300 1200
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L78L33_TO92 U4
U 1 1 5BA3B596
P 4000 1200
F 0 "U4" H 4000 1442 50  0000 C CNN
F 1 "L78L33_TO92" H 4000 1351 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 4000 1425 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 4000 1150 50  0001 C CNN
	1    4000 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 5BA3B664
P 2850 1600
F 0 "C5" H 2968 1646 50  0000 L CNN
F 1 "100u/16V" H 2900 1500 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 2888 1450 50  0001 C CNN
F 3 "~" H 2850 1600 50  0001 C CNN
	1    2850 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5BA3CD49
P 2850 1850
F 0 "#PWR0120" H 2850 1600 50  0001 C CNN
F 1 "GND" H 2855 1677 50  0000 C CNN
F 2 "" H 2850 1850 50  0001 C CNN
F 3 "" H 2850 1850 50  0001 C CNN
	1    2850 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5BA4156C
P 3400 1600
F 0 "C6" H 3500 1550 50  0000 L CNN
F 1 "100n" H 3600 1650 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W4.5mm_P5.00mm" H 3438 1450 50  0001 C CNN
F 3 "~" H 3400 1600 50  0001 C CNN
	1    3400 1600
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5BA46823
P 3400 1850
F 0 "#PWR0121" H 3400 1600 50  0001 C CNN
F 1 "GND" H 3405 1677 50  0000 C CNN
F 2 "" H 3400 1850 50  0001 C CNN
F 3 "" H 3400 1850 50  0001 C CNN
	1    3400 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1750 3400 1850
$Comp
L Device:C C11
U 1 1 5BA4D701
P 8250 1400
F 0 "C11" H 8350 1350 50  0000 L CNN
F 1 "470n" H 8450 1450 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W4.5mm_P5.00mm" H 8288 1250 50  0001 C CNN
F 3 "~" H 8250 1400 50  0001 C CNN
	1    8250 1400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5BA4D802
P 4000 1850
F 0 "#PWR0122" H 4000 1600 50  0001 C CNN
F 1 "GND" H 4005 1677 50  0000 C CNN
F 2 "" H 4000 1850 50  0001 C CNN
F 3 "" H 4000 1850 50  0001 C CNN
	1    4000 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 5BA4D85B
P 2300 1850
F 0 "#PWR0123" H 2300 1600 50  0001 C CNN
F 1 "GND" H 2305 1677 50  0000 C CNN
F 2 "" H 2300 1850 50  0001 C CNN
F 3 "" H 2300 1850 50  0001 C CNN
	1    2300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1850 4000 1500
Wire Wire Line
	2300 1850 2300 1500
Wire Wire Line
	2850 1450 2850 1200
Wire Wire Line
	2850 1200 2600 1200
Wire Wire Line
	3400 1450 3400 1200
$Comp
L power:+3.3V #PWR0124
U 1 1 5BA5D1C0
P 4550 800
F 0 "#PWR0124" H 4550 650 50  0001 C CNN
F 1 "+3.3V" H 4565 973 50  0000 C CNN
F 2 "" H 4550 800 50  0001 C CNN
F 3 "" H 4550 800 50  0001 C CNN
	1    4550 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5BA5F1AB
P 1450 1550
F 0 "C1" H 1568 1596 50  0000 L CNN
F 1 "100u/16V" H 1450 1450 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 1488 1400 50  0001 C CNN
F 3 "~" H 1450 1550 50  0001 C CNN
	1    1450 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5BA5F1B2
P 1450 1850
F 0 "#PWR0125" H 1450 1600 50  0001 C CNN
F 1 "GND" H 1455 1677 50  0000 C CNN
F 2 "" H 1450 1850 50  0001 C CNN
F 3 "" H 1450 1850 50  0001 C CNN
	1    1450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1700 1450 1850
$Comp
L Device:C C3
U 1 1 5BA5F1B9
P 1900 1550
F 0 "C3" H 2000 1500 50  0000 L CNN
F 1 "100n" H 2100 1600 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W4.5mm_P5.00mm" H 1938 1400 50  0001 C CNN
F 3 "~" H 1900 1550 50  0001 C CNN
	1    1900 1550
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5BA5F1C0
P 1900 1850
F 0 "#PWR0126" H 1900 1600 50  0001 C CNN
F 1 "GND" H 1905 1677 50  0000 C CNN
F 2 "" H 1900 1850 50  0001 C CNN
F 3 "" H 1900 1850 50  0001 C CNN
	1    1900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1700 1900 1850
$Comp
L Connector:AVR-ISP-6 J4
U 1 1 5BA655FF
P 6750 1350
F 0 "J4" H 6470 1446 50  0000 R CNN
F 1 "AVR-ISP-6" H 6470 1355 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 6500 1400 50  0001 C CNN
F 3 " ~" H 5475 800 50  0001 C CNN
	1    6750 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 850  6650 800 
Text GLabel 7300 1150 2    50   BiDi ~ 0
D12
Wire Wire Line
	7300 1150 7150 1150
Text GLabel 7300 1250 2    50   BiDi ~ 0
D11
Wire Wire Line
	7300 1250 7150 1250
Text GLabel 7300 1350 2    50   Output ~ 0
D13
Wire Wire Line
	7300 1350 7150 1350
Text GLabel 7300 1450 2    50   Output ~ 0
RESET
Wire Wire Line
	7300 1450 7150 1450
Connection ~ 5700 1950
Wire Wire Line
	5700 1950 5750 1950
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5BA838F6
P 650 1200
F 0 "J1" H 570 1417 50  0000 C CNN
F 1 "+12V_INPUT" H 550 1350 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 650 1200 50  0001 C CNN
F 3 "~" H 650 1200 50  0001 C CNN
	1    650  1200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1450 1400 1450 1200
Wire Wire Line
	1900 1400 1900 1200
$Comp
L power:GND #PWR0127
U 1 1 5BA8A642
P 850 1850
F 0 "#PWR0127" H 850 1600 50  0001 C CNN
F 1 "GND" H 855 1677 50  0000 C CNN
F 2 "" H 850 1850 50  0001 C CNN
F 3 "" H 850 1850 50  0001 C CNN
	1    850  1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1200 3400 1200
Connection ~ 2850 1200
$Comp
L Diode:1N4001 D1
U 1 1 5BAA7E1D
P 1150 1200
F 0 "D1" H 1150 1416 50  0000 C CNN
F 1 "1N4001" H 1150 1325 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1150 1025 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1150 1200 50  0001 C CNN
	1    1150 1200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1300 1200 1450 1200
Connection ~ 1450 1200
Wire Wire Line
	1450 1200 1900 1200
Wire Wire Line
	1000 1200 850  1200
Wire Wire Line
	2000 1200 1900 1200
Connection ~ 1900 1200
Wire Wire Line
	3700 1200 3400 1200
Connection ~ 3400 1200
$Comp
L power:+12V #PWR0128
U 1 1 5BACDCDE
P 1450 800
F 0 "#PWR0128" H 1450 650 50  0001 C CNN
F 1 "+12V" H 1465 973 50  0000 C CNN
F 2 "" H 1450 800 50  0001 C CNN
F 3 "" H 1450 800 50  0001 C CNN
	1    1450 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0129
U 1 1 5BACDD3F
P 2850 800
F 0 "#PWR0129" H 2850 650 50  0001 C CNN
F 1 "+5V" H 2865 973 50  0000 C CNN
F 2 "" H 2850 800 50  0001 C CNN
F 3 "" H 2850 800 50  0001 C CNN
	1    2850 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5BADFC7B
P 4550 1600
F 0 "C7" H 4650 1550 50  0000 L CNN
F 1 "100n" H 4750 1650 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W4.5mm_P5.00mm" H 4588 1450 50  0001 C CNN
F 3 "~" H 4550 1600 50  0001 C CNN
	1    4550 1600
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 5BADFD06
P 4550 1850
F 0 "#PWR0130" H 4550 1600 50  0001 C CNN
F 1 "GND" H 4555 1677 50  0000 C CNN
F 2 "" H 4550 1850 50  0001 C CNN
F 3 "" H 4550 1850 50  0001 C CNN
	1    4550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1850 4550 1750
Wire Wire Line
	4550 1450 4550 1200
Connection ~ 4550 1200
$Comp
L Connector_Generic:Conn_01x08 J6
U 1 1 5BAF828C
P 9300 5500
F 0 "J6" H 9300 4950 50  0000 L CNN
F 1 "NOKIA5110_LCD" H 9300 4850 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 9300 5500 50  0001 C CNN
F 3 "~" H 9300 5500 50  0001 C CNN
	1    9300 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 5BAFDC87
P 10500 4350
F 0 "J8" H 10579 4342 50  0000 L CNN
F 1 "SW_START" H 10579 4251 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10500 4350 50  0001 C CNN
F 3 "~" H 10500 4350 50  0001 C CNN
	1    10500 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 4450 10150 4450
Connection ~ 10150 4450
Wire Wire Line
	10300 4350 10150 4350
Wire Wire Line
	10150 4350 10150 4300
$Comp
L power:GND #PWR0131
U 1 1 5BB0924F
P 9000 6100
F 0 "#PWR0131" H 9000 5850 50  0001 C CNN
F 1 "GND" H 9005 5927 50  0000 C CNN
F 2 "" H 9000 6100 50  0001 C CNN
F 3 "" H 9000 6100 50  0001 C CNN
	1    9000 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 6100 9000 5900
Wire Wire Line
	9000 5900 9100 5900
$Comp
L Device:R R22
U 1 1 5BB0C1D5
P 8850 5800
F 0 "R22" V 8900 5600 50  0000 L CNN
F 1 "390" V 9000 5600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8780 5800 50  0001 C CNN
F 3 "~" H 8850 5800 50  0001 C CNN
	1    8850 5800
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_3_Open JP2
U 1 1 5BB0F332
P 8000 5700
F 0 "JP2" V 8046 5768 50  0000 L CNN
F 1 "LCD Power Selector" V 7955 5768 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 8000 5700 50  0001 C CNN
F 3 "~" H 8000 5700 50  0001 C CNN
	1    8000 5700
	0    -1   -1   0   
$EndComp
Text GLabel 8500 5800 0    50   Input ~ 0
D9
$Comp
L power:+3.3V #PWR0132
U 1 1 5BB1BF54
P 7750 6000
F 0 "#PWR0132" H 7750 5850 50  0001 C CNN
F 1 "+3.3V" V 7765 6128 50  0000 L CNN
F 2 "" H 7750 6000 50  0001 C CNN
F 3 "" H 7750 6000 50  0001 C CNN
	1    7750 6000
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0133
U 1 1 5BB1BFDD
P 7700 5450
F 0 "#PWR0133" H 7700 5300 50  0001 C CNN
F 1 "+5V" V 7715 5578 50  0000 L CNN
F 2 "" H 7700 5450 50  0001 C CNN
F 3 "" H 7700 5450 50  0001 C CNN
	1    7700 5450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7700 5450 8000 5450
Wire Wire Line
	8000 5450 8000 5500
Wire Wire Line
	8000 5900 8000 6000
Wire Wire Line
	8000 6000 7750 6000
$Comp
L Device:R R17
U 1 1 5BB24D51
P 8850 5200
F 0 "R17" V 8850 5800 50  0000 L CNN
F 1 "10k" V 8850 6050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8780 5200 50  0001 C CNN
F 3 "~" H 8850 5200 50  0001 C CNN
	1    8850 5200
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 5BB24EEB
P 8850 5300
F 0 "R18" V 8850 5900 50  0000 L CNN
F 1 "10k" V 8850 6150 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8780 5300 50  0001 C CNN
F 3 "~" H 8850 5300 50  0001 C CNN
	1    8850 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 5BB25049
P 8850 5400
F 0 "R19" V 8850 6000 50  0000 L CNN
F 1 "10k" V 8850 6250 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8780 5400 50  0001 C CNN
F 3 "~" H 8850 5400 50  0001 C CNN
	1    8850 5400
	0    1    1    0   
$EndComp
$Comp
L Device:R R20
U 1 1 5BB250AF
P 8850 5500
F 0 "R20" V 8850 6100 50  0000 L CNN
F 1 "10k" V 8850 6350 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8780 5500 50  0001 C CNN
F 3 "~" H 8850 5500 50  0001 C CNN
	1    8850 5500
	0    1    1    0   
$EndComp
$Comp
L Device:R R21
U 1 1 5BB25229
P 8850 5600
F 0 "R21" V 8850 6200 50  0000 L CNN
F 1 "10k" V 8850 6450 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8780 5600 50  0001 C CNN
F 3 "~" H 8850 5600 50  0001 C CNN
	1    8850 5600
	0    1    1    0   
$EndComp
Text GLabel 8500 5200 0    50   Input ~ 0
D4
Text GLabel 8500 5300 0    50   Input ~ 0
D5
Text GLabel 8500 5400 0    50   Input ~ 0
D6
Wire Wire Line
	8150 5700 9100 5700
Text GLabel 8500 5500 0    50   Input ~ 0
D7
Text GLabel 8500 5600 0    50   Input ~ 0
D8
$Comp
L Device:R R13
U 1 1 5BB5EF26
P 5050 1000
F 0 "R13" H 5120 1046 50  0000 L CNN
F 1 "2k2 (opt)" H 5120 955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4980 1000 50  0001 C CNN
F 3 "~" H 5050 1000 50  0001 C CNN
	1    5050 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5BB5F014
P 5050 1500
F 0 "R14" H 5120 1546 50  0000 L CNN
F 1 "3k6 (opt)" H 5120 1455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4980 1500 50  0001 C CNN
F 3 "~" H 5050 1500 50  0001 C CNN
	1    5050 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5BB5F0BD
P 5050 1850
F 0 "#PWR0134" H 5050 1600 50  0001 C CNN
F 1 "GND" H 5055 1677 50  0000 C CNN
F 2 "" H 5050 1850 50  0001 C CNN
F 3 "" H 5050 1850 50  0001 C CNN
	1    5050 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0135
U 1 1 5BB5F1E4
P 5050 800
F 0 "#PWR0135" H 5050 650 50  0001 C CNN
F 1 "+5V" H 5065 973 50  0000 C CNN
F 2 "" H 5050 800 50  0001 C CNN
F 3 "" H 5050 800 50  0001 C CNN
	1    5050 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 850  5050 800 
Wire Wire Line
	5050 1150 5050 1200
Wire Wire Line
	5050 1650 5050 1850
Connection ~ 5050 1200
Wire Wire Line
	5050 1200 5050 1350
Text Notes 7450 7500 0    50   ~ 10
Nano Spot Welder V0.0.5 (PCB)
Text Notes 8200 7650 0    50   ~ 0
2018.09.16
Text Notes 10600 7650 0    50   ~ 10
0.0.5
Wire Wire Line
	9100 5600 9000 5600
Wire Wire Line
	9100 5500 9000 5500
Wire Wire Line
	9000 5400 9100 5400
Wire Wire Line
	9100 5300 9000 5300
Wire Wire Line
	9100 5200 9000 5200
Wire Wire Line
	8700 5800 8500 5800
Wire Wire Line
	9100 5800 9000 5800
Wire Wire Line
	8700 5200 8500 5200
Wire Wire Line
	8500 5300 8700 5300
Wire Wire Line
	8700 5400 8500 5400
Wire Wire Line
	8500 5500 8700 5500
Wire Wire Line
	8700 5600 8500 5600
$Comp
L Isolator:4N25 U2
U 1 1 5BBE2BF6
P 2800 3350
F 0 "U2" H 2750 3650 50  0000 C CNN
F 1 "4N25" H 2800 3584 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 2600 3150 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83725/4n25.pdf" H 2800 3350 50  0001 L CNN
	1    2800 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5BBE3672
P 3250 2950
F 0 "R7" H 3320 2996 50  0000 L CNN
F 1 "100k" H 3320 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3180 2950 50  0001 C CNN
F 3 "~" H 3250 2950 50  0001 C CNN
	1    3250 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 5BBE374F
P 3250 2650
F 0 "#PWR0136" H 3250 2400 50  0001 C CNN
F 1 "GND" H 3255 2477 50  0000 C CNN
F 2 "" H 3250 2650 50  0001 C CNN
F 3 "" H 3250 2650 50  0001 C CNN
	1    3250 2650
	1    0    0    1   
$EndComp
Wire Wire Line
	3250 3100 3250 3250
Wire Wire Line
	3250 3250 3100 3250
Wire Wire Line
	3250 2800 3250 2650
$Comp
L power:GND #PWR0137
U 1 1 5BBECC81
P 3250 3500
F 0 "#PWR0137" H 3250 3250 50  0001 C CNN
F 1 "GND" H 3255 3327 50  0000 C CNN
F 2 "" H 3250 3500 50  0001 C CNN
F 3 "" H 3250 3500 50  0001 C CNN
	1    3250 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3450 3250 3450
Wire Wire Line
	3250 3450 3250 3500
$Comp
L Device:R R9
U 1 1 5BBF1A22
P 3650 2950
F 0 "R9" H 3720 2996 50  0000 L CNN
F 1 "56k" H 3720 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3580 2950 50  0001 C CNN
F 3 "~" H 3650 2950 50  0001 C CNN
	1    3650 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0138
U 1 1 5BBF1A94
P 3650 2700
F 0 "#PWR0138" H 3650 2550 50  0001 C CNN
F 1 "+5V" H 3665 2873 50  0000 C CNN
F 2 "" H 3650 2700 50  0001 C CNN
F 3 "" H 3650 2700 50  0001 C CNN
	1    3650 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2700 3650 2800
Wire Wire Line
	3650 3350 3100 3350
Wire Wire Line
	3650 3100 3650 3350
Text GLabel 3850 3350 2    50   Output ~ 0
D2
Wire Wire Line
	3850 3350 3650 3350
Connection ~ 3650 3350
$Comp
L Diode_Bridge:DF01M D2
U 1 1 5BC05CC0
P 1650 3350
F 0 "D2" V 1696 3009 50  0000 R CNN
F 1 "DF01M (opt)" V 1605 3009 50  0000 R CNN
F 2 "Diode_THT:Diode_Bridge_DIP-4_W7.62mm_P5.08mm" H 1800 3475 50  0001 L CNN
F 3 "http://www.vishay.com/docs/88571/dfm.pdf" H 1650 3350 50  0001 C CNN
	1    1650 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5BC1600A
P 2200 3050
F 0 "R4" V 2100 3050 50  0000 C CNN
F 1 "4k7 (opt)" V 2300 3050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 2130 3050 50  0001 C CNN
F 3 "~" H 2200 3050 50  0001 C CNN
	1    2200 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	2500 3250 2500 3050
Wire Wire Line
	2500 3050 2350 3050
Wire Wire Line
	1650 3650 2500 3650
Wire Wire Line
	2500 3650 2500 3450
$Comp
L Device:R R1
U 1 1 5BC2719D
P 1350 3900
F 0 "R1" H 1420 3946 50  0000 L CNN
F 1 "33k" H 1420 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P15.24mm_Horizontal" V 1280 3900 50  0001 C CNN
F 3 "~" H 1350 3900 50  0001 C CNN
	1    1350 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5BC2730C
P 1950 3900
F 0 "R3" H 2020 3946 50  0000 L CNN
F 1 "33k" H 2020 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P15.24mm_Horizontal" V 1880 3900 50  0001 C CNN
F 3 "~" H 1950 3900 50  0001 C CNN
	1    1950 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3750 1950 3350
Wire Wire Line
	1350 3750 1350 3350
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5BC34ACB
P 750 6400
F 0 "J2" H 670 6075 50  0000 C CNN
F 1 "230V In" H 670 6166 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 750 6400 50  0001 C CNN
F 3 "~" H 750 6400 50  0001 C CNN
	1    750  6400
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5BC34C72
P 750 7250
F 0 "J3" H 670 6925 50  0000 C CNN
F 1 "MOT" H 670 7016 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 750 7250 50  0001 C CNN
F 3 "~" H 750 7250 50  0001 C CNN
	1    750  7250
	-1   0    0    1   
$EndComp
Wire Wire Line
	950  6400 1250 6400
Wire Wire Line
	1250 6400 1250 7150
Wire Wire Line
	1250 7150 950  7150
$Comp
L Device:R R2
U 1 1 5BC61BB8
P 1450 6550
F 0 "R2" H 1520 6596 50  0000 L CNN
F 1 "510" H 1520 6505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 1380 6550 50  0001 C CNN
F 3 "~" H 1450 6550 50  0001 C CNN
	1    1450 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5BC623B8
P 1450 6950
F 0 "C2" H 1250 6950 50  0000 L TNN
F 1 "10n/400V" H 1350 6950 50  0000 R BNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 1488 6800 50  0001 C CNN
F 3 "~" H 1450 6950 50  0001 C CNN
	1    1450 6950
	-1   0    0    1   
$EndComp
Wire Wire Line
	950  7250 1450 7250
Wire Wire Line
	1450 7250 1450 7100
Wire Wire Line
	1450 6800 1450 6700
Wire Wire Line
	1250 6400 1250 4250
Wire Wire Line
	1250 4250 1950 4250
Wire Wire Line
	1950 4250 1950 4050
Connection ~ 1250 6400
Wire Wire Line
	1200 6300 1200 4200
Wire Wire Line
	1200 4200 1350 4200
Wire Wire Line
	1350 4200 1350 4050
Wire Wire Line
	1200 6300 950  6300
Wire Wire Line
	1200 6300 1450 6300
Wire Wire Line
	1450 6300 1450 6400
Connection ~ 1200 6300
$Comp
L Triac_Thyristor:BT139-600 Q1
U 1 1 5BC9B9C1
P 2100 6700
F 0 "Q1" H 2229 6746 50  0000 L CNN
F 1 "BTA41-600V" H 2229 6655 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-3P-3_Horizontal_TabDown" H 2300 6625 50  0001 L CIN
F 3 "https://www.rapidonline.com/pdf/47-3240.pdf" H 2100 6700 50  0001 L CNN
	1    2100 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2100 6550 2100 6300
Wire Wire Line
	2100 6300 1450 6300
Connection ~ 1450 6300
Wire Wire Line
	2100 6850 2100 7250
Wire Wire Line
	2100 7250 1450 7250
Connection ~ 1450 7250
$Comp
L Device:R R5
U 1 1 5BCBB119
P 2400 6300
F 0 "R5" V 2300 6250 50  0000 L CNN
F 1 "2k2" V 2500 6250 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2330 6300 50  0001 C CNN
F 3 "~" H 2400 6300 50  0001 C CNN
	1    2400 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 6300 2100 6300
Connection ~ 2100 6300
$Comp
L Device:C C4
U 1 1 5BCC3261
P 2650 7050
F 0 "C4" H 2450 7050 50  0000 L TNN
F 1 "150n/400V" H 2550 7050 50  0000 R BNN
F 2 "Capacitor_THT:C_Rect_L18.0mm_W8.0mm_P15.00mm_FKS3_FKP3" H 2688 6900 50  0001 C CNN
F 3 "~" H 2650 7050 50  0001 C CNN
	1    2650 7050
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 6900 2650 6300
Wire Wire Line
	2650 6300 2550 6300
Wire Wire Line
	2650 7200 2650 7250
Wire Wire Line
	2650 7250 2100 7250
Connection ~ 2100 7250
$Comp
L Device:R R6
U 1 1 5BCD3E76
P 2900 6300
F 0 "R6" V 2800 6250 50  0000 L CNN
F 1 "390" V 3000 6250 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2830 6300 50  0001 C CNN
F 3 "~" H 2900 6300 50  0001 C CNN
	1    2900 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 6300 2650 6300
Connection ~ 2650 6300
$Comp
L Relay_SolidState:MOC3051M U3
U 1 1 5BCDC86F
P 3600 6550
F 0 "U3" H 3600 6875 50  0000 C CNN
F 1 "MOC3051M" H 3600 6784 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 3400 6350 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3052M.pdf" H 3575 6550 50  0001 L CNN
	1    3600 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3050 6300 3300 6300
Wire Wire Line
	3300 6300 3300 6450
$Comp
L Device:R R8
U 1 1 5BCE56F4
P 3300 7050
F 0 "R8" H 3370 7096 50  0000 L CNN
F 1 "1k" H 3370 7005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3230 7050 50  0001 C CNN
F 3 "~" H 3300 7050 50  0001 C CNN
	1    3300 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 7250 3300 7250
Wire Wire Line
	3300 7250 3300 7200
Connection ~ 2650 7250
Wire Wire Line
	3300 6900 3300 6800
Wire Wire Line
	2250 6800 3300 6800
Connection ~ 3300 6800
Wire Wire Line
	3300 6800 3300 6650
$Comp
L power:GND #PWR0139
U 1 1 5BD00D59
P 3950 7200
F 0 "#PWR0139" H 3950 6950 50  0001 C CNN
F 1 "GND" H 3955 7027 50  0000 C CNN
F 2 "" H 3950 7200 50  0001 C CNN
F 3 "" H 3950 7200 50  0001 C CNN
	1    3950 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6650 3950 6650
Wire Wire Line
	3950 6650 3950 7200
$Comp
L Device:R R10
U 1 1 5BD160E1
P 4150 6450
F 0 "R10" V 4050 6400 50  0000 L CNN
F 1 "390" V 4250 6400 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4080 6450 50  0001 C CNN
F 3 "~" H 4150 6450 50  0001 C CNN
	1    4150 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	4000 6450 3900 6450
$Comp
L Device:R R11
U 1 1 5BD1FB55
P 4400 6650
F 0 "R11" H 4470 6696 50  0000 L CNN
F 1 "390" H 4470 6605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4330 6650 50  0001 C CNN
F 3 "~" H 4400 6650 50  0001 C CNN
	1    4400 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5BD205AD
P 4400 7000
F 0 "D3" V 4438 6882 50  0000 R CNN
F 1 "WELD_STATE_LED" V 4347 6882 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4400 7000 50  0001 C CNN
F 3 "~" H 4400 7000 50  0001 C CNN
	1    4400 7000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0140
U 1 1 5BD20817
P 4400 7200
F 0 "#PWR0140" H 4400 6950 50  0001 C CNN
F 1 "GND" H 4405 7027 50  0000 C CNN
F 2 "" H 4400 7200 50  0001 C CNN
F 3 "" H 4400 7200 50  0001 C CNN
	1    4400 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 7200 4400 7150
Wire Wire Line
	4400 6850 4400 6800
Wire Wire Line
	4400 6500 4400 6450
Wire Wire Line
	4400 6450 4300 6450
$Comp
L Transistor_BJT:BC548 Q2
U 1 1 5BD3E3BE
P 4500 6100
F 0 "Q2" H 4690 6146 50  0000 L CNN
F 1 "BC548" H 4690 6055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 4700 6025 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 4500 6100 50  0001 L CNN
	1    4500 6100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4400 6300 4400 6450
Connection ~ 4400 6450
$Comp
L Device:R R12
U 1 1 5BD4860D
P 4950 6100
F 0 "R12" V 4850 6050 50  0000 L CNN
F 1 "10k" V 5050 6050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4880 6100 50  0001 C CNN
F 3 "~" H 4950 6100 50  0001 C CNN
	1    4950 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 6100 4700 6100
$Comp
L power:+5V #PWR0141
U 1 1 5BD52AF7
P 4400 5700
F 0 "#PWR0141" H 4400 5550 50  0001 C CNN
F 1 "+5V" H 4415 5873 50  0000 C CNN
F 2 "" H 4400 5700 50  0001 C CNN
F 3 "" H 4400 5700 50  0001 C CNN
	1    4400 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5700 4400 5900
Text GLabel 5300 6100 2    50   Input ~ 0
D12
Wire Wire Line
	5300 6100 5100 6100
NoConn ~ 6250 3650
NoConn ~ 6250 3750
NoConn ~ 6250 4050
NoConn ~ 6250 4150
Wire Wire Line
	2850 1750 2850 1850
Wire Wire Line
	10300 3700 10300 3800
Connection ~ 10300 3700
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5BE05004
P 900 1750
F 0 "#FLG0104" H 900 1825 50  0001 C CNN
F 1 "PWR_FLAG" V 900 1878 50  0000 L CNN
F 2 "" H 900 1750 50  0001 C CNN
F 3 "~" H 900 1750 50  0001 C CNN
	1    900  1750
	0    1    1    0   
$EndComp
Wire Wire Line
	900  1750 850  1750
Connection ~ 850  1750
Wire Wire Line
	850  1750 850  1850
Wire Wire Line
	2850 800  2850 1200
Wire Wire Line
	4550 800  4550 1200
Wire Wire Line
	1450 800  1450 900 
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5BE1139D
P 1550 900
F 0 "#FLG0101" H 1550 975 50  0001 C CNN
F 1 "PWR_FLAG" V 1550 1028 50  0000 L CNN
F 2 "" H 1550 900 50  0001 C CNN
F 3 "~" H 1550 900 50  0001 C CNN
	1    1550 900 
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 900  1450 900 
Connection ~ 1450 900 
Wire Wire Line
	1450 900  1450 1200
Wire Wire Line
	4300 1200 4550 1200
Wire Wire Line
	4550 1200 5050 1200
$Comp
L Switch:SW_Push_Dual SW1
U 1 1 5BBA7376
P 8300 3700
F 0 "SW1" H 8300 3985 50  0000 C CNN
F 1 "SW Reset" H 8300 3894 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H5mm" H 8300 3900 50  0001 C CNN
F 3 "" H 8300 3900 50  0001 C CNN
	1    8300 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0142
U 1 1 5BBC7CC3
P 8650 3800
F 0 "#PWR0142" H 8650 3550 50  0001 C CNN
F 1 "GND" V 8655 3672 50  0000 R CNN
F 2 "" H 8650 3800 50  0001 C CNN
F 3 "" H 8650 3800 50  0001 C CNN
	1    8650 3800
	0    -1   1    0   
$EndComp
Wire Wire Line
	8100 3700 8000 3700
Wire Wire Line
	8000 3700 8000 3800
Wire Wire Line
	8000 3900 8100 3900
Wire Wire Line
	8500 3700 8600 3700
Wire Wire Line
	8600 3700 8600 3800
Wire Wire Line
	8600 3900 8500 3900
Wire Wire Line
	8600 3800 8650 3800
Connection ~ 8600 3800
Wire Wire Line
	8600 3800 8600 3900
Wire Wire Line
	8000 3800 7800 3800
Wire Wire Line
	7800 3800 7800 4000
Wire Wire Line
	7800 4000 6950 4000
Wire Wire Line
	6950 4000 6950 3850
Connection ~ 8000 3800
Wire Wire Line
	8000 3800 8000 3900
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5BC04147
P 8850 5200
F 0 "JP1" H 8850 5405 50  0001 C CNN
F 1 "SolderJumper_2_Open" H 8850 5313 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 8850 5200 50  0001 C CNN
F 3 "~" H 8850 5200 50  0001 C CNN
	1    8850 5200
	1    0    0    -1  
$EndComp
Connection ~ 8700 5200
Connection ~ 9000 5200
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5BC103A8
P 8850 5300
F 0 "JP3" H 8850 5505 50  0001 C CNN
F 1 "SolderJumper_2_Open" H 8850 5414 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 8850 5300 50  0001 C CNN
F 3 "~" H 8850 5300 50  0001 C CNN
	1    8850 5300
	1    0    0    -1  
$EndComp
Connection ~ 8700 5300
Connection ~ 9000 5300
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 5BC10458
P 8850 5400
F 0 "JP4" H 8850 5605 50  0001 C CNN
F 1 "SolderJumper_2_Open" H 8850 5514 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 8850 5400 50  0001 C CNN
F 3 "~" H 8850 5400 50  0001 C CNN
	1    8850 5400
	1    0    0    -1  
$EndComp
Connection ~ 8700 5400
Connection ~ 9000 5400
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 5BC104EA
P 8850 5500
F 0 "JP5" H 8850 5705 50  0001 C CNN
F 1 "SolderJumper_2_Open" H 8850 5614 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 8850 5500 50  0001 C CNN
F 3 "~" H 8850 5500 50  0001 C CNN
	1    8850 5500
	1    0    0    -1  
$EndComp
Connection ~ 8700 5500
Connection ~ 9000 5500
$Comp
L Jumper:SolderJumper_2_Open JP6
U 1 1 5BC10612
P 8850 5600
F 0 "JP6" H 8850 5805 50  0001 C CNN
F 1 "SolderJumper_2_Open" H 8850 5714 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 8850 5600 50  0001 C CNN
F 3 "~" H 8850 5600 50  0001 C CNN
	1    8850 5600
	1    0    0    -1  
$EndComp
Connection ~ 8700 5600
Connection ~ 9000 5600
Wire Wire Line
	1650 3050 2050 3050
$Comp
L Mechanical:MountingHole MH1
U 1 1 5BBF91CD
P 2400 4550
F 0 "MH1" H 2500 4596 50  0000 L CNN
F 1 "MountingHole" H 2500 4505 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 2400 4550 50  0001 C CNN
F 3 "~" H 2400 4550 50  0001 C CNN
	1    2400 4550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH4
U 1 1 5BC05B24
P 3200 4550
F 0 "MH4" H 3300 4596 50  0000 L CNN
F 1 "MountingHole" H 3300 4505 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 3200 4550 50  0001 C CNN
F 3 "~" H 3200 4550 50  0001 C CNN
	1    3200 4550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH2
U 1 1 5BC05BE0
P 2400 4750
F 0 "MH2" H 2500 4796 50  0000 L CNN
F 1 "MountingHole" H 2500 4705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 2400 4750 50  0001 C CNN
F 3 "~" H 2400 4750 50  0001 C CNN
	1    2400 4750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH5
U 1 1 5BC05C98
P 3200 4750
F 0 "MH5" H 3300 4796 50  0000 L CNN
F 1 "MountingHole" H 3300 4705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 3200 4750 50  0001 C CNN
F 3 "~" H 3200 4750 50  0001 C CNN
	1    3200 4750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 5BC05D4A
P 2400 4950
F 0 "MH3" H 2500 4996 50  0000 L CNN
F 1 "MountingHole" H 2500 4905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 2400 4950 50  0001 C CNN
F 3 "~" H 2400 4950 50  0001 C CNN
	1    2400 4950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH6
U 1 1 5BC05E04
P 3200 4950
F 0 "MH6" H 3300 4996 50  0000 L CNN
F 1 "MountingHole" H 3300 4905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 3200 4950 50  0001 C CNN
F 3 "~" H 3200 4950 50  0001 C CNN
	1    3200 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 750  8150 750 
Wire Wire Line
	8300 850  8150 850 
Wire Wire Line
	8300 950  8150 950 
Wire Wire Line
	8300 1050 8150 1050
Wire Wire Line
	8300 1150 8250 1150
Wire Wire Line
	8250 1250 8250 1150
Connection ~ 8250 1150
Wire Wire Line
	8250 1150 8150 1150
Wire Wire Line
	850  1300 850  1750
$Comp
L power:GND #PWR01
U 1 1 5BDD9CE4
P 7700 4850
F 0 "#PWR01" H 7700 4600 50  0001 C CNN
F 1 "GND" H 7705 4677 50  0000 C CNN
F 2 "" H 7700 4850 50  0001 C CNN
F 3 "" H 7700 4850 50  0001 C CNN
	1    7700 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4550 7700 4550
Wire Wire Line
	7850 4750 7700 4750
Wire Wire Line
	7700 4750 7700 4850
$Comp
L Device:R R26
U 1 1 5C3277AC
P 7550 4550
F 0 "R26" V 7450 4500 50  0000 L CNN
F 1 "33" V 7650 4500 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7480 4550 50  0001 C CNN
F 3 "~" H 7550 4550 50  0001 C CNN
	1    7550 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	7400 4550 7250 4550
$EndSCHEMATC
