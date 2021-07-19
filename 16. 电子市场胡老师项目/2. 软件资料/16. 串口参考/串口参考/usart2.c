#include "usart.h"

#define Uart2_Tx_DMA_Channel            DMA1_Channel7
#define Uart2_Rx_DMA_Channel            DMA1_Channel6
#define Uart2_Tx_DMA_FLAG_TC            DMA1_FLAG_TC7

static u8   Uart2_RxBuff[100];
static u8   Uart2_TxBuff[100];


/*******************************************************************************
* ������   ��   
* ����     ��   
* ����     ��   
* ����ֵ   ��   
* ˵��     ��   
*******************************************************************************/
void Uart2_Bsp_Init(void)
{
    GPIO_InitTypeDef    GPIO_InitStructure;
    USART_InitTypeDef   USART_InitStructure;
    DMA_InitTypeDef     DMA_InitStructure;
    NVIC_InitTypeDef    NVIC_InitStructure;
    
    /* 1������ʱ�� */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,  ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);
    
    /* 2������GPIO */
    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_2;
    GPIO_InitStructure.GPIO_Speed  =  GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_AF_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_3;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_IPU;//GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    
    // 485оƬ��\R\E��DE(PA1)
    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_1;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_Out_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    GPIO_ResetBits(GPIOA, GPIO_Pin_1);        // Ĭ�ϵ͵�ƽ������״̬
    
    /* 3�����ô��� */
    USART_InitStructure.USART_BaudRate      = 9600;
    USART_InitStructure.USART_WordLength    = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits      = USART_StopBits_1;
    USART_InitStructure.USART_Parity        = USART_Parity_No;
    USART_InitStructure.USART_Mode          = USART_Mode_Rx | USART_Mode_Tx;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_Init(USART2, &USART_InitStructure);

    /* Enable USART2 DMA Rx and Tx request            */
    USART_DMACmd(USART2, USART_DMAReq_Rx, ENABLE);
    USART_DMACmd(USART2, USART_DMAReq_Tx, ENABLE);
    
     /* Enable USART2 Receive and Transmit interrupts  */
    USART_ITConfig(USART2, USART_IT_TC, ENABLE);

    /* Enable the USART2                              */
    USART_Cmd(USART2, ENABLE);
     
    /* 4�����ô��ڽ���DMA */
    /* Uart2_Rx_DMA_Channel (triggered by USART2 Rx event) Config */
    DMA_DeInit(Uart2_Rx_DMA_Channel);
    DMA_InitStructure.DMA_PeripheralBaseAddr = (u32)(&USART2->DR);           //�����ַ
    DMA_InitStructure.DMA_MemoryBaseAddr = (u32)Uart2_RxBuff;             //�ڴ��ַ
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;                       //dma���䷽����
    DMA_InitStructure.DMA_BufferSize = sizeof(Uart2_RxBuff);              //����DMA�ڴ���ʱ�������ĳ��� word
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;         //����DMA���������ģʽ��һ������
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;                  //����DMA���ڴ����ģʽ��
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;  //���������ֳ�
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;          //�ڴ������ֳ�
    DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;                          //����DMA�Ĵ���ģʽ���������ϵ�ѭ��ģʽ
    DMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;                  //����DMA�����ȼ���
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;                             //����DMA��2��memory�еı����������
    DMA_Init(Uart2_Rx_DMA_Channel, &DMA_InitStructure);
    
    /* Enable Uart2_Rx_DMA_Channel */
    DMA_Cmd(Uart2_Rx_DMA_Channel, ENABLE);
    
    /* 5�����ô��ڷ���DMA */
    /* Uart2_Tx_DMA_Channel (triggered by USART2 Tx event) Config */
    DMA_DeInit(Uart2_Tx_DMA_Channel);
    DMA_InitStructure.DMA_PeripheralBaseAddr = (u32)(&USART2->DR);           //�����ַ
	DMA_InitStructure.DMA_MemoryBaseAddr = (u32)Uart2_TxBuff;                //�ڴ��ַ
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;                       //���ݴ��䷽�򣬴��ڴ��ȡ���͵�����
	DMA_InitStructure.DMA_BufferSize = 0; //sizeof(Uart2_TxBuff);            //����DMA�ڴ���ʱ�������ĳ��� word
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;         //�����ַ�Ĵ�������
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;                  //�ڴ��ַ�Ĵ�������
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;  //���ݿ��Ϊ8λ
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;          //���ݿ��Ϊ8λ
	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;                            //��������������ģʽ
	DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;                    //DMAͨ�� xӵ�������ȼ� 
	DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;                             //DMAͨ��xû������Ϊ�ڴ浽�ڴ洫��
	DMA_Init(Uart2_Tx_DMA_Channel, &DMA_InitStructure);

    /* Enable Uart2_Tx_DMA_Channel */
    //DMA_Cmd(Uart2_Tx_DMA_Channel, ENABLE);
    
    /* 6�����ô��ڷ���DMA ������� �ж� */ 
    NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn;     
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
u32 Uart2_Dat_Get(u8* pdat)
{
    static u32      LastLen, LastTime;
    u32             CurrLen, CurrTime;
    
    CurrTime = OSTimeGet();
    if(CurrTime - LastTime < OS_TICKS_PER_SEC/100){     // 10ms
        return 0;
    }
    LastTime = CurrTime;   
    
    CurrLen = sizeof(Uart2_RxBuff) - DMA_GetCurrDataCounter(Uart2_Rx_DMA_Channel);
    if(CurrLen == 0){                                   // ������
        LastLen = 0;
        return 0;
    }
    if(CurrLen != LastLen){                             // ��������
        LastLen = CurrLen;
        return 0;
    }
    
    memcpy(pdat, Uart2_RxBuff, CurrLen);
    
//    printf("Uart2 Recv[%d]:", CurrLen);
//    for(i=0; i<CurrLen; i++){
//        printf("%02X ", Uart2_RxBuff[i]);
//    }
//    printf("\r\n");

    // ���³�ʼ������DMA
    LastLen = 0;
    DMA_Cmd(Uart2_Rx_DMA_Channel, DISABLE );                                //�ر�USART2 RX DMA ��ָʾ��ͨ��      
 	DMA_SetCurrDataCounter(Uart2_Rx_DMA_Channel,sizeof(Uart2_RxBuff));      //DMAͨ����DMA����Ĵ�С
 	DMA_Cmd(Uart2_Rx_DMA_Channel, ENABLE);                                  //ʹ��USART2 RX DMA ��ָʾ��ͨ��
    
    return CurrLen;
}

/*******************************************************************************
* ������   ��   
* ����     ��   
* ����     ��   
* ����ֵ   ��   
* ˵��     ��   
*******************************************************************************/
void Uart2_Buff_Send(u8 *str,u32 length)
{
    if(length > sizeof(Uart2_TxBuff)){
        return;
    }
    
    memcpy(Uart2_TxBuff, str, length);
    
    // �ø�485ʹ�����ţ���������
    GPIO_SetBits(GPIOA, GPIO_Pin_1);
    
    // ����DMA    
    DMA_Cmd(Uart2_Tx_DMA_Channel, DISABLE );                //�ر�USART2 TX DMA ��ָʾ��ͨ��      
 	DMA_SetCurrDataCounter(Uart2_Tx_DMA_Channel,length);    //DMAͨ����DMA����Ĵ�С
 	DMA_Cmd(Uart2_Tx_DMA_Channel, ENABLE);                  //ʹ��USART2 TX DMA ��ָʾ��ͨ��    
}  

/*******************************************************************************
* Function Name  : USART3_IRQHandler
* Description    : This function handles USART3 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void USART2_IRQHandler(void)
{
    if (USART_GetITStatus(USART2, USART_IT_TC) != RESET){   // ��������ж�
        USART_ClearITPendingBit(USART2, USART_IT_TC);
        GPIO_ResetBits(GPIOA, GPIO_Pin_1);                  // ��λ485ʹ�����ţ���������
	}
}
