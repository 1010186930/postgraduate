#ifndef __PID_H__
#define __PID_H__
#include "sys.h"




extern u8 pid_set;

typedef struct
{
    float SetVoltage;	//定义设定值
    float ActualVoltage;//定义实际值
    float err;			//定义偏差值
    float err_last;		//定义上一个偏差值
    float Kp,Ki,Kd;		//定义比例、积分、微分系数
    float voltage;		//定义电压值（控制执行器的变量）0-5v右转 5-10v左转
    float integral;		//定义积分值
    float umax;
    float umin;
} pid_p;

void PID_init( void);
float FlowtoVoltage(float flow);
float VoltagetoFlow(float voltage);
float BinarySearch(int num);
float PID_realize(float flow, float voltage_adc);
#endif
