#!/bin/bash

# FILE:  start_gpgMin_robot_and_joint_state.sh

basedir=KiltedDave
echo -e "\n*** Switching to ~/${basedir}/ros2ws"
cd ~/$basedir/ros2ws

echo -e "\n*** Sourcing /opt/ros/kilted/setup.bash"
. /opt/ros/kilted/setup.bash

echo -e "\n*** Sourcing install/setup.bash"
. ~/$basedir/ros2ws/install/setup.bash

echo -e "\n*** Starting Robot_State and Joint_State Publishers"
echo "*** with URDF file: gpgMin.urdf"
ros2 launch ros2_gopigo3_node ros2_gpgMin_state_and_joint.launch.py &
