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
	delay_init();	    	 //��ʱ������ʼ��
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	KEY_Init();  //����ģ��
	LED_Init();   //����ָʾ��
	Modbus_RegMap();//modbusͨѶ  
	RS485_Init();//Ӳ����ͨѶʹ��
	uart_init(9600);  //����ͨѶ
	Timer4_enable(5000);	//250ms	ͨѶ���Ŀ����� 
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

