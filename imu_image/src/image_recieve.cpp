#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <string>
// ****************edit by liwb****************************** //
ros::Time current_time;
#include <iostream>
#include <fstream>
#include <stdlib.h> 
#include <stdio.h>
#include <sstream>
using namespace std;
// ****************edit by liwb****************************** //

static const std::string OPENCV_WINDOW = "Image window";
static const string PATH = "";


class ImageConverter
{
  ros::NodeHandle nh_;
  image_transport::ImageTransport it_;
  image_transport::Subscriber image_sub_;
  image_transport::Publisher image_pub_;  
  int count;
  std::ofstream outfile;
public:
  ImageConverter()
    : it_(nh_)
  {
    count = 1;
    outfile.open("/home/liwb/Documents/output/imageNum.txt",ios::binary);//记录时间戳与顺序的关系
    //("/home/liwb/Output_data/imageNum.txt",std::ofstream::binary);
    // Subscrive to input video feed and publish output video feed
    image_sub_ = it_.subscribe("/usb_cam/image_raw", 1, 
      &ImageConverter::imageCb, this);
    image_pub_ = it_.advertise("/image_converter/output_video", 1);

    cv::namedWindow(OPENCV_WINDOW);
  }

  ~ImageConverter()
  {
    cv::destroyWindow(OPENCV_WINDOW);
    outfile.close();
  }

  void imageCb(const sensor_msgs::ImageConstPtr& msg)
  {
    cv_bridge::CvImagePtr cv_ptr;
    try
    {
      cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e)
    {
      ROS_ERROR("cv_bridge exception: %s", e.what());
      return;
    }

    // Draw an example circle on the video stream
//    if (cv_ptr->image.rows > 60 && cv_ptr->image.cols > 60)
  //    cv::circle(cv_ptr->image, cv::Point(50, 50), 10, CV_RGB(255,0,0));

    // Update GUI Window
    //cv::imshow(OPENCV_WINDOW, cv_ptr->image);
    // ****************edit by liwb****************************** //
//    char temp[100];
//    std::sprintf(temp,"%d",count);
//    t = temp;
//    path = path + t + ".jpg";
    string path = "/home/liwb/Documents/output/image/";
    stringstream ss;
    ss << count;
    string temp = ss.str();
//    char *temp = itoa(current_time);
    path.append(temp);
    path.append(".jpg");
    current_time = ros::Time::now();
    outfile << count << " " << current_time << "\n";
    cv::imwrite(path,cv_ptr->image);
    cout<<count<<endl;
    count = count + 1;
    // ****************edit by liwb****************************** //
    cv::waitKey(3);
    
    // Output modified video stream
    image_pub_.publish(cv_ptr->toImageMsg());
  }
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "image_converter");
  ImageConverter ic;
  ros::spin();
//  outfile.close();
  return 0;
}
