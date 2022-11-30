# Install script for directory: /home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ubuntu/ES-TEAM-A/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sensor_msgs_ext/msg" TYPE FILE FILES
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/axis_state.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/proximity.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/analog_voltage.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/time_reference.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_fix.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_position.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gnss_track.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/accelerometer.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/gyroscope.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/magnetometer.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/temperature.msg"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/msg/covariance.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sensor_msgs_ext/srv" TYPE FILE FILES
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/calibrate_gyroscope.srv"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/set_axis_home.srv"
    "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/srv/get_proximity_configuration.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sensor_msgs_ext/cmake" TYPE FILE FILES "/home/ubuntu/ES-TEAM-A/build/ros-sensor_msgs_ext/catkin_generated/installspace/sensor_msgs_ext-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ubuntu/ES-TEAM-A/devel/include/sensor_msgs_ext")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ubuntu/ES-TEAM-A/devel/share/roseus/ros/sensor_msgs_ext")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ubuntu/ES-TEAM-A/devel/share/common-lisp/ros/sensor_msgs_ext")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ubuntu/ES-TEAM-A/devel/share/gennodejs/ros/sensor_msgs_ext")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/ubuntu/ES-TEAM-A/devel/lib/python3/dist-packages/sensor_msgs_ext")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/ubuntu/ES-TEAM-A/devel/lib/python3/dist-packages/sensor_msgs_ext")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ubuntu/ES-TEAM-A/build/ros-sensor_msgs_ext/catkin_generated/installspace/sensor_msgs_ext.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sensor_msgs_ext/cmake" TYPE FILE FILES "/home/ubuntu/ES-TEAM-A/build/ros-sensor_msgs_ext/catkin_generated/installspace/sensor_msgs_ext-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sensor_msgs_ext/cmake" TYPE FILE FILES
    "/home/ubuntu/ES-TEAM-A/build/ros-sensor_msgs_ext/catkin_generated/installspace/sensor_msgs_extConfig.cmake"
    "/home/ubuntu/ES-TEAM-A/build/ros-sensor_msgs_ext/catkin_generated/installspace/sensor_msgs_extConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sensor_msgs_ext" TYPE FILE FILES "/home/ubuntu/ES-TEAM-A/src/ros-sensor_msgs_ext/package.xml")
endif()

