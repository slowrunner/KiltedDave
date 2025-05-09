#!/bin/bash

basedir=KiltedDave
echo -e "\n*** Switching to ~/${basedir}/ros2ws"
cd ~/$basedir/ros2ws

echo -e "\n*** Sourcing /opt/ros/kilted/setup.bash"
. /opt/ros/kilted/setup.bash

echo -e "\n*** Sourcing install/setup.bash"
. ~/$basedir/ros2ws/install/setup.bash

trap '[[ $BASH_COMMAND != echo* ]] && echo $BASH_COMMAND' DEBUG

echo -e "\n*** STARTING kill_lidar.sh ***"

echo -e "\n*** Kill LiDAR node ***"
killall ydlidar_ros2_driver_node

echo -e  "\n*** DONE KILLING YDLIDAR ***\n"
