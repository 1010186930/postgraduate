#include "usart.h"

static u8   Uart5_RxBuff[100];
static u8   Uart5_RxBuffIndex;

/*******************************************************************************
* 函数名   ：   
* 描述     ：   
* 输入     ：   
* 返回值   ：   
* 说明     ：   
*******************************************************************************/
void Uart5_Bsp_Init(void)
{
    GPIO_InitTypeDef    GPIO_InitStructure;
    USART_InitTypeDef   USART_InitStructure;
    NVIC_InitTypeDef    NVIC_InitStructure;
    
    /* 1、配置时钟 */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOE, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,  ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_UART5, ENABLE);
    
    /* 2、配置GPIO */
    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_12;
    GPIO_InitStructure.GPIO_Speed  =  GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_AF_PP;
    GPIO_Init(GPIOC, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_2;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_IPU;//GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOD, &GPIO_InitStructure);
    
    // 485芯片的\R\E和DE(PE3)
    GPIO_InitStructure.GPIO_Pin    =  GPIO_Pin_3;
    GPIO_InitStructure.GPIO_Mode   =  GPIO_Mode_Out_PP;
    GPIO_Init(GPIOE, &GPIO_InitStructure);
    GPIO_ResetBits(GPIOE, GPIO_Pin_3);		// 默认低电平，接收状态
    
    /* 3、配置串口 */
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
    
	/* 6、配置串口发送完成中断 */
    NVIC_InitStructure.NVIC_IRQChannel = UART5_IRQn;     
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
    if(CurrLen == 0){                                   // 无数据
        LastLen = 0;
        return 0;
    }
    if(CurrLen != LastLen){                             // 有新数据
        LastLen = CurrLen;
        return 0;
    }
    
    memcpy(pdat, Uart5_RxBuff, CurrLen);
    
//    printf("Uart5 Recv[%d]:", CurrLen);
//    for(i=0; i<CurrLen; i++){
//        printf("%02X ", Uart5_RxBuff[i]);
//    }
//    printf("\r\n");   

    // 重新初始化接收
    LastLen = 0;
    Uart5_RxBuffIndex = 0;  
    
    return CurrLen;
}

/*******************************************************************************
* 函数名   ：   
* 描述     ：   
* 输入     ：   
* 返回值   ：   
* 说明     ：   
*******************************************************************************/
void Uart5_Buff_Send(u8 *str,u32 length)
{
    u32 i;
    
    // 置高485使能引脚，发送数据
    GPIO_SetBits(GPIOE, GPIO_Pin_3);
    
    for(i=0; i<length; i++){
        USART_SendData(UART5, str[i]);//向串口1发送数据
        while(USART_GetFlagStatus(UART5,USART_FLAG_TC)!=SET);//等待发送结束
    }

    // 复位485使能引脚，接收数据    
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
    if (USART_GetITStatus(UART5, USART_IT_RXNE) != RESET){   // 发送中断
        USART_ClearITPendingBit(UART5, USART_IT_RXNE);
        if(Uart5_RxBuffIndex < sizeof(Uart5_RxBuff)){
            Uart5_RxBuff[Uart5_RxBuffIndex] = USART_ReceiveData(UART5);
            Uart5_RxBuffIndex++;
        }
    }
}
