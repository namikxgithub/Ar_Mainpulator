#!/bin/bash

# Shell script to start Server endpoint with a small delay.
# This delay is neccessary so the ip.sh script can change the ROS IP before the server starts.
sleep 10
roslaunch ebot_mani server_connect.launch
