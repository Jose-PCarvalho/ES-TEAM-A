#include <iostream>
#include <opencv2/opencv.hpp>
#include <opencv2/videoio.hpp>
#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <string.h>

int main(int argc, char** argv)
{
  ros::init(argc, argv, "get_video");
  ros::NodeHandle nh;
  ros::Publisher pub;
  pub = nh.advertise<sensor_msgs::Image>("/video_raw", 1);

  bool show_original;
  nh.param<bool>("/show_original", show_original, "True");
  
  // choose video with rosparam
  std::string material, path;
  nh.param<std::string>("/material", material, "Plastic");
  path = "/home/pedrosr/pm/src/pm_proj1/videos/video" + material + ".mp4";

  // Open video
  cv::VideoCapture cap(path);

  // Check if video opened successfully
  if(!cap.isOpened()){
    std::cout << "Error opening video stream or file" << std::endl;
    return -1;
  }

  cv::Mat frame;
  int fps = 30;
  ros::Rate rate = fps;

  // Acquire input size
  cv::Size frame_size = cv::Size((int) cap.get(cv::CAP_PROP_FRAME_WIDTH), (int) cap.get(cv::CAP_PROP_FRAME_HEIGHT));

  // Define the codec and create VideoWriter object
  cv::VideoWriter writer("p1_plastic.mp4", cv::VideoWriter::fourcc('a', 'v', 'c', '1'), fps, frame_size);

  // Iterate through frames
  if (show_original)
    ROS_INFO("Press key to advance frame and 'Esc' do leave");

  cv_bridge::CvImagePtr cv_ptr(new cv_bridge::CvImage);  

  while(cap.isOpened())
  {
    // Capture next frame
    cap >> frame;

    // If the frame is empty, break immediately
    if (frame.empty())
      break;

    // Write the frame into the output file
    writer.write(frame);

    //publishes frame
    cv_ptr->image = frame;
    cv_ptr->encoding = "bgr8";
    pub.publish(cv_ptr->toImageMsg()); 

    // Display the frame
    if (show_original)
    {
      float scale_down = 0.5;
      cv::Mat original_small;
      cv::resize(frame,original_small, cv::Size(),scale_down,scale_down, cv::INTER_LINEAR);
      cv::imshow("Frame", original_small );
      // Press Space Bar to continue, ESC to exit
      char c = (char)cv::waitKey(0);
      if( c == 27 )
        break;
    }
    else
      rate.sleep();
    }

  // When everything is done, release the video capture and writer objects
  cap.release();
  writer.release();

  // Close all the frames
  if (show_original)
    cv::destroyAllWindows();

  ROS_INFO("Job done");
  
  return 0;
}
