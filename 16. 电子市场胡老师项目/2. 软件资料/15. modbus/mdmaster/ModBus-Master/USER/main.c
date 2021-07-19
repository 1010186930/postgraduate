#include "led.h"
#include "delay.h"
#include "sys.h"
#include "key.h"
#include "usart.h"
#include "timer.h"
#include "master.h" 
#include "stdio.h"

//#include "12864.h"
int main(void)
{
  static int s,errsolve,state,test=0;
	static int volA,i;
	int a[10];
	SystemInit();
	delay_init();	    	 //延时函数初始化
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	KEY_Init();  //控制模块
	LED_Init();   //报错指示灯
	Modbus_RegMap();//modbus通讯  
	RS485_Init();//硬件层通讯使能
	uart_init(9600);  //电脑通讯
	Timer4_enable(5000);	//250ms	通讯节拍控制器 
	while(1)
	{
    s=erroeback();
    volA=volback();
		errsolve=errpaceback();
		state=stateback();
		if(test!=state)
		{	
		printf("%3d,%3d,%3d,%3d\n",s,volA,errsolve,state);
			for(i=0;i<8;i++)
			{
				a[i]=RS485_RX_BUFFback(i);
				printf("%8d",a[i]);
			}
		printf("\n");	
		test=state;
		}
	}	 
}

