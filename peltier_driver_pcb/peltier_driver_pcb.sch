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
Wire Notes Line
	2100 6200 2100 7450
Wire Notes Line
	2100 7450 3500 7450
Wire Notes Line
	3500 7450 3500 6200
Wire Notes Line
	3500 6200 2100 6200
Wire Notes Line
	8750 4500 10950 4500
Wire Notes Line
	8750 6050 10950 6050
Text GLabel 3450 4750 2    50   Input ~ 0
T_sense
$Comp
L Device:R R6
U 1 1 5ED8C740
P 2350 5300
F 0 "R6" V 2250 5250 50  0000 L CNN
F 1 "30K" V 2350 5200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2280 5300 50  0001 C CNN
F 3 "~" H 2350 5300 50  0001 C CNN
	1    2350 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 6550 2550 7000
Wire Wire Line
	2800 7000 2550 7000
Text Notes 900  6150 0    50   ~ 0
Note don't need PuP resistors here as this I2C devices is adjacent to\nanother one on the same PCB.
$Comp
L Device:Fuse F1
U 1 1 5ED7FAB5
P 9850 4250
F 0 "F1" V 9750 4250 50  0000 C CNN
F 1 "3A hold, 5.1A trip" V 10000 4250 50  0000 C CNN
F 2 "Fuse:Fuse_Bourns_MF-RG300" V 9780 4250 50  0001 C CNN
F 3 "https://docs.rs-online.com/9fc6/0900766b813374cb.pdf" H 9850 4250 50  0001 C CNN
	1    9850 4250
	0    1    1    0   
$EndComp
Wire Notes Line
	8750 4000 10950 4000
Wire Notes Line
	8750 4000 8750 6050
Wire Notes Line
	10950 4000 10950 6050
$Comp
L power:GND #PWR08
U 1 1 5ED4C382
P 2700 5550
F 0 "#PWR08" H 2700 5300 50  0001 C CNN
F 1 "GND" H 2705 5377 50  0000 C CNN
F 2 "" H 2700 5550 50  0001 C CNN
F 3 "" H 2700 5550 50  0001 C CNN
	1    2700 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5ED4BA77
P 2700 4450
F 0 "#PWR07" H 2700 4300 50  0001 C CNN
F 1 "+5V" H 2715 4623 50  0000 C CNN
F 2 "" H 2700 4450 50  0001 C CNN
F 3 "" H 2700 4450 50  0001 C CNN
	1    2700 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5ED2B4A3
P 1500 5100
F 0 "J2" H 1580 5092 50  0000 L CNN
F 1 "GA10K4A1_NTC" H 1550 4900 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1500 5100 50  0001 C CNN
F 3 "~" H 1500 5100 50  0001 C CNN
	1    1500 5100
	-1   0    0    1   
$EndComp
$Comp
L pspice:OPAMP U?
U 1 1 5EDDD8B6
P 2800 4750
F 0 "U?" H 3144 4796 50  0000 L CNN
F 1 "OPAMP" H 2850 4950 50  0000 L CNN
F 2 "" H 2800 4750 50  0001 C CNN
F 3 "~" H 2800 4750 50  0001 C CNN
	1    2800 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4750 3250 4750
$Comp
L Device:R R?
U 1 1 5EDDEA72
P 1700 4850
F 0 "R?" V 1600 4800 50  0000 L CNN
F 1 "30K" V 1700 4750 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1630 4850 50  0001 C CNN
F 3 "~" H 1700 4850 50  0001 C CNN
	1    1700 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 4850 2350 4850
Wire Wire Line
	2350 4850 2350 5150
$Comp
L Device:R R?
U 1 1 5EDE5230
P 2950 5150
F 0 "R?" V 2850 5100 50  0000 L CNN
F 1 "30K" V 2950 5050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2880 5150 50  0001 C CNN
F 3 "~" H 2950 5150 50  0001 C CNN
	1    2950 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 5150 2350 5150
Connection ~ 2350 5150
Wire Wire Line
	3100 5150 3250 5150
Wire Wire Line
	3250 5150 3250 4750
Connection ~ 3250 4750
Wire Wire Line
	3250 4750 3450 4750
Wire Wire Line
	2350 5450 2700 5450
Wire Wire Line
	2700 5450 2700 5550
Wire Wire Line
	2700 5050 2700 5450
Connection ~ 2700 5450
$Comp
L power:+5V #PWR?
U 1 1 5EDEA6BA
P 1700 4500
F 0 "#PWR?" H 1700 4350 50  0001 C CNN
F 1 "+5V" H 1715 4673 50  0000 C CNN
F 2 "" H 1700 4500 50  0001 C CNN
F 3 "" H 1700 4500 50  0001 C CNN
	1    1700 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4500 1700 4650
$Comp
L power:GND #PWR?
U 1 1 5EDEBAAB
P 1700 5200
F 0 "#PWR?" H 1700 4950 50  0001 C CNN
F 1 "GND" H 1705 5027 50  0000 C CNN
F 2 "" H 1700 5200 50  0001 C CNN
F 3 "" H 1700 5200 50  0001 C CNN
	1    1700 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5100 1700 5200
Wire Wire Line
	2500 4650 1700 4650
Connection ~ 1700 4650
Wire Wire Line
	1700 4650 1700 4700
$Comp
L Device:R_Shunt R?
U 1 1 5EDF3AE0
P 9850 4800
F 0 "R?" V 9625 4800 50  0000 C CNN
F 1 "0.5m" V 9716 4800 50  0000 C CNN
F 2 "" V 9780 4800 50  0001 C CNN
F 3 "~" H 9850 4800 50  0001 C CNN
	1    9850 4800
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Current:INA283 U?
U 1 1 5EDF6968
P 9850 5400
F 0 "U?" V 9804 5744 50  0000 L CNN
F 1 "INA283" V 9895 5744 50  0000 L CNN
F 2 "" H 9850 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 9850 5400 50  0001 C CNN
	1    9850 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 5100 9950 4950
Wire Wire Line
	9750 4950 9750 5100
$Comp
L power:GND #PWR?
U 1 1 5EDFD364
P 9400 5700
F 0 "#PWR?" H 9400 5450 50  0001 C CNN
F 1 "GND" H 9405 5527 50  0000 C CNN
F 2 "" H 9400 5700 50  0001 C CNN
F 3 "" H 9400 5700 50  0001 C CNN
	1    9400 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 5300 9400 5300
Wire Wire Line
	9400 5300 9400 5500
$Comp
L power:+5V #PWR?
U 1 1 5EDFEA5C
P 9550 5150
F 0 "#PWR?" H 9550 5000 50  0001 C CNN
F 1 "+5V" H 9565 5323 50  0000 C CNN
F 2 "" H 9550 5150 50  0001 C CNN
F 3 "" H 9550 5150 50  0001 C CNN
	1    9550 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 5150 9550 5300
Connection ~ 9550 5300
Wire Wire Line
	9550 5300 9550 5400
$Comp
L power:+5V #PWR?
U 1 1 5EDFFBEF
P 10150 5150
F 0 "#PWR?" H 10150 5000 50  0001 C CNN
F 1 "+5V" H 10165 5323 50  0000 C CNN
F 2 "" H 10150 5150 50  0001 C CNN
F 3 "" H 10150 5150 50  0001 C CNN
	1    10150 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5150 10150 5300
Wire Wire Line
	9550 5500 9400 5500
Connection ~ 9400 5500
Wire Wire Line
	9400 5500 9400 5700
Wire Wire Line
	9250 4800 9650 4800
Wire Wire Line
	10050 4800 10400 4800
Text GLabel 5000 4550 0    50   Input ~ 0
5v
Text GLabel 5000 4750 0    50   Input ~ 0
GND
Text GLabel 9950 5850 2    50   Input ~ 0
I_sense_1
Wire Wire Line
	9850 5700 9850 5850
Wire Wire Line
	9850 5850 9950 5850
Text GLabel 5000 4900 0    50   Input ~ 0
T_sense
Text GLabel 5000 5050 0    50   Input ~ 0
I_sense_1
Text GLabel 5000 4650 0    50   Input ~ 0
3v3
Text GLabel 5000 5150 0    50   Input ~ 0
I_sense_2
Text GLabel 5000 5250 0    50   Input ~ 0
I_sense_3
Text Notes 9050 6250 0    50   ~ 0
Reference pins set to bidirectional setup\n(for unidirectional setup connect both to gnd)
Wire Notes Line
	8750 2250 10950 2250
Wire Notes Line
	8750 3800 10950 3800
$Comp
L Device:R_Shunt R?
U 1 1 5EE216C0
P 9850 2550
F 0 "R?" V 9625 2550 50  0000 C CNN
F 1 "0.5m" V 9716 2550 50  0000 C CNN
F 2 "" V 9780 2550 50  0001 C CNN
F 3 "~" H 9850 2550 50  0001 C CNN
	1    9850 2550
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Current:INA283 U?
U 1 1 5EE216C6
P 9850 3150
F 0 "U?" V 9804 3494 50  0000 L CNN
F 1 "INA283" V 9895 3494 50  0000 L CNN
F 2 "" H 9850 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 9850 3150 50  0001 C CNN
	1    9850 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 2850 9950 2700
Wire Wire Line
	9750 2700 9750 2850
$Comp
L power:GND #PWR?
U 1 1 5EE216CE
P 9400 3450
F 0 "#PWR?" H 9400 3200 50  0001 C CNN
F 1 "GND" H 9405 3277 50  0000 C CNN
F 2 "" H 9400 3450 50  0001 C CNN
F 3 "" H 9400 3450 50  0001 C CNN
	1    9400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3050 9400 3050
Wire Wire Line
	9400 3050 9400 3250
$Comp
L power:+5V #PWR?
U 1 1 5EE216D6
P 9550 2900
F 0 "#PWR?" H 9550 2750 50  0001 C CNN
F 1 "+5V" H 9565 3073 50  0000 C CNN
F 2 "" H 9550 2900 50  0001 C CNN
F 3 "" H 9550 2900 50  0001 C CNN
	1    9550 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 2900 9550 3050
Connection ~ 9550 3050
Wire Wire Line
	9550 3050 9550 3150
$Comp
L power:+5V #PWR?
U 1 1 5EE216DF
P 10150 2900
F 0 "#PWR?" H 10150 2750 50  0001 C CNN
F 1 "+5V" H 10165 3073 50  0000 C CNN
F 2 "" H 10150 2900 50  0001 C CNN
F 3 "" H 10150 2900 50  0001 C CNN
	1    10150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 2900 10150 3050
Wire Wire Line
	9550 3250 9400 3250
Connection ~ 9400 3250
Wire Wire Line
	9400 3250 9400 3450
Wire Wire Line
	9250 2550 9650 2550
Wire Wire Line
	10050 2550 10400 2550
Text GLabel 9950 3600 2    50   Input ~ 0
I_sense_2
Wire Wire Line
	9850 3450 9850 3600
Wire Wire Line
	9850 3600 9950 3600
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EE71483
P 9050 2550
F 0 "J?" H 9000 2650 50  0000 L CNN
F 1 "I_2a" H 8950 2450 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 9050 2550 50  0001 C CNN
F 3 "~" H 9050 2550 50  0001 C CNN
	1    9050 2550
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EE71B01
P 10600 2550
F 0 "J?" H 10550 2450 50  0000 L CNN
F 1 "I_2b" H 10550 2650 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 10600 2550 50  0001 C CNN
F 3 "~" H 10600 2550 50  0001 C CNN
	1    10600 2550
	1    0    0    -1  
$EndComp
Wire Notes Line
	8750 2250 8750 3800
Wire Notes Line
	10950 2250 10950 3800
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEA3068
P 8900 4250
F 0 "J?" H 8850 4350 50  0000 L CNN
F 1 "Peltier V+" H 8600 4150 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 8900 4250 50  0001 C CNN
F 3 "~" H 8900 4250 50  0001 C CNN
	1    8900 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 4250 9700 4250
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEA4721
P 10800 4250
F 0 "J?" H 10750 4150 50  0000 L CNN
F 1 "Peltier V-" H 10450 4350 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 10800 4250 50  0001 C CNN
F 3 "~" H 10800 4250 50  0001 C CNN
	1    10800 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 4250 10600 4250
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEAAED1
P 9050 4800
F 0 "J?" H 9000 4900 50  0000 L CNN
F 1 "I_1a" H 8950 4700 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 9050 4800 50  0001 C CNN
F 3 "~" H 9050 4800 50  0001 C CNN
	1    9050 4800
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEAB68D
P 10600 4800
F 0 "J?" H 10550 4700 50  0000 L CNN
F 1 "I_1b" H 10550 4900 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 10600 4800 50  0001 C CNN
F 3 "~" H 10600 4800 50  0001 C CNN
	1    10600 4800
	1    0    0    -1  
$EndComp
Wire Notes Line
	8750 550  10950 550 
Wire Notes Line
	8750 2100 10950 2100
$Comp
L Device:R_Shunt R?
U 1 1 5EEB52FC
P 9850 850
F 0 "R?" V 9625 850 50  0000 C CNN
F 1 "0.5m" V 9716 850 50  0000 C CNN
F 2 "" V 9780 850 50  0001 C CNN
F 3 "~" H 9850 850 50  0001 C CNN
	1    9850 850 
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Current:INA283 U?
U 1 1 5EEB5302
P 9850 1450
F 0 "U?" V 9804 1794 50  0000 L CNN
F 1 "INA283" V 9895 1794 50  0000 L CNN
F 2 "" H 9850 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 9850 1450 50  0001 C CNN
	1    9850 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 1150 9950 1000
Wire Wire Line
	9750 1000 9750 1150
$Comp
L power:GND #PWR?
U 1 1 5EEB530A
P 9400 1750
F 0 "#PWR?" H 9400 1500 50  0001 C CNN
F 1 "GND" H 9405 1577 50  0000 C CNN
F 2 "" H 9400 1750 50  0001 C CNN
F 3 "" H 9400 1750 50  0001 C CNN
	1    9400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1350 9400 1350
Wire Wire Line
	9400 1350 9400 1550
$Comp
L power:+5V #PWR?
U 1 1 5EEB5312
P 9550 1200
F 0 "#PWR?" H 9550 1050 50  0001 C CNN
F 1 "+5V" H 9565 1373 50  0000 C CNN
F 2 "" H 9550 1200 50  0001 C CNN
F 3 "" H 9550 1200 50  0001 C CNN
	1    9550 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1200 9550 1350
Connection ~ 9550 1350
Wire Wire Line
	9550 1350 9550 1450
$Comp
L power:+5V #PWR?
U 1 1 5EEB531B
P 10150 1200
F 0 "#PWR?" H 10150 1050 50  0001 C CNN
F 1 "+5V" H 10165 1373 50  0000 C CNN
F 2 "" H 10150 1200 50  0001 C CNN
F 3 "" H 10150 1200 50  0001 C CNN
	1    10150 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 1200 10150 1350
Wire Wire Line
	9550 1550 9400 1550
Connection ~ 9400 1550
Wire Wire Line
	9400 1550 9400 1750
Wire Wire Line
	9250 850  9650 850 
Wire Wire Line
	10050 850  10400 850 
Text GLabel 9950 1900 2    50   Input ~ 0
I_sense_3
Wire Wire Line
	9850 1750 9850 1900
Wire Wire Line
	9850 1900 9950 1900
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEB532A
P 9050 850
F 0 "J?" H 9000 950 50  0000 L CNN
F 1 "I_3a" H 8950 750 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 9050 850 50  0001 C CNN
F 3 "~" H 9050 850 50  0001 C CNN
	1    9050 850 
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEB5330
P 10600 850
F 0 "J?" H 10550 750 50  0000 L CNN
F 1 "I_3b" H 10550 950 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 10600 850 50  0001 C CNN
F 3 "~" H 10600 850 50  0001 C CNN
	1    10600 850 
	1    0    0    -1  
$EndComp
Wire Notes Line
	8750 550  8750 2100
Wire Notes Line
	10950 550  10950 2100
Wire Notes Line
	6350 550  8550 550 
Wire Notes Line
	6350 2100 8550 2100
$Comp
L Device:R_Shunt R?
U 1 1 5EEB85FF
P 7450 850
F 0 "R?" V 7225 850 50  0000 C CNN
F 1 "0.5m" V 7316 850 50  0000 C CNN
F 2 "" V 7380 850 50  0001 C CNN
F 3 "~" H 7450 850 50  0001 C CNN
	1    7450 850 
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Current:INA283 U?
U 1 1 5EEB8605
P 7450 1450
F 0 "U?" V 7404 1794 50  0000 L CNN
F 1 "INA283" V 7495 1794 50  0000 L CNN
F 2 "" H 7450 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 7450 1450 50  0001 C CNN
	1    7450 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	7550 1150 7550 1000
Wire Wire Line
	7350 1000 7350 1150
$Comp
L power:GND #PWR?
U 1 1 5EEB860D
P 7000 1750
F 0 "#PWR?" H 7000 1500 50  0001 C CNN
F 1 "GND" H 7005 1577 50  0000 C CNN
F 2 "" H 7000 1750 50  0001 C CNN
F 3 "" H 7000 1750 50  0001 C CNN
	1    7000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1350 7000 1350
Wire Wire Line
	7000 1350 7000 1550
$Comp
L power:+5V #PWR?
U 1 1 5EEB8615
P 7150 1200
F 0 "#PWR?" H 7150 1050 50  0001 C CNN
F 1 "+5V" H 7165 1373 50  0000 C CNN
F 2 "" H 7150 1200 50  0001 C CNN
F 3 "" H 7150 1200 50  0001 C CNN
	1    7150 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1200 7150 1350
Connection ~ 7150 1350
Wire Wire Line
	7150 1350 7150 1450
$Comp
L power:+5V #PWR?
U 1 1 5EEB861E
P 7750 1200
F 0 "#PWR?" H 7750 1050 50  0001 C CNN
F 1 "+5V" H 7765 1373 50  0000 C CNN
F 2 "" H 7750 1200 50  0001 C CNN
F 3 "" H 7750 1200 50  0001 C CNN
	1    7750 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 1200 7750 1350
Wire Wire Line
	7150 1550 7000 1550
Connection ~ 7000 1550
Wire Wire Line
	7000 1550 7000 1750
Wire Wire Line
	6850 850  7250 850 
Wire Wire Line
	7650 850  8000 850 
Text GLabel 7550 1900 2    50   Input ~ 0
I_sense_4
Wire Wire Line
	7450 1750 7450 1900
Wire Wire Line
	7450 1900 7550 1900
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEB862D
P 6650 850
F 0 "J?" H 6600 950 50  0000 L CNN
F 1 "I_4a" H 6550 750 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 6650 850 50  0001 C CNN
F 3 "~" H 6650 850 50  0001 C CNN
	1    6650 850 
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEB8633
P 8200 850
F 0 "J?" H 8150 750 50  0000 L CNN
F 1 "I_4b" H 8150 950 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 8200 850 50  0001 C CNN
F 3 "~" H 8200 850 50  0001 C CNN
	1    8200 850 
	1    0    0    -1  
$EndComp
Wire Notes Line
	6350 550  6350 2100
Wire Notes Line
	8550 550  8550 2100
Wire Notes Line
	3950 550  6150 550 
Wire Notes Line
	3950 2100 6150 2100
$Comp
L Device:R_Shunt R?
U 1 1 5EEBB93B
P 5050 850
F 0 "R?" V 4825 850 50  0000 C CNN
F 1 "0.5m" V 4916 850 50  0000 C CNN
F 2 "" V 4980 850 50  0001 C CNN
F 3 "~" H 5050 850 50  0001 C CNN
	1    5050 850 
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Current:INA283 U?
U 1 1 5EEBB941
P 5050 1450
F 0 "U?" V 5004 1794 50  0000 L CNN
F 1 "INA283" V 5095 1794 50  0000 L CNN
F 2 "" H 5050 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 5050 1450 50  0001 C CNN
	1    5050 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 1150 5150 1000
Wire Wire Line
	4950 1000 4950 1150
$Comp
L power:GND #PWR?
U 1 1 5EEBB949
P 4600 1750
F 0 "#PWR?" H 4600 1500 50  0001 C CNN
F 1 "GND" H 4605 1577 50  0000 C CNN
F 2 "" H 4600 1750 50  0001 C CNN
F 3 "" H 4600 1750 50  0001 C CNN
	1    4600 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1350 4600 1350
Wire Wire Line
	4600 1350 4600 1550
$Comp
L power:+5V #PWR?
U 1 1 5EEBB951
P 4750 1200
F 0 "#PWR?" H 4750 1050 50  0001 C CNN
F 1 "+5V" H 4765 1373 50  0000 C CNN
F 2 "" H 4750 1200 50  0001 C CNN
F 3 "" H 4750 1200 50  0001 C CNN
	1    4750 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1200 4750 1350
Connection ~ 4750 1350
Wire Wire Line
	4750 1350 4750 1450
$Comp
L power:+5V #PWR?
U 1 1 5EEBB95A
P 5350 1200
F 0 "#PWR?" H 5350 1050 50  0001 C CNN
F 1 "+5V" H 5365 1373 50  0000 C CNN
F 2 "" H 5350 1200 50  0001 C CNN
F 3 "" H 5350 1200 50  0001 C CNN
	1    5350 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1200 5350 1350
Wire Wire Line
	4750 1550 4600 1550
Connection ~ 4600 1550
Wire Wire Line
	4600 1550 4600 1750
Wire Wire Line
	4450 850  4850 850 
Wire Wire Line
	5250 850  5600 850 
Text GLabel 5150 1900 2    50   Input ~ 0
I_sense_5
Wire Wire Line
	5050 1750 5050 1900
Wire Wire Line
	5050 1900 5150 1900
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEBB969
P 4250 850
F 0 "J?" H 4200 950 50  0000 L CNN
F 1 "I_5a" H 4150 750 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4250 850 50  0001 C CNN
F 3 "~" H 4250 850 50  0001 C CNN
	1    4250 850 
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEBB96F
P 5800 850
F 0 "J?" H 5750 750 50  0000 L CNN
F 1 "I_5b" H 5750 950 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 5800 850 50  0001 C CNN
F 3 "~" H 5800 850 50  0001 C CNN
	1    5800 850 
	1    0    0    -1  
$EndComp
Wire Notes Line
	3950 550  3950 2100
Wire Notes Line
	6150 550  6150 2100
Wire Notes Line
	1600 550  3800 550 
Wire Notes Line
	1600 2100 3800 2100
$Comp
L Device:R_Shunt R?
U 1 1 5EEC031B
P 2700 850
F 0 "R?" V 2475 850 50  0000 C CNN
F 1 "0.5m" V 2566 850 50  0000 C CNN
F 2 "" V 2630 850 50  0001 C CNN
F 3 "~" H 2700 850 50  0001 C CNN
	1    2700 850 
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Current:INA283 U?
U 1 1 5EEC0321
P 2700 1450
F 0 "U?" V 2654 1794 50  0000 L CNN
F 1 "INA283" V 2745 1794 50  0000 L CNN
F 2 "" H 2700 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 2700 1450 50  0001 C CNN
	1    2700 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 1150 2800 1000
Wire Wire Line
	2600 1000 2600 1150
$Comp
L power:GND #PWR?
U 1 1 5EEC0329
P 2250 1750
F 0 "#PWR?" H 2250 1500 50  0001 C CNN
F 1 "GND" H 2255 1577 50  0000 C CNN
F 2 "" H 2250 1750 50  0001 C CNN
F 3 "" H 2250 1750 50  0001 C CNN
	1    2250 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1350 2250 1350
Wire Wire Line
	2250 1350 2250 1550
$Comp
L power:+5V #PWR?
U 1 1 5EEC0331
P 2400 1200
F 0 "#PWR?" H 2400 1050 50  0001 C CNN
F 1 "+5V" H 2415 1373 50  0000 C CNN
F 2 "" H 2400 1200 50  0001 C CNN
F 3 "" H 2400 1200 50  0001 C CNN
	1    2400 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1200 2400 1350
Connection ~ 2400 1350
Wire Wire Line
	2400 1350 2400 1450
$Comp
L power:+5V #PWR?
U 1 1 5EEC033A
P 3000 1200
F 0 "#PWR?" H 3000 1050 50  0001 C CNN
F 1 "+5V" H 3015 1373 50  0000 C CNN
F 2 "" H 3000 1200 50  0001 C CNN
F 3 "" H 3000 1200 50  0001 C CNN
	1    3000 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1200 3000 1350
Wire Wire Line
	2400 1550 2250 1550
Connection ~ 2250 1550
Wire Wire Line
	2250 1550 2250 1750
Wire Wire Line
	2100 850  2500 850 
Wire Wire Line
	2900 850  3250 850 
Text GLabel 2800 1900 2    50   Input ~ 0
I_sense_6
Wire Wire Line
	2700 1750 2700 1900
Wire Wire Line
	2700 1900 2800 1900
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEC0349
P 1900 850
F 0 "J?" H 1850 950 50  0000 L CNN
F 1 "I_6a" H 1800 750 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 1900 850 50  0001 C CNN
F 3 "~" H 1900 850 50  0001 C CNN
	1    1900 850 
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5EEC034F
P 3450 850
F 0 "J?" H 3400 750 50  0000 L CNN
F 1 "I_6b" H 3400 950 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 3450 850 50  0001 C CNN
F 3 "~" H 3450 850 50  0001 C CNN
	1    3450 850 
	1    0    0    -1  
$EndComp
Wire Notes Line
	1600 550  1600 2100
Wire Notes Line
	3800 550  3800 2100
Text Notes 1600 2450 0    50   ~ 10
Six I-sense amplifiers to fully utilize coil-system\n
$Comp
L Device:Rotary_Encoder_Switch SW?
U 1 1 5EEC4A96
P 6250 7250
F 0 "SW?" H 6250 7617 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 6250 7526 50  0000 C CNN
F 2 "" H 6100 7410 50  0001 C CNN
F 3 "~" H 6250 7510 50  0001 C CNN
	1    6250 7250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
