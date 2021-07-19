//	主机服务程序    //


#include"master.h"
#include"usart.h"
#include"delay.h"
#include"stdio.h"
#include "led.h"

u32 RS485_Baudrate=9600;//通讯波特率
u8 RS485_Parity=0;//0无校验；1奇校验；2偶校验
u16 RS485_Frame_Distance=4;//数据帧最小间隔（ms),超过此时间则认为是下一帧 在此为tim7负责进行延时

u8 RS485_RX_BUFF[2048];//接收缓冲区2048字节
u16 RS485_RX_CNT=0;//接收计数器
u8 RS485_RxFlag=0;//接收一帧结束标记

u8 RS485_TX_BUFF[2048];//发送缓冲区
u16 RS485_TX_CNT=0;//发送计数器
u8 RS485_TxFlag=0;//发送一帧结束标记



/////////////////////////////////////////////////////////////////////////////////////
//主机命令区
u8   SlaverAddr=0x01;    //从机地址
u8   Fuction=0x03;      // 功能码
u16  StartAddr=0xC10C;    //起始地址
u16  ValueOrLenth=0x01;  //数据or长度

u8 message=0;
//////////////////////////////////////////////////////////////////////////////////////////

u8 TX_RX_SET=0; //发送，接受命令切换。 0 发送模式 1接受模式    
u8 ComErr=8; //0代表通讯正常
             //1代表CRC错误
			       // 2代表功能码错误 现在默认的是0x03
						 //7为通讯超时
						 //8代表未开始
						 //
u8 errpace=0;	//1代表tim7串口待机时间过长，放弃数据帧
               // 2检测到噪音、帧错误或校验错误
			
u8 state=0;

////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Master寄存器和单片机寄存器的映射关系,届时需要在主函数进行调用或者显示
u16   Master_InputIO[100];  //输入开关量寄存器(这里使用的是位带操作)   注意： 这里储存从机返回的数据。    开关量的数据只能是0，1 例如 Master_InputIO[5]=0；Master_InputIO[8]=1；
u16   Master_OutputIO[100]; //输出开关量寄存器(这里使用的是位带操作)    功能码 05 15

u16  Master_ReadReg[1000]; //只读寄存器----存储从机返回的数据          功能码 03 目前是只用这一个
u16  Master_WriteReg[1000];//写寄存器-------将寄存器中的数据送给从机   功能码 06 16



u32 testData1=1201,testData2=1002,testData3=2303,testData4=8204;

void Modbus_RegMap(void)  //功能码0x06使用
{
	Master_WriteReg[0]=1;
	Master_WriteReg[1]=8;
	Master_WriteReg[2]=9;
	Master_WriteReg[3]=235;
	Master_WriteReg[4]=8690;
	Master_WriteReg[5]=23578;
	Master_WriteReg[6]=125;
	
	Master_OutputIO[20]=1;
	Master_OutputIO[21]=0;
	Master_OutputIO[22]=1;
	Master_OutputIO[23]=1;
	Master_OutputIO[24]=0;
	Master_OutputIO[25]=0;
	Master_OutputIO[26]=1;
	Master_OutputIO[27]=1;
	
	Master_OutputIO[28]=1;
	Master_OutputIO[29]=0;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//CRC校验 自己后面添加的

const u8 auchCRCHi[] = { 
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1,0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1,0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 
0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1,0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 
0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 
0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1,0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40} ; 


const u8 auchCRCLo[] = { 
0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06,0x07, 0xC7, 0x05, 0xC5, 0xC4, 0x04, 0xCC, 0x0C, 0x0D, 0xCD, 
0x0F, 0xCF, 0xCE, 0x0E, 0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09,0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9, 0x1B, 0xDB, 0xDA, 0x1A, 
0x1E, 0xDE, 0xDF, 0x1F, 0xDD, 0x1D, 0x1C, 0xDC, 0x14, 0xD4,0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3, 
0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3,0xF2, 0x32, 0x36, 0xF6, 0xF7, 0x37, 0xF5, 0x35, 0x34, 0xF4, 
0x3C, 0xFC, 0xFD, 0x3D, 0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A,0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 0x28, 0xE8, 0xE9, 0x29, 
0xEB, 0x2B, 0x2A, 0xEA, 0xEE, 0x2E, 0x2F, 0xEF, 0x2D, 0xED,0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26, 
0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60,0x61, 0xA1, 0x63, 0xA3, 0xA2, 0x62, 0x66, 0xA6, 0xA7, 0x67, 
0xA5, 0x65, 0x64, 0xA4, 0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F,0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 0x69, 0xA9, 0xA8, 0x68, 
0x78, 0xB8, 0xB9, 0x79, 0xBB, 0x7B, 0x7A, 0xBA, 0xBE, 0x7E,0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5, 
0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71,0x70, 0xB0, 0x50, 0x90, 0x91, 0x51, 0x93, 0x53, 0x52, 0x92, 
0x96, 0x56, 0x57, 0x97, 0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C,0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E, 0x5A, 0x9A, 0x9B, 0x5B, 
0x99, 0x59, 0x58, 0x98, 0x88, 0x48, 0x49, 0x89, 0x4B, 0x8B,0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C, 
0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42,0x43, 0x83, 0x41, 0x81, 0x80, 0x40} ;


u16 CRC_Compute(u8 *puchMsg, u16 usDataLen) 
{ 
	u8 uchCRCHi = 0xFF ; 
	u8 uchCRCLo = 0xFF ; 
	u32 uIndex ; 
	while (usDataLen--) 
	{ 
		uIndex = uchCRCHi ^ *puchMsg++ ; 
		uchCRCHi = uchCRCLo ^ auchCRCHi[uIndex] ; 
		uchCRCLo = auchCRCLo[uIndex] ; 
	} 
	return ((uchCRCHi<< 8)  | (uchCRCLo)) ; 
}//uint16 crc16(uint8 *puchMsg, uint16 usDataLen)
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//初始化USART2
void RS485_Init(void)
{
        GPIO_InitTypeDef GPIO_InitStructure;
        USART_InitTypeDef USART_InitStructure;
        NVIC_InitTypeDef NVIC_InitStructure;
        RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA|RCC_APB2Periph_GPIOD,ENABLE);
        RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
        
        GPIO_InitStructure.GPIO_Pin=GPIO_Pin_2;//PA2（TX）复用推挽输出
        GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
        GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
        GPIO_Init(GPIOA,&GPIO_InitStructure);
        GPIO_SetBits(GPIOA,GPIO_Pin_2);//默认高电平
        
        GPIO_InitStructure.GPIO_Pin=GPIO_Pin_3;//PA3（RX）输入上拉
        GPIO_InitStructure.GPIO_Mode=GPIO_Mode_IN_FLOATING;   //修改原GPIO_Mode_IPU（输入上拉）->GPIO_Mode_IN_FLOATING(浮空输入)/////////////////////////////////////////////
        GPIO_Init(GPIOA,&GPIO_InitStructure);
        
        GPIO_InitStructure.GPIO_Pin=GPIO_Pin_7;//修改PG9（RE/DE）通用推挽输出->PD7（RE/DE）通用推挽输出//////////////////////////////////////////////////////////////////////
        GPIO_InitStructure.GPIO_Mode=GPIO_Mode_Out_PP;
        GPIO_Init(GPIOD,&GPIO_InitStructure);
        GPIO_ResetBits(GPIOD,GPIO_Pin_7);//默认接收状态
        
        USART_DeInit(USART2);//复位串口2
        USART_InitStructure.USART_BaudRate=RS485_Baudrate;
        USART_InitStructure.USART_HardwareFlowControl=USART_HardwareFlowControl_None;
        USART_InitStructure.USART_WordLength=USART_WordLength_8b;
        USART_InitStructure.USART_StopBits=USART_StopBits_1;
        USART_InitStructure.USART_Mode=USART_Mode_Rx|USART_Mode_Tx;//收发模式
        switch(RS485_Parity)
        {
                case 0:USART_InitStructure.USART_Parity=USART_Parity_No;break;//无校验
                case 1:USART_InitStructure.USART_Parity=USART_Parity_Odd;break;//奇校验
                case 2:USART_InitStructure.USART_Parity=USART_Parity_Even;break;//偶校验
        }
        USART_Init(USART2,&USART_InitStructure);
        
        USART_ClearITPendingBit(USART2,USART_IT_RXNE);
        USART_ITConfig(USART2,USART_IT_RXNE,ENABLE);//使能串口2接收中断
        
        NVIC_InitStructure.NVIC_IRQChannel=USART2_IRQn;
        NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority=2;
        NVIC_InitStructure.NVIC_IRQChannelSubPriority=2;
        NVIC_InitStructure.NVIC_IRQChannelCmd=ENABLE;
        NVIC_Init(&NVIC_InitStructure);
        
        USART_Cmd(USART2,ENABLE);//使能串口2
        RS485_TX_EN=1;//默认为接收模式
        
        Timer7_Init();//定时器7初始化，用于监视空闲时间
        //Modbus_RegMap();//Modbus寄存器映射
}
////////////////////////////////////////////////////////////////////////////////////////////////////////
//定时器4初始化
//定时1s进行通讯，分2步，前500ms进行发送功能，后500ms处理从机返回的数据
void Timer4_enable(u16 arr)	   	//TIM4使能
{
	TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
	NVIC_InitTypeDef NVIC_InitStructure;

	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4, ENABLE); //时钟使能	
	TIM_TimeBaseStructure.TIM_Period = arr; //设置在下一个更新事件装入活动的自动重装载寄存器周期的值	 计数到5000为500ms
	TIM_TimeBaseStructure.TIM_Prescaler = 7199; //设置用来作为TIMx时钟频率除数的预分频值  10Khz的计数频率  
	TIM_TimeBaseStructure.TIM_ClockDivision = 0; //设置时钟分割:TDTS = Tck_tim
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;  //TIM向上计数模式
	TIM_TimeBaseInit(TIM4, &TIM_TimeBaseStructure); //根据TIM_TimeBaseInitStruct中指定的参数初始化TIMx的时间基数单位
 
	TIM_ITConfig(  //使能或者失能指定的TIM中断
		TIM4, //TIM2
		TIM_IT_Update  |  //TIM 中断源
		TIM_IT_Trigger,   //TIM 触发中断源 
		ENABLE  //使能
		);

	NVIC_InitStructure.NVIC_IRQChannel = TIM4_IRQn;  //TIM3中断
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 3;  //先占优先级0级
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 3;  //从优先级3级
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; //IRQ通道被使能
	NVIC_Init(&NVIC_InitStructure);  //根据NVIC_InitStruct中指定的参数初始化外设NVIC寄存器

	TIM_Cmd(TIM4, ENABLE);  //使能TIMx外设							 
}

void Timer4_disable (void)					   //TIM4失能
{
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4, DISABLE); //时钟失能
	TIM_ITConfig(TIM4, TIM_IT_Update | TIM_IT_Trigger,DISABLE );
	TIM_Cmd(TIM4, DISABLE);  //失能TIMx外设
}
///////////////////////////////////////////////////////////////////////////////////////////////
//定时器7初始化---功能：判断从机返回的数据是否接受完成

void Timer7_Init(void)
{
        TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
        NVIC_InitTypeDef NVIC_InitStructure;

        RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM7, ENABLE); //TIM7时钟使能 

        //TIM7初始化设置
        TIM_TimeBaseStructure.TIM_Period = RS485_Frame_Distance*10; //设置在下一个更新事件装入活动的自动重装载寄存器周期的值
        TIM_TimeBaseStructure.TIM_Prescaler =7199; //设置用来作为TIMx时钟频率除数的预分频值 设置计数频率为10kHz
        TIM_TimeBaseStructure.TIM_ClockDivision = 0; //设置时钟分割:TDTS = Tck_tim
        TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;  //TIM向上计数模式
        TIM_TimeBaseInit(TIM7, &TIM_TimeBaseStructure); //根据TIM_TimeBaseInitStruct中指定的参数初始化TIMx的时间基数单位

        TIM_ITConfig( TIM7, TIM_IT_Update, ENABLE );//TIM7 允许更新中断

        //TIM7中断分组配置
        NVIC_InitStructure.NVIC_IRQChannel =TIM7_IRQn;  //TIM7中断
        NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 2;  //先占优先级2级
        NVIC_InitStructure.NVIC_IRQChannelSubPriority = 3;  //从优先级3级
        NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; //IRQ通道被使能
        NVIC_Init(&NVIC_InitStructure);  //根据NVIC_InitStruct中指定的参数初始化外设NVIC寄存器                                                                  
}






/////////////////////////////////////////////////////////////////////////////////////
void USART2_IRQHandler(void)//串口2中断服务程序
{
	   
        u8 res;
        u8 err;
	 
        if(USART_GetITStatus(USART2,USART_IT_RXNE)!=RESET)
        {
                if(USART_GetFlagStatus(USART2,USART_FLAG_NE|USART_FLAG_FE|USART_FLAG_PE)) {err=1;errpace=2;}//检测到噪音、帧错误或校验错误
                else err=0;
                res=USART_ReceiveData(USART2); //读接收到的字节，同时相关标志自动清除
                
                if((RS485_RX_CNT<2047)&&(err==0))
                {
                        RS485_RX_BUFF[RS485_RX_CNT]=res;
                        RS485_RX_CNT++;
                        
                        TIM_ClearITPendingBit(TIM7,TIM_IT_Update);//清除定时器溢出中断
                        TIM_SetCounter(TIM7,0);//当接收到一个新的字节，将定时器7复位为0，重新计时（相当于喂狗）
                        TIM_Cmd(TIM7,ENABLE);//开始计时
                }
        }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////
void TIM4_IRQHandler(void)   //TIM4中断
{
	if (TIM_GetITStatus(TIM4,TIM_IT_Update) == SET) //检查指定的TIM中断发生与否:TIM 中断源 
	{
		TIM_ClearITPendingBit(TIM4, TIM_IT_Update  );  //清除TIMx的中断待处理位:TIM 中断源 ;
		modbus_rtu();
		
	}
}

///////////////////////////////////////////////////////////////////////////////////////

//用定时器7判断接收空闲时间,当空闲时间大于指定时间，认为一帧结束
//定时器7中断服务程序         
void TIM7_IRQHandler(void)
{                                                                   
	if(TIM_GetITStatus(TIM7,TIM_IT_Update)!=RESET)
	{
		TIM_ClearITPendingBit(TIM7,TIM_IT_Update);//清除中断标志
		TIM_Cmd(TIM7,DISABLE);//停止定时器
		RS485_TX_EN=1;//停止接收，切换为发送状态
		RS485_RxFlag=1;//置位帧结束标记
		errpace=1;
	}
}

//////////////////////////////////////////////////////////////////////////////
//发送n个字节数据 主机将数据进行发送
//buff:发送区首地址
//len：发送的字节数
void RS485_SendData(u8 *buff,u8 len)
{ 
		RS485_TX_EN=1;//切换为发送模式
		while(len--)
		{
						while(USART_GetFlagStatus(USART2,USART_FLAG_TXE)==RESET);//等待发送区为空
						USART_SendData(USART2,*(buff++));
		}
		while(USART_GetFlagStatus(USART2,USART_FLAG_TC)==RESET);//等待发送完成
		TX_RX_SET=1; //发送命令完成，定时器T4处理接收到的数据
		RS485_TX_EN=0;
}


/////////////////////////////////////////////////////////////////////////////////////
//通讯策略
void modbus_rtu(void)
{	
	static u8 i=0;
	static u8 j=0;
	switch(i)
	{
		case 0:      //modbus执行命令第一步。
				//RS485_TX_Service();  //向从机发送一个请求。就在此时发送完成TX_RX_SET=1 发送命令完成，定时器T4处理接收到的数据
		    //在此处也可以直接写Master_Service( SlaverAddr, Fuction, StartAddr, ValueOrLenth);
		    //多次通讯结果可以按照类似的封装进行填写
		    
		    RS485_TX_Service();
 	  		if(TX_RX_SET) i=1; //发送，接受命令切换。 0 发送模式 1 接受模式
		    
		
		    state=1;
				break;
		case 1:     //modbus命令执行第二步。
				RS485_RX_Service();  //执行数据接收 
		    state=2;
				if(ComErr==0)  //如果什么错误都没有发生
				{
					i=2;//完成命令更换功能码！
				} //一次通讯已经完成
				else   //错误接收后再次准备接收
				{
					i=1;//
					j++;//一个命令发送3次没有应答切换下一个命令
					if(j>=2)
					{
						j=0;
						i=2;
						ComErr=7;  //通讯超时
					}				
				}
				break;
		case 2: //从机地址++	
		    i=0;
		    state=3;
				break;
		case 3://功能码,这个是空余出来做报错以及其他处理的
				break;				
			
	}
	
}
	

//Modbus功能码03处理程序///////////////////////////////////////////////////////////////////////////////////////
//读保持寄存器
void Master_03_Slove( u8 board_adr,u16 start_address,u16 lenth )
{ 
	u16 calCRC;
    RS485_TX_BUFF[0] = board_adr;
    RS485_TX_BUFF[1] = READ_HLD_REG;    //modbus 指令码03
    RS485_TX_BUFF[2] = HI(start_address);  
    RS485_TX_BUFF[3] = LOW(start_address); 
    RS485_TX_BUFF[4] = HI(lenth);
    RS485_TX_BUFF[5] = LOW(lenth);
    calCRC=CRC_Compute(RS485_TX_BUFF,6);
    RS485_TX_BUFF[6]=(calCRC>>8)&0xFF;
    RS485_TX_BUFF[7]=(calCRC)&0xFF;
	RS485_SendData(RS485_TX_BUFF,8);
}
//Modbus功能码04处理程序/////////////////////////////////////////////////////////////////////////////////////// 未使用
//读输入寄存器
void Master_04_Slove( u8 board_adr,u16 start_address,u16 lenth )
{ 
	u16 calCRC;
    RS485_TX_BUFF[0] = board_adr;
    RS485_TX_BUFF[1] = READ_AI;    //modbus 指令码04
    RS485_TX_BUFF[2] = HI(start_address);  
    RS485_TX_BUFF[3] = LOW(start_address); 
    RS485_TX_BUFF[4] = HI(lenth);
    RS485_TX_BUFF[5] = LOW(lenth);
    calCRC=CRC_Compute(RS485_TX_BUFF,6);
    RS485_TX_BUFF[6]=(calCRC>>8)&0xFF;
    RS485_TX_BUFF[7]=(calCRC)&0xFF;
	RS485_SendData(RS485_TX_BUFF,8);
}


//Modbus功能码06处理程序   //////////////////////////////////////////////////////////////////////////////////
//写单个保持寄存器
void Master_06_Slove(u8 board_adr,u16 start_address, u16 value)
{
	u16 calCRC;
	if(value==1)
	{
	RS485_TX_BUFF[0] = board_adr;
    RS485_TX_BUFF[1] = SET_HLD_REG;   //modbus 指令码06
    RS485_TX_BUFF[2] = HI(start_address);  
    RS485_TX_BUFF[3] = LOW(start_address); 
    RS485_TX_BUFF[4] = HI(Master_WriteReg[start_address]);
    RS485_TX_BUFF[5] = LOW(Master_WriteReg[start_address]);
    calCRC=CRC_Compute(RS485_TX_BUFF,6);
	RS485_TX_BUFF[6]=(calCRC>>8)&0xFF;
    RS485_TX_BUFF[7]=(calCRC)&0xFF;
	RS485_SendData(RS485_TX_BUFF,8);
	}		
}
void Master_Service(u8 SlaverAddr,u8 Fuction,u16 StartAddr,u16 ValueOrLenth)
{    
 
	switch(Fuction)
	{
		case 03:
				Master_03_Slove(SlaverAddr,StartAddr,ValueOrLenth);
				break;
		case 06:
				Master_06_Slove(SlaverAddr,StartAddr,ValueOrLenth);
				break;
	}
		
}

void RS485_TX_Service(void)
{
	Master_Service( SlaverAddr, Fuction, StartAddr, ValueOrLenth);
}


/////////////////////////////////////////////////////////////////////////////////////
//RS485服务程序，用于处理接收到的数据(请在主函数中循环调用)

void RS485_RX_Service(void)
{
		u16 calCRC;
        u16 recCRC;
        if(RS485_RxFlag==1)
        {
                if(RS485_RX_BUFF[0]==SlaverAddr)//地址正确
                {
                        if((RS485_RX_BUFF[1]==01)||(RS485_RX_BUFF[1]==02)||(RS485_RX_BUFF[1]==03)||(RS485_RX_BUFF[1]==05)||(RS485_RX_BUFF[1]==06)||(RS485_RX_BUFF[1]==15)||(RS485_RX_BUFF[1]==16))//功能码正确
					            	{
                                        calCRC=CRC_Compute(RS485_RX_BUFF,RS485_RX_CNT-2);//计算所接收数据的CRC
                                        recCRC=RS485_RX_BUFF[RS485_RX_CNT-1]|(((u16)RS485_RX_BUFF[RS485_RX_CNT-2])<<8);//接收到的CRC(低字节在前，高字节在后)
                                        if(calCRC==recCRC)//CRC校验正确
                                        {
                                                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                switch(RS485_RX_BUFF[1])//根据不同的功能码进行处理
                                                {    
                                                        case 03: //读单个寄存器，现在目前只用这一个先，只能读一个。
                                                        {																
                                                                Modbus_03_Solve();
                                                                break;
                                                        }
                                                                
                                                        case 06: 
                                                        {
                                                                Modbus_06_Solve();
                                                                break;
                                                        }
                                                                
                                                        case 16: 
                                                        {
                                                                Modbus_16_Solve();															
                                                                break;
                                                        }
                                                                                        
                                                }
										}
                                        else//CRC校验错误
                                        {
												  ComErr=14;

                                        }                                                                                       
						}
                        else//功能码错误
                        {
							if((RS485_RX_BUFF[1]==0x81)||(RS485_RX_BUFF[1]==0x82)||(RS485_RX_BUFF[1]==0x83)||(RS485_RX_BUFF[1]==0x85)||(RS485_RX_BUFF[1]==0x86)||(RS485_RX_BUFF[1]==0x8F)||(RS485_RX_BUFF[1]==0x90))
							{
								switch(RS485_RX_BUFF[2])
								{
									case 0x01:
												ComErr=11;
												break;
									case 0x02:
												ComErr=12;
												break;
									case 0x03:
												ComErr=13;
												break;
									case 0x04:
												ComErr=14;
												break;
									
								}
								TX_RX_SET=0; //命令完成	
							}
                        }
          }                              
                RS485_RxFlag=0;//复位帧结束标志
                RS485_RX_CNT=0;//接收计数器清零
                RS485_TX_EN=1;//开启发送模式  
				        TX_RX_SET=0; //命令完成
        }                
}



//Modbus功能码03处理程序///////////////////////////////////////////////////////////////////////////////////////已验证程序OK
//读保持寄存器
//排除了寄存器的字节验证机制，采用默认的轮询周期清空缓存区
void Modbus_03_Solve(void)
{
    u8 i;
		//u8 RegNum;
        //RegNum= RS485_RX_BUFF[2]/2;//获取字节数 6---->?
        if(1)//寄存器地址+数量在范围内
        {
                for(i=0;i<20;i++)
                {
                       //Master_ReadReg[StartAddr+i]= RS485_RX_BUFF[3+i*2];           /////////高8位
                       //Master_ReadReg[StartAddr+i]= RS485_RX_BUFF[4+i*2]+(Master_ReadReg[StartAddr+i]<<8);// 低8位+高8位
									     Master_ReadReg[i]= RS485_RX_BUFF[3+i*2]; 
									     Master_ReadReg[i]= RS485_RX_BUFF[4+i*2]+(Master_ReadReg[i]<<8);// 低8位+高8位
                }
         message=Master_ReadReg[i-1] ;      								
		     //volback(message);
				 ComErr=0;
        }
		else
		{
			
				ComErr=3;
		}
		TX_RX_SET=0; //命令完成
}

//Modbus功能码05处理程序   ///////////////////////////////////////////////////////程序已验证OK
//写单个输出开关量
void Modbus_05_Solve(void)
{
       u16 i;
	   i=ValueOrLenth;
	   if((i>0&&RS485_RX_BUFF[4]==0XFF&&RS485_RX_BUFF[5]==0X00)||(i==0&&RS485_RX_BUFF[4]==0X00&&RS485_RX_BUFF[5]==0X00))
	   {
			ComErr=0;
			
	   }
	   else
	   {
			ComErr=5;
	   }
	   TX_RX_SET=0; //命令完成	   
}

//Modbus功能码06处理程序   //////////////////////////////////////////////////////////////////////////////////已验证程序OK
//写单个保持寄存器
void Modbus_06_Solve(void)
{
		u16 i; //数据返回校验用    
		i=(((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//获取寄存器数量
        if(i==Master_WriteReg[StartAddr])
		{
			ComErr=0;
		}
		else
		{
			ComErr=6;
		}
		TX_RX_SET=0; //命令完成

}
//Modbus功能码15处理程序   //////////////////////////////////////////////////////程序已验证OK
//写多个输出开关量
void Modbus_15_Solve(void)
{
        u16 i;//数据返回校验用
        i=(((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//获取寄存器数量
         if(i==ValueOrLenth)
		{
			ComErr=0;
		}
         else
		{
			ComErr=15;
		}
		TX_RX_SET=0; //命令完成   
}

//Modbus功能码16处理程序 /////////////////////////////////////////////////////////////////////////////////////////////////已验证程序OK
//写多个保持寄存器
void Modbus_16_Solve(void)
{
        u16 i;//数据返回校验用
        i= (((u16)RS485_RX_BUFF[4])<<8)|((RS485_RX_BUFF[5]));//获取寄存器数量
        if(i==ValueOrLenth)
		{
			ComErr=0;
		}
         else
		{
			ComErr=16;
		}
		TX_RX_SET=0; //命令完成           
}

//测试函数，实际使用时请忽略
//只读寄存器----存储从机返回的数据          功能码 03 目前是只用这一个
//内存数据返回以及测试，返回值已经是合并的数值
//函数
u16 Master_ReadReginput(u8 teamcounter)
{
	return Master_ReadReg[teamcounter];
}
u16 Master_sendReginput(u8 teamcounter)
{
	return RS485_TX_BUFF[teamcounter];
}
u16 RS485_RX_BUFFback(u8 count)
{
	return RS485_RX_BUFF[count];
}
//返回电压值
u16 volback()
{
	return message=0*0.1;
}
 
u16 erroeback()
{
	return ComErr;
}

u16 errpaceback()
{
	return errpace;
}

u16 stateback()
{
	return state;
}

