#ifndef __PID_H__
#define __PID_H__
#include "sys.h"




extern u8 pid_set;

typedef struct
{
    double SetVoltage;	//�����趨ֵ
    double ActualVoltage;//����ʵ��ֵ
    double err;			//����ƫ��ֵ
    double err_last;		//������һ��ƫ��ֵ
    double Kp,Ki,Kd;		//������������֡�΢��ϵ��
    double voltage;		//�����ѹֵ������ִ�����ı�����0-5v��ת 5-10v��ת
    double integral;		//�������ֵ
    double umax;
    double umin;
} pid_p;

void PID_init( void);
double FlowtoVoltage(double flow);
double VoltagetoFlow(double voltage);
double BinarySearch(double num ,int mode);
double PID_realize(double set_voltage, double voltage_adc);
#endif
