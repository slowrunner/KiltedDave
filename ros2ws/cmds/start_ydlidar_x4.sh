#!/bin/bash 

basedir=KiltedDave
echo -e "\n*** Switching to ~/${basedir}/ros2ws"
cd ~/$basedir/ros2ws

echo -e "\n*** Sourcing /opt/ros/kilted/setup.bash"
. /opt/ros/kilted/setup.bash

echo -e "\n*** Sourcing install/setup.bash"
. ~/$basedir/ros2ws/install/setup.bash

echo -e "\n*** Start YDLidar X4 node in background"
echo "*** ros2 launch ydlidar_ros2_driver ydlidar_launch.py &"
ros2 launch ydlidar_ros2_driver ydlidar_launch.py &
