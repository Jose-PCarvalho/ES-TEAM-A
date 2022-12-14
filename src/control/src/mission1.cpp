#include <iostream>
#include <string.h>

#include <ros/ros.h>

#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Range.h>
#include <geometry_msgs/Point.h>

#define HEIGT 720
#define WIDTH 1280

int state = 0;
int center_threshold;
float lidar_threshold;
float lidar_dst;

float max_speed;

geometry_msgs::Point buoy_pos;
bool buoy_at_center = false;
bool there_is_buoy = false;

void callback_tracker (const geometry_msgs::PointConstPtr &msg)
{
    buoy_pos = *msg;

    ( ( buoy_pos.x  < WIDTH / 2 + center_threshold ) &&  ( buoy_pos.x  > WIDTH / 2 - center_threshold ) ) ? buoy_at_center=true : buoy_at_center=false;

    if ((buoy_pos.x > WIDTH) ||
        (buoy_pos.x < WIDTH) ||
        (buoy_pos.y > HEIGT) ||
        (buoy_pos.y < WIDTH) )
        there_is_buoy = false;
}

void callback_lidar (const sensor_msgs::RangeConstPtr &msg)
{
    lidar_dst = msg->range;
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "teste");
    ros::NodeHandle nh;

    nh.param<int>("/center_treshold", center_threshold, 20);
    nh.param<float>("/lidar_treshold", lidar_threshold, 0.20);
    nh.param<float>("/max_speed", max_speed, 20);

    ros::Subscriber lidar_sub, tracker_sub;
    lidar_sub = nh.subscribe("/", 1, callback_lidar);
    tracker_sub = nh.subscribe("/tracker", 1, callback_tracker);

    ros::Publisher pub;
    nh.advertise<geometry_msgs::Twist>("/cmd_vel", 1);

    ros::Rate rate(10);

    geometry_msgs::Twist cmd_vel;

    while (ros::ok())
    {
        ros::spinOnce();

        // transições
        switch (state)
        {  
            case 0: // a procura da boia
            {
                if (buoy_at_center == true)
                    state = 1;
            }
            case 1: // aproxima suficiente da boia
            {
                if (buoy_at_center == false)
                    state = 0;

                if (lidar_dst < lidar_threshold)
                {
                    state = 2;
                }
            }
            case 2: // roda ate encontrar boia
            {
                if (there_is_buoy == false)
                {
                    state = 0;
                }
            } 

            default:
                ;
        }

        // ações
        switch (state)
        {
            case 0:
            {
                cmd_vel.linear.x = 0;
                cmd_vel.angular.x = max_speed;
            }
            case 1:
            {
                cmd_vel.linear.x = max_speed;
                cmd_vel.angular.x = 0;
            }
            case 2:
            {
                cmd_vel.linear.x = 0;
                cmd_vel.angular.x = 0;
            }
            default:
            {
                cmd_vel.linear.x = 0;
                cmd_vel.angular.x = 0; 
            }
        }

        pub.publish(cmd_vel);
        
        rate.sleep();
    }
}