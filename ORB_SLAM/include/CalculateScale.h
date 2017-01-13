/*

*/
#ifndef CALCULATESCALE_H
#define CALCULATESCALE_H

#include<opencv2/core/core.hpp>
#include<opencv2/features2d/features2d.hpp>
#include<sensor_msgs/Image.h>
#include<sensor_msgs/image_encodings.h>

#include"FramePublisher.h"
#include"Map.h"
#include"LocalMapping.h"
#include"LoopClosing.h"
#include"Frame.h"
#include "ORBVocabulary.h"
#include"KeyFrameDatabase.h"
#include"ORBextractor.h"
#include "Initializer.h"
#include "MapPublisher.h"

namespace ORB_SLAM
{

class FramePublisher;
class Map;
class LocalMapping;
class LoopClosing;
class imuSubscriber;//IMU

class CalculateScale
{
public:
	CalculateScale();
	CalculateScale(const CalculateScale &CalScale); //copy all the data

	struct tCamPose //t means struct
	{
		double TimeStamp;
		float Rotation[3][3];
		float Translation[3];
	};
	struct tIMUData //t means struct
	{
		double TimeStamp;
		float Quat[4];
		float Acc[3];
	};

	//tCamPose* mpCamPose;
	void mAddCamPose(tCamPose& pCamPose);
	void mRotateVectorByQuaternion(float* q,float* acc);
	void mAddIMUData(imuSubscriber* pIMUSub,long AlignedIndx);
	void mAlignCamAndIMU(imuSubscriber* pIMUSub);
	void mIfStartToCalScale();
	void mIfStartToMedian();
	void mCalRawScale();//calculate raw scale
	void mMedian();     //median the raw scale data to get a stable result
	void mCalFinalScale();//calculate the final scale by mean, median, or other method
	float mGetFinalScale();//return the value of final scale
	long mGetLastAlignedIndx();
	void mGetLastTranslation(float* LastTrans);
	tCamPose mCurCamPose;//edit 1001

//private:
	//IMU
	imuSubscriber* mpIMUSub;
	//
	bool mbStartToMedian;//init to be false
	bool mbStartToCalScale;//init to be false
	long mlImageNum;//init to be zero
	long mlLastAlignedIndx;//init to be zero
	vector<tCamPose> mvpCamPose;//vector of camera pose
	vector<tIMUData> mvpIMU;//vector of IMU data
	vector<long> mvlAlignedIndx;

	vector<float> mvfScale;//vector of raw scale data
	vector<float> mvfScaleAfterMedian;//vector of scale data after median process

	int mnImageStep;
	int mnImageWindowForDisplacement;
    int mnWindowForMedian;
	long mlImageIndxForDisplacement;
	float* mfRawScaleInWindow;
	float mfFinalScale;//mean, or median
};
}////namespace ORB_SLAM

#endif
