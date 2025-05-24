#!/bin/bash



control_c() {
  echo -e "\n"
  exit
}

trap control_c SIGINT


while true; \
do echo -e "Collecting ROS Info"; \

# cntl-c will cause ros2 traceback; send to null device
procs=$(ros2 topic list 2>/dev/null)
echo  -e "ROS Topic List:"
echo -e $procs

if grep -q "$procs" <<< "battery_state"; then
    # Check Battery Percentage
    batt=$(ros2 topic echo --once --field percentage --qos-reliability best_effort --qos-durability volatile /battery_state)
    batt="${batt:0:4}"
fi

if grep -q "$procs" <<< "dock_status"; then
    # Checking Docking State
    docked=$(ros2 topic echo --once --field is_docked --qos-reliability best_effort --qos-durability volatile /dock_status)
fi

if grep -q "$procs" <<< "battery_state"; then
    curr=$(ros2 topic echo --once --field current --qos-reliability best_effort --qos-durability volatile /battery_state); \
    curr="${curr:0:5}"; \
    # echo "Current: $curr"; \

    volt=$(ros2 topic echo --once --field voltage --qos-reliability best_effort --qos-durability volatile /battery_state); \
    volt="${volt:0:5}"; \
    watts=`(echo "scale=1; ($volt * $curr)" | bc -l)`; \
    watts="${watts:0:5}"; \
fi

echo -e "\n********** KILTED DAVE MONITOR ******************************"; \

echo -n `date +"%A %D"`; \
echo ""; \
uptime; \
vcgencmd measure_temp && vcgencmd measure_clock arm && vcgencmd get_throttled; \
free -h; \
echo ""; \

if grep -q "$procs"  <<< "battery_state"; then
    echo "Voltage: $volt  Current: $curr  Watts: $watts"; \
fi

if grep -q "$procs" <<< "dock"; then
    echo "Battery: $batt  Docked: $docked"; \
fi

# ps -e -o %cpu,%mem,cmd | grep  'CPU\|MEM\|CMD\|rplidar\|robot\|joint\|oak\|nav\|slam\|turtlebot4\|dave' | grep -v "grep" | sort -rk 1 ; \
# sleep 5; \
echo " "; \
done
