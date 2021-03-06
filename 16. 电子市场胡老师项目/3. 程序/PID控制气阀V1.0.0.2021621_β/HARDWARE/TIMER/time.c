#include "time.h"
#include "key.h"
#include "usart.h"
#include "delay.h"
#include "GUI.h"
#include "lcd.h"
#include "string.h"
#include "rs485.h"
#include "exti.h"
#include "pid.h"
#include "math.h"
#define EPSILON 1e-6
__IO u8 key_up_fall_flag=0;					//?Ͻ???????
__IO u8 key_down_fall_flag=0;
bool key_up_up_flag=FALSE;
#define short_click_k1 11
#define short_click_k2 12
#define double_click 13
u8 K_UP_status=0;
u8 K_DOWN_status=0;
u8 key=0;
__IO u16 data=0;
u8 tmp=0;
static u8 bit_index=0;
static u8 index_value=0;
u8 RS485_FrameFlag=0;


u8 Float_to_Bit(double num, u8* thousand, u8* hundred, u8* ten, u8* unit, u8* tenths, u8* percentile, u8* thousandth)
{
	u8 len=0;
	u8 intelen = 0;
	char buf[9] = "";
	char* p = buf;
	sprintf(buf, "%.3f", num);
	len= strlen(buf);
	p = strchr((const char*)buf, '.');
	intelen = (u8)(p-buf);
	switch (intelen)
	{
	case 1:
		*thousand = 0;
		*hundred = 0;
		*ten = 0;
		*unit = buf[0] - '0';
		*tenths = buf[2] - '0';
		*percentile = buf[3] - '0';
		*thousandth = buf[4] - '0';
		break;
	case 2:
		*thousand = 0;
		*hundred = 0;
		*ten = buf[0] - '0';
		*unit = buf[1] - '0';
		*tenths = buf[3] - '0';
		*percentile = buf[4] - '0';
		*thousandth = buf[5] - '0';
		break;
	case 3:
		*thousand = 0;
		*hundred = buf[0] - '0';
		*ten = buf[1] - '0';
		*unit = buf[2] - '0';
		*tenths = buf[4] - '0';
		*percentile = buf[5] - '0';
		*thousandth = buf[6] - '0';
		break;
	case 4:
		*thousand = buf[0] - '0';
		*hundred = buf[1] - '0';
		*ten = buf[2] - '0';
		*unit = buf[3] - '0';
		*tenths = buf[5] - '0';
		*percentile = buf[6] - '0';
		*thousandth = buf[7] - '0';
		break;
	default:
		break;
	}
	p = NULL;
	return len;
}

void K_UP_sacnf_func(u8 len,u8* thousand,u8* hundred,u8* ten,u8* unit,u8* tenths, u8* percentile,u8* thousandth) {
	
    switch(K_UP_status) 
	{
		case 11:
			set_flag=1;
			bit_index+=1;
			if(bit_index>=8)
				bit_index=1; 
			BACK_COLOR=WHITE;
			POINT_COLOR=BROWN;
			LCD_ShowNum(5,110,*thousand,1,16);
			LCD_ShowNum(13,110,*hundred,1,16);
			LCD_ShowNum(21,110,*ten,1,16);
			LCD_ShowNum(29,110,*unit,1,16);
			LCD_ShowNum(45,110,*tenths,1,16);
			LCD_ShowNum(53,110,*percentile,1,16);
			LCD_ShowNum(61,110,*thousandth,1,16);
			switch(bit_index)
			{
				case 1:
					BACK_COLOR=WHITE;
					POINT_COLOR=BROWN;
					LCD_Fill(5,110,13,126,WHITE);
					LCD_ShowNum(5,110,*thousand,1,16);
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(61,110,69,126,BLACK);
					LCD_ShowNum(61,110,*thousandth,1,16);
					break;
				case 2:
					BACK_COLOR=WHITE;
					POINT_COLOR=BROWN;
					LCD_Fill(61,110,69,126,WHITE);
					LCD_ShowNum(61,110,*thousandth,1,16);
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(53,110,61,126,BLACK);
					LCD_ShowNum(53,110,*percentile,1,16);
					break;
				case 3:
					BACK_COLOR=WHITE;
					POINT_COLOR=BROWN;
					LCD_Fill(53,110,61,126,WHITE);
					LCD_ShowNum(53,110,*percentile,1,16);
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(45,110,53,126,BLACK);
					LCD_ShowNum(45,110,*tenths,1,16);
					break;
				case 4:
					BACK_COLOR=WHITE;
					POINT_COLOR=BROWN;
					LCD_Fill(45,110,53,126,WHITE);
					LCD_ShowNum(45,110,*tenths,1,16);
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(29,110,37,126,BLACK);
					LCD_ShowNum(29,110,*unit,1,16);
					break;
				case 5:
					BACK_COLOR=WHITE;
					POINT_COLOR=BROWN;
					LCD_Fill(29,110,37,126,WHITE);
					LCD_ShowNum(29,110,*unit,1,16);
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(21,110,29,126,BLACK);
					LCD_ShowNum(21,110,*ten,1,16);
					break;
				case 6:
					BACK_COLOR=WHITE;
					POINT_COLOR=BROWN;
					LCD_Fill(21,110,29,126,WHITE);
					LCD_ShowNum(21,110,*ten,1,16);
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(13,110,21,126,BLACK);
					LCD_ShowNum(13,110,*hundred,1,16);
					break;
				case 7:
					BACK_COLOR=WHITE;
					POINT_COLOR=BROWN;
					LCD_Fill(13,110,21,126,WHITE);
					LCD_ShowNum(13,110,*hundred,1,16);
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(5,110,13,126,BLACK);
					LCD_ShowNum(5,110,*thousand,1,16);
					break;
				default:
					break;
			}
        K_UP_status=0;
        break;
    case 12:
		
		switch(bit_index)
			{
				case 1:
					index_value=*thousandth;
					index_value+=1;
					if(index_value>=10)
						index_value=0;
					*thousandth=index_value;
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(61,110,69,126,BLACK);
					LCD_ShowNum(61,110,*thousandth,1,16);
					break;
				case 2:
					index_value=*percentile;
					index_value+=1;
					if(index_value>=10)
						index_value=0;
					*percentile=index_value;
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(53,110,61,126,BLACK);
					LCD_ShowNum(53,110,*percentile,1,16);
					break;
				case 3:
					index_value=*tenths;
					index_value+=1;
					if(index_value>=10)
						index_value=0;
					*tenths=index_value;
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(45,110,53,126,BLACK);
					LCD_ShowNum(45,110,*tenths,1,16);
					break;
				case 4:
					index_value=*unit;
					index_value+=1;
					if(index_value>=10)
						index_value=0;
					*unit=index_value;
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(29,110,37,126,BLACK);
					LCD_ShowNum(29,110,*unit,1,16);
					break;
				case 5:
					index_value=*ten;
					index_value+=1;
					if(index_value>=10)
						index_value=0;
					*ten=index_value;
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(21,110,29,126,BLACK);
					LCD_ShowNum(21,110,*ten,1,16);
					break;
				case 6:
					index_value=*hundred;
					index_value+=1;
					if(index_value>=10)
						index_value=0;
					*hundred=index_value;
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(13,110,21,126,BLACK);
					LCD_ShowNum(13,110,*hundred,1,16);
					break;
				case 7:
					index_value=*thousand;
					index_value+=1;
					if(index_value>=10)
						index_value=0;
					*thousand=index_value;
					BACK_COLOR=BLACK;
					POINT_COLOR=RED;
					LCD_Fill(5,110,13,126,BLACK);
					LCD_ShowNum(5,110,*thousand,1,16);
					break;
				default:
					break;
			}
        K_UP_status=0;
        break;
    case 13:
        K_UP_status=0;
        break;
    default:
        break;
    }
}

/*******************************************************************************
* ?? ?? ??         : TIM4_Init
* ????????		   : TIM4??ʼ??????
* ??    ??         : per:??װ??ֵ
					 psc:??Ƶϵ??
* ??    ??         : ??
*******************************************************************************/
void TIM4_Init(u16 per,u16 psc)
{
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4,ENABLE);//ʹ??TIM4ʱ??

    TIM_TimeBaseInitStructure.TIM_Period=per;   //?Զ?װ??ֵ
    TIM_TimeBaseInitStructure.TIM_Prescaler=psc; //??Ƶϵ??
    TIM_TimeBaseInitStructure.TIM_ClockDivision=TIM_CKD_DIV1;
    TIM_TimeBaseInitStructure.TIM_CounterMode=TIM_CounterMode_Up; //???????ϼ???ģʽ
    TIM_TimeBaseInit(TIM4,&TIM_TimeBaseInitStructure);

    TIM_ITConfig(TIM4,TIM_IT_Update,ENABLE); //??????ʱ???ж?
    TIM_ClearITPendingBit(TIM4,TIM_IT_Update);

    NVIC_InitStructure.NVIC_IRQChannel = TIM4_IRQn;//??ʱ???ж?ͨ??
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority=2;//??ռ???ȼ?
    NVIC_InitStructure.NVIC_IRQChannelSubPriority =1;		//?????ȼ?
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;			//IRQͨ??ʹ??
    NVIC_Init(&NVIC_InitStructure);
}
void TIM3_Init(u16 per,u16 psc)
{
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3,ENABLE);//ʹ??TIM3ʱ??

    TIM_TimeBaseInitStructure.TIM_Period=per;   //?Զ?װ??ֵ
    TIM_TimeBaseInitStructure.TIM_Prescaler=psc; //??Ƶϵ??
    TIM_TimeBaseInitStructure.TIM_ClockDivision=TIM_CKD_DIV1;
    TIM_TimeBaseInitStructure.TIM_CounterMode=TIM_CounterMode_Up; //???????ϼ???ģʽ
    TIM_TimeBaseInit(TIM3,&TIM_TimeBaseInitStructure);

    TIM_ITConfig(TIM3,TIM_IT_Update,ENABLE); //??????ʱ???ж?
    TIM_ClearITPendingBit(TIM3,TIM_IT_Update);

    NVIC_InitStructure.NVIC_IRQChannel = TIM3_IRQn;//??ʱ???ж?ͨ??
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority=2;//??ռ???ȼ?
    NVIC_InitStructure.NVIC_IRQChannelSubPriority =3;		//?????ȼ?
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;			//IRQͨ??ʹ??
    NVIC_Init(&NVIC_InitStructure);

    TIM_Cmd(TIM3,ENABLE); //ʹ?ܶ?ʱ??
}
/*******************************************************************************
* ?? ?? ??         : TIM4_IRQHandler
* ????????		   : TIM4?жϺ???
* ??    ??         : ??
* ??    ??         : ??
*******************************************************************************/
void TIM3_IRQHandler(void)
{          
	u8 rs485sendbuf[100]="";	
	char display[10]="";
	double show_num=0;
	double display_acd_volatge=0;
	if(TIM_GetITStatus(TIM3,TIM_IT_Update)!=RESET)
	{
		TIM_ClearITPendingBit(TIM3,TIM_IT_Update);//?????жϱ?־
//		strcpy((char*)rs485sendbuf,"@");
//		display_acd_volatge=voltage_adc-2.584;
//		if(display_acd_volatge<0)
//			display_acd_volatge=0;
//		sprintf(display,"%.3f",display_acd_volatge);
//		strcat((char*)rs485sendbuf,display);
//		strcat((char*)rs485sendbuf,"V");
//		show_num=VoltagetoFlow(display_acd_volatge);
//		if(fabs(show_num-7000)>EPSILON&&show_num>7000)
//		show_num=7000.000;
//		strcat((char*)rs485sendbuf,"@");
//		sprintf(display,"%.3f",show_num);
//		strcat((char*)rs485sendbuf,display);
//		strcat((char*)rs485sendbuf,"mL/S\r\n");
//		RS485_SendData(rs485sendbuf,strlen((char*)rs485sendbuf));
//		memset(rs485sendbuf,'\0',sizeof(rs485sendbuf)/sizeof(char));
//????ʹ?ã?		strcpy((char*)rs485sendbuf,"@3.995V@345mL/S\r\n");	
//				RS485_SendData(rs485sendbuf,strlen((char*)rs485sendbuf));
	}
}


void TIM4_IRQHandler(void)
{
	static u32 key_holdon_ms=0;
	static u8 cnt=0;
	if(TIM_GetITStatus(TIM4,TIM_IT_Update))
	{
		if(key_up_fall_flag==1)//?????????????¼?
		{
			if(KEY1==0)//????????????
			{
				cnt=0;
				
				if(key_holdon_ms <= 70)
				{
					key_holdon_ms++;
				}
			}
			else //????̧??
			{
				if(key_holdon_ms>3)//????ʱ??????60ms?????ɵ?????־
				{
					K_UP_status=short_click_k1;
					key_holdon_ms=0;
					key_up_fall_flag=0;
				}
				else  //????????ʱ??С??60ms??????
				{
					key_holdon_ms=0;
					K_UP_status=0;
					key_up_fall_flag=0;
				}
			}
		}
		else
			cnt++;
		if(key_down_fall_flag==1)//?????????????¼?
		{
			if(KEY2==0)//????????????
			{
				cnt=0;
				if(key_holdon_ms <= 70)
				{
					key_holdon_ms++;
				}		
			}
			else //????̧??
			{
				if(key_holdon_ms>3)//????ʱ??????60ms?????ɵ?????־
				{
					K_UP_status=short_click_k2;
					key_holdon_ms=0;
					key_down_fall_flag=0;
				}
				else  //????????ʱ??С??60ms??????
				{
					key_holdon_ms=0;
					K_UP_status=0;
					key_down_fall_flag=0;
				}
			}		
		}
		if(cnt>=250)
		{
			key1_pressed=0;
			bit_index=0;
			index_value=0;
			set_flag=0;
			cnt=0;
			TIM_Cmd(TIM4, DISABLE);
		}
	}
	TIM_ClearITPendingBit(TIM4,TIM_IT_Update);
}





