#!/bin/bash

sleep 5
roslaunch ebot_mani server_connect.launch
sleep 5
echo 'Server_endpoint started, please connect to the following IP'
echo "ROS_IP: $(hostname -I)" | awk '{print $1, $2}'