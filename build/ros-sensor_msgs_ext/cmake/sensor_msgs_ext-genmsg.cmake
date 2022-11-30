# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sensor_msgs_ext: 12 messages, 3 services")

set(MSG_I_FLAGS "-Isensor_msgs_ext:/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sensor_msgs_ext_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv" ""
)

get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv" NAME_WE)
add_custom_target(_sensor_msgs_ext_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor_msgs_ext" "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Services
_generate_srv_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_cpp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Module File
_generate_module_cpp(sensor_msgs_ext
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sensor_msgs_ext_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sensor_msgs_ext_generate_messages sensor_msgs_ext_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_cpp _sensor_msgs_ext_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_msgs_ext_gencpp)
add_dependencies(sensor_msgs_ext_gencpp sensor_msgs_ext_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_msgs_ext_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Services
_generate_srv_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_eus(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Module File
_generate_module_eus(sensor_msgs_ext
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sensor_msgs_ext_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sensor_msgs_ext_generate_messages sensor_msgs_ext_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_eus _sensor_msgs_ext_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_msgs_ext_geneus)
add_dependencies(sensor_msgs_ext_geneus sensor_msgs_ext_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_msgs_ext_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Services
_generate_srv_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_lisp(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Module File
_generate_module_lisp(sensor_msgs_ext
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sensor_msgs_ext_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sensor_msgs_ext_generate_messages sensor_msgs_ext_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_lisp _sensor_msgs_ext_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_msgs_ext_genlisp)
add_dependencies(sensor_msgs_ext_genlisp sensor_msgs_ext_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_msgs_ext_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Services
_generate_srv_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_nodejs(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Module File
_generate_module_nodejs(sensor_msgs_ext
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sensor_msgs_ext_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sensor_msgs_ext_generate_messages sensor_msgs_ext_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_nodejs _sensor_msgs_ext_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_msgs_ext_gennodejs)
add_dependencies(sensor_msgs_ext_gennodejs sensor_msgs_ext_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_msgs_ext_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_msg_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Services
_generate_srv_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)
_generate_srv_py(sensor_msgs_ext
  "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
)

### Generating Module File
_generate_module_py(sensor_msgs_ext
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sensor_msgs_ext_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sensor_msgs_ext_generate_messages sensor_msgs_ext_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv" NAME_WE)
add_dependencies(sensor_msgs_ext_generate_messages_py _sensor_msgs_ext_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_msgs_ext_genpy)
add_dependencies(sensor_msgs_ext_genpy sensor_msgs_ext_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_msgs_ext_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor_msgs_ext
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor_msgs_ext
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor_msgs_ext
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor_msgs_ext
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor_msgs_ext
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
