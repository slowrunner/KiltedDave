#!/bin/bash

# installs and configures the new gopigo3 power service

chmod 777 new_gopigo3_power.sh

echo "copying new_gopigo3_power.service to /etc/systemd/system"
sudo cp etc_systemd_system.new_gopigo3_power.service /etc/systemd/system/new_gopigo3_power.service
sudo systemctl daemon-reload
sudo systemctl enable new_gopigo3_power
sudo service new_gopigo3_power start
