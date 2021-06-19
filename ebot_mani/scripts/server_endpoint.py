#!/usr/bin/env python

import rospy

from ros_tcp_endpoint import TcpServer, RosPublisher, RosSubscriber, RosService
from ebot_mani.msg import UR5MoveitJoints

def main():
    rospy.loginfo('Server Connect Node Has Started')
    ros_node_name = rospy.get_param("/TCP_NODE_NAME", 'TCPServer')
    tcp_server = TcpServer(ros_node_name)
    rospy.init_node(ros_node_name, anonymous=True)

    # Start the Server Endpoint with a ROS communication objects dictionary for routing messages
    tcp_server.start({
        'SourceDestination_input': RosPublisher('SourceDestination', UR5MoveitJoints, queue_size=10)
    })
    rospy.spin()


if __name__ == "__main__":
    main()
