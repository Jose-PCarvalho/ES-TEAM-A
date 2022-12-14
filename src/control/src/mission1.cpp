#include <iostream>
#include <string.h>

#include <ros/ros.h>

#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Range.h>
#include <geometry_msgs/Point.h>


int main(int argc, char** argv)
{
    ros::init(argc, argv, "teste");
    ros::NodeHandle nh;

    ros::Rate rate(10);

    while (ros::ok())
    {
        ros::spinOnce();

        
        rate.sleep();
    }
}