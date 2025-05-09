#!/bin/bash

# FILE: call_start_scan.sh

# PURPOSE:  call the ydlidar node's /start_scan service

basedir=KiltedDave
echo -e "\n*** Switching to ~/${basedir}/ros2ws"
cd ~/$basedir/ros2ws

echo -e "\n*** Sourcing /opt/ros/kilted/setup.bash"
. /opt/ros/kilted/setup.bash

echo -e "\n*** Sourcing install/setup.bash"
. ~/$basedir/ros2ws/install/setup.bash

echo -e "\n*** Calling ydlidar_ros_driver's /start_scan service"
echo -e "ros2 service call /start_scan std_srvs/Empty"
ros2 service call /start_scan std_srvs/Empty
