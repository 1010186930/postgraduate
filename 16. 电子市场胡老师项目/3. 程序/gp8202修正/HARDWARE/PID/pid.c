#include "pid.h"
#include "stdio.h"
#include "usart.h"
#include "stdlib.h"
float Flow_Convert_Voltage[]= {	0,1.068, 1,1.068, 2,1.068, 3,1.069, 4,1.069, 5,1.069,
                                6,1.070, 7,1.070, 8,1.070, 9,1.071, 10,1.071, 15,1.072,
                                20,1.073, 25,1.074, 30,1.075, 35,1.077, 40,1.078, 45,1.079,
                                50,1.081, 60,1.083, 70,1.086, 80,1.089, 90,1.092, 100,1.095,
                                200,1.119, 300,1.147, 400,1.176, 500,1.207, 600,1.240, 700,1.273,
                                800,1.308, 900,1.343, 960,1.364, 970,1.367, 980,1.371, 990,1.374,
                                1000,1.375, 1500,1.553, 2000,1.738, 2500,1.926, 3000,2.115, 4000,2.492,
                                5000,2.868, 6000,3.242, 6960,3.587, 6970,3.594, 6980,3.603, 6990,3.610, 7000,3.617
                              }
                              ;
pid_p pid;

//pid位置式
void PID_init()
{
    printf("PID_init begin \n");
    pid.SetVoltage= 0.0;		//设定的预期电压值
    pid.ActualVoltage= 0.0;		//adc实际电压值
    pid.err= 0.0;				//当前次实际与理想的偏差
    pid.err_last=0.0;			//上一次的偏差
    pid.voltage= 0.0;			//控制电压值
    pid.integral= 0.0;			//积分值
    pid.Kp= 0.1;				//比例系数
    pid.Ki= 0.15;				//积分系数
    pid.Kd= 0.2;				//微分系数
    pid.umax=10.0;
    pid.umin=0.0;
    printf("PID_init end \n");
}
float VoltagetoFlow(float voltage)
{
//	if(voltage<=1.068)
//		return 0;
//	else
		return (voltage-1.068)/0.0004;
}
float FlowtoVoltage(float flow)
{
	return 0.0004*flow+1.068;
}
float PID_realize(float flow, float voltage_adc)
{
    int index;
		
    pid.SetVoltage = FlowtoVoltage(flow);						//固定电压值传入
    pid.err = pid.SetVoltage - pid.ActualVoltage;	//计算偏差
		if(pid.ActualVoltage>pid.umax)
		{
			if(abs((int)pid.err)>2)
				index=0;
			else
			{
				index=1;
				if(pid.err<0)
					pid.integral+=pid.err;
			}
		}
		else if(pid.ActualVoltage<pid.umin)
		{
			if(abs((int)pid.err)>2)
				index=0;
			else
			{
				index=1;
				if(pid.err>0)
					pid.integral+=pid.err;
			}
		}
		else
		{
			if(abs((int)pid.err)>2)
				index=0;
			else
			{
				index=1;
				pid.integral+=pid.err;
			}
		}
    pid.voltage = pid.Kp * pid.err + index * pid.Ki * pid.integral + pid.Kd * ( pid.err - pid.err_last);//位置式公式
    pid.err_last = pid.err;					//留住上一次误差
	pid.ActualVoltage = voltage_adc;				//实际电压传入 = ADC_Value * 3.3f/ 4096
    return pid.voltage;
}
float BinarySearch(int num)
{
    int low=0;
    int high=sizeof(Flow_Convert_Voltage)/sizeof(double)-1;
    int n=16;
    int i;
    float voltage;
    for(n=16; n; n--)
    {
        i=low+(high-low)/2;
        if(num==Flow_Convert_Voltage[i*2])
            break;
        if(num>Flow_Convert_Voltage[i*2])
            low=i;
        else
            high=i;
    }
    voltage=n?Flow_Convert_Voltage[i*2+1]:0;
    return voltage;
}
