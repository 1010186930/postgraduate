#include "time.h"
#include "key.h"
#include "usart.h"
#include "delay.h"
#include "GUI.h"
#include "lcd.h"
#include "string.h"
#include "rs485.h"
#include "exti.h"
__IO u8 key_up_fall_flag=0;					//上健被按下
__IO u8 key_down_fall_flag=0;
//u8 short_key_flag=0;							//清短按键标
//u8 long_key_flag=0;
//bool double_click=FALSE;
bool key_up_up_flag=FALSE;
//char display_setflowvalue[50]="";
//const char valve_unit[3]="ml";
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



u8 Float_to_Bit(double num, u8* thousand, u8* hundred, u8* ten, u8* unit, u8* tenths, u8* percentile, u8* thousandth)
{
	u8 len=0;
	u8 intelen = 0;
	u8 dotlen = 0;
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
//	if(K_UP_status)
//	{
//		switch(len)
//		{
//			case 5:
//				LCD_ShowNum(5,110,0,1,16);
//				LCD_ShowNum(13,110,0,1,16);
//				LCD_ShowNum(21,110,0,1,16);
//				POINT_COLOR=BROWN;
//				Show_Str(29,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
//				break;
//			case 6:
//				LCD_ShowNum(5,110,0,1,16);
//				LCD_ShowNum(13,110,0,1,16);
//				POINT_COLOR=BROWN;
//				Show_Str(21,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
//				break;
//			case 7:
//				LCD_ShowNum(5,110,0,1,16);
//				POINT_COLOR=BROWN;
//				Show_Str(13,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
//				break;
//			default:
//				POINT_COLOR=BROWN;
//				Show_Str(5,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
//				break;
//		}
//	}
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
		
//		set_flowvalue+=10;
//		if(set_flowvalue>=7000)
//			set_flowvalue=0;
//		memset(display_setflowvalue,'\0',sizeof(display_setflowvalue)/sizeof(char));
//        sprintf(display_setflowvalue,"%.3f",set_flowvalue);
//		strcat(display_setflowvalue,valve_unit);
//        LCD_Fill(5,110,200,120,WHITE);
//        Show_Str(5,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
//		len=strlen(display_setflowvalue);
//		RS485_Send_Data((u8*)display_setflowvalue,len);

		
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
//	switch(K_DOWN_status){
//
//		case 11:led6=!led6;K_UP_status=0;break;
//		case 12:led7=!led7;K_UP_status=0;break;
//		case 13:led8=!led8;K_UP_status=0;break;
//		default:break;
//	}

}

/*******************************************************************************
* 函 数 名         : TIM4_Init
* 函数功能		   : TIM4初始化函数
* 输    入         : per:重装载值
					 psc:分频系数
* 输    出         : 无
*******************************************************************************/
void TIM4_Init(u16 per,u16 psc)
{
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4,ENABLE);//使能TIM4时钟

    TIM_TimeBaseInitStructure.TIM_Period=per;   //自动装载值
    TIM_TimeBaseInitStructure.TIM_Prescaler=psc; //分频系数
    TIM_TimeBaseInitStructure.TIM_ClockDivision=TIM_CKD_DIV1;
    TIM_TimeBaseInitStructure.TIM_CounterMode=TIM_CounterMode_Up; //设置向上计数模式
    TIM_TimeBaseInit(TIM4,&TIM_TimeBaseInitStructure);

    TIM_ITConfig(TIM4,TIM_IT_Update,ENABLE); //开启定时器中断
    TIM_ClearITPendingBit(TIM4,TIM_IT_Update);

    NVIC_InitStructure.NVIC_IRQChannel = TIM4_IRQn;//定时器中断通道
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority=3;//抢占优先级
    NVIC_InitStructure.NVIC_IRQChannelSubPriority =3;		//子优先级
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;			//IRQ通道使能
    NVIC_Init(&NVIC_InitStructure);

    //TIM_Cmd(TIM4,ENABLE); //使能定时器
}
void TIM3_Init(u16 per,u16 psc)
{
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3,ENABLE);//使能TIM4时钟

    TIM_TimeBaseInitStructure.TIM_Period=per;   //自动装载值
    TIM_TimeBaseInitStructure.TIM_Prescaler=psc; //分频系数
    TIM_TimeBaseInitStructure.TIM_ClockDivision=TIM_CKD_DIV1;
    TIM_TimeBaseInitStructure.TIM_CounterMode=TIM_CounterMode_Up; //设置向上计数模式
    TIM_TimeBaseInit(TIM3,&TIM_TimeBaseInitStructure);

    TIM_ITConfig(TIM3,TIM_IT_Update,ENABLE); //开启定时器中断
    TIM_ClearITPendingBit(TIM3,TIM_IT_Update);

    NVIC_InitStructure.NVIC_IRQChannel = TIM3_IRQn;//定时器中断通道
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority=3;//抢占优先级
    NVIC_InitStructure.NVIC_IRQChannelSubPriority =3;		//子优先级
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;			//IRQ通道使能
    NVIC_Init(&NVIC_InitStructure);

    TIM_Cmd(TIM3,ENABLE); //使能定时器
}
/*******************************************************************************
* 函 数 名         : TIM4_IRQHandler
* 函数功能		   : TIM4中断函数
* 输    入         : 无
* 输    出         : 无
*******************************************************************************/
void TIM3_IRQHandler(void)
{
	if(TIM_GetITStatus(TIM3,TIM_IT_Update))
	{
		u8 senbuf[20]="";
		sprintf(senbuf,"%.3f",voltage_pid);
		strcat(senbuf,"v\r\n");
		RS485_Send_Data((u8*)senbuf,strlen(senbuf));
	}
	TIM_ClearITPendingBit(TIM3,TIM_IT_Update);
}




void TIM4_IRQHandler(void)
{
static u32 key_holdon_ms=0;
static u8 cnt=0;

	if(TIM_GetITStatus(TIM4,TIM_IT_Update))
    {
//		sprintf(display_setflowvalue,"%d",cnt);
//		RS485_Send_Data(display_setflowvalue,4);
//		RS485_Send_Data("\r\n",2);
        if(key_up_fall_flag==1)//发生按键按下事件
        {
            if(KEY1==0)//按键持续按下
            {
				cnt=0;
				
                if(key_holdon_ms <= 70)
                {
                    key_holdon_ms++;
                }
			}
            else //按键抬起
            {
                if(key_holdon_ms>3)//按下时间大于60ms，生成单击标志
                {
					K_UP_status=short_click_k1;
                    key_holdon_ms=0;
                    key_up_fall_flag=0;
                }
                else  //按键持续时间小于60ms，忽略
                {
                    key_holdon_ms=0;
                    K_UP_status=0;
                    key_up_fall_flag=0;
                }
            }
        }
		else
			cnt++;
		if(key_down_fall_flag==1)//发生按键按下事件
        {
			if(KEY2==0)//按键持续按下
			{
				cnt=0;
				if(key_holdon_ms <= 70)
				{
					key_holdon_ms++;
				}		
			}
			else //按键抬起
			{
				if(key_holdon_ms>3)//按下时间大于60ms，生成单击标志
				{
					K_UP_status=short_click_k2;
					key_holdon_ms=0;
					key_down_fall_flag=0;
				}
				else  //按键持续时间小于60ms，忽略
				{
					key_holdon_ms=0;
					K_UP_status=0;
					key_down_fall_flag=0;
				}
			}		
        }
		if(cnt>=250)
		{
			/*change color*/
//			LCD_Fill(5,110,100,126,WHITE);
//			delay_ms(10);
			/*send setvalue*/
			key1_pressed=0;
			bit_index=0;
			index_value=0;
			set_flag=0;
			cnt=0;
//			RS485_Send_Data("time up\r\n",9);
			TIM_Cmd(TIM4, DISABLE);
			TIM_Cmd(TIM3, ENABLE);
		}

//    if(TIM_GetITStatus(TIM4,TIM_IT_Update))
//    {
//        if(key_up_fall_flag==1)//发生按键按下事件
//        {
//            if(KEY1==0)//按键持续按下
//            {
//                key_up_up_flag=FALSE;

//                if(key_holdon_ms <= 70)
//                {
//                    key_holdon_ms++;
//                }
//                else //按键按下到2000ms就判断长按时间成立，生成长按标志
//                {
//                    key_up_fall_flag = 0;//清按键按下标志
//                    key_holdon_ms = 0;
//                    key_up_up_flag=FALSE;
//                    key_up_cnt=0;
//                    K_UP_status = long_click;
//                }
//			}
//            else //按键抬起
//            {

//                if(key_holdon_ms>3)//按下时间大于50ms，生成单击标志
//                {
//                    key_holdon_ms=0;
//                    K_UP_status=short_click;
//                    key_up_fall_flag=0;
//                    //led6=!led6;

//                    key_up_cnt = 0;
//                    key_up_up_flag=TRUE;//单击抬起按键后，生成按键抬起标志

//                }
//                else  //按键持续时间小于50ms，忽略
//                {
//                    key_holdon_ms=0;
//                    key_up_cnt=0;
//                    K_UP_status=0;
//                    key_up_fall_flag=0;
//                    key_up_up_flag=FALSE;

//                }
//            }
//        }

//		if(key_down_fall_flag==1)//发生按键按下事件
//        {
//            if(K_DOWN==0)//按键持续按下
//             {
//							 key_up_flag=FALSE;
//                if(key_holdon_ms <= 150)
//                 {
//                    key_holdon_ms++;
//                 }
//                 else //按键按下到2000ms就判断长按时间成立，生成长按标志
//                 {
//                   key_holdon_ms = 0;
//                   K_DOWN_status=long_click;
//                   key_fall_flag = 0;//清按键按下标志
////									 key_up_flag=FALSE;
//									 key_up_cnt=0;
//									 //led7=!led7;
//                  }
//								 if((key_up_cnt > 10) && (key_up_cnt < 50))
//									 {
//										 key_up_cnt = 0;
//										 K_DOWN_status=double_click ;	//标记发生了连击事件
//										 //led8=!led8;
//										}
//							}
//          else //按键抬起
//						{
//
//						 if(key_holdon_ms>5)//按下时间大于50ms，生成单击标志
//							{
//								 	key_holdon_ms=0;
//									K_DOWN_status=short_click;
//
//                   key_fall_flag=0;
//									 //led6=!led6;
//
//									key_up_cnt = 0;
//									key_up_flag=TRUE;//单击抬起按键后，生成按键抬起标志
//
//                }
//               else  //按键持续时间小于50ms，忽略
//                  {
//                    key_holdon_ms=0;
//										key_up_cnt=0;
//                    K_DOWN_status=0;
//                    key_fall_flag=0;
//										key_up_flag=FALSE;
//
//                 }
//          }
//
//        }
    }
    TIM_ClearITPendingBit(TIM4,TIM_IT_Update);
}





