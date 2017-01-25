#include "ros/ros.h"
#include "imu_image/imuData.h"
#include <iostream>
#include <fstream>
#include <string>

using namespace std;
#define the_number_of_imuData 15

void callback(const imu_image::imuData &msg)
{
  cout<<msg.timeStamp<<" "<<msg.linearAccel_x<<endl;
}


int main(int argc, char **argv)
{
  ros::init(argc,argv,"imuData_subscriber");
  ros::NodeHandle n;
  ros::Subscriber imuData_sub = n.subscribe("/imuData",100,callback);
  ros::spin();
  return 0;
}
