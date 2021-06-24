# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ebot_mani: 1 messages, 1 services")

set(MSG_I_FLAGS "-Iebot_mani:/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Imoveit_msgs:/home/kurkure/dev_ws/devel/share/moveit_msgs/msg;-Imoveit_msgs:/home/kurkure/dev_ws/src/Ar_Mainpulator/moveit_msgs/msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/melodic/share/trajectory_msgs/cmake/../msg;-Ishape_msgs:/opt/ros/melodic/share/shape_msgs/cmake/../msg;-Iobject_recognition_msgs:/opt/ros/melodic/share/object_recognition_msgs/cmake/../msg;-Ioctomap_msgs:/opt/ros/melodic/share/octomap_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ebot_mani_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv" NAME_WE)
add_custom_target(_ebot_mani_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ebot_mani" "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv" "trajectory_msgs/JointTrajectory:moveit_msgs/RobotTrajectory:ebot_mani/bot:trajectory_msgs/MultiDOFJointTrajectoryPoint:geometry_msgs/Twist:trajectory_msgs/MultiDOFJointTrajectory:geometry_msgs/Transform:std_msgs/Header:ebot_mani/UR5MoveitJoints:geometry_msgs/Vector3:trajectory_msgs/JointTrajectoryPoint:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg" NAME_WE)
add_custom_target(_ebot_mani_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ebot_mani" "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebot_mani
)

### Generating Services
_generate_srv_cpp(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/moveit_msgs/msg/RobotTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/bot.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebot_mani
)

### Generating Module File
_generate_module_cpp(ebot_mani
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebot_mani
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ebot_mani_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ebot_mani_generate_messages ebot_mani_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv" NAME_WE)
add_dependencies(ebot_mani_generate_messages_cpp _ebot_mani_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg" NAME_WE)
add_dependencies(ebot_mani_generate_messages_cpp _ebot_mani_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ebot_mani_gencpp)
add_dependencies(ebot_mani_gencpp ebot_mani_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ebot_mani_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ebot_mani
)

### Generating Services
_generate_srv_eus(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/moveit_msgs/msg/RobotTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/bot.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ebot_mani
)

### Generating Module File
_generate_module_eus(ebot_mani
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ebot_mani
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ebot_mani_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ebot_mani_generate_messages ebot_mani_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv" NAME_WE)
add_dependencies(ebot_mani_generate_messages_eus _ebot_mani_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg" NAME_WE)
add_dependencies(ebot_mani_generate_messages_eus _ebot_mani_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ebot_mani_geneus)
add_dependencies(ebot_mani_geneus ebot_mani_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ebot_mani_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ebot_mani
)

### Generating Services
_generate_srv_lisp(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/moveit_msgs/msg/RobotTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/bot.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ebot_mani
)

### Generating Module File
_generate_module_lisp(ebot_mani
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ebot_mani
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ebot_mani_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ebot_mani_generate_messages ebot_mani_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv" NAME_WE)
add_dependencies(ebot_mani_generate_messages_lisp _ebot_mani_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg" NAME_WE)
add_dependencies(ebot_mani_generate_messages_lisp _ebot_mani_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ebot_mani_genlisp)
add_dependencies(ebot_mani_genlisp ebot_mani_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ebot_mani_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebot_mani
)

### Generating Services
_generate_srv_nodejs(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/moveit_msgs/msg/RobotTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/bot.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebot_mani
)

### Generating Module File
_generate_module_nodejs(ebot_mani
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebot_mani
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ebot_mani_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ebot_mani_generate_messages ebot_mani_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv" NAME_WE)
add_dependencies(ebot_mani_generate_messages_nodejs _ebot_mani_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg" NAME_WE)
add_dependencies(ebot_mani_generate_messages_nodejs _ebot_mani_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ebot_mani_gennodejs)
add_dependencies(ebot_mani_gennodejs ebot_mani_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ebot_mani_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebot_mani
)

### Generating Services
_generate_srv_py(ebot_mani
  "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/moveit_msgs/msg/RobotTrajectory.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/bot.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebot_mani
)

### Generating Module File
_generate_module_py(ebot_mani
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebot_mani
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ebot_mani_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ebot_mani_generate_messages ebot_mani_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/srv/MoverService.srv" NAME_WE)
add_dependencies(ebot_mani_generate_messages_py _ebot_mani_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kurkure/dev_ws/src/Ar_Mainpulator/ebot_mani/msg/UR5MoveitJoints.msg" NAME_WE)
add_dependencies(ebot_mani_generate_messages_py _ebot_mani_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ebot_mani_genpy)
add_dependencies(ebot_mani_genpy ebot_mani_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ebot_mani_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebot_mani)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ebot_mani
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ebot_mani_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ebot_mani_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET moveit_msgs_generate_messages_cpp)
  add_dependencies(ebot_mani_generate_messages_cpp moveit_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(ebot_mani_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ebot_mani)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ebot_mani
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ebot_mani_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ebot_mani_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET moveit_msgs_generate_messages_eus)
  add_dependencies(ebot_mani_generate_messages_eus moveit_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(ebot_mani_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ebot_mani)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ebot_mani
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ebot_mani_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ebot_mani_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET moveit_msgs_generate_messages_lisp)
  add_dependencies(ebot_mani_generate_messages_lisp moveit_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(ebot_mani_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebot_mani)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ebot_mani
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ebot_mani_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ebot_mani_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET moveit_msgs_generate_messages_nodejs)
  add_dependencies(ebot_mani_generate_messages_nodejs moveit_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(ebot_mani_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebot_mani)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebot_mani\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ebot_mani
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ebot_mani_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ebot_mani_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET moveit_msgs_generate_messages_py)
  add_dependencies(ebot_mani_generate_messages_py moveit_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(ebot_mani_generate_messages_py sensor_msgs_generate_messages_py)
endif()
