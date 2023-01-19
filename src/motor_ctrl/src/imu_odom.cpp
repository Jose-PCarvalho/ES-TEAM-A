#include <ros/ros.h>
#include <iostream>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Imu.h>

sensor_msgs::Imu new_imu_data, old_imu_data;
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

    twist_msg.linear.x = (new_imu_data.linear_acceleration.x - old_imu_data.linear_acceleration.x) / freq;
    twist_msg.linear.y = (new_imu_data.linear_acceleration.y - old_imu_data.linear_acceleration.y) / freq;
    twist_msg.linear.z = (new_imu_data.linear_acceleration.z - old_imu_data.linear_acceleration.z) / freq;

    pub.publish(twist_msg);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "imu_odom");
    ros::NodeHandle nh;
    ros::Subscriber sub;
    sub = nh.subscribe("/imu_data", 1, callback);
    pub = nh.advertise<geometry_msgs::Twist>("/vel_estimate", 1);

    nh.param<float>("/freq", freq, 10);

    ros::Rate rate(10);

    while(ros::ok())
    {
        ros::spinOnce();
        rate.sleep();
    }
}
