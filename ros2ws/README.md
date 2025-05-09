# Humble Dave 2  ROS 2 Workspace


### Base Humble Dave 2  Raspberry Pi 4 Processor Utilization

Base Humble Dave 2 ROS 2 configuration is:  
- ros2_gopigo3_node GoPiGo3 ROS2 publishes odom, offers /cmd_vel etc  
- battery_node: publishes /battery_state  
- docking_node: publishes /dock_status, offers /dock and /undock services  
- dave_node: calls /dock when vBatt<10v, and calls /undock when charge current < -175mA  
- odometer: logs all /cmd_vel movement (does not record dock/undock movement)  
- joy_node: handles wireless SNES joy controller to publish /cmd_vel  
- say_node: TTS speech server offers /say {"phrase"} service  



```

```

Base KiltedDave Processor Utilization:  
- Total Load (15 min uptime / 4 cores): x%   
- Instantaneous Load (sum of top %CPU): x%  

```
********** ROS2 GoPiGo3 MONITOR ******************************

```
