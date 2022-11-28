#include <iostream>
#include <string.h>

#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/imgcodecs.hpp>

#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>

#include "es_vision/seg_params.h"

int H_MIN, H_MAX, S_MIN, S_MAX, V_MIN, V_MAX; 
int H_MIN_old, H_MAX_old, S_MIN_old, S_MAX_old, V_MIN_old, V_MAX_old; 
ros::Publisher pub;
bool debug;
cv::Mat img, mask,mask_small;
float scale_down = 0.5;

bool param_update()
{
    if (H_MAX_old != H_MAX)
    {
        H_MAX_old = H_MAX;
        return true;
    }

    if (H_MIN_old != H_MIN)
    {
        H_MIN_old = H_MIN;
        return true;
    }

    if (S_MAX_old != S_MAX)
    {
        S_MAX_old = S_MAX;
        return true;
    }

    if (S_MIN_old != S_MIN)
    {
        S_MIN_old = S_MIN;
        return true;
    }

    if (V_MAX_old != V_MAX)
    {
        V_MAX_old = V_MAX;
        return true;
    }

    if (V_MAX_old != V_MAX)
    {
        V_MAX_old = V_MAX;
        return true;
    }
    return false;
}

void update_params (const es_vision::seg_paramsConstPtr msg)
{
    H_MIN = msg->H_MIN;
    H_MAX = msg->H_MAX;
    S_MIN = msg->S_MIN;
    S_MAX = msg->S_MAX;
    V_MIN = msg->V_MIN;
    V_MAX = msg->V_MAX;
}

void callback (const sensor_msgs::ImageConstPtr& cam_msg)
{
    cv_bridge::CvImagePtr cam, res;
    sensor_msgs::ImagePtr out_msg;

    cv_bridge::CvImagePtr teste;

    try
    {
        cam = cv_bridge::toCvCopy(cam_msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }
    
    cv::cvtColor(cam->image,img, cv::COLOR_RGB2HSV);
    cv::inRange(img, cv::Scalar(H_MIN, S_MIN, V_MIN), cv::Scalar(H_MAX, S_MAX, V_MAX), mask);
    cv::resize(mask,mask_small, cv::Size(),scale_down,scale_down, cv::INTER_LINEAR);
    cv::imshow("mask",mask_small);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "segment");
    ros::NodeHandle nh;
  
    ros::Subscriber sub, sub_params;
    pub = nh.advertise<sensor_msgs::Image>("/mask", 1);
    sub = nh.subscribe("/video_raw", 1, callback);

    cv_bridge::CvImagePtr cv_ptr(new cv_bridge::CvImage);

    nh.param<bool>("/debug", debug, "False");
    nh.param<int>("/H_MIN", H_MIN, 0);
    nh.param<int>("/H_MAX", H_MAX, 255);
    nh.param<int>("/S_MIN", S_MIN, 0);
    nh.param<int>("/S_MAX", S_MAX, 255);
    nh.param<int>("/V_MIN", V_MIN, 0);
    nh.param<int>("/V_MAX", V_MAX, 255);

    if (debug)
        sub_params = nh.subscribe("/seg_params",1,update_params);

    while (ros::ok())
    {
        ros::spinOnce();
        
        cv::waitKey(1);

        if (img.channels() == 3)
        {
            if (debug)
            {
                ROS_INFO("\n\nUsing these parameters:");
                ROS_INFO("\nH_MIN: %d",H_MIN);
                ROS_INFO("\nH_MAX: %d",H_MAX);
                ROS_INFO("\nS_MIN: %d",S_MIN);
                ROS_INFO("\nS_MAX: %d",S_MAX);
                ROS_INFO("\nV_MIN: %d",V_MIN);
                ROS_INFO("\nV_MAX: %d",V_MAX);
            }

            if (param_update())
            {
                cv::destroyWindow("mask");
                cv::inRange(img, cv::Scalar(H_MIN, S_MIN, V_MIN), cv::Scalar(H_MAX, S_MAX, V_MAX), mask);
                cv::resize(mask,mask_small, cv::Size(),scale_down,scale_down, cv::INTER_LINEAR);
                cv::imshow("mask",mask_small);
            }

            cv_ptr->encoding = "MONO8";
            cv_ptr->header.frame_id = "/mask";
            cv_ptr->image = mask;

            pub.publish(cv_ptr->toImageMsg());          
            
        }
        
    }

    return 0;
}