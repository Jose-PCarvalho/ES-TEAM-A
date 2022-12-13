#include <ros/ros.h>
#include <iostream>
#include <sensor_msgs/Imu.h>

sensor_msgs::Imu new_imu_data, old_imu_data;
bool first_run = true;

void callback (sensor_msgs::ImuConstPtr &msg)
{
    if (first_run)
    {
        new_imu_data = *msg;
        first_run = false;
        return;
    }
    

}

int main(int argc, char** argv)
{
    /*ros::init(argc, argv, "imu_odom");
    ros::NodeHandle nh;
    ros::Subscriber sub;
    sub = nh.subscribe("/imu_data", 1, callback);

    ros::Rate rate(10);

    while(ros::ok())
    {
        ros::spinOnce();
        rate.sleep();
    }*/
}
