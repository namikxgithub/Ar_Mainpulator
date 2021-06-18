#!/bin/bash

full_path=$(realpath $0)
 
dir_path=$(dirname $full_path)

parent=$(dirname $dir_path )


# ls $parent/config 
echo "ROS_IP: $(hostname -I)" | awk '{print $1, $2}' > $parent/config/ip_params.yaml