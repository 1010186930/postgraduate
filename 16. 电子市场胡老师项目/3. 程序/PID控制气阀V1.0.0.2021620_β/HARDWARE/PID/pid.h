#ifndef __PID_H__
#define __PID_H__
#include "sys.h"




extern u8 pid_set;

typedef struct
{
    double SetVoltage;	//定义设定值
    double ActualVoltage;//定义实际值
    double err;			//定义偏差值
    double err_last;		//定义上一个偏差值
    double Kp,Ki,Kd;		//定义比例、积分、微分系数
    double voltage;		//定义电压值（控制执行器的变量）0-5v右转 5-10v左转
    double integral;		//定义积分值
    double umax;
    double umin;
} pid_p;

void PID_init( void);
double FlowtoVoltage(double flow);
double VoltagetoFlow(double voltage);
double BinarySearch(double num ,int mode);
double PID_realize(double set_voltage, double voltage_adc);
#endif
