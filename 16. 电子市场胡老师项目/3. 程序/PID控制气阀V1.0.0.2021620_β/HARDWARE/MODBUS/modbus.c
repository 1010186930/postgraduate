#include "modbus.h"
#include "rs485.h"
#include "time.h"
#include "crc.h"
#include "stdlib.h"
#include "string.h"
#include "stdio.h"
#include "pid.h"
#include "lcd.h"
#include "GUI.h"
#include "GP8202.h"
#define EPSILON 1e-6
u16 startRegAddr = 0;//ADC->0X0001	GP8202->0x0002	set_voltagevalue->0x0003
u8 RS485_Addr = 0x01;
u16 calCRC = 0;
u16 RegNum = 0;
extern u16 Input_value;
extern u16 adcx;
//Modbus功能码03处理程序
//读GP8202
void Modbus_03_Solve(void)
{
	u8 i;
	RegNum= (((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//获取寄存器数量
	if((startRegAddr+RegNum)==0x03)//寄存器地址+数量在范围内
	{
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1];
			RS485_TX_BUFF[2]=RegNum*2;
			for(i=0;i<RegNum;i++)
			{
				RS485_TX_BUFF[3+i*2]=Input_value&0xFF; //先发送低字节
				RS485_TX_BUFF[4+i*2]=(Input_value>>8)&0xFF;//后发送高字节
			}
			calCRC=CRC16_Compute(RS485_TX_BUFF,RegNum*2+3);
			RS485_TX_BUFF[RegNum*2+3]=calCRC&0xFF;
			RS485_TX_BUFF[RegNum*2+4]=(calCRC>>8)&0xFF;
			RS485_SendData(RS485_TX_BUFF,RegNum*2+5);
	}
	else//寄存器地址+数量超出范围
	{
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
			RS485_TX_BUFF[2]=0x02; //异常码
			RS485_SendData(RS485_TX_BUFF,3);
	}
}

//Modbus功能码04处理程序
//读ADC
void Modbus_04_Solve(void)
{
	u8 i;
	RegNum= (((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//获取寄存器数量
	if((startRegAddr+RegNum)==0x02)//寄存器地址+数量在范围内
	{
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1];
			RS485_TX_BUFF[2]=RegNum*2;
			for(i=0;i<RegNum;i++)
			{
					RS485_TX_BUFF[3+i*2]=adcx&0xFF;//先发送低字节
					RS485_TX_BUFF[4+i*2]=(adcx>>8)&0xFF; //后发送高字节
			}
			calCRC=CRC16_Compute(RS485_TX_BUFF,RegNum*2+3);
			RS485_TX_BUFF[RegNum*2+3]=calCRC&0xFF;
			RS485_TX_BUFF[RegNum*2+4]=(calCRC>>8)&0xFF;
			RS485_SendData(RS485_TX_BUFF,RegNum*2+5);
	}
	else//寄存器地址+数量超出范围
	{
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
			RS485_TX_BUFF[2]=0x02; //异常码
			RS485_SendData(RS485_TX_BUFF,3);
	}
}

//Modbus功能码06处理程序
//写GP8202 高字节在前
void Modbus_06_Solve(void)
{
//	char convertbuf[20]="";
	if(startRegAddr==0x02)
	{
		Input_value=((u16)RS485_RX_BUFF[4]<<8|RS485_RX_BUFF[5]);//高在前
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1];
		RS485_TX_BUFF[2]=RS485_RX_BUFF[2];
		RS485_TX_BUFF[3]=RS485_RX_BUFF[3];
		RS485_TX_BUFF[4]=RS485_RX_BUFF[4];
		RS485_TX_BUFF[5]=RS485_RX_BUFF[5];

		calCRC=CRC16_Compute(RS485_TX_BUFF,6);
		RS485_TX_BUFF[6]=calCRC&0xFF;
		RS485_TX_BUFF[7]=(calCRC>>8)&0xFF;
		RS485_SendData(RS485_TX_BUFF,8);
//		sprintf(convertbuf,"Input_value:%x\n",Input_value);
//		RS485_SendData((u8*)convertbuf,strlen(convertbuf));
		if((u16)Input_value<=0x800)
			GP8202_SendDate(Input_value);
		else
		{
			GP8202_SendDate(0x000);

		}
	}
	else//寄存器地址+数量超出范围
	{
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
		RS485_TX_BUFF[2]=0x02; //异常码
		RS485_SendData(RS485_TX_BUFF,3);
	}
}

//Modbus功能码17处理程序
//写set_voltagevalue
void Modbus_17_Solve(void)
{
	u8 convertbuf[10]="";
	char disbuf[50]="";
	double res;
	u8 cnt= RS485_RX_BUFF[6];
	u8 len= strlen((const char*)RS485_RX_BUFF);
	RegNum= (((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//获取寄存器数量
	if((startRegAddr+RegNum)==0x04&&cnt<=0x05)//寄存器地址+数量在范围内
	{
		strncpy((char*)convertbuf,(char*)(RS485_RX_BUFF+7),cnt);
		
		res=atof((char*)convertbuf);
		if ((res - 1.067) >= EPSILON && (3.618 - res) >= EPSILON)
		{
			set_voltagevalue=res;
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1];
			RS485_TX_BUFF[2]=RS485_RX_BUFF[2];
			RS485_TX_BUFF[3]=RS485_RX_BUFF[3];
			RS485_TX_BUFF[4]=RS485_RX_BUFF[4];
			RS485_TX_BUFF[5]=RS485_RX_BUFF[5];

			calCRC=CRC16_Compute(RS485_TX_BUFF,6);
			RS485_TX_BUFF[6]=calCRC&0xFF;
			RS485_TX_BUFF[7]=(calCRC>>8)&0xFF;
			RS485_SendData(RS485_TX_BUFF,8);
			POINT_COLOR=BROWN;
			set_flowvalue=VoltagetoFlow(set_voltagevalue);
			sprintf(disbuf,"%.3f",set_flowvalue);
			strcat(disbuf,"ml");
			LCD_Fill(5,110,100,126,WHITE);
			POINT_COLOR=WHITE;
			len=Float_to_Bit(set_flowvalue,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);
			switch(len)
			{
				case 5:
					LCD_ShowNum(5,110,0,1,16);
					LCD_ShowNum(13,110,0,1,16);
					LCD_ShowNum(21,110,0,1,16);
					POINT_COLOR=BROWN;
					Show_Str(29,110,POINT_COLOR,BACK_COLOR,(u8*)disbuf,16,1);
					break;
				case 6:
					LCD_ShowNum(5,110,0,1,16);
					LCD_ShowNum(13,110,0,1,16);
					POINT_COLOR=BROWN;
					Show_Str(21,110,POINT_COLOR,BACK_COLOR,(u8*)disbuf,16,1);
					break;
				case 7:
					LCD_ShowNum(5,110,0,1,16);
					POINT_COLOR=BROWN;
					Show_Str(13,110,POINT_COLOR,BACK_COLOR,(u8*)disbuf,16,1);
					break;
				default:
					POINT_COLOR=BROWN;
					Show_Str(5,110,POINT_COLOR,BACK_COLOR,(u8*)disbuf,16,1);
					break;
			}
		}
		else
		{
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
			RS485_TX_BUFF[2]=0x05; //异常码
			RS485_SendData(RS485_TX_BUFF,3);
		}
	}
	else if((startRegAddr+RegNum)!=0x04)//寄存器地址+数量超出范围
	{
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
		RS485_TX_BUFF[2]=0x02; //异常码
		RS485_SendData(RS485_TX_BUFF,3);
	}
	else if(cnt>0x05)//超过了规定写入字节数
	{
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
		RS485_TX_BUFF[2]=0x03; //异常码
		RS485_SendData(RS485_TX_BUFF,3);
	}
}

//Modbus功能码18处理程序
//读set_voltagevalue
void Modbus_18_Solve(void)
{
	u8 convertbuf[10]="";
	u8 cnt;
	u8 len;
	u8 i=0;
	RegNum= (((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//获取寄存器数量
	if((startRegAddr+RegNum)==0x04)//寄存器地址+数量在范围内
	{
		sprintf((char*)convertbuf,"%.3f",set_voltagevalue);
		len=strlen((char*)convertbuf);
		
		
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1];
		RS485_TX_BUFF[2]=len;
		for(i=0;i<len;i++)
		{
			RS485_TX_BUFF[3+i]=convertbuf[i];
		}
		calCRC=CRC16_Compute(RS485_TX_BUFF,len+3);
		RS485_TX_BUFF[len+3]=calCRC&0xFF;
		RS485_TX_BUFF[len+4]=(calCRC>>8)&0xFF;
		RS485_SendData(RS485_TX_BUFF,len+5);
	}
	else //寄存器地址+数量超出范围
	{
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
		RS485_TX_BUFF[2]=0x02; //异常码
		RS485_SendData(RS485_TX_BUFF,3);
	}
}


void MODBUS_Service(void)
{
//	char convertbuf[20]="";
    u16 recCRC;
    if(RS485_FrameFlag==1)
    {
        if(RS485_RX_BUFF[0]==RS485_Addr)//地址正确
        {
            if((RS485_RX_BUFF[1]==0x03)||(RS485_RX_BUFF[1]==0x04)||(RS485_RX_BUFF[1]==0x06)||(RS485_RX_BUFF[1]==0x17)||(RS485_RX_BUFF[1]==0x18))//功能码正确
            {
                startRegAddr=(((u16)RS485_RX_BUFF[2])<<8)|RS485_RX_BUFF[3];//获取寄存器起始地址
                if(startRegAddr<0x04)//寄存器地址在范围内
                {
                    calCRC=CRC16_Compute(RS485_RX_BUFF,RS485_RX_CNT-2);//计算所接收数据的CRC
//					sprintf(convertbuf,"cal:%x\n",calCRC);
//					RS485_SendData((u8*)convertbuf,strlen(convertbuf));
                    recCRC=RS485_RX_BUFF[RS485_RX_CNT-2]|(((u16)RS485_RX_BUFF[RS485_RX_CNT-1])<<8);//接收到的CRC(低字节在前，高字节在后)
//					sprintf(convertbuf,"rec:%x\n",recCRC);
//					RS485_SendData((u8*)convertbuf,strlen(convertbuf));
                    if(calCRC==recCRC)//CRC校验正确
                    {
                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        switch(RS485_RX_BUFF[1])//根据不同的功能码进行处理
                        {
							case 0x03://读输入开关量:8202值 读到的低字节在前高字节在后 checked
                        {
                            Modbus_03_Solve();
                            break;
                        }

                        case 0x04://读输出开关量:ADC值 checked
                        {
                            Modbus_04_Solve();
                            break;
                        }

                        case 0x06://写单个输出开关量 写GP8202 写入高字节在前低字节在后 checked
                        {
                            Modbus_06_Solve();
                            break;
                        }

                        case 0x17://写多个输出开关量 写set_voltagevalue 字符串写入 最多5位数（包括小数点） 范围1.068~3.617 checked
                        {
                            Modbus_17_Solve();
                            break;
                        }

                        case 0x18: //读多个寄存器 读set_voltagevalue checked
                        {
                            Modbus_18_Solve();
                            break;
                        }
						default:
							break;
                        }
                        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    }
                    else//CRC校验错误
                    {
                        RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
                        RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
                        RS485_TX_BUFF[2]=0x04; //异常码
                        RS485_SendData(RS485_TX_BUFF,3);
                    }
                }
                else//寄存器地址超出范围
                {
                    RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
                    RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
                    RS485_TX_BUFF[2]=0x02; //异常码
                    RS485_SendData(RS485_TX_BUFF,3);
                }
            }
            else//功能码错误
            {
                RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
                RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
                RS485_TX_BUFF[2]=0x01; //异常码
                RS485_SendData(RS485_TX_BUFF,3);
            }
        }

        RS485_FrameFlag=0;//复位帧结束标志
        RS485_RX_CNT=0;//接收计数器清零
        RS485_TX_EN=0;//开启接收模式
    }
}