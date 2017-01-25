#ifndef IMUSUBSCRIBER_H
#define IMUSUBSCRIBER_H

#include "ros/ros.h"
#include "ORB_SLAM/imuData.h"
#include <vector>

namespace ORB_SLAM
{
    struct Acceleration
    {
        float x;
        float y;
        float z;
    };

    struct Quaternion
    {
        float w;
        float x;
        float y;
        float z;
    };

    struct IMU_Data
    {
        double timeStamp;
        Acceleration LinearAccel;
        Quaternion Quat;
    };

    class imuSubscriber
    {
    public:
        imuSubscriber();
        void Run();
        void GrabIMUData(const ORB_SLAM::imuData &msg);
        void test();

        std::vector<IMU_Data> mvIMUData;

    protected:
        IMU_Data mIMUData;
        ros::NodeHandle mNH;
        ros::Subscriber mIMUDataSub;
    };

}// namespace ORB_SLAM


#endif // IMUSUBSCRIBER_H
