#!/bin/bash

echo -e "ros2 run ros2_gopigo3_node gopigo3_node --ros-args --params-file ./src/ros2_gopigo3_node/gopigo3_node_params.yaml & "

ros2 run ros2_gopigo3_node gopigo3_node --ros-args --params-file ./src/ros2_gopigo3_node/gopigo3_node_params.yaml  &
