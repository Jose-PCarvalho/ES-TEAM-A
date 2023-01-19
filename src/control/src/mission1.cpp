#include <iostream>
#include <string.h>
#include <stdlib.h>
#include <ros/ros.h>

#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Range.h>
#include <geometry_msgs/Point.h>
#include <std_msgs/Int8.h>

#define HEIGT 308
#define WIDTH 410

int state = 0;
int center_threshold;
float lidar_threshold_low;
float lidar_threshold_high;
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

    nh.param<int>("/center_treshold", center_threshold, 200);
    nh.param<float>("/lidar_treshold_low", lidar_threshold_low, 0.50);
    nh.param<float>("/lidar_treshold_high", lidar_threshold_high, 1.50);
    nh.param<float>("/max_speed", max_speed, 15);

    //max_speed = 15;

    ros::Subscriber lidar_sub, tracker_sub;
    ROS_INFO("so far so good");
    
    lidar_sub = nh.subscribe("/tfmini_ros_node/TFmini", 1, callback_lidar);
    tracker_sub = nh.subscribe("/vision/point", 1, callback_tracker);

    ros::Publisher pub, state_pub;
    state_pub = nh.advertise<std_msgs::Int8>("/mission/state",1);
    pub = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 1);

    ros::Rate rate(30);

    geometry_msgs::Twist cmd_vel;
    std_msgs::Int8 state_msg;

    while (ros::ok())
    {
        ros::spinOnce();

        //ROS_INFO("state: %d", state);
        

        // transições
        switch (state)
        {  
            case 0: // a procura da boia
            {
                if (buoy_at_center == true)
                    state = 1;

                break;
            }
            case 1: // enquadra com a boia
            {
                if (buoy_at_center == false)
                    state = 0;

                if (abs(WIDTH/2-buoy_pos.x)<center_threshold/3)
                {
                    state = 2;
                }
                break;
            }
            case 2: // aproxima da boia
            {
                if (buoy_at_center == false)
                    state = 0;

                if (lidar_dst < lidar_threshold_low)
                {
                    state = 3;
                }
                break;
            }
            case 3: // anda de marcha atras
            {
                if (lidar_dst > lidar_threshold_high || buoy_at_center==false)
                {
                    state = 0;
                }
                break;
            } 

            default:
                break;
        }

        // ações
        switch (state)
        {
            case 0:
            {
                cmd_vel.linear.x = 0;
                cmd_vel.angular.x = max_speed/2;
                break;
            }
            case 1:
            { 
                cmd_vel.linear.x =0;
                cmd_vel.angular.x = -(WIDTH/2-buoy_pos.x)*max_speed/center_threshold/2;
                break;
            }
            case 2:
            {
                cmd_vel.linear.x = max_speed/2;
                cmd_vel.angular.x = -(WIDTH/2-buoy_pos.x)*max_speed/center_threshold*2/3;
                break;
            }
            case 3:
            {
                cmd_vel.linear.x = -max_speed/1.5;
                cmd_vel.angular.x = -(WIDTH/2-buoy_pos.x)*max_speed/center_threshold*2/3;
                break;
            }
            default:
            {
                cmd_vel.linear.x = 0;
                cmd_vel.angular.x = 0; 
                break;
            }
        }

        state_msg.data = state;
        state_pub.publish(state_msg);

        //ROS_WARN("\n\nlin: %f ang %f",cmd_vel.linear.x, cmd_vel.angular.x);
        
        pub.publish(cmd_vel);
        
        rate.sleep();
    }
}