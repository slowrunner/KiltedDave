#!/bin/bash

amixer -D plughw:1,0 sset Master 40%
~/HumbleDave2/plib/piper.sh 'Volume set to 40 percent'
