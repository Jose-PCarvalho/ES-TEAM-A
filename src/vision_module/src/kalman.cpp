#include <iostream>
#include <string.h>

#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/video/video.hpp>

#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <geometry_msgs/Point.h>

ros::Publisher pub;
cv::Point2d pt, pt_old;

int old_frame = 0;
int frame_n = 0;
bool never_detected = true;

void callback (const geometry_msgs::PointConstPtr msg)
{
    pt_old = pt;
    frame_n = msg->z;
    pt.x = msg->x;
    pt.y = msg->y;
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "kalman");
    ros::NodeHandle nh;
  
    ros::Subscriber sub;

    pub = nh.advertise<geometry_msgs::Point>("/tracker", 1);

    sub = nh.subscribe("/point",1,callback);

    int stateSize = 4;
    int measSize = 2;
    int contrSize = 0;

    cv::KalmanFilter kf (stateSize, measSize, contrSize);

    cv::Mat state (stateSize, 1 , CV_32F); // [x, y, vx, vy]
    cv::Mat meas(measSize, 1, CV_32F); // [z_x, z_y]
    cv::setIdentity(kf.transitionMatrix);

    //Transition matrix A
    // [ 1 0 dT 0 ] x+1 = x + vx*dT
    // [ 0 1 0  dT] y+1 = y + vy*dT
    // [ 0 0 1  0 ] vx = vx
    // [ 0 0 0  1 ] vy = vy
    kf.measurementMatrix = cv::Mat::zeros(measSize, stateSize, CV_32F);
    kf.measurementMatrix.at<float>(0) = 1e-0f;
    kf.measurementMatrix.at<float>(5) = 1e-0f;
    kf.measurementMatrix.at<float>(10) = 1e-1f;
    kf.measurementMatrix.at<float>(15) = 1e-1f;

    //process covariance matrix Q
    // [Ex 0   0    0   ]
    // [0  Ey  0    0   ]
    // [0  0   Ev_x 0   ]
    // [0  0   0    Ev_y]
    kf.processNoiseCov = cv::Mat::zeros(stateSize, stateSize, CV_32F);
    kf.processNoiseCov.at<float>(0) = 1e-2;
    kf.processNoiseCov.at<float>(5) = 1e-2;
    kf.processNoiseCov.at<float>(10) = 5.0f;
    kf.processNoiseCov.at<float>(15) = 5.0f;

    //measurement covariance matrix R
    cv::setIdentity(kf.measurementNoiseCov, cv::Scalar(1e-2));

    int not_found = 0;
    bool found = false;
    float dT = (1.0/30.0);

    cv::Point2d center;

    while(ros::ok())
    {
        ros::spinOnce();       

        if (old_frame < frame_n)
        {
            // predict
            if (found)
            {   
                //mantem
                //kf.transitionMatrix.at<float>(0) = 1;
                //kf.transitionMatrix.at<float>(1) = 1;
                kf.transitionMatrix.at<float>(2) = 1;
                kf.transitionMatrix.at<float>(3) = 1;

                state = kf.predict();

                // cv::Point2d center;
                // center.x = state.at<float>(0);
                // center.y = state.at<float>(1);

                // //publica
                // geometry_msgs::Point msg;
                // msg.x = (int)center.x;
                // msg.y = (int)center.y;
                // msg.z = frame_n;

                // pub.publish(msg);

                
            }

            old_frame = frame_n;

            //update 
            if ((pt.x < 0) || (pt.y < 0)) //nao encontrou
            {
                not_found++;
                //found = false;
            }
            else
            {
                not_found = 0;

                meas.at<float>(0) = (float)pt.x;
                meas.at<float>(1) = (float)pt.y;
                if (! ((pt_old.x <= 0) || (pt_old.y <= 0)) ) //ambos forem validos / existem
                {
                    meas.at<float>(2) = ((float)pt.x - (float)pt_old.x);
                    meas.at<float>(3) = ((float)pt.y - (float)pt_old.y); 
                    //ROS_WARN("atualizou velocidade MEDIDA x: %f passada: %f",((float)pt.x - (float)pt_old.x)/dT, meas.at<float>(2));
                }
                

                if (!found)
                {
                    //ROS_WARN("so devia entrar aqui uma vez");
                    kf.errorCovPre.at<float>(0) = 1;
                    kf.errorCovPre.at<float>(5) = 1;
                    kf.errorCovPre.at<float>(10) = 1;
                    kf.errorCovPre.at<float>(15) = 1;    

                    state.at<float>(0) = meas.at<float>(0);
                    state.at<float>(1) = meas.at<float>(1);
                    state.at<float>(2) = 0;
                    state.at<float>(3) = 0;

                    kf.statePost = state;

                    found = true;                    
                }
                else
                {
                    kf.correct(meas);
                }
            }

            cv::Point2d center;
            center.x = state.at<float>(0);
            center.y = state.at<float>(1);

            //publica
            geometry_msgs::Point msg;
            msg.x = (int)center.x;
            msg.y = (int)center.y;
            msg.z = frame_n;

            // ROS_WARN("\n\nstate x y: %f %f", state.at<float>(0),state.at<float>(1));
            // ROS_WARN("observado x y: %f %f", meas.at<float>(0), meas.at<float>(1));
            // ROS_WARN("velocidade x y: %f %f", state.at<float>(2),state.at<float>(3));

            pub.publish(msg);
            //ROS_INFO("\n\n Detected: %f %f\n Tracked: %d %d", pt.x, pt.y, (int)center.x,(int)center.y);
        }
    }
}