EESchema Schematic File Version 4
EELAYER 30 0
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
L ARDUINO_NANO:ARDUINO_NANO TB1
U 1 1 5ED12A82
P 10200 2100
F 0 "TB1" H 10200 3667 50  0000 C CNN
F 1 "ARDUINO_NANO" H 10200 3576 50  0000 C CNN
F 2 "ARDUINO_NANO:SHIELD_ARDUINO_NANO" H 10200 2100 50  0001 L BNN
F 3 "http://www.circuitstoday.com/arduino-nano-tutorial-pinout-schematics" H 10200 2100 50  0001 L BNN
F 4 "Manufacturer Recommendations" H 10200 2100 50  0001 L BNN "Field4"
	1    10200 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR016
U 1 1 5ED1B837
P 11050 900
F 0 "#PWR016" H 11050 750 50  0001 C CNN
F 1 "+3.3V" H 11065 1073 50  0000 C CNN
F 2 "" H 11050 900 50  0001 C CNN
F 3 "" H 11050 900 50  0001 C CNN
	1    11050 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 900  11050 900 
$Comp
L power:GND #PWR015
U 1 1 5ED1EA3A
P 10900 3400
F 0 "#PWR015" H 10900 3150 50  0001 C CNN
F 1 "GND" H 10905 3227 50  0000 C CNN
F 2 "" H 10900 3400 50  0001 C CNN
F 3 "" H 10900 3400 50  0001 C CNN
	1    10900 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5ED1F01B
P 10900 800
F 0 "#PWR014" H 10900 650 50  0001 C CNN
F 1 "+5V" H 10915 973 50  0000 C CNN
F 2 "" H 10900 800 50  0001 C CNN
F 3 "" H 10900 800 50  0001 C CNN
	1    10900 800 
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 5ED1B6F5
P 1300 7100
F 0 "J1" H 1380 7092 50  0000 L CNN
F 1 "Conn_01x04" H 1380 7001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 1300 7100 50  0001 C CNN
F 3 "~" H 1300 7100 50  0001 C CNN
	1    1300 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5ED1C3F6
P 1100 7300
F 0 "#PWR02" H 1100 7050 50  0001 C CNN
F 1 "GND" H 1105 7127 50  0000 C CNN
F 2 "" H 1100 7300 50  0001 C CNN
F 3 "" H 1100 7300 50  0001 C CNN
	1    1100 7300
	1    0    0    -1  
$EndComp
Text GLabel 1100 7100 0    50   Input ~ 0
SCL
Text GLabel 1100 7000 0    50   Input ~ 0
SDA
$Comp
L power:+3.3V #PWR01
U 1 1 5ED1CAD2
P 850 6900
F 0 "#PWR01" H 850 6750 50  0001 C CNN
F 1 "+3.3V" H 865 7073 50  0000 C CNN
F 2 "" H 850 6900 50  0001 C CNN
F 3 "" H 850 6900 50  0001 C CNN
	1    850  6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 7200 850  7200
Wire Wire Line
	850  7200 850  6900
Text Notes 650  7650 0    50   ~ 0
Break-out for the I2C interface\n
Text Notes 2100 7650 0    50   ~ 0
Status LCD:\nShows peltier temps + current-draw\n
Text GLabel 9500 2800 0    50   Input ~ 0
SDA
Text GLabel 9500 2900 0    50   Input ~ 0
SCL
$Comp
L User_made_symbols:OLED_128x32_I2C U2
U 1 1 5ED1570B
P 3350 6900
F 0 "U2" V 3700 7050 50  0000 R CNN
F 1 "OLED_128x32_I2C" H 3600 6900 50  0000 R CNN
F 2 "peltier_driver_pcb:OLED_128x32_I2C" H 3550 6250 50  0001 C CNN
F 3 "https://cdn-shop.adafruit.com/datasheets/SSD1306.pdf" H 3100 5900 50  0001 C CNN
	1    3350 6900
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 5ED22892
P 2550 6550
F 0 "#PWR05" H 2550 6400 50  0001 C CNN
F 1 "+3.3V" H 2565 6723 50  0000 C CNN
F 2 "" H 2550 6550 50  0001 C CNN
F 3 "" H 2550 6550 50  0001 C CNN
	1    2550 6550
	1    0    0    -1  
$EndComp
Text GLabel 2900 6500 2    50   Input ~ 0
SDA
Text GLabel 2900 6400 2    50   Input ~ 0
SCL
$Comp
L power:GND #PWR06
U 1 1 5ED224B9
P 2750 7200
F 0 "#PWR06" H 2750 6950 50  0001 C CNN
F 1 "GND" H 2850 7050 50  0000 R CNN
F 2 "" H 2750 7200 50  0001 C CNN
F 3 "" H 2750 7200 50  0001 C CNN
	1    2750 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 7200 2750 7100
Wire Wire Line
	2750 7100 2800 7100
Wire Wire Line
	2900 6400 2700 6400
Wire Wire Line
	2700 6400 2700 6900
Wire Wire Line
	2700 6900 2800 6900
Wire Wire Line
	2800 6800 2800 6500
Wire Wire Line
	2800 6500 2900 6500
Text Notes 3850 7650 0    50   ~ 0
For measuting the current-draw from the coils (bidirectional)\n+36V up to 15A, high or low side, integrated shunt-resistor\n(2miliohms) measured by a 16bit ADC:\nhttps://www.adafruit.com/product/4226
Wire Notes Line
	2100 6200 2100 7450
Wire Notes Line
	2100 7450 3500 7450
Wire Notes Line
	3500 7450 3500 6200
Wire Notes Line
	3500 6200 2100 6200
Wire Wire Line
	1850 3000 1600 3000
$Comp
L power:GND #PWR04
U 1 1 5ED24F95
P 1600 3000
F 0 "#PWR04" H 1600 2750 50  0001 C CNN
F 1 "GND" H 1605 2827 50  0000 C CNN
F 2 "" H 1600 3000 50  0001 C CNN
F 3 "" H 1600 3000 50  0001 C CNN
	1    1600 3000
	1    0    0    -1  
$EndComp
Connection ~ 1600 3000
Wire Wire Line
	1600 3000 1300 3000
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5ED2B4A3
P 1100 2950
F 0 "J2" H 1180 2942 50  0000 L CNN
F 1 "Pt1000_top" H 950 2750 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1100 2950 50  0001 C CNN
F 3 "~" H 1100 2950 50  0001 C CNN
	1    1100 2950
	-1   0    0    1   
$EndComp
$Comp
L Sensor:INA260 U3
U 1 1 5ED493F3
P 4900 6700
F 0 "U3" H 4650 7250 50  0000 C CNN
F 1 "INA260" H 4600 7150 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 4900 6100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina260.pdf" H 4900 6600 50  0001 C CNN
	1    4900 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6200 4900 6300
$Comp
L power:GND #PWR011
U 1 1 5ED4F0EA
P 4900 7100
F 0 "#PWR011" H 4900 6850 50  0001 C CNN
F 1 "GND" H 4900 6950 50  0000 C CNN
F 2 "" H 4900 7100 50  0001 C CNN
F 3 "" H 4900 7100 50  0001 C CNN
	1    4900 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 6900 4500 6900
Text GLabel 4450 6900 0    50   Input ~ 0
IN-
Wire Wire Line
	4150 6500 4500 6500
Text GLabel 4150 6500 0    50   Input ~ 0
IN+
Wire Wire Line
	4100 6600 4300 6600
Wire Wire Line
	4100 6750 4100 6600
$Comp
L power:GND #PWR09
U 1 1 5ED5C3CD
P 4100 6750
F 0 "#PWR09" H 4100 6500 50  0001 C CNN
F 1 "GND" H 4105 6577 50  0000 C CNN
F 2 "" H 4100 6750 50  0001 C CNN
F 3 "" H 4100 6750 50  0001 C CNN
	1    4100 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 6300 5750 6300
Connection ~ 5700 6300
Wire Wire Line
	5700 6200 5700 6300
Wire Wire Line
	5300 6700 5650 6700
Wire Wire Line
	5650 6700 5800 6700
Connection ~ 5650 6700
Wire Wire Line
	5650 6300 5700 6300
Wire Wire Line
	5650 6500 5650 6700
Wire Wire Line
	5750 6600 5800 6600
Connection ~ 5750 6600
Wire Wire Line
	5750 6500 5750 6600
Wire Wire Line
	5300 6600 5750 6600
Text GLabel 5800 6600 2    50   Input ~ 0
SCL
Text GLabel 5800 6700 2    50   Input ~ 0
SDA
$Comp
L Device:R_Small_US R8
U 1 1 5ED53E0F
P 5750 6400
F 0 "R8" H 5750 6550 50  0000 L CNN
F 1 "4K7" H 5800 6350 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5750 6400 50  0001 C CNN
F 3 "~" H 5750 6400 50  0001 C CNN
	1    5750 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R7
U 1 1 5ED53930
P 5650 6400
F 0 "R7" H 5600 6550 50  0000 L CNN
F 1 "4K7" H 5450 6450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5650 6400 50  0001 C CNN
F 3 "~" H 5650 6400 50  0001 C CNN
	1    5650 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5ED5245A
P 4900 6000
F 0 "#PWR010" H 4900 5750 50  0001 C CNN
F 1 "GND" H 4905 5827 50  0000 C CNN
F 2 "" H 4900 6000 50  0001 C CNN
F 3 "" H 4900 6000 50  0001 C CNN
	1    4900 6000
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5ED50276
P 4900 6100
F 0 "C2" H 4808 6054 50  0000 R CNN
F 1 "0.1uF" H 4808 6145 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4900 6100 50  0001 C CNN
F 3 "~" H 4900 6100 50  0001 C CNN
	1    4900 6100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5ED4FBCB
P 4400 6600
F 0 "C1" V 4450 6500 50  0000 C CNN
F 1 "C_BUS" V 4500 6650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4400 6600 50  0001 C CNN
F 3 "~" H 4400 6600 50  0001 C CNN
	1    4400 6600
	0    1    1    0   
$EndComp
Wire Notes Line
	3850 5750 6050 5750
Wire Notes Line
	3850 7300 6050 7300
Wire Wire Line
	5300 6800 5300 6900
Wire Wire Line
	4900 7100 5300 7100
Wire Wire Line
	5300 7100 5300 6900
Connection ~ 4900 7100
Connection ~ 5300 6900
$Comp
L power:+3.3V #PWR013
U 1 1 5EDEC00F
P 5700 6200
F 0 "#PWR013" H 5700 6050 50  0001 C CNN
F 1 "+3.3V" H 5715 6373 50  0000 C CNN
F 2 "" H 5700 6200 50  0001 C CNN
F 3 "" H 5700 6200 50  0001 C CNN
	1    5700 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 6200 5350 6300
Wire Wire Line
	5350 6300 4900 6300
Connection ~ 4900 6300
$Comp
L Amplifier_Operational:MCP601-xSN U1
U 1 1 5ED4A2C8
P 2950 2500
F 0 "U1" H 3150 2650 50  0000 L CNN
F 1 "MCP601-xSN" H 3050 2800 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2850 2300 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21314g.pdf" H 3100 2650 50  0001 C CNN
	1    2950 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5ED4BA77
P 2850 2200
F 0 "#PWR07" H 2850 2050 50  0001 C CNN
F 1 "+5V" H 2865 2373 50  0000 C CNN
F 2 "" H 2850 2200 50  0001 C CNN
F 3 "" H 2850 2200 50  0001 C CNN
	1    2850 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5ED4C382
P 2850 2800
F 0 "#PWR08" H 2850 2550 50  0001 C CNN
F 1 "GND" H 2855 2627 50  0000 C CNN
F 2 "" H 2850 2800 50  0001 C CNN
F 3 "" H 2850 2800 50  0001 C CNN
	1    2850 2800
	1    0    0    -1  
$EndComp
Text GLabel 9500 2200 0    50   Input ~ 0
T_sense
Text GLabel 3600 2500 2    50   Input ~ 0
T_sense
Wire Wire Line
	2550 2600 2600 2600
$Comp
L Device:R R5
U 1 1 5ED5ABB3
P 2400 2600
F 0 "R5" V 2500 2600 50  0000 L CNN
F 1 "100k" V 2400 2500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2330 2600 50  0001 C CNN
F 3 "~" H 2400 2600 50  0001 C CNN
	1    2400 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 3100 2600 2600
Connection ~ 2600 2600
Wire Wire Line
	2600 2600 2650 2600
Text Notes 2600 3400 0    50   ~ 0
Non-inverting differential amplifier.\nSecond gain stage.\n
Wire Wire Line
	1300 2950 1300 3000
Text Notes 700  1500 0    50   ~ 0
Validate the gain stage resistors, etc:\nSee Pt1000 look-up table to tune desired sensing range\n(https://www.sterlingsensors.co.uk/pt1000-resistance-table):\n0C    = 1000 Ohms\n50C  = 1194.00 Ohms \n100C = 1358.10 Ohms\n\ni.e tune feedback R such that T_sense is 5V at the "max" temp (e.g. 50C or 100C), \nto maximize resolution for smaller temperature ranges.
$Comp
L Device:R R4
U 1 1 5ED86A70
P 1850 2850
F 0 "R4" H 1900 2800 50  0000 L CNN
F 1 "1K" V 1850 2800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1780 2850 50  0001 C CNN
F 3 "~" H 1850 2850 50  0001 C CNN
	1    1850 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5ED87019
P 1850 2250
F 0 "R3" H 1900 2200 50  0000 L CNN
F 1 "1K" V 1850 2200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1780 2250 50  0001 C CNN
F 3 "~" H 1850 2250 50  0001 C CNN
	1    1850 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2400 2650 2400
Wire Wire Line
	1850 2700 1850 2400
Connection ~ 1850 2400
Wire Wire Line
	1300 2600 2250 2600
Wire Wire Line
	1300 2600 1300 2850
Wire Wire Line
	1300 2400 1300 2600
Connection ~ 1300 2600
$Comp
L Device:R R1
U 1 1 5ED8BB38
P 1300 2250
F 0 "R1" H 1350 2200 50  0000 L CNN
F 1 "1K" V 1300 2200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1230 2250 50  0001 C CNN
F 3 "~" H 1300 2250 50  0001 C CNN
	1    1300 2250
	1    0    0    -1  
$EndComp
Text Notes 600  3350 0    50   ~ 0
Quarter wheatstone bridge (balanced at 0C).\nUse POT to balance at RT?
$Comp
L Device:R R6
U 1 1 5ED8C740
P 3100 3100
F 0 "R6" V 3000 3050 50  0000 L CNN
F 1 "100k" V 3100 3000 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3030 3100 50  0001 C CNN
F 3 "~" H 3100 3100 50  0001 C CNN
	1    3100 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	3400 3100 3400 2500
Wire Wire Line
	3250 2500 3400 2500
Connection ~ 3400 2500
Wire Wire Line
	3400 2500 3600 2500
Wire Wire Line
	3250 3100 3400 3100
Wire Wire Line
	2600 3100 2950 3100
Text Notes 600  3700 0    50   ~ 10
Sim this analog bit in LTSPICE before comitting to design?
Wire Wire Line
	2550 6550 2550 7000
Wire Wire Line
	2800 7000 2550 7000
Text Notes 900  6150 0    50   ~ 0
Note don't need PuP resistors here as this I2C devices is adjacent to\nanother one on the same PCB.
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 5ED8DDBA
P 3950 5900
F 0 "J3" H 3900 6000 50  0000 L CNN
F 1 "Peltier_1b" H 3650 5800 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 3950 5900 50  0001 C CNN
F 3 "~" H 3950 5900 50  0001 C CNN
	1    3950 5900
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 5ED8E2DB
P 3950 6200
F 0 "J4" H 3900 6300 50  0000 L CNN
F 1 "Peltier_2b" H 3650 6100 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 3950 6200 50  0001 C CNN
F 3 "~" H 3950 6200 50  0001 C CNN
	1    3950 6200
	-1   0    0    1   
$EndComp
Text GLabel 4150 5900 2    50   Input ~ 0
IN+
Text GLabel 4150 6200 2    50   Input ~ 0
IN-
Wire Wire Line
	1300 2100 1600 2100
$Comp
L Device:R_POT_TRIM RV1
U 1 1 5ED8910F
P 4600 1550
F 0 "RV1" H 4530 1596 50  0000 R CNN
F 1 "3K" V 4600 1600 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3296W_Vertical" H 4600 1550 50  0001 C CNN
F 3 "~" H 4600 1550 50  0001 C CNN
	1    4600 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5ED8FC06
P 4950 1250
F 0 "R2" H 4800 1200 50  0000 L CNN
F 1 "1K" V 4950 1200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4880 1250 50  0001 C CNN
F 3 "~" H 4950 1250 50  0001 C CNN
	1    4950 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4600 1300 4600 1400
Wire Wire Line
	4800 1100 4950 1100
Wire Wire Line
	4950 1400 4950 1550
Wire Wire Line
	4950 1550 4750 1550
Wire Wire Line
	4750 1550 4750 1700
Wire Wire Line
	4750 1700 4600 1700
Connection ~ 4750 1550
$Comp
L power:+5V #PWR03
U 1 1 5ED944B7
P 4600 800
F 0 "#PWR03" H 4600 650 50  0001 C CNN
F 1 "+5V" H 4615 973 50  0000 C CNN
F 2 "" H 4600 800 50  0001 C CNN
F 3 "" H 4600 800 50  0001 C CNN
	1    4600 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 800  4600 900 
Text GLabel 4600 1950 0    50   Input ~ 0
I_ref
Connection ~ 4600 1700
Text GLabel 1500 1850 0    50   Input ~ 0
I_ref
Wire Wire Line
	1500 1850 1600 1850
Wire Wire Line
	1600 1850 1600 2100
Connection ~ 1600 2100
Wire Wire Line
	1600 2100 1850 2100
Wire Wire Line
	4600 1700 4600 1950
Text Notes 4950 800  0    50   ~ 0
Constant current source with trim-pot \nfor ensuring a strict 1mA for the RTD\n
$Comp
L Reference_Current:LM334Z U4
U 1 1 5EDA4EB9
P 4600 1100
F 0 "U4" H 4470 1146 50  0000 R CNN
F 1 "LM334Z" H 4470 1055 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4625 925 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm134.pdf" H 4600 1100 50  0001 C CIN
	1    4600 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 5EE03FCC
P 5350 6200
F 0 "#PWR0101" H 5350 6050 50  0001 C CNN
F 1 "+3.3V" H 5365 6373 50  0000 C CNN
F 2 "" H 5350 6200 50  0001 C CNN
F 3 "" H 5350 6200 50  0001 C CNN
	1    5350 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F1
U 1 1 5ED7FAB5
P 4950 5500
F 0 "F1" V 4850 5500 50  0000 C CNN
F 1 "3A hold, 5.1A trip" V 5100 5500 50  0000 C CNN
F 2 "Fuse:Fuse_Bourns_MF-RG300" V 4880 5500 50  0001 C CNN
F 3 "https://docs.rs-online.com/9fc6/0900766b813374cb.pdf" H 4950 5500 50  0001 C CNN
	1    4950 5500
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 5ED805DF
P 5300 5500
F 0 "J6" H 5250 5600 50  0000 L CNN
F 1 "Peltier_2a" H 5400 5500 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 5300 5500 50  0001 C CNN
F 3 "~" H 5300 5500 50  0001 C CNN
	1    5300 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 5ED80D27
P 4600 5500
F 0 "J5" H 4550 5400 50  0000 L CNN
F 1 "Peltier_1a" H 4700 5500 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4600 5500 50  0001 C CNN
F 3 "~" H 4600 5500 50  0001 C CNN
	1    4600 5500
	-1   0    0    1   
$EndComp
Wire Notes Line
	3850 5250 6050 5250
Wire Notes Line
	3850 5250 3850 7300
Wire Notes Line
	6050 5250 6050 7300
Text GLabel 5300 6500 2    50   Input ~ 0
ALRT
Text GLabel 9500 2700 0    50   Input ~ 0
ALRT
Text GLabel 10900 2400 2    50   Input ~ 0
D7
Text GLabel 10900 2500 2    50   Input ~ 0
D8
Text GLabel 10900 2600 2    50   Input ~ 0
D9
Text GLabel 10900 3000 2    50   Input ~ 0
D13
Text GLabel 10900 2900 2    50   Input ~ 0
D12
Text GLabel 10900 2800 2    50   Input ~ 0
D11
Text GLabel 10900 2700 2    50   Input ~ 0
D10
Text GLabel 9500 3000 0    50   Input ~ 0
D6
Text GLabel 9500 2400 0    50   Input ~ 0
D0
Text GLabel 9500 2500 0    50   Input ~ 0
D1
Text GLabel 9500 1500 0    50   Input ~ 0
A0
Text GLabel 9500 1600 0    50   Input ~ 0
A1
Text GLabel 9500 1700 0    50   Input ~ 0
A2
Text GLabel 9500 1800 0    50   Input ~ 0
A3
Text GLabel 9500 1900 0    50   Input ~ 0
A4
Text GLabel 8750 2000 0    50   Input ~ 0
POT_fine
Wire Wire Line
	8750 2000 9500 2000
Text GLabel 8750 2100 0    50   Input ~ 0
POT_coarse
Wire Wire Line
	8750 2100 9500 2100
Text GLabel 8750 2600 0    50   Input ~ 0
BTN
Wire Wire Line
	8750 2600 9500 2600
Text GLabel 10400 4350 2    50   Input ~ 0
D7
Text GLabel 10400 4450 2    50   Input ~ 0
D8
Text GLabel 10400 4550 2    50   Input ~ 0
D9
Text GLabel 10400 4950 2    50   Input ~ 0
D13
Text GLabel 10400 4850 2    50   Input ~ 0
D12
Text GLabel 10400 4750 2    50   Input ~ 0
D11
Text GLabel 10400 4650 2    50   Input ~ 0
D10
Text GLabel 10400 4150 2    50   Input ~ 0
D6
Text GLabel 10400 4250 2    50   Input ~ 0
D0
Text GLabel 9900 4350 0    50   Input ~ 0
D1
$Comp
L power:+3.3V #PWR012
U 1 1 5EE310C5
P 9450 4050
F 0 "#PWR012" H 9450 3900 50  0001 C CNN
F 1 "+3.3V" H 9465 4223 50  0000 C CNN
F 2 "" H 9450 4050 50  0001 C CNN
F 3 "" H 9450 4050 50  0001 C CNN
	1    9450 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5EE32E23
P 9600 4350
F 0 "#PWR017" H 9600 4100 50  0001 C CNN
F 1 "GND" H 9605 4177 50  0000 C CNN
F 2 "" H 9600 4350 50  0001 C CNN
F 3 "" H 9600 4350 50  0001 C CNN
	1    9600 4350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x09_Counter_Clockwise J7
U 1 1 5EE3C42F
P 10100 4550
F 0 "J7" H 10150 5167 50  0000 C CNN
F 1 "Arduino_breakout" H 10150 5076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x09_P2.54mm_Vertical" H 10100 4550 50  0001 C CNN
F 3 "~" H 10100 4550 50  0001 C CNN
	1    10100 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 4350 9600 4250
Wire Wire Line
	9600 4250 9900 4250
$Comp
L power:+5V #PWR018
U 1 1 5EE4F7FF
P 9700 3900
F 0 "#PWR018" H 9700 3750 50  0001 C CNN
F 1 "+5V" H 9715 4073 50  0000 C CNN
F 2 "" H 9700 3900 50  0001 C CNN
F 3 "" H 9700 3900 50  0001 C CNN
	1    9700 3900
	1    0    0    -1  
$EndComp
Text GLabel 9900 4950 0    50   Input ~ 0
A0
Text GLabel 9900 4850 0    50   Input ~ 0
A1
Text GLabel 9900 4750 0    50   Input ~ 0
A2
Text GLabel 9900 4650 0    50   Input ~ 0
A3
Text GLabel 9900 4550 0    50   Input ~ 0
A4
Wire Wire Line
	9900 4150 9450 4150
Wire Wire Line
	9450 4150 9450 4050
Wire Wire Line
	9700 3900 9700 4450
Wire Wire Line
	9700 4450 9900 4450
$EndSCHEMATC
