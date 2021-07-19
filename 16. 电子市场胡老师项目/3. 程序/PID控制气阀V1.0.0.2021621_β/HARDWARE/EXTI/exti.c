#include "exti.h"
#include "key.h"
#include "delay.h"
#include "usart.h"
#include "gui.h"
#include "lcd.h"
#include "string.h"
#include "rs485.h"
extern __IO u8 key_up_fall_flag;
extern __IO u8 key_down_fall_flag;


__IO u8 key1_pressed=0;
/** 
  * @name   EXTIX_Init
  *
  * @brief  key1和key2的外部中断初始化
  *
  * @param  无

  * @retval 无
  */
void EXTIX_Init(void)
{

    EXTI_InitTypeDef EXTI_InitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;

    KEY_Init();	 //	按键端口初始化

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,ENABLE);	//使能复用功能时钟



    GPIO_EXTILineConfig(GPIO_PortSourceGPIOC,GPIO_PinSource2);
    EXTI_InitStructure.EXTI_Line=EXTI_Line2;
    EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
    EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
    EXTI_Init(&EXTI_InitStructure);	  	


    GPIO_EXTILineConfig(GPIO_PortSourceGPIOC,GPIO_PinSource3);
    EXTI_InitStructure.EXTI_Line=EXTI_Line3;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
    EXTI_Init(&EXTI_InitStructure);	

    


    NVIC_InitStructure.NVIC_IRQChannel = EXTI2_IRQn;			
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x02;	//抢占优先级2，
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x03;					//子优先级3
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;								//使能外部中断通道
    NVIC_Init(&NVIC_InitStructure);

    NVIC_InitStructure.NVIC_IRQChannel = EXTI3_IRQn;			
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x02;	//抢占优先级2
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x01;					//子优先级1
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;								//使能外部中断通道
    NVIC_Init(&NVIC_InitStructure);  	  //根据NVIC_InitStruct中指定的参数初始化外设NVIC寄存器


}

//外部中断2服务程序 支持key1短按，key1按下后开启定时器4
void EXTI2_IRQHandler(void)
{
	if(EXTI_GetITStatus(EXTI_Line2)==1)
    {
        delay_ms(10);
        if(KEY1 == 0 )
        {
			key1_pressed=1;
			key_up_fall_flag = 1;
			TIM_Cmd(TIM4, ENABLE);
        }
    } 
    EXTI_ClearITPendingBit(EXTI_Line2);
}


//外部中断3服务程序，key2在key1按下时才有效
void EXTI3_IRQHandler(void)
{
    delay_ms(10);//消抖
    if(KEY2==0)	 
    {
		if(key1_pressed==1)
		{
			key_down_fall_flag=1;
		}
    }
    EXTI_ClearITPendingBit(EXTI_Line3);  //清除LINE3上的中断标志位
}



