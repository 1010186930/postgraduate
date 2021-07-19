#include "time.h"
#include "led.h"
#include "key.h"
#include "SysTick.h"
#include "usart.h"

__IO u8 key_up_fall_flag=0;					//�Ͻ�������
__IO u8 key_down_fall_flag=0;
//u8 short_key_flag=0;							//��̰�����
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
* �� �� ��         : TIM4_Init
* ��������		   : TIM4��ʼ������
* ��    ��         : per:��װ��ֵ
					 psc:��Ƶϵ��
* ��    ��         : ��
*******************************************************************************/
void TIM4_Init(u16 per,u16 psc)
{
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4,ENABLE);//ʹ��TIM4ʱ��

    TIM_TimeBaseInitStructure.TIM_Period=per;   //�Զ�װ��ֵ
    TIM_TimeBaseInitStructure.TIM_Prescaler=psc; //��Ƶϵ��
    TIM_TimeBaseInitStructure.TIM_ClockDivision=TIM_CKD_DIV1;
    TIM_TimeBaseInitStructure.TIM_CounterMode=TIM_CounterMode_Up; //�������ϼ���ģʽ
    TIM_TimeBaseInit(TIM4,&TIM_TimeBaseInitStructure);

    TIM_ITConfig(TIM4,TIM_IT_Update,ENABLE); //������ʱ���ж�
    TIM_ClearITPendingBit(TIM4,TIM_IT_Update);

    NVIC_InitStructure.NVIC_IRQChannel = TIM4_IRQn;//��ʱ���ж�ͨ��
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority=2;//��ռ���ȼ�
    NVIC_InitStructure.NVIC_IRQChannelSubPriority =3;		//�����ȼ�
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;			//IRQͨ��ʹ��
    NVIC_Init(&NVIC_InitStructure);

    //TIM_Cmd(TIM4,ENABLE); //ʹ�ܶ�ʱ��
}

/*******************************************************************************
* �� �� ��         : TIM4_IRQHandler
* ��������		   : TIM4�жϺ���
* ��    ��         : ��
* ��    ��         : ��
*******************************************************************************/






void TIM4_IRQHandler(void)
{
    static u32 key_holdon_ms=0;
    static u32 key_up_cnt=0;

    if(TIM_GetITStatus(TIM4,TIM_IT_Update))
    {
        if(key_up_fall_flag==1)//�������������¼�
        {
            if(K_UP==1)//������������
            {
                key_up_up_flag=FALSE;

                if(key_holdon_ms <= 70)
                {
                    key_holdon_ms++;
                }
                else //�������µ�2000ms���жϳ���ʱ����������ɳ�����־
                {
                    key_up_fall_flag = 0;//�尴�����±�־
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
                    K_UP_status = double_click ;	//��Ƿ����������¼�
                    //led8=!led8;

                }
            }
            else //����̧��
            {

                if(key_holdon_ms>3)//����ʱ�����50ms�����ɵ�����־
                {
                    key_holdon_ms=0;
                    K_UP_status=short_click;
                    key_up_fall_flag=0;
                    //led6=!led6;

                    key_up_cnt = 0;
                    key_up_up_flag=TRUE;//����̧�𰴼������ɰ���̧���־

                }
                else  //��������ʱ��С��50ms������
                {
                    key_holdon_ms=0;
                    key_up_cnt=0;
                    K_UP_status=0;
                    key_up_fall_flag=0;
                    key_up_up_flag=FALSE;

                }
            }
        }

//		if(key_down_fall_flag==1)//�������������¼�
//        {
//            if(K_DOWN==0)//������������
//             {
//							 key_up_flag=FALSE;
//                if(key_holdon_ms <= 150)
//                 {
//                    key_holdon_ms++;
//                 }
//                 else //�������µ�2000ms���жϳ���ʱ����������ɳ�����־
//                 {
//                   key_holdon_ms = 0;
//                   K_DOWN_status=long_click;
//                   key_fall_flag = 0;//�尴�����±�־
////									 key_up_flag=FALSE;
//									 key_up_cnt=0;
//									 //led7=!led7;
//                  }
//								 if((key_up_cnt > 10) && (key_up_cnt < 50))
//									 {
//										 key_up_cnt = 0;
//										 K_DOWN_status=double_click ;	//��Ƿ����������¼�
//										 //led8=!led8;
//										}
//							}
//          else //����̧��
//						{
//
//						 if(key_holdon_ms>5)//����ʱ�����50ms�����ɵ�����־
//							{
//								 	key_holdon_ms=0;
//									K_DOWN_status=short_click;
//
//                   key_fall_flag=0;
//									 //led6=!led6;
//
//									key_up_cnt = 0;
//									key_up_flag=TRUE;//����̧�𰴼������ɰ���̧���־
//
//                }
//               else  //��������ʱ��С��50ms������
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
        if(key_up_up_flag)//����̧�������������������500ms
            key_up_cnt++;
        if(key_up_cnt>500)
        {
            key_up_cnt = 0;
            key_up_up_flag = FALSE;
        }


    }
    TIM_ClearITPendingBit(TIM4,TIM_IT_Update);
}





