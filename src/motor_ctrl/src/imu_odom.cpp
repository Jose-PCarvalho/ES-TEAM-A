#include <ros/ros.h>
#include <iostream>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Imu.h>
#include <stdlib.h>

sensor_msgs::Imu new_imu_data, old_imu_data;
geometry_msgs::Twist old_msg;
bool first_run = true;
float freq;
ros::Publisher pub;

void callback (const sensor_msgs::ImuConstPtr &msg)
{
    if (first_run==true)
    {
        new_imu_data = *msg;
        first_run = false;
        return;
    }

    old_imu_data = new_imu_data;
    new_imu_data = *msg;

    geometry_msgs::Twist twist_msg;
    
    twist_msg.angular.x = new_imu_data.angular_velocity.x;
    twist_msg.angular.y = new_imu_data.angular_velocity.y;
    twist_msg.angular.z = new_imu_data.angular_velocity.z;

    if (abs(twist_msg.linear.x) < 0.02)
        twist_msg.linear.x = 0;

    if (abs(twist_msg.linear.y) < 0.02)
        twist_msg.linear.y = 0;

    ros::Time time_new = new_imu_data.header.stamp;
    ros::Time time_old = old_imu_data.header.stamp;
    double diff_time = (time_new - time_old).toSec();
    //ROS_INFO("diff time %f",diff_time);
    twist_msg.linear.x = old_msg.linear.x+(new_imu_data.linear_acceleration.x) * diff_time;
    twist_msg.linear.y = old_msg.linear.y+(new_imu_data.linear_acceleration.y) * diff_time;
    twist_msg.linear.z = 0;
    old_msg=twist_msg;
    //ROS_INFO("Publiquei");
    pub.publish(twist_msg);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "imu_odom");
    ros::NodeHandle nh;
    ros::Subscriber sub;
    // ROS_INFO("OLA");
    sub = nh.subscribe("/imu/data", 1, callback);
    pub = nh.advertise<geometry_msgs::Twist>("/vel_estimate", 1);

    nh.param<float>("/freq", freq, 10);

    ros::Rate rate(100);

    while(ros::ok())
    {
        ros::spinOnce();
        rate.sleep();
    }
}
