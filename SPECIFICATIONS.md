Feature / Bot	GoPiGo3 “Kilted Dave”

| Feature | Detail |
| --- | --- |
| Motors | Quantity 2 |
| | 6v Gear Reduction (1:120) motors |
| | 4500 mg-cm at 6v |  
| | drive() batt. load: ~330mA at 9.5v | 
| Speed | 2.6 in/sec at 120 DPS |
| | 3.25 in/sec 82.6mm at 150 DPS |
| | 6.4 in/sec at 300 DPS (default)|
| | 43 in/sec (1.1m/s) max acceleration |
| | 7.7  in/sec (0.2m/s) at 360 DPS (max for  straight travel) |
| Supply Circuit |Rohm DC/DC Buck BD9D320EFJ |
| | 4.5-18v input |
| | 5v 3A |
| Tires	| 2.6” 66.5mm | 
| Robot Dimensions | 9 L x 5 W x 7 H |
| Chassis Shape	| Three Layer Rectangle|
| Weight | X.x lbs |
| Min Turning Radius | 14cm 5.5 inch |
| | "Axle" center to rear corners |
| | 19cm 7.5 inch orbit radius |
| | Wheel center to opp. rear corner |
| Using WDia,WBase | 64.0 (2.5")  114.05 mm (4.5") |	
| “Grove” Analog / Digital / PWM | Grove Connector: |
| (A2D 0-5v 12bit 1.2mV resolution) | |
| 1-A: | pin 1 (default) |
| 1-B: | pin 2 |
| 2-A: | pin 1 (default) |
| 2-B: | pin 2 |
| pin 3: |  VCC 5v |
| pin 4: | GND |
| | |
| Serial Port | unused |
| level converted | |
|Servo Ports | 1) pan  2) unused |
| | |
| Motor Driver | Dual TB6612FNG| 
| | Dual 1.2A 15v max |
| I2C | Parallel wired -interchangeable |
| | 2x “Grove” HW I2C ports | 
| | (level converted) |
| | “1”) MPU9250 IMU | 
| | “2”) INA219 Voltage/current |
| Castor | 3/4” Pololu plastic ball |
| Power Switch	| Push/Push |
| | |
| Sensors: | |

   Battery V	12bit intrinsic float, 16:1 div, 
8.6mV precision, 70mv variation

   Encoders	720 counts / rev   (6 count/motor_rev x 120:1 gear reduction)
(APIs in degrees, 360 / wheel rev)

    Microphone	None

Indicators	

   Battery On/Level	Red/Yellow/Purple Voltage Indicator

   Other	3x Multi-Color WS2812B LED
	2x Red LED

Processor	Raspberry Pi 4
* 1.8GHz Four-core Cortex-A72
* 4 GB RAM
* 32GB SD card / ~10GB used 
* 600ma idle - 1.34A full load

ADC 	ATMEL SAMC20J
	12-bit with 2.048v ± 0.041v Vref 

Power Source	ModRobotics 3000mAH 11.1 Rechargeable LI-Ion Battery

Configured Idle Battery Current Draw              225ma 11v - 308mA 8v 
ave: 258mA 9.6v  2.5w         
equiv. 500mA at 5v                          
Active Current Draw ( Motors, Camera, Sensors, Servo )	800 mA - 2A
Run Time	4-5 h (~30Wh), 

Extended ROSbot Cost	$??? Apr 2025
