#! /usr/bin/env python

import rospy
import sys
import copy
import moveit_commander
import moveit_msgs.msg
from moveit_msgs.msg import Constraints, JointConstraint, PositionConstraint, OrientationConstraint, BoundingVolume
from sensor_msgs.msg import JointState
from moveit_msgs.msg import RobotState

import geometry_msgs.msg
from geometry_msgs.msg import Quaternion, Pose
from tf.transformations import quaternion_from_euler

from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list


from ebot_mani.srv import MoverService, MoverServiceRequest, MoverServiceResponse

import actionlib
import math

from sensor_msgs.msg import JointState
from ebot_mani.msg import UR5MoveitJoints

joint_angles = [0,0,0,0,0,0]
joint_names = [
                "shoulder_pan_joint",
                "shoulder_lift_joint",
                "elbow_joint",
                "wrist_1_joint",
                "wrist_2_joint",
                "wrist_3_joint"
                ]



# Between Melodic and Noetic, the return type of plan() changed. moveit_commander has no __version__ variable, so checking the python version as a proxy
if sys.version_info >= (3, 0):
    def planCompat(plan):
        return plan[1]
else:
    def planCompat(plan):
        return plan
        

class Ur5Moveit:

    # Constructor
    def __init__(self):
        rospy.loginfo('Join Angle Node Has Started')

        rospy.init_node('set_joint_angles', anonymous=True)
        rospy.Service('ur5_moveit', MoverService, self.plan_pick_and_place)

        self._planning_group = "ur5_1_planning_group"
        self._commander = moveit_commander.roscpp_initialize(sys.argv)
        self._robot = moveit_commander.RobotCommander()
        self._scene = moveit_commander.PlanningSceneInterface()
        self._group = moveit_commander.MoveGroupCommander(self._planning_group)
        self._display_trajectory_publisher = rospy.Publisher(
            '/move_group/display_planned_path', moveit_msgs.msg.DisplayTrajectory, queue_size=1)

        self._exectute_trajectory_client = actionlib.SimpleActionClient(
            'execute_trajectory', moveit_msgs.msg.ExecuteTrajectoryAction)
        self._exectute_trajectory_client.wait_for_server()

        self._planning_frame = self._group.get_planning_frame()
        self._eef_link = self._group.get_end_effector_link()
        self._group_names = self._robot.get_group_names()


        rospy.loginfo(
            '\033[94m' + "Planning Group: {}".format(self._planning_frame) + '\033[0m')
        rospy.loginfo(
            '\033[94m' + "End Effector Link: {}".format(self._eef_link) + '\033[0m')
        rospy.loginfo(
            '\033[94m' + "Group Names: {}".format(self._group_names) + '\033[0m')

        rospy.loginfo('\033[94m' + " >>> Ur5Moveit init done." + '\033[0m')

    def plan_trajectory(self, move_group, destination_pose, start_joint_angles): 
        # current_joint_state = JointState()
        # current_joint_state.name = joint_names
        # current_joint_state.position = start_joint_angles

        # moveit_robot_state = RobotState()
        # moveit_robot_state.joint_state = current_joint_state
        # move_group.set_start_state(moveit_robot_state)

        ori = [-1.57093100782, -6.75505852993e-05, -1.57047131029]
        orientation = quaternion_from_euler(ori[0], ori[1], ori[2], axes='sxyz')

        destination_pose_ur5 = geometry_msgs.msg.Pose()
        destination_pose_ur5.position.x = destination_pose.pos_x
        destination_pose_ur5.position.y = destination_pose.pos_z
        destination_pose_ur5.position.z = destination_pose.pos_y - 0.77
        destination_pose_ur5.orientation.x = orientation[0] #destination_pose.rot_x
        destination_pose_ur5.orientation.y = orientation[1] #destination_pose.rot_y
        destination_pose_ur5.orientation.z = orientation[2] #destination_pose.rot_z
        destination_pose_ur5.orientation.w = orientation[3] #destination_pose.rot_w
        rospy.loginfo(destination_pose_ur5)
        move_group.set_pose_target(destination_pose_ur5)
        plan = move_group.plan()

        if not plan:
            exception_str = """
                Trajectory could not be planned for a destination of {} with starting joint angles {}.
                Please make sure target and destination are reachable by the robot.
            """.format(destination_pose, destination_pose)
            raise Exception(exception_str)

        return planCompat(plan)

    def plan_pick_and_place(self, req):
        response = MoverServiceResponse()
        move_group = self._group
        self._group.set_planning_time(20)
        # ori = [-1.69788433675, -1.0154567338602, 0]
        # orientation = quaternion_from_euler(ori[0], ori[1], ori[2], axes='sxyz')

        # req.pick_pose.position.x += 1.2
        # req.pick_pose.position.y += 0.76
        # req.pick_pose.position.z -= 0.55
        # req.pick_pose.orientation.x = -0.6558968
        # req.pick_pose.orientation.y = -0.3212657
        # req.pick_pose.orientation.z = 0.364928
        # req.pick_pose.orientation.w = 0.5774212
        # rospy.logwarn(req.pick_pose)
        pose_values = geometry_msgs.msg.Pose()
        pose_values = self._group.get_current_pose().pose
        rospy.loginfo(pose_values)
        # TODO: Make message type a list instead
        current_robot_joint_configuration = [
            math.radians(req.joints_input.joint_00),
            math.radians(req.joints_input.joint_01),
            math.radians(req.joints_input.joint_02),
            math.radians(req.joints_input.joint_03),
            math.radians(req.joints_input.joint_04),
            math.radians(req.joints_input.joint_05),
        ]

        # Pre grasp - position gripper directly above target object
        pre_grasp_pose = self.plan_trajectory(self._group, req.pick_pose, current_robot_joint_configuration)
        
        # If the trajectory has no points, planning has failed and we return an empty response
        if not pre_grasp_pose.joint_trajectory.points:
            return response

        # If trajectory planning worked for all pick and place stages, add plan to response
        response.trajectories.append(pre_grasp_pose)
    
        move_group.clear_pose_targets()
        print("\n\n\nMoving arm in unity\n\n\n")
        move_group.go(wait=True)
        print("\n\n\nending move\n\n\n")
        return response

    def set_joint_angles(self, arg_list_joint_angles):

        flag_plan = False
        i = 0
        while(not flag_plan):
            list_joint_values = self._group.get_current_joint_values()
            rospy.loginfo('\033[94m' + ">>> Current Joint Values:" + '\033[0m')
            rospy.loginfo(list_joint_values)

            self._group.set_joint_value_target(arg_list_joint_angles)
            self._group.plan()
            flag_plan = self._group.go(wait=True)

            list_joint_values = self._group.get_current_joint_values()
            rospy.loginfo('\033[94m' + ">>> Final Joint Values:" + '\033[0m')
            rospy.loginfo(list_joint_values)

            pose_values = self._group.get_current_pose().pose
            rospy.loginfo('\033[94m' + ">>> Final Pose:" + '\033[0m')
            rospy.loginfo(pose_values)

            if (flag_plan == True):
                rospy.loginfo(
                    '\033[94m' + ">>> set_joint_angles() Success" + '\033[0m')
            else:
                rospy.logerr(
                    '\033[94m' + ">>> set_joint_angles() Failed." + '\033[0m')
            i+=1
            if i>4:
                rospy.logerr('Motion_Plan not found, Please Change the joint angles')
                break

        return flag_plan

    # Destructor

    def __del__(self):
        moveit_commander.roscpp_shutdown()
        rospy.loginfo(
            '\033[94m' + "Object of class Ur5Moveit Deleted." + '\033[0m')

ur5 = Ur5Moveit()

def callback(joints):
    global joint_angles, ur5
    joint_angles = [math.radians(joints.joint_00),
                    math.radians(joints.joint_01),
                    math.radians(joints.joint_02),
                    math.radians(joints.joint_03),
                    math.radians(joints.joint_04),
                    math.radians(joints.joint_05)]
    ur5.set_joint_angles(joint_angles)
    rospy.loginfo(joint_angles)

def main():
    global joint_angles, ur5
    rospy.Subscriber("SourceDestination", UR5MoveitJoints, callback)

    rospy.spin()

    del ur5


if __name__ == '__main__':
    main()
