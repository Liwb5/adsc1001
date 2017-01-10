#include <sstream>
#include <stdio.h>
#include <unistd.h>
#include <iostream>
#include <fstream>
#include <string>

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "imu_image/imuData.h"
using namespace std;


int main(int argc, char **argv)
{
    char buffer[1000];
    long count = 1;
    ros::Time current_time;

    ros::init(argc,argv, "BNO_talker_node");
    ros::NodeHandle n;
    ros::Publisher imuData_pub = n.advertise<imu_image::imuData>("/imuData",10);
//    ros::Publisher odom_pub = n.advertise<nav_msgs::Odometry>("odom", 50);
    ros::Rate loop_rate(100);

    FILE *file = fopen("/dev/ttyACM0", "r");
    printf("trying to read the usb node\n");
    if (file == NULL)
    {
	perror("Error opening file\n");
	return 0;
    }
    printf("usb node not null\n");
    if(argc != 2)
    {
        cout<<"no argument!"<<endl;
    }
    //const string path = argv[0];
    //cout<<argv[1]<<endl;
    //ofstream outfile(argv[1],ofstream::binary);
    ofstream outfile("/home/liwb/Documents/output/imu.txt",ofstream::binary);


   imu_image::imuData data;
    //feof: to jude whether the file is completely read
    while(~feof(file) && ros::ok())
    {
	if (fgets(buffer,1000,file) == NULL)
	    break;

	ros::spinOnce();

	current_time = ros::Time::now();

	std::vector<float> v;
	// Build an istream that holds the input string
	std::istringstream iss(buffer);

	// Iterate over the istream, using >> to grab floats
	// and push_back to store them in the vector
	std::copy(std::istream_iterator<float>(iss),
			std::istream_iterator<float>(),
			std::back_inserter(v)
		);
	
	count++;//
	//save data to a txt file
	outfile << count << " " << current_time;
	for(int i =0;i<v.size();i++)
	{
	    outfile << " " << v[i];
	}
	outfile << "\n";

	std::cout<<count<<endl;//for test
  data.count = count;
  data.timeStamp = current_time.toSec();
  data.gravWithAccel_x = v[0];
  data.gravWithAccel_y = v[1];
  data.gravWithAccel_z = v[2];
  data.quat_w = v[3];
  data.quat_x = v[4];
  data.quat_y = v[5];
  data.quat_z = v[6];
  data.linearAccel_x = v[7];
  data.linearAccel_y = v[8];
  data.linearAccel_z = v[9];
  data.gravity_x = v[10];
  data.gravity_y = v[11];
  data.gravity_z = v[12];
  imuData_pub.publish(data);
  ros::spinOnce();
	loop_rate.sleep();
    }
    printf("~Feof(file) = %d, ros_ok = %d,  quitting\n",~feof(file) ,ros::ok());
    fclose(file);
    outfile.close();
    return 0;

}
