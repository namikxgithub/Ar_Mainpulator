#! /usr/bin/env python
"""
Dummy script for finding orientation of gazebo world wrt unity scene. 
"""
import rospy 
import rospkg 
from gazebo_msgs.msg import ModelState 
from gazebo_msgs.srv import SetModelState
from robotics_demo.msg import PosRot


def callback(data):
    state_msg = ModelState()
    state_msg.model_name = 'ebot'
    state_msg.pose.position.x = data.pos_x
    state_msg.pose.position.y = data.pos_y
    state_msg.pose.position.z = data.pos_z
    state_msg.pose.orientation.x = data.rot_x
    state_msg.pose.orientation.y = data.rot_y
    state_msg.pose.orientation.z = data.rot_z
    state_msg.pose.orientation.w = data.rot_w

    rospy.wait_for_service('/gazebo/set_model_state')
    try:
        set_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)
        resp = set_state( state_msg )

    except rospy.ServiceException, e:
        print "Service call failed: %s" % e
    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("pos_rot", PosRot, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
