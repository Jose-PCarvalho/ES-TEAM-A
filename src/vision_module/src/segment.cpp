#include <iostream>
#include <string.h>

#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/imgcodecs.hpp>

#include <numeric>

#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/CompressedImage.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <geometry_msgs/Point.h>
#include <std_msgs/Float32.h>

#include "vision_module/seg_params.h"

int H_MIN, H_MAX, S_MIN, S_MAX, V_MIN, V_MAX; 
int H_MIN_old, H_MAX_old, S_MIN_old, S_MAX_old, V_MIN_old, V_MAX_old; 
int kernel_size;
std::string debug_raw;
ros::Publisher pub, area_pub, mask_pub, contours_pub;
bool debug;
cv::Mat img, mask,mask_small,hsv, contours, ccomps, contours_small, original;
float scale_down = 0.5;
bool checked_params = false;
int frame_n = 0;
int detected_frames = 0;
std::vector <float> area;

void eval_debug ()
{
    if ((debug_raw == "True") || (debug_raw == "true"))
        debug = true;
    else
        debug = false;
}

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

void update_params (const vision_module::seg_paramsConstPtr msg)
{
    H_MIN = msg->H_MIN;
    H_MAX = msg->H_MAX;
    S_MIN = msg->S_MIN;
    S_MAX = msg->S_MAX;
    V_MIN = msg->V_MIN;
    V_MAX = msg->V_MAX;

    checked_params = true;
}

void update_image_cont()
{
    //ROS_INFO(" update contours");

    cv::inRange(hsv, cv::Scalar(H_MIN, S_MIN, V_MIN), cv::Scalar(H_MAX, S_MAX, V_MAX), mask);

    cv::blur(hsv,hsv, cv::Size(11,11));

    cv::Mat kernel = cv::Mat::ones(kernel_size,kernel_size, CV_8U);
    cv::dilate(mask, img, kernel);
    cv::erode(img,contours,kernel);

    cv::Mat canny_output;
    float thresh = 1.5;
    cv::Canny( contours, canny_output, thresh, thresh*2, 3 );
    std::vector<std::vector<cv::Point> > cont;
    cv::findContours( canny_output, cont, cv::RETR_TREE, cv::CHAIN_APPROX_SIMPLE );    
    std::vector<cv::Moments> mu(cont.size() );
    for( size_t i = 0; i < cont.size(); i++ )
    {
        mu[i] = moments( cont[i] );
    }
    std::vector<cv::Point2f> mc( cont.size() );
    for( size_t i = 0; i < cont.size(); i++ )
    {
        mc[i] = cv::Point2f( static_cast<float>(mu[i].m10 / (mu[i].m00 + 1e-5)), static_cast<float>(mu[i].m01 / (mu[i].m00 + 1e-5)) );
    }
    
    cv::Moments m = cv::moments(contours, true);
    cv::Point p(m.m10/m.m00, m.m01/m.m00);
    area.push_back(m.m00);

    std_msgs::Float32 area_msg;
    area_msg.data = std::accumulate(area.begin(), area.end(), 0 ) / area.size();
    area_pub.publish(area_msg);
    area.clear();
    
    geometry_msgs::Point pt_msg;
    pt_msg.x = (float)p.x;
    pt_msg.y = (float)p.y;
    pt_msg.z = (float)frame_n;
    
    pub.publish(pt_msg);

    if (debug)
    {
        //ROS_INFO("mostrar");
        
        //cv_bridge::CvImagePtr mask_ptr(new cv_bridge::CvImage); 
        //cv_bridge::CvImagePtr cont_ptr(new cv_bridge::CvImage); 

        //publishes frame
        //mask_ptr->image = img;
        //mask_ptr->encoding = "bgr8";
        //mask_pub.publish(mask_ptr->toImageMsg()); 

        cv::imshow("mask", img);
        

        //publishes frame
        cv::Mat drawing = cv::Mat::zeros( canny_output.size(), CV_8UC3 );
        for( size_t i = 0; i< cont.size(); i++ )
        {
            cv::Scalar color = cv::Scalar(0, 255, 0 );
            cv::drawContours( drawing, cont, (int)i, color, 2 );
        }

        cv::Scalar color = cv::Scalar(0, 255, 0 );
        cv::circle( drawing, cv::Point(p.x,p.y), 4, color, -1 );
        //cont_ptr->image = drawing;
        //cont_ptr->encoding = "bgr8";
        //contours_pub.publish(cont_ptr->toCompressedImageMsg()); 

        cv::imshow("contours", drawing);
        cv::waitKey(1);
    }
}

void callback (const sensor_msgs::CompressedImageConstPtr& cam_msg)
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

    original = cam->image;
    cv::cvtColor(cam->image,hsv, cv::COLOR_RGB2HSV);
    
    frame_n++;

    update_image_cont();
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "segment");
    ros::NodeHandle nh;
  
    ros::Subscriber sub, sub_params;
    pub = nh.advertise<geometry_msgs::Point>("/vision/point", 1);
    area_pub = nh.advertise<std_msgs::Float32>("/vision/area", 1);

    nh.param<int>("/H_MIN", H_MIN, 0);
    nh.param<int>("/H_MAX", H_MAX, 255);
    nh.param<int>("/S_MIN", S_MIN, 0);
    nh.param<int>("/S_MAX", S_MAX, 255);
    nh.param<int>("/V_MIN", V_MIN, 0);
    nh.param<int>("/V_MAX", V_MAX, 255);

    nh.param<int>("/kernel_size", kernel_size, 3);

    nh.param<bool>("/debug", debug, "False");

    // if (debug)
    // {
    //     contours_pub = nh.advertise<sensor_msgs::Image>("/vision/contours", 1);
    //     mask_pub = nh.advertise<sensor_msgs::Image>("/vision/mask", 1);   
    // }
    //eval_debug();

    sub_params = nh.subscribe("/vision/seg_params",1,update_params);

    sub = nh.subscribe("/raspicam_node/image/compressed", 1, callback);    

    while (ros::ok())
    {
        if (hsv.channels() >= 3)
        {
            if (param_update())
            {
                update_image_cont();
            }           
        }

        ros::spinOnce();
    }

    return 0;
}

// #include <iostream>
// #include <string.h>

// #include <opencv2/opencv.hpp>
// #include <opencv2/highgui.hpp>
// #include <opencv2/videoio.hpp>
// #include <opencv2/imgcodecs.hpp>

// #include <numeric>

// #include <ros/ros.h>
// #include <sensor_msgs/Image.h>
// #include <sensor_msgs/CompressedImage.h>
// #include <cv_bridge/cv_bridge.h>
// #include <image_transport/image_transport.h>
// #include <geometry_msgs/Point.h>
// #include <std_msgs/Float32.h>

// #include "vision_module/seg_params.h"

// int H_MIN, H_MAX, S_MIN, S_MAX, V_MIN, V_MAX; 
// int H_MIN_old, H_MAX_old, S_MIN_old, S_MAX_old, V_MIN_old, V_MAX_old; 
// int kernel_size;
// std::string debug_raw;
// ros::Publisher pub, area_pub, mask_pub, contours_pub, drawing_pub;
// bool debug;
// cv::Mat img, mask,mask_small,hsv, contours, ccomps, contours_small, ccomps_small;
// float scale_down = 0.5;
// bool checked_params = false;
// int frame_n = 0;
// int detected_frames = 0;
// std::vector <float> area;

// void eval_debug ()
// {
//     if (debug)
//         ROS_INFO("debug mode is enabled");
//     else
//         ROS_INFO("debug mode is disabled");        
// }

// bool param_update()
// {
//     if (H_MAX_old != H_MAX)
//     {
//         H_MAX_old = H_MAX;
//         return true;
//     }

//     if (H_MIN_old != H_MIN)
//     {
//         H_MIN_old = H_MIN;
//         return true;
//     }

//     if (S_MAX_old != S_MAX)
//     {
//         S_MAX_old = S_MAX;
//         return true;
//     }

//     if (S_MIN_old != S_MIN)
//     {
//         S_MIN_old = S_MIN;
//         return true;
//     }

//     if (V_MAX_old != V_MAX)
//     {
//         V_MAX_old = V_MAX;
//         return true;
//     }

//     if (V_MAX_old != V_MAX)
//     {
//         V_MAX_old = V_MAX;
//         return true;
//     }
//     return false;
// }

// void update_params (const vision_module::seg_paramsConstPtr msg)
// {
//     H_MIN = msg->H_MIN;
//     H_MAX = msg->H_MAX;
//     S_MIN = msg->S_MIN;
//     S_MAX = msg->S_MAX;
//     V_MIN = msg->V_MIN;
//     V_MAX = msg->V_MAX;

//     checked_params = true;
// }

// void update_image_cont()
// {
//     cv::inRange(hsv, cv::Scalar(H_MIN, S_MIN, V_MIN), cv::Scalar(H_MAX, S_MAX, V_MAX), mask);
//     cv::blur(hsv,hsv, cv::Size(11,11));

//     cv::Mat kernel = cv::Mat::ones(kernel_size,kernel_size, CV_8U);
//     cv::dilate(mask, img, kernel);
//     cv::erode(img,contours,kernel);

//     cv::Mat canny_output;
//     float thresh = 1.5;
//     cv::Canny( contours, canny_output, thresh, thresh*2, 3 );
//     std::vector<std::vector<cv::Point> > cont;

//     cv::findContours( canny_output, cont, cv::RETR_TREE, cv::CHAIN_APPROX_SIMPLE );    
//     std::vector<cv::Moments> mu(cont.size() );
//     int count = 0;
//     int biggest_index=0;
//     double biggest_moment = 0;

//     for( size_t i = 0; i < cont.size(); i++ )
//     {
//         mu[i] = moments( cont[i] );
//         if (biggest_moment < mu[i].m00)
//         {
//             biggest_moment = mu[i].m00;
//             biggest_index = i;
//         }
//         count = i;
//     }

//     cv::Mat drawing = cv::Mat::zeros( canny_output.size(), CV_8UC3 );
    

//     if (cont.size() > 0)
//     {
//         //ROS_WARN("%d index", biggest_index);
//         double teste = mu[biggest_index].m10 ;
//         cv::Point mc;
//         mc = cv::Point2f( static_cast<float>(mu[biggest_index].m10) / static_cast<float>(mu[biggest_index].m00 + 1e-5), static_cast<float>(mu[biggest_index].m01 / (mu[biggest_index].m00 + 1e-5)) );
//         cv::Scalar color = cv::Scalar(0, 255, 0 );
//         cv::circle( drawing,mc, 4, color, -1 );

//         geometry_msgs::Point pt_msg;
//         //ROS_INFO("centro: %d %d",mc.x, mc.y);
        
//         pt_msg.x = mc.x;
//         pt_msg.y = mc.y;
//         pt_msg.z = frame_n;
//         pub.publish(pt_msg);
//     }

//     if (debug)
//     {
        
//         for( size_t i = 0; i< cont.size(); i++ )
//         {
//             cv::Scalar color = cv::Scalar(0, 255, 0 );
//             cv::drawContours( drawing, cont, (int)i, color, 2 );
//         }

//         cv_bridge::CvImagePtr mask_bridge(new cv_bridge::CvImage);
//         cv_bridge::CvImagePtr contours_bridge(new cv_bridge::CvImage);
//         cv_bridge::CvImagePtr drawing_bridge(new cv_bridge::CvImage);

//         mask_bridge->encoding = "mono8";
//         mask_bridge->image = mask;

//         contours_bridge->encoding = "mono8";
//         contours_bridge->image = mask;

//         contours_bridge->encoding = "bgr8";
//         contours_bridge->image = drawing;

//         mask_pub.publish(mask_bridge->toImageMsg());
//         contours_pub.publish(contours_bridge->toImageMsg());
//         drawing_pub.publish(drawing_bridge->toImageMsg());
//     }
// }

// void callback (const sensor_msgs::ImageConstPtr& cam_msg)
// {
//     cv_bridge::CvImagePtr cam, res;
//     sensor_msgs::ImagePtr out_msg;

//     try
//     {
//         cam = cv_bridge::toCvCopy(cam_msg, sensor_msgs::image_encodings::BGR8);
//     }
//     catch (cv_bridge::Exception& e)
//     {
//         ROS_ERROR("cv_bridge exception: %s", e.what());
//         return;
//     }

//     cv::cvtColor(cam->image,hsv, cv::COLOR_RGB2HSV);
    
//     frame_n++;

//     //update_image_ccomp();
//     update_image_cont();
// }

// int main(int argc, char** argv)
// {
//     ros::init(argc, argv, "vision_segment");
//     ros::NodeHandle nh;
  
//     ros::Subscriber sub, sub_params;
//     pub = nh.advertise<geometry_msgs::Point>("/vision/point", 1);
//     area_pub = nh.advertise<std_msgs::Float32>("/vision/area", 1);
//     contours_pub = nh.advertise<sensor_msgs::Image>("/vision/contours", 1);
//     mask_pub = nh.advertise<sensor_msgs::Image>("/vision/mask", 1);
//     drawing_pub = nh.advertise<sensor_msgs::Image>("/vision/mask", 1);

//     nh.param<int>("/H_MIN", H_MIN, 0);
//     nh.param<int>("/H_MAX", H_MAX, 255);
//     nh.param<int>("/S_MIN", S_MIN, 0);
//     nh.param<int>("/S_MAX", S_MAX, 255);
//     nh.param<int>("/V_MIN", V_MIN, 0);
//     nh.param<int>("/V_MAX", V_MAX, 255);

//     nh.param<int>("/kernel_size", kernel_size, 3);
//     ROS_INFO("kernel_size %d",kernel_size);
    
//     nh.param<bool>("/debug", debug, "false");
//     eval_debug();

//     sub_params = nh.subscribe("/vision_module/seg_params",1,update_params);

//     sub = nh.subscribe("/raspicam_node/image", 1, callback);    

//     while (ros::ok())
//     {
//         if (hsv.channels() >= 3)
//         {
//             // if (debug)
//             // {
//             //     ROS_INFO("\n\nUsing these parameters:");
//             //     ROS_INFO("\nH_MIN: %d",H_MIN);
//             //     ROS_INFO("\nH_MAX: %d",H_MAX);
//             //     ROS_INFO("\nS_MIN: %d",S_MIN);
//             //     ROS_INFO("\nS_MAX: %d",S_MAX);
//             //     ROS_INFO("\nV_MIN: %d",V_MIN);
//             //     ROS_INFO("\nV_MAX: %d",V_MAX);
//             // }

//             if (param_update())
//             {
//                 //update_image_ccomp(); 
//                 update_image_cont();
//             }           
//         }

//         ros::spinOnce();

//     }

//     return 0;
// }