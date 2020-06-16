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
Text GLabel 9350 3500 2    50   Input ~ 0
I_sense_1
Text GLabel 9350 3700 2    50   Input ~ 0
T_sense1
Text GLabel 8850 3700 0    50   Input ~ 0
T_sense2
Text GLabel 8850 3400 0    50   Input ~ 0
A0
Text GLabel 8850 3600 0    50   Input ~ 0
A1
Text GLabel 8850 3800 0    50   Input ~ 0
A2
Text GLabel 8850 4000 0    50   Input ~ 0
A3
Text GLabel 8850 4300 0    50   Input ~ 0
SCL
Text GLabel 8850 4100 0    50   Input ~ 0
SDA
Text GLabel 9350 3400 2    50   Input ~ 0
D0
Text GLabel 9350 3600 2    50   Input ~ 0
D1
Text GLabel 9350 4200 2    50   Input ~ 0
PWM1
Text GLabel 9350 4000 2    50   Input ~ 0
PWM0
$Comp
L Connector_Generic:Conn_02x10_Top_Bottom J1
U 1 1 5EE98F09
P 9050 3800
F 0 "J1" H 9100 4417 50  0000 C CNN
F 1 "Conn_02x10_Top_Bottom" H 9100 4326 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x10_P2.54mm_Vertical" H 9050 3800 50  0001 C CNN
F 3 "~" H 9050 3800 50  0001 C CNN
	1    9050 3800
	1    0    0    -1  
$EndComp
Text GLabel 8850 3500 0    50   Input ~ 0
I_sense_2
$Comp
L power:+5V #PWR03
U 1 1 5EE98F10
P 9800 3950
F 0 "#PWR03" H 9800 3800 50  0001 C CNN
F 1 "+5V" H 9815 4123 50  0000 C CNN
F 2 "" H 9800 3950 50  0001 C CNN
F 3 "" H 9800 3950 50  0001 C CNN
	1    9800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 3950 9800 4100
$Comp
L power:GND #PWR02
U 1 1 5EE98F17
P 9350 4350
F 0 "#PWR02" H 9350 4100 50  0001 C CNN
F 1 "GND" H 9355 4177 50  0000 C CNN
F 2 "" H 9350 4350 50  0001 C CNN
F 3 "" H 9350 4350 50  0001 C CNN
	1    9350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 4350 9350 4300
Text GLabel 9350 3800 2    50   Input ~ 0
D2
Text GLabel 9350 3900 2    50   Input ~ 0
D3
Text GLabel 8850 4200 0    50   Input ~ 0
A4
Wire Wire Line
	8300 3900 8850 3900
Wire Wire Line
	9350 4100 9800 4100
$Comp
L Connector_Generic:Conn_02x10_Top_Bottom J2
U 1 1 5EE98F23
P 10450 3800
AR Path="/5EE98F23" Ref="J2"  Part="1" 
AR Path="/5EE94CC6/5EE98F23" Ref="J?"  Part="1" 
F 0 "J2" H 10500 4417 50  0000 C CNN
F 1 "Conn_02x10_Top_Bottom" H 10500 4326 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x10_P2.54mm_Vertical" H 10450 3800 50  0001 C CNN
F 3 "~" H 10450 3800 50  0001 C CNN
	1    10450 3800
	1    0    0    -1  
$EndComp
NoConn ~ 10750 3500
NoConn ~ 10750 3700
NoConn ~ 10750 3900
NoConn ~ 10250 4300
NoConn ~ 10250 4100
NoConn ~ 10250 3900
NoConn ~ 10250 3700
NoConn ~ 10250 3500
NoConn ~ 10250 3400
$Comp
L power:+3.3V #PWR01
U 1 1 5EE9B6CA
P 8300 3900
F 0 "#PWR01" H 8300 3750 50  0001 C CNN
F 1 "+3.3V" H 8315 4073 50  0000 C CNN
F 2 "" H 8300 3900 50  0001 C CNN
F 3 "" H 8300 3900 50  0001 C CNN
	1    8300 3900
	1    0    0    -1  
$EndComp
Text GLabel 7200 950  0    50   Input ~ 0
D0
Text GLabel 9800 1150 2    50   Input ~ 0
D4
Text GLabel 9800 1050 2    50   Input ~ 0
PWM0
Text GLabel 9800 1250 2    50   Input ~ 0
PWM1
Text GLabel 9800 1350 2    50   Input ~ 0
PWM2
Text GLabel 9800 1650 2    50   Input ~ 0
PWM3
Text GLabel 9800 1750 2    50   Input ~ 0
PWM4
Text GLabel 9800 1850 2    50   Input ~ 0
PWM5
Text GLabel 9800 1550 2    50   Input ~ 0
D8
Text GLabel 7200 1050 0    50   Input ~ 0
D1
Text GLabel 9800 950  2    50   Input ~ 0
D2
Text GLabel 9800 1450 2    50   Input ~ 0
D7
Text GLabel 9800 1950 2    50   Input ~ 0
D12
Text GLabel 9800 2050 2    50   Input ~ 0
D13
$Comp
L power:+5V #PWR05
U 1 1 5EEA4460
P 7100 2650
F 0 "#PWR05" H 7100 2500 50  0001 C CNN
F 1 "+5V" H 7115 2823 50  0000 C CNN
F 2 "" H 7100 2650 50  0001 C CNN
F 3 "" H 7100 2650 50  0001 C CNN
	1    7100 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 2650 7100 2650
$Comp
L power:+3.3V #PWR06
U 1 1 5EEA49F0
P 6850 2650
F 0 "#PWR06" H 6850 2500 50  0001 C CNN
F 1 "+3.3V" H 6865 2823 50  0000 C CNN
F 2 "" H 6850 2650 50  0001 C CNN
F 3 "" H 6850 2650 50  0001 C CNN
	1    6850 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 2550 6850 2550
Wire Wire Line
	6850 2550 6850 2650
Text GLabel 7200 1550 0    50   Input ~ 0
SCL
Text GLabel 7200 1650 0    50   Input ~ 0
SDA
Text GLabel 7200 1950 0    50   Input ~ 0
A1
Text GLabel 7200 2050 0    50   Input ~ 0
A0
Text GLabel 7200 1850 0    50   Input ~ 0
I_sense_1
Text GLabel 7200 1750 0    50   Input ~ 0
T_sense1
Text GLabel 7200 1450 0    50   Input ~ 0
I_sense_2
Text GLabel 7200 1350 0    50   Input ~ 0
T_sense2
$Comp
L Mechanical:MountingHole H3
U 1 1 5EE9A42B
P 7200 3950
F 0 "H3" H 7300 3996 50  0000 L CNN
F 1 "MountingHole" H 7300 3905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7200 3950 50  0001 C CNN
F 3 "~" H 7200 3950 50  0001 C CNN
	1    7200 3950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5EE9A944
P 7200 4150
F 0 "H4" H 7300 4196 50  0000 L CNN
F 1 "MountingHole" H 7300 4105 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7200 4150 50  0001 C CNN
F 3 "~" H 7200 4150 50  0001 C CNN
	1    7200 4150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5EE9AAF3
P 7200 3750
F 0 "H2" H 7300 3796 50  0000 L CNN
F 1 "MountingHole" H 7300 3705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7200 3750 50  0001 C CNN
F 3 "~" H 7200 3750 50  0001 C CNN
	1    7200 3750
	1    0    0    -1  
$EndComp
$Comp
L arduino:Arduino_Nano_Socket XA2
U 1 1 5EEA3C8B
P 8500 1850
F 0 "XA2" H 8500 3087 60  0000 C CNN
F 1 "Arduino_Nano_Socket" H 8500 2981 60  0000 C CNN
F 2 "Arduino:Arduino_Nano_Socket" H 10300 5600 60  0001 C CNN
F 3 "" H 10300 5600 60  0001 C CNN
	1    8500 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EEA7DA0
P 7200 2350
F 0 "#PWR0101" H 7200 2100 50  0001 C CNN
F 1 "GND" V 7205 2222 50  0000 R CNN
F 2 "" H 7200 2350 50  0001 C CNN
F 3 "" H 7200 2350 50  0001 C CNN
	1    7200 2350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EEA8415
P 7200 2450
F 0 "#PWR0102" H 7200 2200 50  0001 C CNN
F 1 "GND" V 7205 2322 50  0000 R CNN
F 2 "" H 7200 2450 50  0001 C CNN
F 3 "" H 7200 2450 50  0001 C CNN
	1    7200 2450
	0    1    1    0   
$EndComp
NoConn ~ 9800 2550
NoConn ~ 9800 2650
NoConn ~ 3850 3350
NoConn ~ 6300 1750
NoConn ~ 10750 4100
NoConn ~ 10750 4300
Text GLabel 10250 3600 0    50   Input ~ 0
D4
Text GLabel 10250 4000 0    50   Input ~ 0
D7
Text GLabel 10750 4000 2    50   Input ~ 0
D12
Text GLabel 10750 4200 2    50   Input ~ 0
D13
Text GLabel 10250 3800 0    50   Input ~ 0
PWM2
Text GLabel 10750 3400 2    50   Input ~ 0
PWM3
Text GLabel 10750 3600 2    50   Input ~ 0
PWM4
Text GLabel 10750 3800 2    50   Input ~ 0
PWM5
Text GLabel 10250 4200 0    50   Input ~ 0
D8
$Comp
L Mechanical:MountingHole H1
U 1 1 5EEF2413
P 7200 3550
F 0 "H1" H 7300 3596 50  0000 L CNN
F 1 "MountingHole" H 7300 3505 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7200 3550 50  0001 C CNN
F 3 "~" H 7200 3550 50  0001 C CNN
	1    7200 3550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
