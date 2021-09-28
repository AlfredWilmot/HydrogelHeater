# Home peltier/ coil system

## Use of temperature controller with microscope 
<img src="https://github.com/AlfredWilmot/HydrogelHeater/blob/home_system/media/hydroglel_heater_and_microscope.png" width="600">

## Close-up of activated temperature-sensitive hydrogel (20x speed)
<img src="https://github.com/AlfredWilmot/HydrogelHeater/blob/home_system/media/quick_looping_PNIPAM.gif" width="600">

## Overview of temperature controller hardware
<img src="https://github.com/AlfredWilmot/HydrogelHeater/blob/home_system/media/temp_controller_overview.png" width="900">

## Notes on Coil-driver
* [Reverse current/ battery protection circuits(TI)](https://www.ti.com/lit/an/slva139/slva139.pdf)
* [MOSFET gate driver fundamentals (TI)](https://www.ti.com/lit/ml/slua618a/slua618a.pdf)
* [Relays vs solid state switches (TI)](https://e2e.ti.com/blogs_/b/behind_the_wheel/archive/2017/07/13/why-are-you-still-driving-automotive-motors-with-relays)




## Magnets learning resources
[educational videos-- "super magnet man"](https://supermagnetman.com/pages/all-videos)

## Peltier stuff
* [Peltier device theory(extensive!)](http://etutorials.org/Misc/pc+hardware+tuning+acceleration/Chapter+11+Problems+with+using+Thermoelectric+Elements/Peltier+Modules/)
* [PID temperature controller tutorial](https://www.youtube.com/watch?v=LXhTFBGgskI&t=378s)


## Assembly skills 
* [Brazing Fundamentals](https://www.lucasmilhaupt.com/EN/Brazing-Academy/Brazing-Fundamentals.htm)

## Some intersting parts I wanted to note down:
* [DRB8873 H-bridge, 10A; built-in current regulation, uses current-mirror to infer output current (so no R_sense needed)](https://www.ti.com/lit/ds/symlink/drv8873.pdf?ts=1593795815021&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FDRV8873)
* [VNH7100AS (H-bridge, internally limited output current)](https://docs.rs-online.com/bb0a/0900766b8160a473.pdf)


## Useful Analog application notes and articles

_Voltage Controlled Current Source (VCCS) Articles_

* [Bidirectional current sources](https://www.allaboutcircuits.com/technical-articles/how-to-design-simple-voltage-controlled-bidirectional-analog-current-source/)
* [Howland Current Pump(TI)](https://www.ti.com/lit/an/snoa474a/snoa474a.pdf)
* [Types and applications of current mirrors](https://www.allaboutcircuits.com/technical-articles/learn-analog-circuits-introduction-to-current-mirrors-types-applications/)

_Measurement circuits_

* [Collection of Measurement & control circuits (LT)](https://www.analog.com/media/en/technical-documentation/application-notes/an45f.pdf)
