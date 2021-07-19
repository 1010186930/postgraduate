#ifndef __PID_H__
#define __PID_H__
#include "sys.h"




extern u8 pid_set;

typedef struct
{
    float SetVoltage;	//�����趨ֵ
    float ActualVoltage;//����ʵ��ֵ
    float err;			//����ƫ��ֵ
    float err_last;		//������һ��ƫ��ֵ
    float Kp,Ki,Kd;		//������������֡�΢��ϵ��
    float voltage;		//�����ѹֵ������ִ�����ı�����0-5v��ת 5-10v��ת
    float integral;		//�������ֵ
    float umax;
    float umin;
} pid_p;

void PID_init( void);
float FlowtoVoltage(float flow);
float VoltagetoFlow(float voltage);
float BinarySearch(int num);
float PID_realize(float flow, float voltage_adc);
#endif
