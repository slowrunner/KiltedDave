#!/bin/bash

# FILE: cmds/set_vol_very_low.sh

amixer -c 1 sset PCM 40%
~/KiltedDave/ros2ws/cmds/say.sh "Volume set very low, 40 percent"

