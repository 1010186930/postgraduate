#include "led.h"
#include "delay.h"
#include "key.h"
#include "sys.h"
#include "usart.h"
#include "exti.h"
#include "time.h"

/************************************************
 ALIENTEK精英STM32开发板实验5
 外部中断 实验 
 技术支持：www.openedv.com
 淘宝店铺：http://eboard.taobao.com 
 关注微信公众平台微信号："正点原子"，免费获取STM32资料。
 广州市星翼电子科技有限公司  
 作者：正点原子 @ALIENTEK
************************************************/
	
 int main(void)
 {		
	delay_init();	    	 //延时函数初始化	  
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2); //设置NVIC中断分组2:2位抢占优先级，2位响应优先级
	uart_init(115200);	 //串口初始化为115200
	LED_Init();		  		//初始化与LED连接的硬件接口 
	EXTIX_Init();         	//初始化外部中断输入 
	TIM4_Init(200-1,7200-1);  //定时20ms
	while(1)
	{	    
		K_UP_sacnf_func();
		delay_ms(10);	
	}	 
}
