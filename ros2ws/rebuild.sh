#!/bin/bash


echo -e "\n*** REBUILDING ROS2 KiltedDave ***"

echo "*** Executing rebuild.sh ***"

echo "*** cd ~/KiltedDave/ros2ws"
cd ~/KiltedDave/ros2ws

echo "*** rosdep install -i --from-path src"
rosdep install -i --from-path src

colcon build

# echo "*** colcon build --packages-select ros2_gopigo3_msg "
# colcon build --packages-select --allow-overriding ros2_gopigo3_msg 

# echo "*** colcon build --packages-select dave_interfaces "
# colcon build --packages-select --allow-overriding dave_interfaces  

# echo "*** colcon build --packages-select ros2_gopigo3_node"
colcon build --symlink-install --packages-select ros2_gopigo3_node

# echo "*** colcon build --packages-select teleop_gopigo3_keyboard"
# colcon build --symlink-install --packages-select teleop_gopigo3_keyboard

# echo "*** colcon build --packages-select ros2_libcamera_pub"
# colcon build --packages-select ros2_libcamera_pub

# echo "** colcon build --symlink-install --packages-select ydlidar_ros2_driver"
# colcon build --symlink-install --packages-select ydlidar_ros2_driver

# echo "** colcon build --symlink-install --packages-select scan_client"
# colcon build --symlink-install --packages-select scan_client

# echo "** colcon build --symlink-install --packages-select mpu9250driver"
# colcon build --symlink-install --packages-select mpu9250driver

# echo "** colcon build --symlink-install --packages-select explorer_wanderer"
# colcon build --symlink-install --packages-select explorer_wanderer

# echo "** colcon build --symlink-install --packages-select dave"
# colcon build --symlink-install --packages-select dave

# echo "** colcon build --symlink-install --packages-select gpg3_cartographer"
# colcon build --symlink-install --packages-select gpg3_cartographer

# echo "** colcon build --symlink-install --packages-select gpg3_navigation2"
# colcon build --symlink-install --packages-select gpg3_navigation2

# echo "** colcon build --packages-select apriltag_ros apriltag_msgs"
# colcon build --packages-select apriltag_ros apriltag_msgs


echo -e "\n*** . install/setup.bash"
. install/setup.bash

echo "*** REBUILD DONE"
