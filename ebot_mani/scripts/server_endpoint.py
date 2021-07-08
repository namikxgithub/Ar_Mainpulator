#!/usr/bin/env python
"""
Server endpoint script.
Specifies how pubishers, subscribers and services are to be redirected. 
"""
import rospy

from ros_tcp_endpoint import TcpServer, RosPublisher, RosSubscriber, RosService
from ebot_mani.msg import UR5MoveitJoints
from sensor_msgs.msg import JointState
from ebot_mani.srv import MoverService
def main():
    rospy.loginfo('Server Connect Node Has Started')
    ros_node_name = rospy.get_param("/TCP_NODE_NAME", 'TCPServer')
    tcp_server = TcpServer(ros_node_name)
    rospy.init_node(ros_node_name, anonymous=True)

    # Start the Server Endpoint with a ROS communication objects dictionary for routing messages
    tcp_server.start({
        'SourceDestination_input': RosPublisher('SourceDestination', UR5MoveitJoints, queue_size=10),
        'Joint_output': RosSubscriber('/joint_states', JointState, tcp_server),
        'ur5_moveit': RosService('ur5_moveit', MoverService),
    })
    rospy.spin()


if __name__ == "__main__":
    main()
