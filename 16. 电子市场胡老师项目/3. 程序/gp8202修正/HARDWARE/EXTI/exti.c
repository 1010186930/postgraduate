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

//外部中断0服务程序 支持长短按
void EXTI2_IRQHandler(void)
{
	if(EXTI_GetITStatus(EXTI_Line2)==1)
    {
        delay_ms(10);
        if(KEY1 == 0 )
        {
			key1_pressed=1;
			key_up_fall_flag = 1;
//			bit_index+=1;
//			if(bit_index>=8)
//				bit_index=1; 
//			switch(bit_index)
//			{
//				BACK_COLOR=BLACK;
//				POINT_COLOR=RED;
//				case 1:
//					LCD_Fill(5,110,13,130,BLACK);
//					break;
//				case 2:
//					LCD_Fill(5+16*6,110,5+16*7,130,BLACK);
//					break;
//				case 3:
//					LCD_Fill(5+16*5,110,5+16*6,130,BLACK);
//					break;
//				case 4:
//					LCD_Fill(5+16*3,110,5+16*4,130,BLACK);
//					break;
//				case 5:
//					LCD_Fill(5+16*2,110,5+16*3,130,BLACK);
//					break;
//				case 6:
//					LCD_Fill(5+16,110,5+16*2,130,BLACK);
//					break;
//				case 7:
//					LCD_Fill(5,110,5+16,130,BLACK);
//					break;
//				default:
//					break;
//			}
		
			
			
			
//			key1_pressed=1;
//			if(set_flowvalue<=7000)
//				set_flowvalue+=10;
//			else
//				set_flowvalue=0;
//		memset(display_setflowvalue,'\0',sizeof(display_setflowvalue)/sizeof(char));
//        sprintf(display_setflowvalue,"%.3f",set_flowvalue);
//		strcat(display_setflowvalue,unit);
//        LCD_Fill(5,110,200,130,WHITE);
//		POINT_COLOR=BROWN;
//        Show_Str(5,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
        TIM_Cmd(TIM4, ENABLE);
        }

    } 
    EXTI_ClearITPendingBit(EXTI_Line2);
}


//外部中断3服务程序
void EXTI3_IRQHandler(void)
{
    delay_ms(10);//消抖
    if(KEY2==0)	 
    {
		
		if(key1_pressed==1)
		{
			key_down_fall_flag=1;
//			index_value+=1;
//			if(index_value>=10)
//				index_value=0;
//			switch(index)
//			{
//				BACK_COLOR=BLACK;
//				POINT_COLOR=RED;
//				case 0:
//					LCD_ShowNum(5+16*7,110,index_value,1,1);
//					set_flowvalue+=index_value*0.001;
//					break;
//				case 1:
//					LCD_Fill(5+16*6,110,5+16*7,130,BLACK);
//					break;
//				case 2:
//					LCD_Fill(5+16*5,110,5+16*6,130,BLACK);
//					break;
//				case 3:
//					LCD_Fill(5+16*3,110,5+16*4,130,BLACK);
//					break;
//				case 4:
//					LCD_Fill(5+16*2,110,5+16*3,130,BLACK);
//					break;
//				case 5:
//					LCD_Fill(5+16,110,5+16*2,130,BLACK);
//					break;
//				case 6:
//					LCD_ShowNum(5,110,5+16,130,BLACK);
//					break;
//				default:
//					break;
//			}
			
//			if(set_flowvalue!=0)
//				set_flowvalue-=10;
//			memset(display_setflowvalue,'\0',sizeof(display_setflowvalue)/sizeof(char));
//			sprintf(display_setflowvalue,"%.3f",set_flowvalue);
//			strcat(display_setflowvalue,unit);
//			LCD_Fill(5,110,200,130,WHITE);
//			POINT_COLOR=BROWN;
//			Show_Str(5,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
		}
    }
    EXTI_ClearITPendingBit(EXTI_Line3);  //清除LINE3上的中断标志位
}



