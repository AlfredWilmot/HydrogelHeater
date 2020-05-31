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
	2100 2750 1850 2750
$Comp
L power:GND #PWR04
U 1 1 5ED24F95
P 1850 2750
F 0 "#PWR04" H 1850 2500 50  0001 C CNN
F 1 "GND" H 1855 2577 50  0000 C CNN
F 2 "" H 1850 2750 50  0001 C CNN
F 3 "" H 1850 2750 50  0001 C CNN
	1    1850 2750
	1    0    0    -1  
$EndComp
Connection ~ 1850 2750
Wire Wire Line
	1850 2750 1550 2750
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5ED2B4A3
P 1350 2700
F 0 "J2" H 1430 2692 50  0000 L CNN
F 1 "Pt1000_top" H 1200 2500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1350 2700 50  0001 C CNN
F 3 "~" H 1350 2700 50  0001 C CNN
	1    1350 2700
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
F 1 "4K7" H 5500 6300 50  0000 L CNN
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
F 2 "Capacitor_SMD:C_2816_7142Metric" H 4400 6600 50  0001 C CNN
F 3 "~" H 4400 6600 50  0001 C CNN
	1    4400 6600
	0    1    1    0   
$EndComp
Wire Notes Line
	3850 7300 3850 5750
Wire Notes Line
	3850 5750 6050 5750
Wire Notes Line
	6050 5750 6050 7300
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
$Comp
L power:+5V #PWR012
U 1 1 5EDEC521
P 5350 6200
F 0 "#PWR012" H 5350 6050 50  0001 C CNN
F 1 "+5V" H 5365 6373 50  0000 C CNN
F 2 "" H 5350 6200 50  0001 C CNN
F 3 "" H 5350 6200 50  0001 C CNN
	1    5350 6200
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
P 3200 2250
F 0 "U1" H 3400 2400 50  0000 L CNN
F 1 "MCP601-xSN" H 3300 2550 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3100 2050 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21314g.pdf" H 3350 2400 50  0001 C CNN
	1    3200 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5ED4BA77
P 3100 1950
F 0 "#PWR07" H 3100 1800 50  0001 C CNN
F 1 "+5V" H 3115 2123 50  0000 C CNN
F 2 "" H 3100 1950 50  0001 C CNN
F 3 "" H 3100 1950 50  0001 C CNN
	1    3100 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5ED4C382
P 3100 2550
F 0 "#PWR08" H 3100 2300 50  0001 C CNN
F 1 "GND" H 3105 2377 50  0000 C CNN
F 2 "" H 3100 2550 50  0001 C CNN
F 3 "" H 3100 2550 50  0001 C CNN
	1    3100 2550
	1    0    0    -1  
$EndComp
Text GLabel 9500 2200 0    50   Input ~ 0
T_sense
Text GLabel 3850 2250 2    50   Input ~ 0
T_sense
Wire Wire Line
	2800 2350 2850 2350
$Comp
L Device:R R5
U 1 1 5ED5ABB3
P 2650 2350
F 0 "R5" V 2750 2350 50  0000 L CNN
F 1 "100k" V 2650 2250 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2580 2350 50  0001 C CNN
F 3 "~" H 2650 2350 50  0001 C CNN
	1    2650 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 2850 2850 2350
Connection ~ 2850 2350
Wire Wire Line
	2850 2350 2900 2350
Text Notes 2850 3150 0    50   ~ 0
Non-inverting differential amplifier.\nSecond gain stage.\n
$Comp
L Device:R R2
U 1 1 5ED1DFE2
P 1800 1700
F 0 "R2" H 1850 1650 50  0000 L CNN
F 1 "4K" V 1800 1650 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1730 1700 50  0001 C CNN
F 3 "~" H 1800 1700 50  0001 C CNN
	1    1800 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2700 1550 2750
Text Notes 650  1200 0    50   ~ 0
Validate the gain stage resistors, etc:\nSee Pt1000 look-up table to tune desired sensing range\n(https://www.sterlingsensors.co.uk/pt1000-resistance-table):\n0C    = 1000 Ohms\n50C  = 1194.00 Ohms \n100C = 1358.10 Ohms\n\ni.e tune feedback R such that T_sense is 5V at the "max" temp (e.g. 50C or 100C), \nto maximize resolution for smaller temperature ranges.
$Comp
L power:+5V #PWR03
U 1 1 5ED22256
P 1800 1550
F 0 "#PWR03" H 1800 1400 50  0001 C CNN
F 1 "+5V" H 1815 1723 50  0000 C CNN
F 2 "" H 1800 1550 50  0001 C CNN
F 3 "" H 1800 1550 50  0001 C CNN
	1    1800 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5ED86A70
P 2100 2600
F 0 "R4" H 2150 2550 50  0000 L CNN
F 1 "1K" V 2100 2550 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2030 2600 50  0001 C CNN
F 3 "~" H 2100 2600 50  0001 C CNN
	1    2100 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5ED87019
P 2100 2000
F 0 "R3" H 2150 1950 50  0000 L CNN
F 1 "1K" V 2100 1950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2030 2000 50  0001 C CNN
F 3 "~" H 2100 2000 50  0001 C CNN
	1    2100 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2150 2900 2150
Wire Wire Line
	2100 2450 2100 2150
Connection ~ 2100 2150
Wire Wire Line
	1550 2350 2500 2350
Wire Wire Line
	1550 2350 1550 2600
Wire Wire Line
	1550 2150 1550 2350
Connection ~ 1550 2350
Wire Wire Line
	1550 1850 1800 1850
Connection ~ 1800 1850
Wire Wire Line
	1800 1850 2100 1850
$Comp
L Device:R R1
U 1 1 5ED8BB38
P 1550 2000
F 0 "R1" H 1600 1950 50  0000 L CNN
F 1 "1K" V 1550 1950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1480 2000 50  0001 C CNN
F 3 "~" H 1550 2000 50  0001 C CNN
	1    1550 2000
	1    0    0    -1  
$EndComp
Text Notes 1950 1600 0    50   ~ 0
I-limiting resistor \n(ideally would use a constant I -source)\nNo more than 1mA can pass through Pt1000
Text Notes 850  3100 0    50   ~ 0
Quarter wheatstone bridge (balanced at 0C).\nUse POT to balance at RT?
$Comp
L Device:R R6
U 1 1 5ED8C740
P 3350 2850
F 0 "R6" V 3250 2800 50  0000 L CNN
F 1 "100k" V 3350 2750 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3280 2850 50  0001 C CNN
F 3 "~" H 3350 2850 50  0001 C CNN
	1    3350 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 2850 3650 2250
Wire Wire Line
	3500 2250 3650 2250
Connection ~ 3650 2250
Wire Wire Line
	3650 2250 3850 2250
Wire Wire Line
	3500 2850 3650 2850
Wire Wire Line
	2850 2850 3200 2850
Text Notes 850  3450 0    50   ~ 10
Sim this analog bit in LTSPICE before comitting to design?
Wire Wire Line
	2550 6550 2550 7000
Wire Wire Line
	2800 7000 2550 7000
Text Notes 900  6150 0    50   ~ 0
Note don't need PuP resistors here as this I2C devices is adjacent to\nanother one on the same PCB.
$EndSCHEMATC
