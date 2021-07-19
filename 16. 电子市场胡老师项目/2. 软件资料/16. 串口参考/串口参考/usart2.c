#include "usart.h"

#define Uart2_Tx_DMA_Channel            DMA1_Channel7
#define Uart2_Rx_DMA_Channel            DMA1_Channel6
#define Uart2_Tx_DMA_FLAG_TC            DMA1_FLAG_TC7

static u8   Uart2_RxBuff[100];
static u8   Uart2_TxBuff[100];


/*******************************************************************************
* 函数名   ：   
* 描述     ：   
* 输入     ：   
* 返回值   ：   
* 说明     ：   
*******************************************************************************/
void Uart2_Bsp_Init(void)
{
    GPIO_InitTypeDef    GPIO_InitStructure;
    USART_InitTypeDef   USART_InitStructure;
    DMA_InitTypeDef     DMA_InitStructure;
    NVIC_InitTypeDef    NVIC_InitStructure;
    
    /* 1、配置时钟 */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,  ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);
    
    /* 2、配置GPIO */
    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_2;
    GPIO_InitStructure.GPIO_Speed  =  GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_AF_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_3;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_IPU;//GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    
    // 485芯片的\R\E和DE(PA1)
    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_1;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_Out_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    GPIO_ResetBits(GPIOA, GPIO_Pin_1);        // 默认低电平，接收状态
    
    /* 3、配置串口 */
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
     
    /* 4、配置串口接收DMA */
    /* Uart2_Rx_DMA_Channel (triggered by USART2 Rx event) Config */
    DMA_DeInit(Uart2_Rx_DMA_Channel);
    DMA_InitStructure.DMA_PeripheralBaseAddr = (u32)(&USART2->DR);           //外设地址
    DMA_InitStructure.DMA_MemoryBaseAddr = (u32)Uart2_RxBuff;             //内存地址
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;                       //dma传输方向单向
    DMA_InitStructure.DMA_BufferSize = sizeof(Uart2_RxBuff);              //设置DMA在传输时缓冲区的长度 word
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;         //设置DMA的外设递增模式，一个外设
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;                  //设置DMA的内存递增模式，
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;  //外设数据字长
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;          //内存数据字长
    DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;                          //设置DMA的传输模式：连续不断的循环模式
    DMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;                  //设置DMA的优先级别
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;                             //设置DMA的2个memory中的变量互相访问
    DMA_Init(Uart2_Rx_DMA_Channel, &DMA_InitStructure);
    
    /* Enable Uart2_Rx_DMA_Channel */
    DMA_Cmd(Uart2_Rx_DMA_Channel, ENABLE);
    
    /* 5、配置串口发送DMA */
    /* Uart2_Tx_DMA_Channel (triggered by USART2 Tx event) Config */
    DMA_DeInit(Uart2_Tx_DMA_Channel);
    DMA_InitStructure.DMA_PeripheralBaseAddr = (u32)(&USART2->DR);           //外设地址
	DMA_InitStructure.DMA_MemoryBaseAddr = (u32)Uart2_TxBuff;                //内存地址
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;                       //数据传输方向，从内存读取发送到外设
	DMA_InitStructure.DMA_BufferSize = 0; //sizeof(Uart2_TxBuff);            //设置DMA在传输时缓冲区的长度 word
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;         //外设地址寄存器不变
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;                  //内存地址寄存器递增
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;  //数据宽度为8位
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;          //数据宽度为8位
	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;                            //工作在正常缓存模式
	DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;                    //DMA通道 x拥有中优先级 
	DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;                             //DMA通道x没有设置为内存到内存传输
	DMA_Init(Uart2_Tx_DMA_Channel, &DMA_InitStructure);

    /* Enable Uart2_Tx_DMA_Channel */
    //DMA_Cmd(Uart2_Tx_DMA_Channel, ENABLE);
    
    /* 6、配置串口发送DMA 发送完成 中断 */ 
    NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn;     
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;          
    NVIC_Init(&NVIC_InitStructure);
}

/*******************************************************************************
* 函数名   ：   
* 描述     ：   
* 输入     ：   
* 返回值   ：   
* 说明     ：   
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
    if(CurrLen == 0){                                   // 无数据
        LastLen = 0;
        return 0;
    }
    if(CurrLen != LastLen){                             // 有新数据
        LastLen = CurrLen;
        return 0;
    }
    
    memcpy(pdat, Uart2_RxBuff, CurrLen);
    
//    printf("Uart2 Recv[%d]:", CurrLen);
//    for(i=0; i<CurrLen; i++){
//        printf("%02X ", Uart2_RxBuff[i]);
//    }
//    printf("\r\n");

    // 重新初始化接收DMA
    LastLen = 0;
    DMA_Cmd(Uart2_Rx_DMA_Channel, DISABLE );                                //关闭USART2 RX DMA 所指示的通道      
 	DMA_SetCurrDataCounter(Uart2_Rx_DMA_Channel,sizeof(Uart2_RxBuff));      //DMA通道的DMA缓存的大小
 	DMA_Cmd(Uart2_Rx_DMA_Channel, ENABLE);                                  //使能USART2 RX DMA 所指示的通道
    
    return CurrLen;
}

/*******************************************************************************
* 函数名   ：   
* 描述     ：   
* 输入     ：   
* 返回值   ：   
* 说明     ：   
*******************************************************************************/
void Uart2_Buff_Send(u8 *str,u32 length)
{
    if(length > sizeof(Uart2_TxBuff)){
        return;
    }
    
    memcpy(Uart2_TxBuff, str, length);
    
    // 置高485使能引脚，发送数据
    GPIO_SetBits(GPIOA, GPIO_Pin_1);
    
    // 启动DMA    
    DMA_Cmd(Uart2_Tx_DMA_Channel, DISABLE );                //关闭USART2 TX DMA 所指示的通道      
 	DMA_SetCurrDataCounter(Uart2_Tx_DMA_Channel,length);    //DMA通道的DMA缓存的大小
 	DMA_Cmd(Uart2_Tx_DMA_Channel, ENABLE);                  //使能USART2 TX DMA 所指示的通道    
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
    if (USART_GetITStatus(USART2, USART_IT_TC) != RESET){   // 发送完成中断
        USART_ClearITPendingBit(USART2, USART_IT_TC);
        GPIO_ResetBits(GPIOA, GPIO_Pin_1);                  // 复位485使能引脚，接收数据
	}
}
