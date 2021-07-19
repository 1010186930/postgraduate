

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
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);  //�ж����ȼ����� ��2��
	LED_Init();
	KEY_Init();
	My_EXTI_Init();  //�ⲿ�жϳ�ʼ��
	USART1_Init(9600);
	TIM4_Init(200-1,7200-1);  //��ʱ20ms
	
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
