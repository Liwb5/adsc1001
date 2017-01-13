#include "imuSubscriber.h"
#include <ros/ros.h>
#include <iostream>
#include <fstream>
using namespace std;

#define output_imuData

namespace ORB_SLAM
{
    imuSubscriber::imuSubscriber()
    {
        #ifdef output_imuData
        	outfile_imuData.open("/home/liwb/Documents/output/imu2.txt",ios::binary);//record imu data
        #endif
    }
    void imuSubscriber::Run()
    {
        mIMUDataSub = mNH.subscribe("/imuData",100,&imuSubscriber::GrabIMUData,this);
        //ros::MultiThreadedSpinner spinner(4);//use 4 threads
        //spinner.spin();
    }

    // as callback function, to recieve data from topic /imuData and save imuData in vector mvIMUData
    void imuSubscriber::GrabIMUData(const ORB_SLAM::imuData &msg)
    {
        mIMUData.timeStamp = msg.timeStamp;
        mIMUData.LinearAccel.x = msg.linearAccel_x;
        mIMUData.LinearAccel.y = msg.linearAccel_y;
        mIMUData.LinearAccel.z = msg.linearAccel_z;
        mIMUData.Quat.w = msg.quat_w;
        mIMUData.Quat.x = msg.quat_x;
        mIMUData.Quat.y = msg.quat_y;
        mIMUData.Quat.z = msg.quat_z;

        mvIMUData.push_back(mIMUData);
    #ifdef output_imuData
        outfile_imuData<<std::fixed<<mIMUData.timeStamp<<" "<<mIMUData.LinearAccel.x<<" "<<mIMUData.LinearAccel.y<<" "<<mIMUData.LinearAccel.z<<" "<<mIMUData.Quat.w<<" "<<mIMUData.Quat.x<<" "<<mIMUData.Quat.y<<" "<<mIMUData.Quat.z<<"\n";
    #endif
        //test();//for debug
    }

//for debug
    void imuSubscriber::test()
    {
        if((mvIMUData.size()+3)%7 == 0)
        {
            cout<<mvIMUData.size()<<endl;
            cout<<mvIMUData[mvIMUData.size()-1].timeStamp<<" "<<mvIMUData[mvIMUData.size()-1].Quat.z<< endl;
        }
    }

}//namespace ORB_SLAM


/*
int main(int argc,char **argv)
{
    ros::init(argc,argv,"imuData_subscriber");
    ORB_SLAM::imuSubscriber imuSub;
    imuSub.Run();
    return 0;
}
*/
