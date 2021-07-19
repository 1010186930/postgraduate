#include "GP8202.h"
#include "myiic.h"
#include "delay.h"


void GP8202_Init(void)	//初始化I2C
{
	IIC_Init();
//	IIC_Start();	
//	IIC_Send_Byte(0xb0);
//	IIC_Wait_Ack();
//	IIC_Send_Byte(0x02);
//	IIC_Wait_Ack();
//	IIC_NAck();
//	IIC_Stop();	
}

void GP8202_SendDate(u16 Sv) //发送电压数据
{
	u8 low,high;
	low=Sv&0XFF;
	high=Sv>>8;
	GP8202_WriteOneByte(low,high);
}	

u8 GP8202_WriteOneByte(u8 data_low,u8 data_high)  //写电压数据
{
    IIC_Start();
    IIC_Send_Byte(GP8202_ADDR|0xb0|0X00);//发送器件地址+写命令
    IIC_Wait_Ack();             //等待应答
	IIC_Send_Byte(0X02);
	IIC_Wait_Ack();   		
    IIC_Send_Byte(data_low);        //发送数据
	IIC_Wait_Ack();      
	IIC_Send_Byte(data_high);
	IIC_Wait_Ack();     
    IIC_Stop();
    return 0;
}






