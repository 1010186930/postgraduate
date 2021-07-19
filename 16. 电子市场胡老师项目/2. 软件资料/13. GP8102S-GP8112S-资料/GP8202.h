#ifndef __GP8202_H__
#define __GP8202_H__
//I^C接口，GP8202
sbit SCL = 	P1^2;   
sbit SDA = 	P1^3;
u16 DAC_data;
//-------------------------------------------------
// 函数名称：Delay5US()
// 函数功能：5微秒延时,如果自己的主频有变，请自行修改
// 入口参数：无
// 出口参数：无
//-------------------------------------------------
void Delay5US(void)		//@11.0592MHz
{
	u8 i;
	i = 11;
	while (--i);
}
//-------------------------------------------------
// 函数名称：IIC_Start()
// 函数功能：IIC起动
// 入口参数：无
// 出口参数：无
//-------------------------------------------------
void IIC_Start(void)
{
	SDA = 1;
	Delay5US();
	SCL = 1;
	Delay5US();
	SDA = 0;
	Delay5US();
}
//-------------------------------------------------
// 函数名称：IIC_Stop()
// 函数功能：IIC停止
// 入口参数：无
// 出口参数：无
//-------------------------------------------------
void IIC_Stop(void)                     
{
	SDA = 0;
	Delay5US();
	SCL = 1;
	Delay5US();
	SDA =1;
}
//-------------------------------------------------
// 函数名称：IIC_Ack()
// 函数功能：IIC应答
// 入口参数：无
// 出口参数：无
//-------------------------------------------------
void IIC_Ack(void)                      
{ 
	SCL = 0;				// 为产生脉冲准备
	SDA = 0;				// 产生应答信号
	Delay5US();			
	SCL = 1;
	Delay5US();  
	SCL = 0;
	Delay5US();					// 产生高脉冲 
	SDA = 1;				// 释放总线
}
//-------------------------------------------------
// 函数名称：IIC_RdAck()
// 函数功能：读IIC应答
// 入口参数：无
// 出口参数：是否应答真值
//--------------------------------------------------
u8 IIC_RdAck(void)                      
{ 
	u8 AckFlag;
	u8 uiVal = 0;
	SCL = 0;
	Delay5US();    
	SDA = 1;
	SCL = 1;
	Delay5US();
	while((1 == SDA) && (uiVal < 255))
	{
		uiVal ++;
		AckFlag = SDA;
	}
	LED=AckFlag; 
	SCL = 0;  
	return AckFlag;		// 应答返回：0;不应答返回：1
}
//-----------------------------------------------------
// 函数名称：IIC_Nack()
// 函数功能：IIC不应答
// 入口参数：无
// 出口参数：无
//-----------------------------------------------------
void IIC_Nack(void)                    
{   
	SDA = 1;
	SCL = 0;
	Delay5US();      
	SCL = 1;
	Delay5US();      
	SCL = 0;
}
//---------------------------------------------------------
// 函数名称：R_Byte1()
// 函数功能：从IIC器件中读出一个字节
// 入口参数：无
// 出口参数：读出的一个字节（uByteVal）
//---------------------------------------------------------
u8 R_Byte1(void)        
{
	u8 uByteVal = 0;
	u8 iCount;
	SDA = 1;
	for (iCount = 0;iCount < 8;iCount++)
	{
		SCL = 0;
		Delay5US();
		SCL = 1;
		Delay5US(); 
		uByteVal <<= 1;
		if(SDA)
		uByteVal |= 0x01;
	}         
	SCL = 0;
	return(uByteVal);
}
//-------------------------------------------------------
// 函数名称：W_Byte1()
// 函数功能：向IIC器件写入一个字节
// 入口参数：待写入的一个字节（uByteVal）
// 出口参数：无
//-------------------------------------------------------
void W_Byte1(u8 uByteVal)
{
    u8 iCount;
    for(iCount = 0;iCount < 8;iCount++)
	{  
		SCL = 0;
		Delay5US();			
		SDA = (uByteVal & 0x80) >> 7;
		Delay5US();         
		SCL = 1;
		Delay5US();
		uByteVal <<= 1;
    } 
	SCL = 0;   	  
}
//-------------------------------------------------------
void Init_GP8202(void)
{
	IIC_Start();	
	W_Byte1(0xb0);
	IIC_RdAck();
	W_Byte1(0x02);
	IIC_RdAck();
	IIC_Nack();
	IIC_Stop();	
}
//----------------------------------------------------------
void change_data(DAC_data)
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
#endif

/*
#include	"GP8202.h" 
//-------------------主函数---------------------------
void main(void)
{
	GPIO_config();
//	GUHUA_GP8202();//用于固话芯片的一些数据，每个芯片只在第一次写入
	Init_GP8202(); //每次启动进行的初始化芯片
	delay_ms(200);
	DAC_data=0x0FFF;
	while(1)
	{		
		if(DAC_data==0x0000)DAC_data=0x0FFF;
		DAC_data--;
		change_data(DAC_data);
		LED=1;
	}
}
*/