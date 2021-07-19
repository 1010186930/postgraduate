#include "sys.h"
#include "rs485.h"
#include "delay.h"




#ifdef EN_USART2_RX   	//���ʹ���˽���


//���ջ�����
u8 RS485_RX_BUFF[RX_MAXSIZE];  	//���ջ���,���64���ֽ�.
//���ͻ�����
u8 RS485_TX_BUFF[TX_MAXSIZE];	//���ͻ���,���64���ֽ�.
//���յ������ݳ���
u16 RS485_RX_CNT=0;
//���͵����ݳ���
u16 RS485_TX_CNT=0;


void USART2_IRQHandler(void)
{
    u8 res;
	u8 err;
	if(USART_GetITStatus(USART2,USART_IT_RXNE)!=RESET)
	{
		if(USART_GetFlagStatus(USART2,USART_FLAG_NE|USART_FLAG_FE|USART_FLAG_PE)) err=1;//��⵽������֡�����У�����
		else err=0;
		res=USART_ReceiveData(USART2); //�����յ����ֽڣ�ͬʱ��ر�־�Զ����

		if((RS485_RX_CNT<RX_MAXSIZE)&&(err==0))
		{
				RS485_RX_BUFF[RS485_RX_CNT]=res;
				RS485_RX_CNT++;
		}
	}
}
#endif
//��ʼ��IO ����2
//pclk1:PCLK1ʱ��Ƶ��(Mhz)
//bound:������
void RS485_Init(u32 bound)
{
    GPIO_InitTypeDef GPIO_InitStructure;
    USART_InitTypeDef USART_InitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);//ʹ��GPIOA,Dʱ��
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,  ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);//ʹ��USART2ʱ��
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;	//PA2
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;	//��������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
	GPIO_SetBits(GPIOA,GPIO_Pin_2);//Ĭ�ϸߵ�ƽ
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3;//PA3
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU; //����
    GPIO_Init(GPIOA, &GPIO_InitStructure);
	
	
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;				 //PA6�˿�����
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		 //�������
    GPIO_Init(GPIOA, &GPIO_InitStructure);
	GPIO_ResetBits(GPIOA,GPIO_Pin_6);
    

   

    RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2,ENABLE);//��λ����2
    RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2,DISABLE);//ֹͣ��λ


#ifdef EN_USART2_RX		  	//���ʹ���˽���
    USART_InitStructure.USART_BaudRate = bound;//����������
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;//8λ���ݳ���
    USART_InitStructure.USART_StopBits = USART_StopBits_1;//һ��ֹͣλ
    USART_InitStructure.USART_Parity = USART_Parity_No;///��żУ��λ
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;//��Ӳ������������
    USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;//�շ�ģʽ

    USART_Init(USART2, &USART_InitStructure);  //��ʼ������
	
	
	USART_ClearITPendingBit(USART2,USART_IT_RXNE);
    USART_ITConfig(USART2,USART_IT_RXNE,ENABLE);
	
	
    NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn; //ʹ�ܴ���2�ж�
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 2; //��ռ���ȼ�2��
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 2; //�����ȼ�2��
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; //ʹ���ⲿ�ж�ͨ��
    NVIC_Init(&NVIC_InitStructure); //����NVIC_InitStruct��ָ���Ĳ�����ʼ������NVIC�Ĵ���

 
    USART_Cmd(USART2, ENABLE);                    //ʹ�ܴ���

#endif

    RS485_TX_EN=0;			//Ĭ��Ϊ����ģʽ

}

//RS485����len���ֽ�.
//buf:�������׵�ַ
//len:���͵��ֽ���(Ϊ�˺ͱ�����Ľ���ƥ��,���ｨ�鲻Ҫ����64���ֽ�)
void RS485_SendData(u8 *buf,u8 len)
{
    u8 t;
    RS485_TX_EN=1;			//����Ϊ����ģʽ
    for(t=0; t<len; t++)		//ѭ����������
    {
		while(USART_GetFlagStatus(USART2,USART_FLAG_TXE)==RESET);//�ȴ�������Ϊ��
        USART_SendData(USART2,buf[t]);
    }
   while(USART_GetFlagStatus(USART2,USART_FLAG_TC)==RESET);
   RS485_TX_EN=0;				//����Ϊ����ģʽ
}
//RS485��ѯ���յ�������
//buf:���ջ����׵�ַ
//len:���������ݳ���
void RS485_Receive_Data(u8 *buf,u8 *len)
{
    u8 rxlen=RS485_RX_CNT;
    u8 i=0;
    *len=0;				//Ĭ��Ϊ0
    delay_ms(10);		//�ȴ�10ms,��������10msû�н��յ�һ������,����Ϊ���ս���
    if(rxlen==RS485_RX_CNT&&rxlen)//���յ�������,�ҽ��������
    {
        for(i=0; i<rxlen; i++)
        {
            buf[i]=RS485_RX_BUFF[i];
        }
        *len=RS485_RX_CNT;	//��¼�������ݳ���
        RS485_RX_CNT=0;		//����
    }
}





















