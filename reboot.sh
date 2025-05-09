#!/bin/bash

echo "Routine Reboot Requested"
batt=`(/home/ubuntu/KiltedDave/plib/battery.py)`
/home/ubuntu/KiltedDave/utils/logMaintenance.py "Routine Reboot"
/home/ubuntu/KiltedDave/utils/logMaintenance.py "'$batt'"
sudo reboot
