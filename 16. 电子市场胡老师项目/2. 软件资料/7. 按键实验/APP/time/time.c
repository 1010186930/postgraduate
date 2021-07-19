#include "time.h"
#include "led.h"
#include "key.h"
#include "SysTick.h"
#include "usart.h"

__IO u8 key_up_fall_flag=0;					//上健被按下
__IO u8 key_down_fall_flag=0;
//u8 short_key_flag=0;							//清短按键标
//u8 long_key_flag=0;
//bool double_click=FALSE;
bool key_up_up_flag=FALSE;

#define short_click 11
#define long_click 12
#define double_click 13
u8 K_UP_status=0;
u8 K_DOWN_status=0;
u8 key=0;
extern __IO u16 data;

void K_UP_sacnf_func(void) {

    switch(K_UP_status) {

    case 11:
        led6=!led6;
        K_UP_status=0;
        break;
    case 12:
        led7=!led7;
        K_UP_status=0;
        break;
    case 13:
        led8=!led8;
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
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority=2;//抢占优先级
    NVIC_InitStructure.NVIC_IRQChannelSubPriority =3;		//子优先级
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;			//IRQ通道使能
    NVIC_Init(&NVIC_InitStructure);

    //TIM_Cmd(TIM4,ENABLE); //使能定时器
}

/*******************************************************************************
* 函 数 名         : TIM4_IRQHandler
* 函数功能		   : TIM4中断函数
* 输    入         : 无
* 输    出         : 无
*******************************************************************************/






void TIM4_IRQHandler(void)
{
    static u32 key_holdon_ms=0;
    static u32 key_up_cnt=0;

    if(TIM_GetITStatus(TIM4,TIM_IT_Update))
    {
        if(key_up_fall_flag==1)//发生按键按下事件
        {
            if(K_UP==1)//按键持续按下
            {
                key_up_up_flag=FALSE;

                if(key_holdon_ms <= 70)
                {
                    key_holdon_ms++;
                }
                else //按键按下到2000ms就判断长按时间成立，生成长按标志
                {
                    key_up_fall_flag = 0;//清按键按下标志
                    key_holdon_ms = 0;
                    key_up_up_flag=FALSE;
                    key_up_cnt=0;
                    K_UP_status = long_click;
                    //led7=!led7;
                    key=KEY_Scan(1);
                    while(key==K_UP) {
                        ++data;
                        printf("%d\n\r",data);
                        delay_ms(15);
                    }
                }
                if((key_up_cnt > 3) && (key_up_cnt < 30))
                {
                    key_up_cnt=0;
                    key_holdon_ms = 0;
                    K_UP_status = double_click ;	//标记发生了连击事件
                    //led8=!led8;

                }
            }
            else //按键抬起
            {

                if(key_holdon_ms>3)//按下时间大于50ms，生成单击标志
                {
                    key_holdon_ms=0;
                    K_UP_status=short_click;
                    key_up_fall_flag=0;
                    //led6=!led6;

                    key_up_cnt = 0;
                    key_up_up_flag=TRUE;//单击抬起按键后，生成按键抬起标志

                }
                else  //按键持续时间小于50ms，忽略
                {
                    key_holdon_ms=0;
                    key_up_cnt=0;
                    K_UP_status=0;
                    key_up_fall_flag=0;
                    key_up_up_flag=FALSE;

                }
            }
        }

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
        if(key_up_up_flag)//单击抬起后，启动计数，计数到500ms
            key_up_cnt++;
        if(key_up_cnt>500)
        {
            key_up_cnt = 0;
            key_up_up_flag = FALSE;
        }


    }
    TIM_ClearITPendingBit(TIM4,TIM_IT_Update);
}





