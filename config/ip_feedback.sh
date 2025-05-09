#!/bin/bash

# FILE:  ip_feedback.sh
# This script is run once at boot by ip_feedback.service

user=ubuntu

echo "starting"
sleep 60
COUNT=0
IPs=$(hostname --all-ip-addresses)
while [ -z "$IPs" ]
do
    echo "loop"
    sleep 1;
    IPs=$(hostname --all-ip-addresses)
    COUNT=$((COUNT+1))
    echo "count: "$COUNT > /home/$user/ipcount
done

echo "done looping "

echo "count: "$COUNT > /home/$user/ipcount

ifconfig wlan0 | grep 'inet ' | awk '{print $2}'  > /home/$user/ip.number
read -r IP_NUMBER < /home/$user/ip.number
echo $IP_NUMBER

# remove previous IP info
sudo rm /boot/firmware/*.assigned_ip &>/dev/null
# sudo rm /home/$user/Desktop/*.assigned_ip &>/dev/null

# remove previous Failed IP
FAILED=/home/$user/failedIP
if test -f "$FAILED"; then
    sudo rm $FAILED &>/dev/null
fi
# sudo rm /home/$user/Desktop/failedIP &>/dev/null

if [ ! -z "$IP_NUMBER" ]
then
        echo "saving IP info"
#        sudo bash -c "echo $IP_NUMBER > /boot/$IP_NUMBER.assigned_ip"
        sudo bash -c "echo $IP_NUMBER > /boot/firmware/$IP_NUMBER.assigned_ip"
#       echo $IP_NUMBER > /home/ubuntu/Desktop/$IP_NUMBER.assigned_ip
        echo "IP info saved"

        su -c "espeak-ng -a 20 'WiFi IP'" ubuntu
        su -c "espeak-ng -a 20 $IP_NUMBER" ubuntu
        su -c "espeak-ng -a 20 repeating "  ubuntu
        su -c "espeak-ng -a 20 $IP_NUMBER" ubuntu
else
        su -c "espeak-ng -a 20 'no IP number'" ubuntu
        echo "no IP number"
        echo "no IP" > /home/$user/failedIP
#       echo "no IP" > /home/ubuntu/Desktop/failedIP

fi
echo "done with IP feedback"
