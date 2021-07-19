

#include "system.h"
#include "SysTick.h"
#include "led.h"
#include "key.h"
#include "usart.h"
#include "exti.h"
#include "time.h"
 __IO u16 data=0;
int main()
{
	u8 i;
	SysTick_Init(72);
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);  //中断优先级分组 分2组
	LED_Init();
	KEY_Init();
	My_EXTI_Init();  //外部中断初始化
	USART1_Init(9600);
	TIM4_Init(200-1,7200-1);  //定时20ms
	
	while(1)
	{
		i++;
		K_UP_sacnf_func();
		if(i%20==0)
		{
			led1=!led1;
		}
		delay_ms(10);	
	}
}
