#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ubuntu/ES-TEAM-A/src/ros-mpu9250-ahrs/tf2_geometry_msgs"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ubuntu/ES-TEAM-A/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ubuntu/ES-TEAM-A/install/lib/python3/dist-packages:/home/ubuntu/ES-TEAM-A/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ubuntu/ES-TEAM-A/build" \
    "/usr/bin/python3" \
    "/home/ubuntu/ES-TEAM-A/src/ros-mpu9250-ahrs/tf2_geometry_msgs/setup.py" \
    egg_info --egg-base /home/ubuntu/ES-TEAM-A/build/ros-mpu9250-ahrs/tf2_geometry_msgs \
    build --build-base "/home/ubuntu/ES-TEAM-A/build/ros-mpu9250-ahrs/tf2_geometry_msgs" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ubuntu/ES-TEAM-A/install" --install-scripts="/home/ubuntu/ES-TEAM-A/install/bin"
