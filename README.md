# **AR_Manipulator**



## This is the Repo for the Augumented Reality project for the UR5 arm organized by E-Yantra  

Please follow the steps to setup the project. 


> This package is tested on **Ubuntu 18, ROS-Melodic**. We recommend you to use this OS and ROS distribution only.


## Installation

###  ROS installation

- Follow the Official Installation instruction from the [ROS-Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu) website. We recommend to use the following command for **step 1.4**. This will ensure all the basic package availability and possibly avoid any "missing packages" errors.

```bash
sudo apt install ros-melodic-desktop-full
```

### Creating a Catkin Workspace

Go to your home direcory and type the following command in the terminal

```bash
mkdir -p catkin_ws/src
cd catkin_ws 
catkin_make && source devel/setup.bash
```
you can also add source `~/catkin_ws/devel/setup.bash` at the bottom of your `.bashrc` in the home direcory if you want to source the the workspace by defualt 

### Cloning this repository

Inside your `cakin_ws/src`, enter the following command to clone (download) this repository. 

```bash
https://github.com/namikxgithub/ar_mainpulator.git
```

### Additional Packages 

you need to install some dependencies and packges like Moveit! and rosbridge for the project to work

```bash
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install python-pip ros-melodic-robot-state-publisher ros-melodic-moveit ros-melodic-rosbridge-suite ros-melodic-joy ros-melodic-ros-control ros-melodic-ros-controllers ros-melodic-tf2-web-republisher
sudo -H pip install rospkg jsonpickle
```
## Run the project

All set! now we can proceed with the excution part...    
- First launch the UR5_AR app in your android device or enter the playmode if you are using the unity editor.
- After that launch the `ar_test` launch file in the `ebot_description` package. This can be launched by the following command.
```bash
roslaunch ebot_description ar_test.launch
```
>This will launch the UR5 arm in Rviz and Gazebo
>A TCP Server will start on the ROS running device to communicate with the AR app. 
>The joint angles are published on the `SourceDestination` topic which are subscribed by the `arm_joint_angle.py`script in the ebot_mani package to move the arm accordingly in gazebo using moveit!

Alright! Now you can fiddle around with the joint angles in the AR app and hit publish and you will see that the Arm moves in gazbo like you set in the APP
**Have Fun!**
