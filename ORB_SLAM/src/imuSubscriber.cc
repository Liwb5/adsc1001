#include "imuSubscriber.h"
#include <ros/ros.h>
#include <iostream>
using namespace std;

namespace ORB_SLAM
{
    imuSubscriber::imuSubscriber()
    {

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
