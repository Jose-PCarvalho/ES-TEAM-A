// #include <iostream>
// #include <string.h>
// #include <fstream>

// #include <opencv2/opencv.hpp>
// #include <opencv2/highgui.hpp>
// #include <opencv2/videoio.hpp>
// #include <opencv2/imgcodecs.hpp>

// #include <ros/ros.h>
// #include <ros/package.h>
// #include <sensor_msgs/Image.h>
// #include <cv_bridge/cv_bridge.h>
// #include <image_transport/image_transport.h>

// #include "vision_module/seg_params.h"

// int H_MIN=0, H_MAX=255, S_MIN=0, S_MAX=255, V_MIN=0, V_MAX=255; 
// ros::Publisher pub;
// bool debug;

// vision_module::seg_params msg;

// void on_trackbar( int, void* )
// {
//     msg.H_MIN = H_MIN;
//     msg.H_MAX = H_MAX;
//     msg.S_MIN = S_MIN;
//     msg.S_MAX = S_MAX;
//     msg.V_MIN = V_MIN;
//     msg.V_MAX = V_MAX;

//     pub.publish(msg);
// }

// void createTrackbars()
// {
//     ROS_WARN("Creating Trackbars");
//     const std::string trackbarWindowName = "Trackbars";
//     cv::namedWindow(trackbarWindowName,cv::WINDOW_AUTOSIZE);
// 	char TrackbarName[50];

//     cv::createTrackbar( "H_MIN", trackbarWindowName, &H_MIN, 254, on_trackbar );
//     cv::createTrackbar( "H_MAX", trackbarWindowName, &H_MAX, 255, on_trackbar );
//     cv::createTrackbar( "S_MIN", trackbarWindowName, &S_MIN, 254, on_trackbar );
//     cv::createTrackbar( "S_MAX", trackbarWindowName, &S_MAX, 255, on_trackbar );
//     cv::createTrackbar( "V_MIN", trackbarWindowName, &V_MIN, 254, on_trackbar );
//     cv::createTrackbar( "V_MAX", trackbarWindowName, &V_MAX, 255, on_trackbar );

//     cv::waitKey(0);
// }

// int main(int argc, char** argv)
// {
//     ros::init(argc, argv, "vision_module_segment");
//     ros::NodeHandle nh;
  
//     ros::Subscriber sub;
//     pub = nh.advertise<vision_module::seg_params>("/vision_module/seg_params", 1);

//     nh.param<bool>("/debug", debug, "False");
//     nh.param<int>("/H_MIN", H_MIN, 0);
//     nh.param<int>("/H_MAX", H_MAX, 255);
//     nh.param<int>("/S_MIN", S_MIN, 0);
//     nh.param<int>("/S_MAX", S_MAX, 255);
//     nh.param<int>("/V_MIN", V_MIN, 0);
//     nh.param<int>("/V_MAX", V_MAX, 255);

//     createTrackbars();

//     std::string path = ros::package::getPath("vision_module");
//     std::string full_path = path + "/cfg/hsv_params.yaml";
//     std::ofstream f (full_path);

//     f << "H_MIN: " << H_MIN << "\n";
//     f << "H_MAX: " << H_MAX << "\n";
//     f << "S_MIN: " << S_MIN << "\n";
//     f << "S_MAX: " << S_MAX << "\n";
//     f << "V_MIN: " << V_MIN << "\n";
//     f << "V_MAX: " << V_MAX;

//     f.close();

//     return 0;
// }


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

#include "vision_module/seg_params.h"

int H_MIN=0, H_MAX=255, S_MIN=0, S_MAX=255, V_MIN=0, V_MAX=255; 
ros::Publisher pub;
bool debug;

vision_module::seg_params msg;

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
    cv::createTrackbar( "V_MIN", trackbarWindowName, &V_MIN, 254, on_trackbar );
    cv::createTrackbar( "V_MAX", trackbarWindowName, &V_MAX, 255, on_trackbar );

    cv::waitKey(0);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "vision_module_segment");
    ros::NodeHandle nh;
  
    ros::Subscriber sub;
    pub = nh.advertise<vision_module::seg_params>("/vision/seg_params", 1);

    nh.param<bool>("/debug", debug, "False");
    nh.param<int>("/H_MIN", H_MIN, 0);
    nh.param<int>("/H_MAX", H_MAX, 255);
    nh.param<int>("/S_MIN", S_MIN, 0);
    nh.param<int>("/S_MAX", S_MAX, 255);
    nh.param<int>("/V_MIN", V_MIN, 0);
    nh.param<int>("/V_MAX", V_MAX, 255);

    createTrackbars();

    std::string path = ros::package::getPath("vision_module");
    std::string full_path = path + "/cfg/hsv_params.yaml";
    std::ofstream f (full_path);

    f << "H_MIN: " << H_MIN << "\n";
    f << "H_MAX: " << H_MAX << "\n";
    f << "S_MIN: " << S_MIN << "\n";
    f << "S_MAX: " << S_MAX << "\n";
    f << "V_MIN: " << V_MIN << "\n";
    f << "V_MAX: " << V_MAX;

    f.close();

    return 0;
}