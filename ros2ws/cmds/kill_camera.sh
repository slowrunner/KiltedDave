#!/bin/bash

basedir=KiltedDave
echo -e "\n*** Switching to ~/${basedir}/ros2ws"
cd ~/$basedir/ros2ws

echo -e "\n*** Sourcing /opt/ros/kilted/setup.bash"
. /opt/ros/kilted/setup.bash

echo -e "\n*** Sourcing install/setup.bash"
. ~/$basedir/ros2ws/install/setup.bash


# trap '[[ $BASH_COMMAND != echo* ]] && echo $BASH_COMMAND' DEBUG

echo -e "\n*** STARTING kill_camera.sh ***"

killall camera
ps -ef | grep camera |  grep -v grep
echo -e  "\n*** use kill [pid] to kill camera ***\n"
