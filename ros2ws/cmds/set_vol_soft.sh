#!/bin/bash

# FILE: cmds/set_vol_soft.sh

amixer -c 1 sset PCM 60%
~/KiltedDave/ros2ws/cmds/say.sh "Volume set to soft, 60 percent"
