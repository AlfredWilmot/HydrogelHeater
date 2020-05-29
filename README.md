# HydrogelHeater
Store all the CAD and Gerber files for an adjustable hot-plate for experimenting with temperature-responsive Hydrogels.

## Parts list 

 **Part ID** | **Purchased?** 
 --- | --- 
 [SyRen 25A motor driver](https://www.dimensionengineering.com/products/syren25) | [x] 
 [Arduino Nano](https://www.amazon.co.uk/ELEGOO-Arduino-board-ATmega328P-compatible/dp/B072BMYZ18/ref=sr_1_3?dchild=1&keywords=arduino+nano&qid=1590747636&sr=8-3) | [x]
 [Header-pins (M/F)](https://www.amazon.co.uk/Aussel-Pieces-Breakaway-Connector-Arduino-PIN-2-20PCS/dp/B01M69EA9O/ref=sr_1_1?crid=1W9OODQ4FMUPW&dchild=1&keywords=header+pins&qid=1590747683&sprefix=header+%2Caps%2C150&sr=8-1) | [x]
 [60W 12V 40mm x 40mm Peltier device](https://www.banggood.com/TEC1-12706-40x40mm-Thermoelectric-Cooler-Peltier-Plate-Module-12V-60W-p-74295.html?rmmds=search&cur_warehouse=UK) | []
 PCB? Housing? | []
 [LCD display](https://www.banggood.com/5Pcs-0_91-Inch-128x32-IIC-I2C-Blue-OLED-LCD-Display-DIY-Oled-Module-SSD1306-Driver-IC-DC-3_3V-5V-p-1191376.html?rmmds=myorder&cur_warehouse=UK) | []
 [POT](https://uk.banggood.com/3590S-2-103L-10K-Ohm-BOURNS-Rotary-Wirewound-Precision-Potentiometer-Pot-10-Turn-p-1026632.html?rmmds=search&cur_warehouse=CN) for adjusting desired temp | []
 [Temp sensor (x2)](https://uk.rs-online.com/web/p/platinum-resistance-temperature-sensors/3629913/) | []

 
 ## Notes
 
Two T-sensors (one for either side of the peltier module).
Q | A
--- | ---
**T-Resolution?** | *See datasheet (basically linear T-dependent resistor) + use wheatstone bridge*

## TODO
Complete shopping list []\
Setup PCB project file with Arduino Nano header footprint, upload []\
Design a preliminary PCB, upload here []\
CAD-model of device with PCB, Peltier device, and mounted sensors []\
5A fuse in line with peltier device []\
Max "I-arduino" fuse in line with arduino Vcc []
