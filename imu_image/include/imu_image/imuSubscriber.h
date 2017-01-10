#ifndef IMUSUBSCRIBER_H
#define IMUSUBSCRIBER_H

#include "ros/ros.h"
#include "imu_image/imuData.h"
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

    struct imuData
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
        void GrabIMUData(const imu_image::imuData &msg);
        void test();

        std::vector<imuData> mvIMUData;

    protected:
        imuData mIMUData;
        ros::NodeHandle mNH;
        ros::Subscriber mIMUDataSub;
    };

}// namespace ORB_SLAM


#endif // IMUSUBSCRIBER_H
