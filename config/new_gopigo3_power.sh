#! /usr/bin/env bash
# This script is used to detect if GPG3 connected and run new_gopigo3_power.py
# This script is called by new_gopigo3_power.service

# These lines are specific to the GoPiGo3
SCRIPTDIR="$(readlink -f $(dirname $0))"
echo "SCRIPTDIR: " $SCRIPTDIR
REPO_PATH=$(readlink -f $(dirname $0) | grep -E -o "^(.*?\\KiltedDave)")
echo "REPO_PATH: " $REPO_PATH

# Check if new_gopigo3_power.py is running.
SERVICE='new_gopigo3_power.py'
# To be able to do an update without crapping out, we need to have power management on.  So let's directly turn it on.
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running."
else
    echo "$SERVICE is not running"
    # Run the new_gopigo3_power.py if GPG3 detected
    echo -e "sudo python3 $REPO_PATH/config/new_gopigo3_power.py"
    sudo python3 $REPO_PATH/config/new_gopigo3_power.py
    echo "$SERVICE started."
fi
