#include<iostream>
#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <sstream>
#include <iostream>
#include "opencv2/opencv.hpp"
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>

using namespace std;
using namespace cv;

int main(int argc, char **argv)
{
  ros::init(argc,argv,"video_publisher");
  ros::NodeHandle nh;
  image_transport::ImageTransport it(nh);
  image_transport::Publisher pub = it.advertise("usb_cam/image_raw", 1);

  if(argc)
      cout<<argv[1]<<endl;
  ros::Rate loop_rate(30);
  string path = "/home/liwb/Documents/output/";
  path = path + argv[1];
  cout<<path<<endl;
  VideoCapture cap(path);//open video from the path
  if(!cap.isOpened())
  {
    std::cout<<"open video failed!"<<std::endl;
    return -1;
  }
  else
    std::cout<<"open video success!"<<std::endl;

  Mat frame;//this is an image
  bool isSuccess = true;
  while(nh.ok())
  {
    isSuccess = cap.read(frame);
    if(!isSuccess)//if the video ends, then break
    {
      std::cout<<"video ends"<<std::endl;
      break;
    }
    sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();

    pub.publish(msg);
    ros::spinOnce();
    loop_rate.sleep();
  }

  /*
  cv_bridge cb;
  VideoCapture cap(argv[0]);//open video from the path
  if(!cap.isOpened())
  {
    std::cout<<"can not open the video file!"<<std::endl;
    return -1;
  }

  Mat frame;
  bool isSuccess = true;
  while(ros::ok())
  {
    isSuccess = cap.read(frame);
    if(!isSuccess)//if the video ends, then break
    {
      break;
    }
    sensor_msgs::Image image = cb.cv2_to_imgmsg(frame, encoding='bgr8')

  }*/
  return 0;
}
