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
Wire Notes Line
	800  800  3350 800 
Wire Notes Line
	3350 2500 3350 800 
Wire Notes Line
	800  2500 3350 2500
Wire Notes Line
	800  800  800  2500
Wire Wire Line
	2400 1100 2750 1100
Wire Wire Line
	1600 1700 1900 1700
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 5EE97406
P 1400 1100
AR Path="/5EE97406" Ref="J5"  Part="1" 
AR Path="/5EE8E9C0/5EE97406" Ref="J13"  Part="1" 
F 0 "J5" H 1350 1000 50  0000 L CNN
F 1 "Peltier V+" H 1250 1250 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 1400 1100 50  0001 C CNN
F 3 "~" H 1400 1100 50  0001 C CNN
	1    1400 1100
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 5EE9740C
P 1150 1600
AR Path="/5EE9740C" Ref="J1"  Part="1" 
AR Path="/5EE8E9C0/5EE9740C" Ref="J7"  Part="1" 
F 0 "J1" H 1100 1500 50  0000 L CNN
F 1 "Peltier V-" V 1250 1400 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 1150 1600 50  0001 C CNN
F 3 "~" H 1150 1600 50  0001 C CNN
	1    1150 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 5EE97412
P 1150 1950
AR Path="/5EE97412" Ref="F1"  Part="1" 
AR Path="/5EE8E9C0/5EE97412" Ref="F2"  Part="1" 
F 0 "F1" V 1050 1950 50  0000 C CNN
F 1 "3A hold, 5.1A trip" V 1350 1950 50  0000 C CNN
F 2 "Fuse:Fuse_Bourns_MF-RG300" V 1080 1950 50  0001 C CNN
F 3 "https://docs.rs-online.com/9fc6/0900766b813374cb.pdf" H 1150 1950 50  0001 C CNN
	1    1150 1950
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Current:INA282 U1
U 1 1 5EE97418
P 2200 1700
AR Path="/5EE97418" Ref="U1"  Part="1" 
AR Path="/5EE8E9C0/5EE97418" Ref="U2"  Part="1" 
F 0 "U1" V 1850 1300 50  0000 L CNN
F 1 "INA283" V 2800 1600 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2200 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 2200 1700 50  0001 C CNN
	1    2200 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 1200 2100 1200
Wire Wire Line
	2100 1200 2100 1400
Wire Wire Line
	1600 1100 2000 1100
Wire Wire Line
	2000 1100 2050 1100
Connection ~ 2000 1100
Wire Wire Line
	2000 1200 2000 1100
Wire Wire Line
	2300 1200 2300 1400
Wire Wire Line
	2400 1200 2400 1100
Wire Wire Line
	2300 1200 2400 1200
Connection ~ 2400 1100
Wire Wire Line
	2350 1100 2400 1100
$Comp
L power:+5V #PWR0101
U 1 1 5EE97429
P 1600 1700
AR Path="/5EE97429" Ref="#PWR0101"  Part="1" 
AR Path="/5EE8E9C0/5EE97429" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0101" H 1600 1550 50  0001 C CNN
F 1 "+5V" H 1615 1873 50  0000 C CNN
F 2 "" H 1600 1700 50  0001 C CNN
F 3 "" H 1600 1700 50  0001 C CNN
	1    1600 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EE9742F
P 2500 1800
AR Path="/5EE9742F" Ref="#PWR0102"  Part="1" 
AR Path="/5EE8E9C0/5EE9742F" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0102" H 2500 1550 50  0001 C CNN
F 1 "GND" H 2505 1627 50  0000 C CNN
F 2 "" H 2500 1800 50  0001 C CNN
F 3 "" H 2500 1800 50  0001 C CNN
	1    2500 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5EE97435
P 2500 1700
AR Path="/5EE97435" Ref="C1"  Part="1" 
AR Path="/5EE8E9C0/5EE97435" Ref="C2"  Part="1" 
F 0 "C1" H 2408 1654 50  0000 R CNN
F 1 "0.1uF" H 2408 1745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 1700 50  0001 C CNN
F 3 "~" H 2500 1700 50  0001 C CNN
	1    2500 1700
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 5EE9743B
P 1150 2300
AR Path="/5EE9743B" Ref="J2"  Part="1" 
AR Path="/5EE8E9C0/5EE9743B" Ref="J8"  Part="1" 
F 0 "J2" V 1050 2350 50  0000 L CNN
F 1 "Driver V-" V 1300 2100 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 1150 2300 50  0001 C CNN
F 3 "~" H 1150 2300 50  0001 C CNN
	1    1150 2300
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 5EE97441
P 2950 1100
AR Path="/5EE97441" Ref="J7"  Part="1" 
AR Path="/5EE8E9C0/5EE97441" Ref="J15"  Part="1" 
F 0 "J7" H 2900 1200 50  0000 L CNN
F 1 "Driver V+" H 2850 1000 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 2950 1100 50  0001 C CNN
F 3 "~" H 2950 1100 50  0001 C CNN
	1    2950 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2150 2300 2150
Wire Wire Line
	2200 2000 2200 2150
Wire Wire Line
	1750 1800 1750 2000
Wire Wire Line
	1900 1800 1750 1800
Connection ~ 2500 1600
Wire Wire Line
	2500 1450 2500 1600
$Comp
L power:+5V #PWR0103
U 1 1 5EE9744D
P 2500 1450
AR Path="/5EE9744D" Ref="#PWR0103"  Part="1" 
AR Path="/5EE8E9C0/5EE9744D" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0103" H 2500 1300 50  0001 C CNN
F 1 "+5V" H 2515 1623 50  0000 C CNN
F 2 "" H 2500 1450 50  0001 C CNN
F 3 "" H 2500 1450 50  0001 C CNN
	1    2500 1450
	1    0    0    -1  
$EndComp
Connection ~ 1750 1800
Wire Wire Line
	1750 1600 1750 1800
Wire Wire Line
	1900 1600 1750 1600
$Comp
L power:GND #PWR0104
U 1 1 5EE97456
P 1750 2000
AR Path="/5EE97456" Ref="#PWR0104"  Part="1" 
AR Path="/5EE8E9C0/5EE97456" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0104" H 1750 1750 50  0001 C CNN
F 1 "GND" H 1755 1827 50  0000 C CNN
F 2 "" H 1750 2000 50  0001 C CNN
F 3 "" H 1750 2000 50  0001 C CNN
	1    1750 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5EE9745C
P 2200 1100
AR Path="/5EE9745C" Ref="R1"  Part="1" 
AR Path="/5EE8E9C0/5EE9745C" Ref="R11"  Part="1" 
F 0 "R1" V 1993 1100 50  0000 C CNN
F 1 "0.5m" V 2084 1100 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 2130 1100 50  0001 C CNN
F 3 "https://www.digikey.co.uk/product-detail/en/riedon/CSR2512C0R0005F/696-1183-1-ND/2813308" H 2200 1100 50  0001 C CNN
	1    2200 1100
	0    1    1    0   
$EndComp
Text GLabel 2300 2150 2    50   Input ~ 0
A3
Wire Notes Line
	3600 800  6150 800 
Wire Notes Line
	6150 2500 6150 800 
Wire Notes Line
	3600 2500 6150 2500
Wire Notes Line
	3600 800  3600 2500
Wire Wire Line
	5200 1100 5550 1100
Wire Wire Line
	4400 1700 4700 1700
$Comp
L Connector_Generic:Conn_01x01 J13
U 1 1 5EE9D70F
P 4200 1100
AR Path="/5EE9D70F" Ref="J13"  Part="1" 
AR Path="/5EE8E9C0/5EE9D70F" Ref="J23"  Part="1" 
F 0 "J13" H 4150 1000 50  0000 L CNN
F 1 "Peltier V+" H 4050 1250 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4200 1100 50  0001 C CNN
F 3 "~" H 4200 1100 50  0001 C CNN
	1    4200 1100
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 5EE9D715
P 3950 1600
AR Path="/5EE9D715" Ref="J9"  Part="1" 
AR Path="/5EE8E9C0/5EE9D715" Ref="J17"  Part="1" 
F 0 "J9" H 3900 1500 50  0000 L CNN
F 1 "Peltier V-" V 4050 1400 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 3950 1600 50  0001 C CNN
F 3 "~" H 3950 1600 50  0001 C CNN
	1    3950 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F3
U 1 1 5EE9D71B
P 3950 1950
AR Path="/5EE9D71B" Ref="F3"  Part="1" 
AR Path="/5EE8E9C0/5EE9D71B" Ref="F4"  Part="1" 
F 0 "F3" V 3850 1950 50  0000 C CNN
F 1 "3A hold, 5.1A trip" V 4150 1950 50  0000 C CNN
F 2 "Fuse:Fuse_Bourns_MF-RG300" V 3880 1950 50  0001 C CNN
F 3 "https://docs.rs-online.com/9fc6/0900766b813374cb.pdf" H 3950 1950 50  0001 C CNN
	1    3950 1950
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Current:INA282 U3
U 1 1 5EE9D721
P 5000 1700
AR Path="/5EE9D721" Ref="U3"  Part="1" 
AR Path="/5EE8E9C0/5EE9D721" Ref="U6"  Part="1" 
F 0 "U3" V 4650 1300 50  0000 L CNN
F 1 "INA283" V 5600 1600 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 5000 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 5000 1700 50  0001 C CNN
	1    5000 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 1200 4900 1200
Wire Wire Line
	4900 1200 4900 1400
Wire Wire Line
	4400 1100 4800 1100
Wire Wire Line
	4800 1100 4850 1100
Connection ~ 4800 1100
Wire Wire Line
	4800 1200 4800 1100
Wire Wire Line
	5100 1200 5100 1400
Wire Wire Line
	5200 1200 5200 1100
Wire Wire Line
	5100 1200 5200 1200
Connection ~ 5200 1100
Wire Wire Line
	5150 1100 5200 1100
$Comp
L power:+5V #PWR0105
U 1 1 5EE9D732
P 4400 1700
AR Path="/5EE9D732" Ref="#PWR0105"  Part="1" 
AR Path="/5EE8E9C0/5EE9D732" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0105" H 4400 1550 50  0001 C CNN
F 1 "+5V" H 4415 1873 50  0000 C CNN
F 2 "" H 4400 1700 50  0001 C CNN
F 3 "" H 4400 1700 50  0001 C CNN
	1    4400 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5EE9D738
P 5300 1800
AR Path="/5EE9D738" Ref="#PWR0106"  Part="1" 
AR Path="/5EE8E9C0/5EE9D738" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0106" H 5300 1550 50  0001 C CNN
F 1 "GND" H 5305 1627 50  0000 C CNN
F 2 "" H 5300 1800 50  0001 C CNN
F 3 "" H 5300 1800 50  0001 C CNN
	1    5300 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5EE9D73E
P 5300 1700
AR Path="/5EE9D73E" Ref="C3"  Part="1" 
AR Path="/5EE8E9C0/5EE9D73E" Ref="C4"  Part="1" 
F 0 "C3" H 5208 1654 50  0000 R CNN
F 1 "0.1uF" H 5208 1745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5300 1700 50  0001 C CNN
F 3 "~" H 5300 1700 50  0001 C CNN
	1    5300 1700
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J10
U 1 1 5EE9D744
P 3950 2300
AR Path="/5EE9D744" Ref="J10"  Part="1" 
AR Path="/5EE8E9C0/5EE9D744" Ref="J18"  Part="1" 
F 0 "J10" V 3850 2350 50  0000 L CNN
F 1 "Driver V-" V 4100 2100 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 3950 2300 50  0001 C CNN
F 3 "~" H 3950 2300 50  0001 C CNN
	1    3950 2300
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J15
U 1 1 5EE9D74A
P 5750 1100
AR Path="/5EE9D74A" Ref="J15"  Part="1" 
AR Path="/5EE8E9C0/5EE9D74A" Ref="J26"  Part="1" 
F 0 "J15" H 5700 1200 50  0000 L CNN
F 1 "Driver V+" H 5650 1000 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 5750 1100 50  0001 C CNN
F 3 "~" H 5750 1100 50  0001 C CNN
	1    5750 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2150 5100 2150
Wire Wire Line
	5000 2000 5000 2150
Wire Wire Line
	4550 1800 4550 2000
Wire Wire Line
	4700 1800 4550 1800
Connection ~ 5300 1600
Wire Wire Line
	5300 1450 5300 1600
$Comp
L power:+5V #PWR0107
U 1 1 5EE9D756
P 5300 1450
AR Path="/5EE9D756" Ref="#PWR0107"  Part="1" 
AR Path="/5EE8E9C0/5EE9D756" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0107" H 5300 1300 50  0001 C CNN
F 1 "+5V" H 5315 1623 50  0000 C CNN
F 2 "" H 5300 1450 50  0001 C CNN
F 3 "" H 5300 1450 50  0001 C CNN
	1    5300 1450
	1    0    0    -1  
$EndComp
Connection ~ 4550 1800
Wire Wire Line
	4550 1600 4550 1800
Wire Wire Line
	4700 1600 4550 1600
$Comp
L power:GND #PWR0108
U 1 1 5EE9D75F
P 4550 2000
AR Path="/5EE9D75F" Ref="#PWR0108"  Part="1" 
AR Path="/5EE8E9C0/5EE9D75F" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0108" H 4550 1750 50  0001 C CNN
F 1 "GND" H 4555 1827 50  0000 C CNN
F 2 "" H 4550 2000 50  0001 C CNN
F 3 "" H 4550 2000 50  0001 C CNN
	1    4550 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5EE9D765
P 5000 1100
AR Path="/5EE9D765" Ref="R3"  Part="1" 
AR Path="/5EE8E9C0/5EE9D765" Ref="R13"  Part="1" 
F 0 "R3" V 4793 1100 50  0000 C CNN
F 1 "0.5m" V 4884 1100 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 4930 1100 50  0001 C CNN
F 3 "https://www.digikey.co.uk/product-detail/en/riedon/CSR2512C0R0005F/696-1183-1-ND/2813308" H 5000 1100 50  0001 C CNN
	1    5000 1100
	0    1    1    0   
$EndComp
Text GLabel 5100 2150 2    50   Input ~ 0
A1
Wire Notes Line
	3600 2800 6150 2800
Wire Notes Line
	6150 4500 6150 2800
Wire Notes Line
	3600 4500 6150 4500
Wire Notes Line
	3600 2800 3600 4500
Wire Wire Line
	5200 3100 5550 3100
Wire Wire Line
	4400 3700 4700 3700
$Comp
L Connector_Generic:Conn_01x01 J14
U 1 1 5EEA1765
P 4200 3100
AR Path="/5EEA1765" Ref="J14"  Part="1" 
AR Path="/5EE8E9C0/5EEA1765" Ref="J24"  Part="1" 
F 0 "J14" H 4150 3000 50  0000 L CNN
F 1 "Peltier V+" H 4050 3250 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4200 3100 50  0001 C CNN
F 3 "~" H 4200 3100 50  0001 C CNN
	1    4200 3100
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J11
U 1 1 5EEA176B
P 3950 3600
AR Path="/5EEA176B" Ref="J11"  Part="1" 
AR Path="/5EE8E9C0/5EEA176B" Ref="J19"  Part="1" 
F 0 "J11" H 3900 3500 50  0000 L CNN
F 1 "Peltier V-" V 4050 3400 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 3950 3600 50  0001 C CNN
F 3 "~" H 3950 3600 50  0001 C CNN
	1    3950 3600
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F4
U 1 1 5EEA1771
P 3950 3950
AR Path="/5EEA1771" Ref="F4"  Part="1" 
AR Path="/5EE8E9C0/5EEA1771" Ref="F5"  Part="1" 
F 0 "F4" V 3850 3950 50  0000 C CNN
F 1 "3A hold, 5.1A trip" V 4150 3950 50  0000 C CNN
F 2 "Fuse:Fuse_Bourns_MF-RG300" V 3880 3950 50  0001 C CNN
F 3 "https://docs.rs-online.com/9fc6/0900766b813374cb.pdf" H 3950 3950 50  0001 C CNN
	1    3950 3950
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Current:INA282 U4
U 1 1 5EEA1777
P 5000 3700
AR Path="/5EEA1777" Ref="U4"  Part="1" 
AR Path="/5EE8E9C0/5EEA1777" Ref="U7"  Part="1" 
F 0 "U4" V 4650 3300 50  0000 L CNN
F 1 "INA283" V 5600 3600 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 5000 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 5000 3700 50  0001 C CNN
	1    5000 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 3200 4900 3200
Wire Wire Line
	4900 3200 4900 3400
Wire Wire Line
	4400 3100 4800 3100
Wire Wire Line
	4800 3100 4850 3100
Connection ~ 4800 3100
Wire Wire Line
	4800 3200 4800 3100
Wire Wire Line
	5100 3200 5100 3400
Wire Wire Line
	5200 3200 5200 3100
Wire Wire Line
	5100 3200 5200 3200
Connection ~ 5200 3100
Wire Wire Line
	5150 3100 5200 3100
$Comp
L power:+5V #PWR0109
U 1 1 5EEA1788
P 4400 3700
AR Path="/5EEA1788" Ref="#PWR0109"  Part="1" 
AR Path="/5EE8E9C0/5EEA1788" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0109" H 4400 3550 50  0001 C CNN
F 1 "+5V" H 4415 3873 50  0000 C CNN
F 2 "" H 4400 3700 50  0001 C CNN
F 3 "" H 4400 3700 50  0001 C CNN
	1    4400 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5EEA178E
P 5300 3800
AR Path="/5EEA178E" Ref="#PWR0110"  Part="1" 
AR Path="/5EE8E9C0/5EEA178E" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0110" H 5300 3550 50  0001 C CNN
F 1 "GND" H 5305 3627 50  0000 C CNN
F 2 "" H 5300 3800 50  0001 C CNN
F 3 "" H 5300 3800 50  0001 C CNN
	1    5300 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5EEA1794
P 5300 3700
AR Path="/5EEA1794" Ref="C4"  Part="1" 
AR Path="/5EE8E9C0/5EEA1794" Ref="C5"  Part="1" 
F 0 "C4" H 5208 3654 50  0000 R CNN
F 1 "0.1uF" H 5208 3745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5300 3700 50  0001 C CNN
F 3 "~" H 5300 3700 50  0001 C CNN
	1    5300 3700
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J12
U 1 1 5EEA179A
P 3950 4300
AR Path="/5EEA179A" Ref="J12"  Part="1" 
AR Path="/5EE8E9C0/5EEA179A" Ref="J20"  Part="1" 
F 0 "J12" V 3850 4350 50  0000 L CNN
F 1 "Driver V-" V 4100 4100 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 3950 4300 50  0001 C CNN
F 3 "~" H 3950 4300 50  0001 C CNN
	1    3950 4300
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J16
U 1 1 5EEA17A0
P 5750 3100
AR Path="/5EEA17A0" Ref="J16"  Part="1" 
AR Path="/5EE8E9C0/5EEA17A0" Ref="J27"  Part="1" 
F 0 "J16" H 5700 3200 50  0000 L CNN
F 1 "Driver V+" H 5650 3000 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 5750 3100 50  0001 C CNN
F 3 "~" H 5750 3100 50  0001 C CNN
	1    5750 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4150 5100 4150
Wire Wire Line
	5000 4000 5000 4150
Wire Wire Line
	4550 3800 4550 4000
Wire Wire Line
	4700 3800 4550 3800
Connection ~ 5300 3600
Wire Wire Line
	5300 3450 5300 3600
$Comp
L power:+5V #PWR0111
U 1 1 5EEA17AC
P 5300 3450
AR Path="/5EEA17AC" Ref="#PWR0111"  Part="1" 
AR Path="/5EE8E9C0/5EEA17AC" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0111" H 5300 3300 50  0001 C CNN
F 1 "+5V" H 5315 3623 50  0000 C CNN
F 2 "" H 5300 3450 50  0001 C CNN
F 3 "" H 5300 3450 50  0001 C CNN
	1    5300 3450
	1    0    0    -1  
$EndComp
Connection ~ 4550 3800
Wire Wire Line
	4550 3600 4550 3800
Wire Wire Line
	4700 3600 4550 3600
$Comp
L power:GND #PWR0112
U 1 1 5EEA17B5
P 4550 4000
AR Path="/5EEA17B5" Ref="#PWR0112"  Part="1" 
AR Path="/5EE8E9C0/5EEA17B5" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0112" H 4550 3750 50  0001 C CNN
F 1 "GND" H 4555 3827 50  0000 C CNN
F 2 "" H 4550 4000 50  0001 C CNN
F 3 "" H 4550 4000 50  0001 C CNN
	1    4550 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5EEA17BB
P 5000 3100
AR Path="/5EEA17BB" Ref="R4"  Part="1" 
AR Path="/5EE8E9C0/5EEA17BB" Ref="R15"  Part="1" 
F 0 "R4" V 4793 3100 50  0000 C CNN
F 1 "0.5m" V 4884 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 4930 3100 50  0001 C CNN
F 3 "https://www.digikey.co.uk/product-detail/en/riedon/CSR2512C0R0005F/696-1183-1-ND/2813308" H 5000 3100 50  0001 C CNN
	1    5000 3100
	0    1    1    0   
$EndComp
Text GLabel 5100 4150 2    50   Input ~ 0
A2
Wire Notes Line
	800  2800 3350 2800
Wire Notes Line
	3350 4500 3350 2800
Wire Notes Line
	800  4500 3350 4500
Wire Notes Line
	800  2800 800  4500
Wire Wire Line
	2400 3100 2750 3100
Wire Wire Line
	1600 3700 1900 3700
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 5EEAB446
P 1400 3100
AR Path="/5EEAB446" Ref="J6"  Part="1" 
AR Path="/5EE8E9C0/5EEAB446" Ref="J14"  Part="1" 
F 0 "J6" H 1350 3000 50  0000 L CNN
F 1 "Peltier V+" H 1250 3250 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 1400 3100 50  0001 C CNN
F 3 "~" H 1400 3100 50  0001 C CNN
	1    1400 3100
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 5EEAB44C
P 1150 3600
AR Path="/5EEAB44C" Ref="J3"  Part="1" 
AR Path="/5EE8E9C0/5EEAB44C" Ref="J11"  Part="1" 
F 0 "J3" H 1100 3500 50  0000 L CNN
F 1 "Peltier V-" V 1250 3400 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 1150 3600 50  0001 C CNN
F 3 "~" H 1150 3600 50  0001 C CNN
	1    1150 3600
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F2
U 1 1 5EEAB452
P 1150 3950
AR Path="/5EEAB452" Ref="F2"  Part="1" 
AR Path="/5EE8E9C0/5EEAB452" Ref="F3"  Part="1" 
F 0 "F2" V 1050 3950 50  0000 C CNN
F 1 "3A hold, 5.1A trip" V 1350 3950 50  0000 C CNN
F 2 "Fuse:Fuse_Bourns_MF-RG300" V 1080 3950 50  0001 C CNN
F 3 "https://docs.rs-online.com/9fc6/0900766b813374cb.pdf" H 1150 3950 50  0001 C CNN
	1    1150 3950
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Current:INA282 U2
U 1 1 5EEAB458
P 2200 3700
AR Path="/5EEAB458" Ref="U2"  Part="1" 
AR Path="/5EE8E9C0/5EEAB458" Ref="U5"  Part="1" 
F 0 "U2" V 1850 3300 50  0000 L CNN
F 1 "INA283" V 2800 3600 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2200 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina282.pdf" H 2200 3700 50  0001 C CNN
	1    2200 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 3200 2100 3200
Wire Wire Line
	2100 3200 2100 3400
Wire Wire Line
	1600 3100 2000 3100
Wire Wire Line
	2000 3100 2050 3100
Connection ~ 2000 3100
Wire Wire Line
	2000 3200 2000 3100
Wire Wire Line
	2300 3200 2300 3400
Wire Wire Line
	2400 3200 2400 3100
Wire Wire Line
	2300 3200 2400 3200
Connection ~ 2400 3100
Wire Wire Line
	2350 3100 2400 3100
$Comp
L power:+5V #PWR0113
U 1 1 5EEAB469
P 1600 3700
AR Path="/5EEAB469" Ref="#PWR0113"  Part="1" 
AR Path="/5EE8E9C0/5EEAB469" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0113" H 1600 3550 50  0001 C CNN
F 1 "+5V" H 1615 3873 50  0000 C CNN
F 2 "" H 1600 3700 50  0001 C CNN
F 3 "" H 1600 3700 50  0001 C CNN
	1    1600 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5EEAB46F
P 2500 3800
AR Path="/5EEAB46F" Ref="#PWR0114"  Part="1" 
AR Path="/5EE8E9C0/5EEAB46F" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0114" H 2500 3550 50  0001 C CNN
F 1 "GND" H 2505 3627 50  0000 C CNN
F 2 "" H 2500 3800 50  0001 C CNN
F 3 "" H 2500 3800 50  0001 C CNN
	1    2500 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5EEAB475
P 2500 3700
AR Path="/5EEAB475" Ref="C2"  Part="1" 
AR Path="/5EE8E9C0/5EEAB475" Ref="C3"  Part="1" 
F 0 "C2" H 2408 3654 50  0000 R CNN
F 1 "0.1uF" H 2408 3745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 3700 50  0001 C CNN
F 3 "~" H 2500 3700 50  0001 C CNN
	1    2500 3700
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 5EEAB47B
P 1150 4300
AR Path="/5EEAB47B" Ref="J4"  Part="1" 
AR Path="/5EE8E9C0/5EEAB47B" Ref="J12"  Part="1" 
F 0 "J4" V 1050 4350 50  0000 L CNN
F 1 "Driver V-" V 1300 4100 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 1150 4300 50  0001 C CNN
F 3 "~" H 1150 4300 50  0001 C CNN
	1    1150 4300
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 5EEAB481
P 2950 3100
AR Path="/5EEAB481" Ref="J8"  Part="1" 
AR Path="/5EE8E9C0/5EEAB481" Ref="J16"  Part="1" 
F 0 "J8" H 2900 3200 50  0000 L CNN
F 1 "Driver V+" H 2850 3000 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 2950 3100 50  0001 C CNN
F 3 "~" H 2950 3100 50  0001 C CNN
	1    2950 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4150 2300 4150
Wire Wire Line
	2200 4000 2200 4150
Wire Wire Line
	1750 3800 1750 4000
Wire Wire Line
	1900 3800 1750 3800
Connection ~ 2500 3600
Wire Wire Line
	2500 3450 2500 3600
$Comp
L power:+5V #PWR0115
U 1 1 5EEAB48D
P 2500 3450
AR Path="/5EEAB48D" Ref="#PWR0115"  Part="1" 
AR Path="/5EE8E9C0/5EEAB48D" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0115" H 2500 3300 50  0001 C CNN
F 1 "+5V" H 2515 3623 50  0000 C CNN
F 2 "" H 2500 3450 50  0001 C CNN
F 3 "" H 2500 3450 50  0001 C CNN
	1    2500 3450
	1    0    0    -1  
$EndComp
Connection ~ 1750 3800
Wire Wire Line
	1750 3600 1750 3800
Wire Wire Line
	1900 3600 1750 3600
$Comp
L power:GND #PWR0116
U 1 1 5EEAB496
P 1750 4000
AR Path="/5EEAB496" Ref="#PWR0116"  Part="1" 
AR Path="/5EE8E9C0/5EEAB496" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0116" H 1750 3750 50  0001 C CNN
F 1 "GND" H 1755 3827 50  0000 C CNN
F 2 "" H 1750 4000 50  0001 C CNN
F 3 "" H 1750 4000 50  0001 C CNN
	1    1750 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EEAB49C
P 2200 3100
AR Path="/5EEAB49C" Ref="R2"  Part="1" 
AR Path="/5EE8E9C0/5EEAB49C" Ref="R12"  Part="1" 
F 0 "R2" V 1993 3100 50  0000 C CNN
F 1 "0.5m" V 2084 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 2130 3100 50  0001 C CNN
F 3 "https://www.digikey.co.uk/product-detail/en/riedon/CSR2512C0R0005F/696-1183-1-ND/2813308" H 2200 3100 50  0001 C CNN
	1    2200 3100
	0    1    1    0   
$EndComp
Text GLabel 2300 4150 2    50   Input ~ 0
A0
$Comp
L Connector_Generic:Conn_02x10_Top_Bottom J18
U 1 1 5EEBC3D7
P 9200 2850
AR Path="/5EEBC3D7" Ref="J18"  Part="1" 
AR Path="/5EE8E9C0/5EEBC3D7" Ref="J30"  Part="1" 
F 0 "J18" H 9250 3467 50  0000 C CNN
F 1 "Conn_02x10_Top_Bottom" H 9250 3376 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x10_P2.54mm_Vertical" H 9200 2850 50  0001 C CNN
F 3 "~" H 9200 2850 50  0001 C CNN
	1    9200 2850
	1    0    0    -1  
$EndComp
NoConn ~ 9500 2450
NoConn ~ 9500 2550
NoConn ~ 9500 2650
NoConn ~ 9500 2750
NoConn ~ 9500 2850
NoConn ~ 9500 2950
NoConn ~ 9500 3050
NoConn ~ 9500 3150
NoConn ~ 9500 3250
NoConn ~ 9500 3350
NoConn ~ 9000 3350
NoConn ~ 9000 3250
NoConn ~ 9000 3150
NoConn ~ 9000 3050
NoConn ~ 9000 2950
NoConn ~ 9000 2850
NoConn ~ 9000 2750
NoConn ~ 9000 2650
NoConn ~ 9000 2550
NoConn ~ 9000 2450
Text GLabel 8950 4450 2    50   Input ~ 0
I_sense_1
Text GLabel 8950 4650 2    50   Input ~ 0
T_sense1
Text GLabel 8450 4650 0    50   Input ~ 0
T_sense2
Text GLabel 8450 4350 0    50   Input ~ 0
A0
Text GLabel 8450 4550 0    50   Input ~ 0
A1
Text GLabel 8450 4750 0    50   Input ~ 0
A2
Text GLabel 8450 4950 0    50   Input ~ 0
A3
Text GLabel 8450 5250 0    50   Input ~ 0
SCL
Text GLabel 8450 5050 0    50   Input ~ 0
SDA
Text GLabel 8950 4350 2    50   Input ~ 0
D0
Text GLabel 8950 4550 2    50   Input ~ 0
D1
Text GLabel 8950 5150 2    50   Input ~ 0
PWM1
Text GLabel 8950 4950 2    50   Input ~ 0
PWM0
$Comp
L Connector_Generic:Conn_02x10_Top_Bottom J17
U 1 1 5EEC1222
P 8650 4750
AR Path="/5EEC1222" Ref="J17"  Part="1" 
AR Path="/5EE8E9C0/5EEC1222" Ref="J29"  Part="1" 
F 0 "J17" H 8700 5367 50  0000 C CNN
F 1 "Conn_02x10_Top_Bottom" H 8700 5276 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x10_P2.54mm_Vertical" H 8650 4750 50  0001 C CNN
F 3 "~" H 8650 4750 50  0001 C CNN
	1    8650 4750
	1    0    0    -1  
$EndComp
Text GLabel 8450 4450 0    50   Input ~ 0
I_sense_2
$Comp
L power:+3.3V #PWR0117
U 1 1 5EEC1229
P 7900 4300
AR Path="/5EEC1229" Ref="#PWR0117"  Part="1" 
AR Path="/5EE8E9C0/5EEC1229" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0117" H 7900 4150 50  0001 C CNN
F 1 "+3.3V" H 7915 4473 50  0000 C CNN
F 2 "" H 7900 4300 50  0001 C CNN
F 3 "" H 7900 4300 50  0001 C CNN
	1    7900 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0118
U 1 1 5EEC122F
P 9400 4900
AR Path="/5EEC122F" Ref="#PWR0118"  Part="1" 
AR Path="/5EE8E9C0/5EEC122F" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0118" H 9400 4750 50  0001 C CNN
F 1 "+5V" H 9415 5073 50  0000 C CNN
F 2 "" H 9400 4900 50  0001 C CNN
F 3 "" H 9400 4900 50  0001 C CNN
	1    9400 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4900 9400 5050
$Comp
L power:GND #PWR0119
U 1 1 5EEC1236
P 8950 5300
AR Path="/5EEC1236" Ref="#PWR0119"  Part="1" 
AR Path="/5EE8E9C0/5EEC1236" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0119" H 8950 5050 50  0001 C CNN
F 1 "GND" H 8955 5127 50  0000 C CNN
F 2 "" H 8950 5300 50  0001 C CNN
F 3 "" H 8950 5300 50  0001 C CNN
	1    8950 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 5300 8950 5250
Text GLabel 8950 4750 2    50   Input ~ 0
D2
Text GLabel 8950 4850 2    50   Input ~ 0
D3
Text GLabel 8450 5150 0    50   Input ~ 0
A4
Wire Wire Line
	7900 4850 8450 4850
Wire Wire Line
	7900 4300 7900 4850
Wire Wire Line
	8950 5050 9400 5050
$EndSCHEMATC
