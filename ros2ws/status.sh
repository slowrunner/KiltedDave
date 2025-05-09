#!/bin/bash

botname="Humble Dave 2"
echo -e "\n********** $botname ROS2 GoPiGo3 Status ***********"; 
echo -n `date +"%A %D"`; 
echo ""; 
uptime; 
vcgencmd measure_temp && vcgencmd measure_clock arm && vcgencmd get_throttled; 
# python3 /home/ubuntu/KiltedDave/plib/battery.py; 
python3 /home/ubuntu/KiltedDave/plib/gopigo3_battery.py; 
echo ""; 
free -h; 
echo -e "\n"
echo -e "ROS 2 NODES"
ps -ef | grep "ros2 run" | grep -v "grep"  && ps -ef | grep "ros2 launch" | grep -v "grep" && ps -ef | grep "publisher" | grep -v "grep"
echo -e "\n"
