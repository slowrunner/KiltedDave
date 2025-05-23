#!/bin/bash
basedir=KiltedDave
echo -e "\n*** Switching to ~/${basedir}/ros2ws"
cd ~/$basedir/ros2ws

echo -e "\n*** Sourcing /opt/ros/kilted/setup.bash"
. /opt/ros/kilted/setup.bash

echo -e "\n*** Sourcing install/setup.bash"
. ~/$basedir/ros2ws/install/setup.bash

echo -e "\n*** Starting Test Dock Node"
echo -e "*** start_robot_dave.sh executed?? ***"
echo -e "*** ros2 run gopi5go_dave test_dock"
ros2 run gopi5go_dave test_dock

