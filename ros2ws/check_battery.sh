#!/bin/bash

echo -e "\n*** Checking Battery with GoPiGo3 API"
python3 /home/ubuntu/KiltedDave/plib/gopigo3_battery.py

echo -e "\n*** Checking Battery with ROS2"; 
echo "ros2 topic echo --once /battery_state"; 
ros2 topic echo --once /battery_state; 

# echo -e "\n*** Checking Battery from Ubuntu"
# python3 /home/ubuntu/KiltedDave/plib/battery.py
