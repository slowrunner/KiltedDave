#!/bin/bash

basedir=KiltedDave
echo -e "\n*** Switching to ~/${basedir}/ros2ws"
cd ~/$basedir/ros2ws

echo -e "\n*** Sourcing /opt/ros/kilted/setup.bash"
. /opt/ros/kilted/setup.bash

echo -e "\n*** Sourcing install/setup.bash"
. ~/$basedir/ros2ws/install/setup.bash


echo -e "\n*** USE WITH NAVIGATION RUNNING TO CONFIRM GOPIGO3 NAV2 PARAMETER FILE IS IN USE"
echo -e "ros2 param get /velocity_smoother max_velocity"
ros2 param get /velocity_smoother max_velocity
echo -e "** max_velocity should not be [0.26, ...]"
