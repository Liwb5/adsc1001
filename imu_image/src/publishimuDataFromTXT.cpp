#include "ros/ros.h"
#include "imu_image/imuData.h"
#include <iostream>
#include <fstream>
#include <string>

using namespace std;
#define the_number_of_imuData 15
int main(int argc, char **argv)
{
    ros::init(argc,argv,"imuData_publisher");
    ros::NodeHandle n;
    ros::Publisher imuData_pub = n.advertise<imu_image::imuData>("imuData",1);
    ros::Rate loop_rate(100);//one data per 10ms

    ifstream infile(argv[1]);

    char buffer[1000];
    imu_image::imuData data;
    int i,j,k;
    //delay for a monment
    for(i=0;i<55535;i++)
    {
      for(j=0;j<35535;j++)
      {
        ;;
      }
    }
    while(ros::ok() && !infile.eof())
    {
	      infile.getline(buffer,1000);
        //transform the char to float
        std::vector<float> v;
        istringstream iss(buffer);
        copy(std::istream_iterator<float>(iss),
			     std::istream_iterator<float>(),
			     std::back_inserter(v)
		      );
        if(v.size() != the_number_of_imuData)
        {
          cout<<"number is wrong"<<endl;
          break;
        }


        data.count = v[0];
        data.timeStamp = v[1];
        data.gravWithAccel_x = v[2];
        data.gravWithAccel_y = v[3];
        data.gravWithAccel_z = v[4];
        data.quat_w = v[5];
        data.quat_x = v[6];
        data.quat_y = v[7];
        data.quat_z = v[8];
        data.linearAccel_x = v[9];
        data.linearAccel_y = v[10];
        data.linearAccel_z = v[11];
        data.gravity_x = v[12];
        data.gravity_y = v[13];
        data.gravity_z = v[14];
        //data.count = v.[15];
        cout<<buffer<<endl;
        imuData_pub.publish(data);
        ros::spinOnce();
        loop_rate.sleep();
    }
    infile.close();
    return 0;
}
