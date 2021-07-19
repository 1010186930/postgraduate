#include "usart.h"

static u8   Uart5_RxBuff[100];
static u8   Uart5_RxBuffIndex;

/*******************************************************************************
* ������   ��   
* ����     ��   
* ����     ��   
* ����ֵ   ��   
* ˵��     ��   
*******************************************************************************/
void Uart5_Bsp_Init(void)
{
    GPIO_InitTypeDef    GPIO_InitStructure;
    USART_InitTypeDef   USART_InitStructure;
    NVIC_InitTypeDef    NVIC_InitStructure;
    
    /* 1������ʱ�� */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOE, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,  ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_UART5, ENABLE);
    
    /* 2������GPIO */
    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_12;
    GPIO_InitStructure.GPIO_Speed  =  GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_AF_PP;
    GPIO_Init(GPIOC, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_2;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_IPU;//GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOD, &GPIO_InitStructure);
    
    // 485оƬ��\R\E��DE(PE3)
    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_3;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_Out_PP;
    GPIO_Init(GPIOE, &GPIO_InitStructure);
    GPIO_ResetBits(GPIOE, GPIO_Pin_3);		// Ĭ�ϵ͵�ƽ������״̬
    
    /* 3�����ô��� */
    USART_InitStructure.USART_BaudRate      = 9600;
    USART_InitStructure.USART_WordLength    = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits      = USART_StopBits_1;
    USART_InitStructure.USART_Parity        = USART_Parity_No;
    USART_InitStructure.USART_Mode          = USART_Mode_Rx | USART_Mode_Tx;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_Init(UART5, &USART_InitStructure);
    
     /* Enable USART5 Receive and Transmit interrupts  */
    //USART_ITConfig(USART5, USART_IT_TXE, ENABLE);
    USART_ITConfig(UART5, USART_IT_RXNE, ENABLE);

    /* Enable the USART5                              */
    USART_Cmd(UART5, ENABLE);
    
	/* 6�����ô��ڷ�������ж� */
    NVIC_InitStructure.NVIC_IRQChannel = UART5_IRQn;     
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;          
    NVIC_Init(&NVIC_InitStructure);
}

/*******************************************************************************
* ������   ��   
* ����     ��   
* ����     ��   
* ����ֵ   ��   
* ˵��     ��   
*******************************************************************************/
extern u32  Uart5_Dat_Get(u8* pdat)
{
    static u32      LastLen, LastTime;
    u32             CurrLen, CurrTime;
    
    CurrTime = OSTimeGet();
    if(CurrTime - LastTime < OS_TICKS_PER_SEC/100){     // 10ms
        return 0;
    }
    LastTime = CurrTime;   
    
    CurrLen = Uart5_RxBuffIndex;
    if(CurrLen == 0){                                   // ������
        LastLen = 0;
        return 0;
    }
    if(CurrLen != LastLen){                             // ��������
        LastLen = CurrLen;
        return 0;
    }
    
    memcpy(pdat, Uart5_RxBuff, CurrLen);
    
//    printf("Uart5 Recv[%d]:", CurrLen);
//    for(i=0; i<CurrLen; i++){
//        printf("%02X ", Uart5_RxBuff[i]);
//    }
//    printf("\r\n");   

    // ���³�ʼ������
    LastLen = 0;
    Uart5_RxBuffIndex = 0;  
    
    return CurrLen;
}

/*******************************************************************************
* ������   ��   
* ����     ��   
* ����     ��   
* ����ֵ   ��   
* ˵��     ��   
*******************************************************************************/
void Uart5_Buff_Send(u8 *str,u32 length)
{
    u32 i;
    
    // �ø�485ʹ�����ţ���������
    GPIO_SetBits(GPIOE, GPIO_Pin_3);
    
    for(i=0; i<length; i++){
        USART_SendData(UART5, str[i]);//�򴮿�1��������
        while(USART_GetFlagStatus(UART5,USART_FLAG_TC)!=SET);//�ȴ����ͽ���
    }

    // ��λ485ʹ�����ţ���������    
    GPIO_ResetBits(GPIOE, GPIO_Pin_3);            
}  

/*******************************************************************************
* Function Name  : USART5_IRQHandler
* Description    : This function handles USART5 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void UART5_IRQHandler(void)
{    
    if (USART_GetITStatus(UART5, USART_IT_RXNE) != RESET){   // �����ж�
        USART_ClearITPendingBit(UART5, USART_IT_RXNE);
        if(Uart5_RxBuffIndex < sizeof(Uart5_RxBuff)){
            Uart5_RxBuff[Uart5_RxBuffIndex] = USART_ReceiveData(UART5);
            Uart5_RxBuffIndex++;
        }
    }
}
