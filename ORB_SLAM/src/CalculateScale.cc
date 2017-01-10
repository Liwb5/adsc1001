/*

*/
#include "CalculateScale.h"
#include "Tracking.h"
#include<ros/ros.h>
#include <cv_bridge/cv_bridge.h>

#include<opencv2/opencv.hpp>

#include"ORBmatcher.h"
#include"FramePublisher.h"
#include"Converter.h"
#include"Map.h"
#include"Initializer.h"

#include"Optimizer.h"
#include"PnPsolver.h"

#include<iostream>
#include<fstream>
#include<algorithm>

using namespace std;

namespace ORB_SLAM
{
void CalculateScale::mAddCamPose(tCamPose& pCamPose)
{
	mvpCamPose.push_back(pCamPose);
	mlImageNum++;
}
void CalculateScale::mAddIMUData(imuSubscriber* pIMUSub,long AlignedIndx)
{
	int IMUDataInc=AlignedIndx-mlLastAlignedIndx;
	for(int i=1;i<=IMUDataInc;i++)
	{
		tIMUData pIMUData;
		pIMUData.TimeStamp = (pIMUSub->mvIMUData[mlLastAlignedIndx+i]).timeStamp;
		//
		pIMUData.Acc[0] = (pIMUSub->mvIMUData[mlLastAlignedIndx+i]).LinearAccel.x;
		pIMUData.Acc[1] = (pIMUSub->mvIMUData[mlLastAlignedIndx+i]).LinearAccel.y;
		pIMUData.Acc[2] = (pIMUSub->mvIMUData[mlLastAlignedIndx+i]).LinearAccel.z;
		//
		pIMUData.Quat[0] = (pIMUSub->mvIMUData[mlLastAlignedIndx+i]).Quat.w;
		pIMUData.Quat[1] = (pIMUSub->mvIMUData[mlLastAlignedIndx+i]).Quat.x;
		pIMUData.Quat[2] = (pIMUSub->mvIMUData[mlLastAlignedIndx+i]).Quat.y;
		pIMUData.Quat[3] = (pIMUSub->mvIMUData[mlLastAlignedIndx+i]).Quat.z;
		//the acceleration should refer to world
		mRotateVectorByQuaternion(pIMUData.Quat,pIMUData.Acc);
		//push
		mvpIMU.push_back(pIMUData);
	}

	//refresh vector of mvlAlignedIndx
	mvlAlignedIndx.push_back(mvpIMU.size()-1);
}
void CalculateScale::mRotateVectorByQuaternion(float* q,float* acc)
{
	//inverse q
	q[1]=-q[1];
	q[2]=-q[2];
	q[3]=-q[3];
	//get acc value temporarily
	float v[3];
	v[0]=acc[0];v[1]=acc[1];v[2]=acc[2];
	//to rotation
	float rot[3][3];
	rot[0][0]=q[0]*q[0]+q[1]*q[1]-q[2]*q[2]-q[3]*q[3];
	rot[0][1]=2*(q[1]*q[2]+q[0]*q[3]);
	rot[0][2]=2*(q[1]*q[3]-q[0]*q[2]);
	rot[1][0]=2*(q[1]*q[2]-q[0]*q[3]);
	rot[1][1]=q[0]*q[0]-q[1]*q[1]+q[2]*q[2]-q[3]*q[3];
	rot[1][2]=2*(q[2]*q[3]+q[0]*q[1]);
	rot[2][0]=2*(q[1]*q[3]+q[0]*q[2]);
	rot[2][1]=2*(q[2]*q[3]-q[0]*q[1]);
	rot[2][2]=q[0]*q[0]-q[1]*q[1]-q[2]*q[2]+q[3]*q[3];
	//rotation multiply acc, fresh acc
	acc[0]=rot[0][0]*v[0]+rot[0][1]*v[1]+rot[0][2]*v[2];
	acc[1]=rot[1][0]*v[0]+rot[1][1]*v[1]+rot[1][2]*v[2];
	acc[2]=rot[2][0]*v[0]+rot[2][1]*v[1]+rot[2][2]*v[2];
}
void CalculateScale::mAlignCamAndIMU(imuSubscriber* pIMUSub)
{
	long MaxIndx=(pIMUSub->mvIMUData).size()-1;
	//look for the nearest imu timestamp index, using binary search method
	long AlignedIndx;
	tCamPose pCamPose = mvpCamPose[mvpCamPose.size()-1];
	double CamTimeStamp=pCamPose.TimeStamp;
	//binary_search(vpIMU,mlLastAlignedIndx,MaxIndx);
	double IMUTimeStamp;
	long MidIndx;
	long LeftIndx=mlLastAlignedIndx+1;
	long RightIndx=MaxIndx;
	while(RightIndx - LeftIndx >=2)
	{
		MidIndx=LeftIndx+(RightIndx-LeftIndx)/2; //avoid expression: TmpIndx=(RightIndx+LeftIndx)/2
		IMUTimeStamp = (pIMUSub->mvIMUData[MidIndx]).timeStamp;
		if(CamTimeStamp>IMUTimeStamp)
		{
			LeftIndx=MidIndx;
		}
		else
		{
			RightIndx=MidIndx;
		}
	}
	//RightIndx-LeftIndx is 1 or 0;
	if(RightIndx-LeftIndx==1)
	{
		long IMUTimeStampRight= (pIMUSub->mvIMUData[RightIndx]).timeStamp;
		long IMUTimeStampLeft = (pIMUSub->mvIMUData[LeftIndx]).timeStamp;
		AlignedIndx = (abs(IMUTimeStampRight-CamTimeStamp)<abs(IMUTimeStampLeft-CamTimeStamp))?LeftIndx:RightIndx;
	}
	else //if(RightIndx-LeftIndx==0)
	{
		AlignedIndx = RightIndx;
	}
	if(mlImageNum==1)
		mlLastAlignedIndx=AlignedIndx-1;
	//
	mAddIMUData(pIMUSub,AlignedIndx);
	//refresh mlLastAlignedIndx;
	mlLastAlignedIndx=AlignedIndx;

}

void CalculateScale::mIfStartToCalScale()
{
	if(mbStartToCalScale)
		return;

	if(mlImageNum>=3*mnImageWindowForDisplacement+1)//31
		mbStartToCalScale=1;
}
void CalculateScale::mIfStartToMedian()
{
	if(mbStartToMedian)
		return;

	if(mvfScale.size()>=mnWindowForMedian)//20
	{
		mbStartToMedian=1;
		//push 20 values of scale into scale array
		for(int i=0;i<mnWindowForMedian;i++)
		{
			mfRawScaleInWindow[i]=mvfScale[i];
		}
		//sort, in ascending order default
		sort(mfRawScaleInWindow , mfRawScaleInWindow + mnWindowForMedian);
	}
}
void CalculateScale::mCalRawScale()
{
	if(!mbStartToCalScale)
		return;
	if(mlImageIndxForDisplacement+mnImageWindowForDisplacement*3>mvpCamPose.size()-1)
		return;
	//image indx
	long ImageIndx0=mlImageIndxForDisplacement;
	long ImageIndx1=ImageIndx0+mnImageWindowForDisplacement;
	long ImageIndx2=ImageIndx1+mnImageWindowForDisplacement;
	long ImageIndx3=ImageIndx2+mnImageWindowForDisplacement;
	//IMU indx
	long IMUIndx0=mvlAlignedIndx[ImageIndx0];
	long IMUIndx1=mvlAlignedIndx[ImageIndx1];
	long IMUIndx2=mvlAlignedIndx[ImageIndx2];
	long IMUIndx3=mvlAlignedIndx[ImageIndx3];
	//imu timestamp
	double IMUTimeStamp0=(mvpIMU[IMUIndx0]).TimeStamp;
	double IMUTimeStamp1=(mvpIMU[IMUIndx1]).TimeStamp;
	double IMUTimeStamp2=(mvpIMU[IMUIndx2]).TimeStamp;
	double IMUTimeStamp3=(mvpIMU[IMUIndx3]).TimeStamp;
	//time
	float t1 = IMUTimeStamp1 - IMUTimeStamp0;
	float t2 = IMUTimeStamp2 - IMUTimeStamp1;
	float t3 = IMUTimeStamp3 - IMUTimeStamp2;
	//s1
	float s1[3]={0.0,0.0,0.0};//
	int n=IMUIndx1-IMUIndx0;
	float time_sum=0.0;
	float a[3]={0.0,0.0,0.0};//acceleration
	float v[3]={0.0,0.0,0.0};//speed
	float s[3]={0.0,0.0,0.0};//displacement
	float t;//time
	float s1_bias=0.0;//coefficient of bias
	for(int i=1;i<=n;i++)
	{
		t=(mvpIMU[IMUIndx1-i+1]).TimeStamp-(mvpIMU[IMUIndx1-i]).TimeStamp;
		a[0]=(mvpIMU[IMUIndx1-i+1]).Acc[0];
		a[1]=(mvpIMU[IMUIndx1-i+1]).Acc[1];
		a[2]=(mvpIMU[IMUIndx1-i+1]).Acc[2];

		s[0]=s[0]+v[0]*t+0.5*a[0]*t*t;
		s[1]=s[1]+v[1]*t+0.5*a[1]*t*t;
		s[2]=s[2]+v[2]*t+0.5*a[2]*t*t;
		v[0]=v[0]+a[0]*t;
		v[1]=v[1]+a[1]*t;
		v[2]=v[2]+a[2]*t;
		s1_bias=s1_bias+time_sum*t+0.5*t*t;
		time_sum=time_sum+t;
	}
	s1[0]=-s[0];
	s1[1]=-s[1];
	s1[2]=-s[2];
	s1_bias=-s1_bias;
	//s2
	float s2[3]={0.0,0.0,0.0};//
	n=IMUIndx2-IMUIndx1;
	time_sum=0.0;
	a[0]=0.0;a[1]=0.0;a[2]=0.0;//acceleration
	v[0]=0.0;v[1]=0.0;v[2]=0.0;//speed
	s[0]=0.0;s[1]=0.0;s[2]=0.0;//displacement
	//t;//time
	float s2_bias=0.0;//coefficient of bias
	for(int i=1;i<=n;i++)
	{
		t=(mvpIMU[IMUIndx1+i]).TimeStamp-(mvpIMU[IMUIndx1+i-1]).TimeStamp;
		a[0]=(mvpIMU[IMUIndx1+i]).Acc[0];
		a[1]=(mvpIMU[IMUIndx1+i]).Acc[1];
		a[2]=(mvpIMU[IMUIndx1+i]).Acc[2];

		s[0]=s[0]+v[0]*t+0.5*a[0]*t*t;
		s[1]=s[1]+v[1]*t+0.5*a[1]*t*t;
		s[2]=s[2]+v[2]*t+0.5*a[2]*t*t;
		v[0]=v[0]+a[0]*t;
		v[1]=v[1]+a[1]*t;
		v[2]=v[2]+a[2]*t;
		s2_bias=s2_bias+time_sum*t+0.5*t*t;
		time_sum=time_sum+t;
	}
	s2[0]=s[0];
	s2[1]=s[1];
	s2[2]=s[2];
	s2_bias=s2_bias;
	//delta1_s
	float delta1_s[3];
	delta1_s[0]=s2[0]-s1[0]*t2/t1;
	delta1_s[1]=s2[1]-s1[1]*t2/t1;
	delta1_s[2]=s2[2]-s1[2]*t2/t1;

	//s2
	//float s2[3]={0.0,0.0,0.0};//
	s2[0]=0.0;s2[1]=0.0;s2[2]=0.0;
	n=IMUIndx2-IMUIndx1;
	time_sum=0.0;
	a[0]=0.0;a[1]=0.0;a[2]=0.0;//acceleration
	v[0]=0.0;v[1]=0.0;v[2]=0.0;//speed
	s[0]=0.0;s[1]=0.0;s[2]=0.0;//displacement
	//t;//time
	float s2_bias2=0.0;//coefficient of bias
	for(int i=1;i<=n;i++)
	{
		t=(mvpIMU[IMUIndx2-i+1]).TimeStamp-(mvpIMU[IMUIndx2-i]).TimeStamp;
		a[0]=(mvpIMU[IMUIndx2-i+1]).Acc[0];
		a[1]=(mvpIMU[IMUIndx2-i+1]).Acc[1];
		a[2]=(mvpIMU[IMUIndx2-i+1]).Acc[2];

		s[0]=s[0]+v[0]*t+0.5*a[0]*t*t;
		s[1]=s[1]+v[1]*t+0.5*a[1]*t*t;
		s[2]=s[2]+v[2]*t+0.5*a[2]*t*t;
		v[0]=v[0]+a[0]*t;
		v[1]=v[1]+a[1]*t;
		v[2]=v[2]+a[2]*t;
		s2_bias2=s2_bias2+time_sum*t+0.5*t*t;
		time_sum=time_sum+t;
	}
	s2[0]=-s[0];
	s2[1]=-s[1];
	s2[2]=-s[2];
	s2_bias2=-s2_bias2;
	//s3
	float s3[3]={0.0,0.0,0.0};//
	n=IMUIndx3-IMUIndx2;
	time_sum=0.0;
	a[0]=0.0;a[1]=0.0;a[2]=0.0;//acceleration
	v[0]=0.0;v[1]=0.0;v[2]=0.0;//speed
	s[0]=0.0;s[1]=0.0;s[2]=0.0;//displacement
	//t;//time
	float s3_bias=0.0;//coefficient of bias
	for(int i=1;i<=n;i++)
	{
		t=(mvpIMU[IMUIndx2+i]).TimeStamp-(mvpIMU[IMUIndx2+i-1]).TimeStamp;
		a[0]=(mvpIMU[IMUIndx2+i]).Acc[0];
		a[1]=(mvpIMU[IMUIndx2+i]).Acc[1];
		a[2]=(mvpIMU[IMUIndx2+i]).Acc[2];

		s[0]=s[0]+v[0]*t+0.5*a[0]*t*t;
		s[1]=s[1]+v[1]*t+0.5*a[1]*t*t;
		s[2]=s[2]+v[2]*t+0.5*a[2]*t*t;
		v[0]=v[0]+a[0]*t;
		v[1]=v[1]+a[1]*t;
		v[2]=v[2]+a[2]*t;
		s3_bias=s3_bias+time_sum*t+0.5*t*t;
		time_sum=time_sum+t;
	}
	s3[0]=s[0];
	s3[1]=s[1];
	s3[2]=s[2];
	s3_bias=s3_bias;
	//
	float delta2_s[3];
	delta2_s[0]=s3[0]-s2[0]*t3/t2;
	delta2_s[1]=s3[1]-s2[1]*t3/t2;
	delta2_s[2]=s3[2]-s2[2]*t3/t2;
	//
	float  delta_s[3];
	float  denominator=(s2_bias-s1_bias*t2/t1);
	//sometimes the denominator is near zero, so there may be a bug
	if(denominator<0.00001&&denominator>-0.00001)
	{
		;
	}
	delta_s[0]=delta2_s[0]-delta1_s[0]*(s3_bias-s2_bias2*t3/t2)/(s2_bias-s1_bias*t2/t1);
	delta_s[1]=delta2_s[1]-delta1_s[1]*(s3_bias-s2_bias2*t3/t2)/(s2_bias-s1_bias*t2/t1);
	delta_s[2]=delta2_s[2]-delta1_s[2]*(s3_bias-s2_bias2*t3/t2)/(s2_bias-s1_bias*t2/t1);

	//orbslam translation
	float tr1[3];
	float tr2[3];
	float tr3[3];
	//tr1
	tr1[0]=mvpCamPose[ImageIndx1].Translation[0]-mvpCamPose[ImageIndx0].Translation[0];
	tr1[1]=mvpCamPose[ImageIndx1].Translation[1]-mvpCamPose[ImageIndx0].Translation[1];
	tr1[2]=mvpCamPose[ImageIndx1].Translation[2]-mvpCamPose[ImageIndx0].Translation[2];
	//tr2
	tr2[0]=mvpCamPose[ImageIndx2].Translation[0]-mvpCamPose[ImageIndx1].Translation[0];
	tr2[1]=mvpCamPose[ImageIndx2].Translation[1]-mvpCamPose[ImageIndx1].Translation[1];
	tr2[2]=mvpCamPose[ImageIndx2].Translation[2]-mvpCamPose[ImageIndx1].Translation[2];
	//tr3
	tr3[0]=mvpCamPose[ImageIndx3].Translation[0]-mvpCamPose[ImageIndx2].Translation[0];
	tr3[1]=mvpCamPose[ImageIndx3].Translation[1]-mvpCamPose[ImageIndx2].Translation[1];
	tr3[2]=mvpCamPose[ImageIndx3].Translation[2]-mvpCamPose[ImageIndx2].Translation[2];
	//
	float delta1_tr[3],delta2_tr[3],delta_tr[3];
	//delta1_tr
	delta1_tr[0]=tr2[0]-tr1[0]*t2/t1;
	delta1_tr[1]=tr2[1]-tr1[1]*t2/t1;
	delta1_tr[2]=tr2[2]-tr1[2]*t2/t1;
	//delta2_tr
	delta2_tr[0]=tr3[0]-tr2[0]*t3/t2;
	delta2_tr[1]=tr3[1]-tr2[1]*t3/t2;
	delta2_tr[2]=tr3[2]-tr2[2]*t3/t2;
	//delta_tr
	delta_tr[0]=delta2_tr[0]-delta1_tr[0]*(s3_bias-s2_bias2*t3/t2)/(s2_bias-s1_bias*t2/t1);
	delta_tr[1]=delta2_tr[1]-delta1_tr[1]*(s3_bias-s2_bias2*t3/t2)/(s2_bias-s1_bias*t2/t1);
	delta_tr[2]=delta2_tr[2]-delta1_tr[2]*(s3_bias-s2_bias2*t3/t2)/(s2_bias-s1_bias*t2/t1);

	//calculate scale
	float delta_s_len=sqrt(delta_s[0]*delta_s[0]+delta_s[1]*delta_s[1]+delta_s[2]*delta_s[2]);
	float delta_tr_len=sqrt(delta_tr[0]*delta_tr[0]+delta_tr[1]*delta_tr[1]+delta_tr[2]*delta_tr[2]);
	//sometimes the denominator is near zero, so there may be a bug
	if(delta_tr_len<0.00001&&delta_tr_len>-0.00001)
	{
		;
	}
	//
	float fRawScale=delta_s_len/delta_tr_len;
	//push
	mvfScale.push_back(fRawScale);

	//fresh variables for next call
    mlImageIndxForDisplacement=mlImageIndxForDisplacement+mnImageStep;
}
void CalculateScale::mMedian() //avoid sorting, as mfRawScaleInWindow is an order array.
{
	if(!mbStartToMedian)
		return;

	float scale_tmp=mvfScale[mvfScale.size()-1];
	int right_position=-1;
	//
	for(int i=1;i<mnWindowForMedian;i++)
	{
		if(mfRawScaleInWindow[i]>scale_tmp)
		{
			right_position=i-1;//so position may be -1, but it does not matter
			break;
		}
	}

	if(right_position == -1)
	{
		right_position = mnWindowForMedian-1;
	}
	//insert the new scale value into scale array
	for(int i=1;i<=right_position;i++)
	{
		mfRawScaleInWindow[i-1]=mfRawScaleInWindow[i];
	}
	mfRawScaleInWindow[right_position]=scale_tmp;//now mfRawScaleInWindow is an order array.
	//median
	//even, mnWindowForMedian/2
	float scale_med=mfRawScaleInWindow[mnWindowForMedian/2];
	//odd,  it cause little error, as using mnWindowForMedian/2

	//push
	mvfScaleAfterMedian.push_back(scale_med);
}
void CalculateScale::mCalFinalScale()
{
	//mean
	double dScaleSum=0.0;
	long lSizeOfScaleVector = mvfScaleAfterMedian.size();
	for(long i=0;i<lSizeOfScaleVector;i++)
	{
		dScaleSum+=mvfScaleAfterMedian[i];
	}
	mfFinalScale=dScaleSum/lSizeOfScaleVector;
	//median
	//any other to do
}
float CalculateScale::mGetFinalScale()
{
	return mfFinalScale;
}
long CalculateScale::mGetLastAlignedIndx()
{
	return mlLastAlignedIndx;
}
void CalculateScale::mGetLastTranslation(float* LastTrans)
{
	long MaxIndx=mvpCamPose.size()-1;
	LastTrans[0]=mvpCamPose[MaxIndx].Translation[0];
	LastTrans[1]=mvpCamPose[MaxIndx].Translation[1];
	LastTrans[2]=mvpCamPose[MaxIndx].Translation[2];
}
}//namespace ORB_SLAM
