#!/bin/bash

echo "Routine Shutdown Requested"
batt=`(/home/ubuntu/KiltedDave/plib/battery.py)`
/home/ubuntu/KiltedDave/utils/logMaintenance.py "Routine Shutdown"
/home/ubuntu/KiltedDave/utils/logMaintenance.py "'$batt'"
sudo shutdown -h +2
