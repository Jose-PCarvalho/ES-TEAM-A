#include <iostream>
#include <string.h>
#include <fstream>

#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/imgcodecs.hpp>

#include <ros/ros.h>
#include <ros/package.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>

#include "motor_ctrl/set_motors.h"

#include <cstdlib>

int LEFT=150, RIGHT=150; 

bool debug;
ros::ServiceClient client_set ;

void on_trackbar( int, void* )
{
    motor_ctrl::set_motors srv;

    srv.request.left = LEFT;
    srv.request.right = RIGHT;

    if (client_set.call(srv))
    {
      ROS_INFO("Sucess call");
    }
    else
    {
      ROS_ERROR("Failed to set motor speeds");
    }
}

void createTrackbars()
{
    ROS_WARN("Creating Trackbars");
    const std::string trackbarWindowName = "Trackbars";
    cv::namedWindow(trackbarWindowName,cv::WINDOW_AUTOSIZE);
	  char TrackbarName[50];

    cv::createTrackbar( "Left", trackbarWindowName, &LEFT, 190, on_trackbar );
    cv::createTrackbar( "Right", trackbarWindowName, &RIGHT, 190, on_trackbar );

    cv::waitKey(0);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "teste");
    ros::NodeHandle nh;
  
    client_set = nh.serviceClient<motor_ctrl::set_motors>("set_motors");

    createTrackbars();

    motor_ctrl::set_motors srv;

    srv.request.left = 150;
    srv.request.right = 150;

    if (client_set.call(srv))
    {
      ROS_INFO("Sucess call");
    }
    else
    {
      ROS_ERROR("Failed to set motor speeds");
    }

    std::system("echo ubuntu | sudo -S gpio pwm 1 150");
    std::system("echo ubuntu | sudo -S gpio pwm 23 150");

    return 0;
}