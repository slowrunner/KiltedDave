# KiltedDave

2025-05-03: Moving to ROS 2 Kilted Kaiju over Ubuntu 24.04.2 Noble_Numbat

2025-04-03: REINCARNATING HUMBLE DAVE due to Pi5 I2C failure on GoPi5Go  

Originally a reincarnation of ROSbot Dave (rosbot-on-gopigo3) atop  
ROS2 Humble and Ubuntu 22.04 (ROS2-GoPiGo3)  

**Autonomous ROS2 home robot based on GoPiGo3 and Raspberry Pi 4**


<img src="https://github.com/slowrunner/HumbleDave2/blob/main/Graphics/2025-04-06_HumbleDave2.JPG" height="504" />


ROSbot Specs:

- Platform: GoPiGo3 from ModularRobotics 

- Processor: Raspberry Pi 4B
  * 1.8 GHz Max
  * Four Cores
  * 4GB Memory  (Configured with 1GB swap)
  * Onboard Dual Band WiFi

- OS: Ubuntu 24.04 LTS 64-bit Server
- ROS2 Kilted Kaiju: Uses 100% of one core (uptime 15min load 1.0)
 
- Control Interfaces: 
  * ssh over WiFi
  * ROS2 Kilted Kaiju 
  * 2.4GHz Wireless USB "SNES" Gamepad 

- Sensors (GoPiGo3 Intrinsic)
  * Battery_Voltage (GoPiGo3 intrinsic)
  * Regulated_5v_Voltage (GoPiGo3 intrinsic)
  * Magnetic Wheel Encoders 720 cnt/rev (GoPiGo3 intrinsic)

- Sensors (Raspberry Pi Intrinsic)  
  * Processor Temperature 
  * Processor Low Voltage Throttling Active / Latched
  * Processor Temperature Throttling Active / Latched
  
- Sensors (Added):
  * YDLIDAR X4 - 360 degrees, 12cm-10m range on half degree increment, ~8Hz scanning
  * MPU9250 Inertial Measurement Unit  
    also provides ambient temperature 
  * INA219 - Voltage, Current, Power  
  * Luxonis Oak-D-W97  1280x800 Wide-Angle Fixed-Focus 18cm-Inf Stereo Depth Camera

- Actuators/Effectors (GoPiGo3 Intrinsic)
  * Wheel Motors
  * Multi-color programmable LED (x3)
  * Program controlled Red LED (x2)
  * Tri-color Battery Voltage Indicator

- Actuators/Effectors 
  * USB audio+power speaker
  
- Available GoPiGo3 Ports
  * I2C (left): MPU9250  
  * I2C (right): INA219   
  * Grove Analog/Digital I/O AD1: Unused  
  * Grove Analog/Digital I/O AD2: Unused  
  * SERVO1: Unused  
  * SERVO2: Unused  

- Power Source: ModRobotics 3000mAH 11.1v Rechargeable Battery
  * 12.6v to protection circuit cutoff at 8.1-8.4v! 
  * Roughly 24wH 

- Run Time: (Using 10.1v 15minutes left "need to shutdown" limit) 
  * "Playtime" 3.75 hours  (averages 568mA at 11.1v 6.3w 24wH)
  * "100% wandering" TBD hours

- Recharger:  
  * ModRobotics Li-ion Battery Charging adapter
  * 12.6v 1A output with charging/charged LED
  * About 3 hours recharge from safety shutdown

- Physical:
  * 2.5 lbs Total
  * 7" wide x 9" Long x 12" High

- Total Cost: 

- First "Life": June 2021 
- First "EOL": Dec 2023
- Reincarnated: Apr 2025
