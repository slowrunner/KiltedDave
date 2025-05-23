#!/bin/bash

basedir=KiltedDave
echo -e "\n*** Switching to ~/${basedir}/ros2ws"
cd ~/$basedir/ros2ws

echo -e "\n*** Sourcing /opt/ros/kilted/setup.bash"
. /opt/ros/kilted/setup.bash

echo -e "\n*** Sourcing install/setup.bash"
. ~/$basedir/ros2ws/install/setup.bash

trap '[[ $BASH_COMMAND != echo* ]] && echo $BASH_COMMAND' DEBUG

echo -e "\n*** STARTING stop_robot.sh ***"

echo -e "\n*** Killing gopigo3_node ***"
killall gopigo3_node

echo -e "\n*** Killing distance_sensor ***"
killall distance_sensor

echo -e "\n*** Killing ultrasonic_ranger ***"
killall ultrasonic_ranger

echo -e "\n*** Killing imu_sensor ***"
killall imu_sensor

echo -e "\n*** Killing mpu9250 IMU sensor ***"
killall mpu9250driver


echo -e "\n*** Kill LiDAR node ***"
killall ydlidar_ros2_driver_node

echo -e "\n*** Try killing any other nodes started ***"
killall joy_node
killall teleop_node
killall joint_state_publisher
killall robot_state_publisher
killall libcamera_jpg_pub
killall odometer
killall async_slam_toolbox_node
killall sync_slam_toolbox_node
killall localization_slam_toolbox_node
killall battery_node
killall docking_node
killall dave_node
killall say_node

# Use when these are set up as lifecycle nodes
# ros2 lifecycle set gopigo3_node shutdown
# ros2 lifecycle set ydlidar_ros2_driver_node shutdown

echo -e  "\n*** DONE KILLING ROBOT ***\n"
