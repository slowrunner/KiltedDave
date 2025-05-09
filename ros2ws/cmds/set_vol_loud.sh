#!/bin/bash

# FILE: cmds/set_vol_normal.sh

amixer -c 1 sset PCM 98%
~/KiltedDave/ros2ws/cmds/say.sh "Volume set to loud, 98 percent"
