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

int LEFT=150, RIGHT=150; 
//ros::Publisher pub;
bool debug;
ros::ServiceClient client_init, client_set ;

//motor_ctrl::speeds msg;

void on_trackbar( int, void* )
{
    motor_ctrl::set_motors srv;

    

    srv.request.left = LEFT;
    srv.request.right = RIGHT;

    //std::string left, right;
    // std::stringstream left_ss, right_ss;
    // left_ss << "echo ubuntu | sudo -S gpio pwm 1 " << LEFT;
    // right_ss << "echo ubuntu | sudo -S gpio pwm 23 " << RIGHT;

    // std::string left, right;

    // left = left_ss.str();
    // right = right_ss.str();

    // char left_c[left.length()+1]; 
    // char right_c[right.length()+1]; 

    // strcpy(left_c,left.c_str());
    // strcpy(right_c,right.c_str() );

    // std::system(left_c);
    // std::system(right_c);

    if (client_set.call(srv))
    {
      ROS_INFO("Sucess call");
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

    cv::createTrackbar( "Left", trackbarWindowName, &LEFT, 190, on_trackbar );
    cv::createTrackbar( "Right", trackbarWindowName, &RIGHT, 190, on_trackbar );

    cv::waitKey(0);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "teste");
    ros::NodeHandle nh;
  
    client_init = nh.serviceClient<motor_ctrl::init_motors>("init_motors");
    client_set = nh.serviceClient<motor_ctrl::set_motors>("set_motors");

    // ROS_INFO("Initing motors");

    // std::system("echo ubuntu | sudo -S gpio mode 1 pwm ");
    // std::system("echo ubuntu | sudo -S gpio mode 23 pwm ");
    // std::system("echo ubuntu | sudo -S gpio pwm-ms");
    // std::system("echo ubuntu | sudo -S gpio pwmr 2000");
    // std::system("echo ubuntu | sudo -S gpio pwmc 192");
    // std::system("echo ubuntu | sudo -S gpio pwm 1 150");
    // std::system("echo ubuntu | sudo -S gpio pwm 23 150");
    // sleep(5);

    // ROS_INFO("Motors Online");

    //motor_ctrl::init_motors srv;
    //srv.request.req = true;

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