#include "pid.h"
#include "stdio.h"
#include "usart.h"
#include "stdlib.h"
#include "rs485.h"
#include "math.h"
#include "string.h"
#define EPSILON 1e-6
char display_buf[50]="";
double Flow_Convert_Voltage[]= {	0,1.068, 1,1.068, 2,1.068, 3,1.069, 4,1.069, 5,1.069,
                                6,1.070, 7,1.070, 8,1.070, 9,1.071, 10,1.071, 15,1.072,
                                20,1.073, 25,1.074, 30,1.075, 35,1.077, 40,1.078, 45,1.079,
                                50,1.081, 60,1.083, 70,1.086, 80,1.089, 90,1.092, 100,1.095,
                                200,1.119, 300,1.147, 400,1.176, 500,1.207, 600,1.240, 700,1.273,
                                800,1.308, 900,1.343, 960,1.364, 970,1.367, 980,1.371, 990,1.374,
                                1000,1.375, 1500,1.553, 2000,1.738, 2500,1.926, 3000,2.115, 4000,2.492,
                                5000,2.868, 6000,3.242, 6960,3.587, 6970,3.594, 6980,3.603, 6990,3.610, 7000,3.617
                              }
                              ;
double voltage_arr[] = { 1.068, 1.068, 1.068, 1.069, 1.069, 1.069,
                                1.070, 1.070, 1.070, 1.071, 1.071, 1.072,
                                1.073, 1.074, 1.075, 1.077, 1.078, 1.079,
                                1.081, 1.083, 1.086, 1.089, 1.092, 1.095,
                                1.119, 1.147, 1.176, 1.207, 1.240, 1.273,
                                1.308, 1.343, 1.364, 1.367, 1.371, 1.374,
                                1.375, 1.553, 1.738, 1.926, 2.115, 2.492,
                                2.868, 3.242, 3.587, 3.594, 3.603, 3.610,3.617
}
;
double flow_arr[] = { 0, 1, 2, 3, 4, 5,6, 7, 8, 9,10,15,
                                20, 25, 30, 35,40, 45,
                                50, 60, 70, 80, 90, 100,
                                200, 300, 400, 500, 600,700,
                                800, 900, 960, 970, 980, 990,
                                1000, 1500, 2000, 2500, 3000, 4000,
                                5000, 6000, 6960, 6970, 6980, 6990, 7000
}
;
pid_p pid;

//pid位置式
void PID_init()
{
   
    pid.SetVoltage= 0.0;		//设定的预期电压值
    pid.ActualVoltage= 0.0;		//adc实际电压值
    pid.err= 0.0;				//当前次实际与理想的偏差
    pid.err_last=0.0;			//上一次的偏差
    pid.voltage= 0.0;			//控制电压值
    pid.integral= 0.0;			//积分值
    pid.Kp= 0.1;				//比例系数
    pid.Ki= 0.0105;				//积分系数
//	pid.Ki= 0.0;
    pid.Kd= 0.02;				//微分系数
//	pid.Kd= 0.0;				//微分系数
    pid.umax=10.0;
    pid.umin=0.0;
    
}
double VoltagetoFlow(double voltage)
{
	return BinarySearch(voltage ,1);
}
double FlowtoVoltage(double flow)
{
	return BinarySearch(flow ,2);
}
double PID_realize(double set_voltage, double voltage_adc)
{
    int index;
    pid.SetVoltage = 2.5;						//固定电压值传入
	pid.ActualVoltage = voltage_adc;				//实际电压传入 = ADC_Value * 3.3f/ 4096
    pid.err = pid.SetVoltage - pid.ActualVoltage;	//计算偏差
	sprintf(display_buf,"err:%.3f",pid.err);
	strcat(display_buf,"v\r\n");
	RS485_Send_Data((u8*)display_buf,strlen(display_buf));
		if(pid.ActualVoltage>pid.umax)
		{
			if(fabs((double)pid.err)>0.2)
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
			if(fabs((double)pid.err)>0.2)
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
			if(fabs((double)pid.err)>0.2)
				index=0;
			else
			{
				index=1;
				pid.integral+=pid.err;
			}
		}
	sprintf(display_buf,"integral:%.3f",pid.integral);
	strcat(display_buf,"v\r\n");
	RS485_Send_Data((u8*)display_buf,strlen(display_buf));
    pid.voltage = pid.SetVoltage+pid.Kp * pid.err + index * pid.Ki * pid.integral + pid.Kd * ( pid.err - pid.err_last);//位置式公式
	sprintf(display_buf,"pid.voltage:%.3f",pid.voltage);
	strcat(display_buf,"v\r\n");
	RS485_Send_Data((u8*)display_buf,strlen(display_buf));
		
    pid.err_last = pid.err;					//留住上一次误差
	
	
	pid_set=0;
//		if(pid_set==0)
//		{
//			
//			RS485_Send_Data("1",1);
//			
//		}
    return pid.voltage;
}
double BinarySearch(double num ,int mode)
{
    int low = 0;
    int high;
    int i;
 switch (mode)
    {
        case 1:
            high = sizeof(voltage_arr) / sizeof(double) - 1;
            while (low <= high)
            {
                i = (high + low) / 2;
                if (fabs(num - voltage_arr[i]) <= EPSILON)
                    return flow_arr[i];
                if (num - voltage_arr[i] > EPSILON)
                    low = i + 1;
                else if (voltage_arr[i] - num > EPSILON)
                    high = i - 1;
            }
            if ((num - 1.095) >= EPSILON && (1.119 - num) > EPSILON)
                return (double)((num - 1.071) / 0.00024);
            else if ((num - 1.119) >= EPSILON && (1.147 - num) > EPSILON)
                return (double)((num - 1.063) / 0.00028);
            else if ((num - 1.147) >= EPSILON && (1.176 - num) > EPSILON)
                return (double)((num - 1.06) / 0.00029);
            else if ((num - 1.176) >= EPSILON && (1.207 - num) > EPSILON)
                return (double)((num - 1.052) / 0.00031);
            else if ((num - 1.207) >= EPSILON && (1.273 - num) > EPSILON)
                return (double)((num - 1.042) / 0.00033);
            else if ((num - 1.273) >= EPSILON && (1.364 - num) > EPSILON)
                return (double)((num - 1.028) / 0.00035);
            else if ((num - 1.364) >= EPSILON && (1.375 - num) > EPSILON)
                return (double)((num - 1.1) / 0.000275);
            else if ((num - 1.375) >= EPSILON && (1.553 - num) >= EPSILON)
                return (double)((num - 1.019) / 0.000356);
            else if ((num - 1.553) >= EPSILON && (1.738 - num) >= EPSILON)
                return (double)((num - 0.998) / 0.00037);
            else if ((num - 1.738) >= EPSILON && (2.492 - num) >= EPSILON)
                return (double)((num - 0.984) / 0.000377);
            else if ((num - 2.492) >= EPSILON && (3.242 - num) >= EPSILON)
                return (double)((num - 0.992) / 0.000375);
            else if ((num - 3.242) >= EPSILON && (3.587 - num) >= EPSILON)
                return (double)((num -1.082) / 0.00036);
            else if ((num - 3.587) >= EPSILON && (3.617 - num) >= EPSILON)
                return (double)((num + 1.633) / 0.00075);
            return flow_arr[i];
            break;
        case 2:
            high = sizeof(flow_arr) / sizeof(double) - 1;
            while (low <= high)
            {
                i = (high + low) / 2;
                if (fabs(num - flow_arr[i]) <= EPSILON)
                    return voltage_arr[i];
                if (num - flow_arr[i] > EPSILON)
                    low = i + 1;
                else if (flow_arr[i] - num > EPSILON)
                    high = i - 1;
            }
            if ((num - 100) >= EPSILON && (200 - num) > EPSILON)
                return (double)(num * 0.00024 + 1.071);
            else if ((num - 200) >= EPSILON && (300 - num) > EPSILON)
                return (double)(num * 0.00028 + 1.063);
            else if ((num - 300) >= EPSILON && (400 - num) > EPSILON)
                return (double)(num * 0.00029 + 1.06);
            else if ((num - 400) >= EPSILON && (500 - num) > EPSILON)
                return (double)(num * 0.00031 + 1.052);
            else if ((num - 500) >= EPSILON && (700 - num) > EPSILON)
                return (double)(num * 0.00033 + 1.042);
            else if ((num - 700) >= EPSILON && (960 - num) > EPSILON)
                return (double)(num * 0.00035 + 1.028);//
            else if ((num - 960) >= EPSILON && (1000 - num) > EPSILON)
                return (double)(num * 0.000275 + 1.1);//
            else if ((num - 1000) >= EPSILON && (1500 - num) > EPSILON)
                return (double)(num * 0.000356 + 1.019);
            else if ((num - 1500) >= EPSILON && (2000 - num) >= EPSILON)
                return (double)(num * 0.00037 + 0.998);
            else if ((num - 2000) >= EPSILON && (4000 - num) >= EPSILON)
                return (double)(num * 0.000377 + 0.984);
            else if ((num - 4000) >= EPSILON && (6000 - num) >= EPSILON)
                return (double)(num * 0.000375 + 0.992);
            else if ((num - 6000) >= EPSILON && (6960 - num) >= EPSILON)
                return (double)(num * 0.00036 + 1.082);
            else if ((num - 6960) >= EPSILON && (7000 - num) >= EPSILON)
                return (double)(num * 0.00075 - 1.633);
            return voltage_arr[i];
            break;
    default:
        break;
    }
	return 0;
}

