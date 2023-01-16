// #include <iostream>
// #include <string.h>

// #include <opencv2/opencv.hpp>
// #include <opencv2/highgui.hpp>
// #include <opencv2/videoio.hpp>
// #include <opencv2/imgcodecs.hpp>

// #include <ros/ros.h>
// #include <sensor_msgs/Image.h>
// #include <sensor_msgs/CompressedImage.h>
// #include <geometry_msgs/Point.h>
// #include <cv_bridge/cv_bridge.h>
// #include <image_transport/image_transport.h>

// cv::Mat img;
// bool got_img = false;
// bool got_track = false;
// bool got_detec = false;
// int n_frame = 0;
// int track_x=-999, track_y, detect_x=-999, detect_y;

// void track_cb (const geometry_msgs::PointConstPtr& msg)
// {
//     track_x = msg->x;
//     track_y = msg->y;

//     got_track = true;

// }

// void detect_cb (const geometry_msgs::PointConstPtr& msg)
// {
//     detect_x = msg->x;
//     detect_y = msg->y;

//     got_detec = true;
// }

// void video_cb (const sensor_msgs::CompressedImageConstPtr& msg)
// {
//     cv_bridge::CvImagePtr cam;

//     cv_bridge::CvImagePtr teste;

//     try
//     {
//         cam = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
//     }
//     catch (cv_bridge::Exception& e)
//     {
//         ROS_ERROR("cv_bridge exception: %s", e.what());
//         return;
//     }

//     img = cam->image;

//     got_img = true;

//     //ROS_WARN("got img point");
// }

// int main(int argc, char** argv)
// {
//     ros::init(argc, argv, "vision_display");
//     ros::NodeHandle nh;
  
//     ros::Subscriber sub_video, sub_track, sub_detect;
    
//     ros::Publisher pub;
//     pub = nh.advertise<sensor_msgs::Image>("/vision/final", 1);

//     sub_video = nh.subscribe("/raspicam_node/image/compressed",1,video_cb);
//     sub_track = nh.subscribe("/vision/tracker",1,track_cb);
//     sub_detect = nh.subscribe("/vision/point",1,detect_cb);

//     while (ros::ok)
//     {
//         //if (img.channels() == 3)
//         if (got_img && got_detec && got_track)
//         {
//             got_img = false;
//             got_track = false;
//             got_detec = false;

//             cv::Point2d pt_track(track_x,track_y);
//             cv::Point2d pt_detect(detect_x,detect_y);
//             cv::circle(img, pt_track, 5, cv::Vec3b(0,255,0),2);
//             cv::circle(img, pt_detect, 5, cv::Vec3b(255,0,0),2);

//             cv::putText(img, "Detect",cv::Point(pt_detect.x + 10, pt_detect.y), cv::FONT_HERSHEY_DUPLEX, 1.0, CV_RGB(0, 0, 255), 1);
//             cv::putText(img, "Track",cv::Point(pt_track.x + 10, pt_track.y -50), cv::FONT_HERSHEY_DUPLEX, 1.0, CV_RGB(0, 255, 0), 1);

//             cv::Mat small;
//             float scale_down = 0.5;
//             cv::resize(img,small, cv::Size(),scale_down,scale_down, cv::INTER_LINEAR);

//             cv_bridge::CvImagePtr img_bridge(new cv_bridge::CvImage);

//             img_bridge->encoding = "bgr8";
//             img_bridge->image = img;

//             pub.publish(img_bridge->toImageMsg());     
//         }  
        
//         ros::spinOnce();
//     }
//     return 0;
// }   

#include <iostream>
#include <string.h>

#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/imgcodecs.hpp>

#include <ros/ros.h>
//#include <sensor_msgs/Image.h>
#include <sensor_msgs/CompressedImage.h>
#include <geometry_msgs/Point.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>

cv::Mat img;
bool got_img = false;
bool got_track = false;
bool got_detec = false;
int n_frame = 0;
int track_x=-999, track_y, detect_x=-999, detect_y;

void track_cb (const geometry_msgs::PointConstPtr& msg)
{
    track_x = msg->x;
    track_y = msg->y;

    got_track = true;


    //ROS_WARN("got track point %f %f",  track_x, track_y);
}

void detect_cb (const geometry_msgs::PointConstPtr& msg)
{
    detect_x = msg->x;
    detect_y = msg->y;

    got_detec = true;

    //ROS_WARN("got detect point %d", msg->z);
}

void video_cb (const sensor_msgs::CompressedImageConstPtr& msg)
{
    cv_bridge::CvImagePtr cam;

    try
    {
        cam = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }

    img = cam->image;

    got_img = true;
}

int main(int argc, char** argv)
{
    ROS_WARN("showing kalman tracker result");

    ros::init(argc, argv, "vision_display");
    ros::NodeHandle nh;
  
    ros::Subscriber sub_video, sub_track, sub_detect;

    sub_video = nh.subscribe("/raspicam_node/image/compressed",1,video_cb);
    sub_track = nh.subscribe("/vision/tracker",1,track_cb);
    sub_detect = nh.subscribe("/vision/point",1,detect_cb);

    while (ros::ok)
    {
        //if (img.channels() == 3)
        if (got_img )
        {
            if (got_track)
            {
                cv::Point2d pt_track(track_x,track_y);
                cv::circle(img, pt_track, 5, cv::Vec3b(0,255,0),2);
                cv::putText(img, "Track",cv::Point(pt_track.x + 10, pt_track.y -50), cv::FONT_HERSHEY_DUPLEX, 0.5, CV_RGB(0, 255, 0), 1);
            }
            
            if (got_detec)
            {
                cv::Point2d pt_detect(detect_x,detect_y);
                cv::circle(img, pt_detect, 5, cv::Vec3b(255,0,0),2);
                cv::putText(img, "Detect",cv::Point(pt_detect.x + 10, pt_detect.y), cv::FONT_HERSHEY_DUPLEX, 0.5, CV_RGB(0, 0, 255), 1);
            }

            // cv_bridge::CvImagePtr img_bridge(new cv_bridge::CvImage);
            // img_bridge->encoding = "bgr8";
            // img_bridge->image = img;
            // pub.publish(img_bridge->toImageMsg());
            cv::imshow("tracker", img);
            cv::waitKey(1);
            
            got_img = false;
            got_track = false;
            got_detec = false;
     
        }  
        
        ros::spinOnce();
    }
    return 0;
}   