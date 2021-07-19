#include "myiic.h"
#include "delay.h"
 	  

//初始化IIC
void IIC_Init(void)
{					     
	GPIO_InitTypeDef GPIO_InitStructure;
	//RCC->APB2ENR|=1<<4;//先使能外设IO PORTC时钟 
	RCC_APB2PeriphClockCmd(	RCC_APB2Periph_GPIOA, ENABLE );	
	   
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4|GPIO_Pin_5;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP ;   //推挽输出
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz; //8202 CLK 40M
	GPIO_Init(GPIOA, &GPIO_InitStructure);
	GPIO_SetBits(GPIOA,GPIO_Pin_4|GPIO_Pin_5);

}
//产生IIC起始信号
void IIC_Start(void)
{
	SDA_OUT();     //sda线输出
	IIC_SDA=1;
	delay_us(5);	
	IIC_SCL=1;
	delay_us(5);
 	IIC_SDA=0;//START:when CLK is high,DATA change form high to low 
	delay_us(5);
	IIC_SCL=0;//钳住I2C总线，准备发送或接收数据 
}	  
//产生IIC停止信号
void IIC_Stop(void)
{
	SDA_OUT();//sda线输出
	IIC_SDA=0;//STOP:when CLK is high DATA change form low to high
 	delay_us(5);
	IIC_SCL=1; 
	delay_us(5);
	IIC_SDA=1;//发送I2C总线结束信号
								   	
}
//等待应答信号到来
//返回值：1，接收应答失败
//        0，接收应答成功
u8 IIC_Wait_Ack(void)
{
	u8 ucErrTime=0;
	SDA_IN();      //SDA设置为输入 
	IIC_SCL=0;
	delay_us(5);	   
	IIC_SDA=1;
	IIC_SCL=1;
	delay_us(5);	
	while(READ_SDA)
	{
		ucErrTime++;
		if(ucErrTime>250)
		{
			IIC_Stop();
			return 1;
		}
	}
	IIC_SCL=0;//时钟输出0 	   
	return 0;  
} 
//产生ACK应答
void IIC_Ack(void)
{
	SDA_OUT();
	IIC_SCL=0;
	IIC_SDA=0;
	delay_us(5);
	IIC_SCL=1;
	delay_us(5);
	IIC_SCL=0;
	delay_us(5);
	IIC_SDA=0;
}
//不产生ACK应答		    
void IIC_NAck(void)
{
	SDA_OUT();
	IIC_SDA=1;
	IIC_SCL=0;
	delay_us(5);
	IIC_SCL=1;
	delay_us(5);
	IIC_SCL=0;
}					 				     
//IIC发送一个字节
//返回从机有无应答
//1，有应答
//0，无应答			  
void IIC_Send_Byte(u8 txd)
{                        
    u8 t;   
	SDA_OUT(); 	    
    for(t=0;t<8;t++)
    {       
		IIC_SCL=0;//拉低时钟开始数据传输
		delay_us(5);
        IIC_SDA=(txd&0x80)>>7;
		delay_us(5);
		IIC_SCL=1;
		delay_us(5);
        txd<<=1; 	  
    }
	IIC_SCL=0;	
} 	    
//读1个字节，ack=1时，发送ACK，ack=0，发送nACK   
u8 IIC_Read_Byte(unsigned char ack)
{
	unsigned char i,receive=0;
	SDA_IN();//SDA设置为输入
    for(i=0;i<8;i++ )
	{
        IIC_SCL=0; 
        delay_us(5);
		IIC_SCL=1;
		delay_us(5);
        receive<<=1;
        if(READ_SDA)receive++;   
		delay_us(1); 
    }					 
    if (!ack)
        IIC_NAck();//发送nACK
    else
        IIC_Ack(); //发送ACK   
    return receive;
}
void W_Byte1(u8 uByteVal)
{
	
    u8 iCount;
	SDA_OUT(); 
    for(iCount = 0;iCount < 8;iCount++)
	{  
		IIC_SCL = 0;
		delay_us(5);			
		IIC_SDA = (uByteVal & 0x80) >> 7;
		delay_us(5);         
		IIC_SCL = 1;
		delay_us(5);;
		uByteVal <<= 1;
    } 
	IIC_SCL = 0;   	  
}
u8 IIC_RdAck(void)                      
{ 
	u8 AckFlag;
	u8 uiVal = 0;
	SDA_IN();
	IIC_SCL = 0;
	delay_us(5);    
	IIC_SDA = 1;
	IIC_SCL = 1;
	delay_us(5);
	while((1 == IIC_SDA) && (uiVal < 255))
	{
		uiVal ++;
		AckFlag = IIC_SDA;
	} 
	IIC_SCL = 0;  
	return AckFlag;		// 应答返回：0;不应答返回：1
}

void change_data(u16 DAC_data)
{
	IIC_Start();			// 发送开始信号
	W_Byte1(0xb0);			//1011 			000		0
							//芯片代码		地址位
	IIC_RdAck();  			// 读应答信号
	W_Byte1(0x02);			//？？？
	IIC_RdAck();			// 读应答信号
	W_Byte1(DAC_data%256);	//数据 低八位											
	IIC_RdAck();			// 读应答信号
	W_Byte1(DAC_data>>8);	//数据 高四位		
	IIC_RdAck();			// 读应答信号
	IIC_Stop();
}
























