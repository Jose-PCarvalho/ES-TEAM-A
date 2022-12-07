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

#include "motor_ctrl/speeds.h"
#include "motor_ctrl/init_motors.h"
#include "motor_ctrl/set_motors.h"

#include <cstdlib>

int LEFT=0, RIGHT=0; 
//ros::Publisher pub;
bool debug;
ros::ServiceClient client_init, client_set ;

//motor_ctrl::speeds msg;

void on_trackbar( int, void* )
{
    motor_ctrl::set_motors srv;

    //msg.left = LEFT;
    //msg.right = RIGHT;

    srv.request.left = LEFT;
    srv.request.right = RIGHT;

    if (client_set.call(srv))
    {
      ROS_INFO("Init sucess");
    }
    else
    {
      ROS_ERROR("Failed to set motor speeds");
    }

    //pub.publish(msg);
}

void createTrackbars()
{
    ROS_WARN("Creating Trackbars");
    const std::string trackbarWindowName = "Trackbars";
    cv::namedWindow(trackbarWindowName,cv::WINDOW_AUTOSIZE);
	char TrackbarName[50];

    cv::createTrackbar( "Left", trackbarWindowName, &LEFT, 100, on_trackbar );
    cv::createTrackbar( "Right", trackbarWindowName, &RIGHT, 100, on_trackbar );

    cv::waitKey(0);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "teste");
    ros::NodeHandle nh;
  
    client_init = nh.serviceClient<motor_ctrl::init_motors>("init_motors");
    client_set = nh.serviceClient<motor_ctrl::set_motors>("set_motors");
    motor_ctrl::init_motors srv;
    srv.request.req = true;

    // if (client_init.call(srv))
    // {
    //   ROS_INFO("Init sucess");
    // }
    // else
    // {
    //   ROS_ERROR("Failed to call service init_motors");
    //   return 1;
    // }

    // ros::Subscriber sub;
    // pub = nh.advertise<motor_ctrl::speeds>("/speeds", 1);

    createTrackbars();

    return 0;
}