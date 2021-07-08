#!/bin/bash

# This shell script finds the ip used by ROS Master and saves it in the config.yaml file to be used by ROS-TCP endpoint
full_path=$(realpath $0)
 
dir_path=$(dirname $full_path)

parent=$(dirname $dir_path )


# ls $parent/config 
echo "ROS_IP: $(hostname -I)" | awk '{print $1, $2}' > $parent/config/ip_params.yaml
