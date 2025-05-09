#!/bin/bash
basedir=KiltedDave
echo -e "\n*** Switching to ~/${basedir}/ros2ws"
cd ~/$basedir/ros2ws

echo -e "\n*** Sourcing /opt/ros/kilted/setup.bash"
. /opt/ros/kilted/setup.bash

echo -e "\n*** Sourcing install/setup.bash"
. ~/$basedir/ros2ws/install/setup.bash

echo -e "\n*** Starting Odometer Node to log movements"
echo "*** ros2 run ros2_gopigo3_node odometer"
ros2 run ros2_gopigo3_node odometer &

