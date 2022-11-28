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

int H_MIN=0, H_MAX=255, S_MIN=0, S_MAX=255, V_MIN=0, V_MAX=255; 
ros::Publisher pub;
bool debug;

es_vision::seg_params msg;

void on_trackbar( int, void* )
{
    msg.H_MIN = H_MIN;
    msg.H_MAX = H_MAX;
    msg.S_MIN = S_MIN;
    msg.S_MAX = S_MAX;
    msg.V_MIN = V_MIN;
    msg.V_MAX = V_MAX;

    pub.publish(msg);
}

void createTrackbars()
{
    ROS_WARN("Creating Trackbars");
    const std::string trackbarWindowName = "Trackbars";
    cv::namedWindow(trackbarWindowName,cv::WINDOW_AUTOSIZE);
	char TrackbarName[50];

    cv::createTrackbar( "H_MIN", trackbarWindowName, &H_MIN, 254, on_trackbar );
    cv::createTrackbar( "H_MAX", trackbarWindowName, &H_MAX, 255, on_trackbar );
    cv::createTrackbar( "S_MIN", trackbarWindowName, &S_MIN, 254, on_trackbar );
    cv::createTrackbar( "S_MAX", trackbarWindowName, &S_MAX, 255, on_trackbar );
    cv::createTrackbar( "V_MIN", trackbarWindowName, &V_MIN, 255, on_trackbar );
    cv::createTrackbar( "V_MAX", trackbarWindowName, &V_MAX, 254, on_trackbar );

    cv::waitKey(0);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "segment");
    ros::NodeHandle nh;
    
    ros::Subscriber sub;
    pub = nh.advertise<es_vision::seg_params>("/seg_params", 1);

    nh.param<bool>("/debug", debug, "False");
    nh.param<int>("/H_MIN", H_MIN, 0);
    nh.param<int>("/H_MAX", H_MAX, 255);
    nh.param<int>("/S_MIN", H_MIN, 0);
    nh.param<int>("/S_MAX", H_MIN, 255);
    nh.param<int>("/V_MIN", H_MIN, 0);
    nh.param<int>("/V_MAX", H_MIN, 255);

    createTrackbars();

    return 0;
}