#include "stdio.h"
#include "stdlib.h"
typedef struct _pid {
	float SetFlow;
	float ActualFlow;
	float err;
	float err_next;
	float err_last;
	float Kp, Ki, Kd;
	float OutputVoltage;
	float integral;
	float umax;
	float umin;
}PID;
PID pid;
void PID_Init()
{
	printf("PID_Init Begin\n");
	pid.SetFlow = 0.0;
	pid.ActualFlow = 0.0;
	pid.err = 0.0;
	pid.err_last = 0.0;
	pid.err_next = 0.0;
	pid.Kp = 0.1;
	pid.Ki = 0.8;
	pid.Kd = 0.1;
	pid.OutputVoltage= 0.0;
	pid.integral = 0.0;
	pid.umax = 10.0;
	pid.umin = 0.0;
	printf("PID Init Finish\n");
}
float PID_Pos_Control(float flow)
{
	pid.SetFlow = flow;
	pid.err = pid.SetFlow - pid.ActualFlow;
	pid.integral += pid.err;
	pid.OutputVoltage = pid.Kp * pid.err + pid.Ki * pid.integral + pid.Kd * (pid.err - pid.err_last);
	pid.err_last = pid.err;
	pid.ActualFlow = pid.OutputVoltage * 1.0;
	return pid.ActualFlow;
}
float PID_Incre_Control(float flow)
{
	pid.SetFlow = flow;
	pid.err = pid.SetFlow - pid.ActualFlow;
	float increment = pid.Kp * (pid.err - pid.err_next) + pid.Ki * pid.err + pid.Kd * (pid.err-2 * pid.err_next + pid.err_last);
	pid.ActualFlow += increment;
	pid.err_last = pid.err_next;
	pid.err_next = pid.err;
	return pid.ActualFlow;
}
float PID_Separate_Integral(float flow)
{
	int index;
	pid.SetFlow = flow;
	pid.err = pid.SetFlow - pid.ActualFlow;
	if (abs((int)pid.err) > 200)
	{
		index = 0;

	}
	else
	{
		index = 1;
		pid.integral += pid.err;
	}
	pid.OutputVoltage = pid.Kp * pid.err + index * pid.Ki * pid.integral + pid.Kd * (pid.err - pid.err_last);
	pid.err_last = pid.err;
	pid.ActualFlow = pid.OutputVoltage * 1.0;
	return pid.ActualFlow;
}
float PID_anti_windup(float flow)
{
	int index;
	pid.SetFlow = flow;
	pid.err = pid.SetFlow - pid.ActualFlow;
	if (pid.ActualFlow > pid.umax)
	{
		if (abs((int)pid.err) > 5)
		{
			index = 0;

		}
		else
		{
			index = 1;
			if(pid.err<0)
			pid.integral += pid.err;
		}
	}
	else if(pid.ActualFlow<pid.umin)
	{
		if (abs((int)pid.err) > 5)
		{
			index = 0;

		}
		else
		{
			index = 1;
			if (pid.err > 0)
				pid.integral += pid.err;
		}
	}
	else
	{
		if (abs((int)pid.err) > 5)
		{
			index = 0;

		}
		else
		{
			index = 1;
			pid.integral += pid.err;
		}
	}
	
	pid.OutputVoltage = pid.Kp * pid.err + index * pid.Ki * pid.integral + pid.Kd * (pid.err - pid.err_last);
	pid.err_last = pid.err;
	pid.ActualFlow = pid.OutputVoltage * 1.0;
	return pid.ActualFlow;
}
int main()
{
	PID_Init();
	int count = 0;
	while (count < 1000)
	{
		float flow = PID_anti_windup(1.068);
		printf("%f\n", flow);
		count++;
	}
}