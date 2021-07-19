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
  * @brief  key1��key2���ⲿ�жϳ�ʼ��
  *
  * @param  ��

  * @retval ��
  */
void EXTIX_Init(void)
{

    EXTI_InitTypeDef EXTI_InitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;

    KEY_Init();	 //	�����˿ڳ�ʼ��

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,ENABLE);	//ʹ�ܸ��ù���ʱ��



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
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x02;	//��ռ���ȼ�2��
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x03;					//�����ȼ�3
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;								//ʹ���ⲿ�ж�ͨ��
    NVIC_Init(&NVIC_InitStructure);

    NVIC_InitStructure.NVIC_IRQChannel = EXTI3_IRQn;			
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x02;	//��ռ���ȼ�2
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x01;					//�����ȼ�1
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;								//ʹ���ⲿ�ж�ͨ��
    NVIC_Init(&NVIC_InitStructure);  	  //����NVIC_InitStruct��ָ���Ĳ�����ʼ������NVIC�Ĵ���


}

//�ⲿ�ж�2������� ֧��key1�̰���key1���º�����ʱ��4
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


//�ⲿ�ж�3�������key2��key1����ʱ����Ч
void EXTI3_IRQHandler(void)
{
    delay_ms(10);//����
    if(KEY2==0)	 
    {
		if(key1_pressed==1)
		{
			key_down_fall_flag=1;
		}
    }
    EXTI_ClearITPendingBit(EXTI_Line3);  //���LINE3�ϵ��жϱ�־λ
}



