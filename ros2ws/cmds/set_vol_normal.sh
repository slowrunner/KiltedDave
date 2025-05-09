#!/bin/bash

# FILE: cmds/set_vol_normal.sh

amixer -c 1 sset PCM 75%
~/KiltedDave/ros2ws/cmds/say.sh "Volume set to normal 75 percent"
