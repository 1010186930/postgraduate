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
//Modbus������03�������
//��GP8202
void Modbus_03_Solve(void)
{
	u8 i;
	RegNum= (((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//��ȡ�Ĵ�������
	if((startRegAddr+RegNum)==0x03)//�Ĵ�����ַ+�����ڷ�Χ��
	{
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1];
			RS485_TX_BUFF[2]=RegNum*2;
			for(i=0;i<RegNum;i++)
			{
				RS485_TX_BUFF[3+i*2]=Input_value&0xFF; //�ȷ��͵��ֽ�
				RS485_TX_BUFF[4+i*2]=(Input_value>>8)&0xFF;//���͸��ֽ�
			}
			calCRC=CRC16_Compute(RS485_TX_BUFF,RegNum*2+3);
			RS485_TX_BUFF[RegNum*2+3]=calCRC&0xFF;
			RS485_TX_BUFF[RegNum*2+4]=(calCRC>>8)&0xFF;
			RS485_SendData(RS485_TX_BUFF,RegNum*2+5);
	}
	else//�Ĵ�����ַ+����������Χ
	{
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
			RS485_TX_BUFF[2]=0x02; //�쳣��
			RS485_SendData(RS485_TX_BUFF,3);
	}
}

//Modbus������04�������
//��ADC
void Modbus_04_Solve(void)
{
	u8 i;
	RegNum= (((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//��ȡ�Ĵ�������
	if((startRegAddr+RegNum)==0x02)//�Ĵ�����ַ+�����ڷ�Χ��
	{
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1];
			RS485_TX_BUFF[2]=RegNum*2;
			for(i=0;i<RegNum;i++)
			{
					RS485_TX_BUFF[3+i*2]=adcx&0xFF;//�ȷ��͵��ֽ�
					RS485_TX_BUFF[4+i*2]=(adcx>>8)&0xFF; //���͸��ֽ�
			}
			calCRC=CRC16_Compute(RS485_TX_BUFF,RegNum*2+3);
			RS485_TX_BUFF[RegNum*2+3]=calCRC&0xFF;
			RS485_TX_BUFF[RegNum*2+4]=(calCRC>>8)&0xFF;
			RS485_SendData(RS485_TX_BUFF,RegNum*2+5);
	}
	else//�Ĵ�����ַ+����������Χ
	{
			RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
			RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
			RS485_TX_BUFF[2]=0x02; //�쳣��
			RS485_SendData(RS485_TX_BUFF,3);
	}
}

//Modbus������06�������
//дGP8202 ���ֽ���ǰ
void Modbus_06_Solve(void)
{
//	char convertbuf[20]="";
	if(startRegAddr==0x02)
	{
		Input_value=((u16)RS485_RX_BUFF[4]<<8|RS485_RX_BUFF[5]);//����ǰ
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
	else//�Ĵ�����ַ+����������Χ
	{
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
		RS485_TX_BUFF[2]=0x02; //�쳣��
		RS485_SendData(RS485_TX_BUFF,3);
	}
}

//Modbus������17�������
//дset_voltagevalue
void Modbus_17_Solve(void)
{
	u8 convertbuf[10]="";
	char disbuf[50]="";
	double res;
	u8 cnt= RS485_RX_BUFF[6];
	u8 len= strlen((const char*)RS485_RX_BUFF);
	RegNum= (((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//��ȡ�Ĵ�������
	if((startRegAddr+RegNum)==0x04&&cnt<=0x05)//�Ĵ�����ַ+�����ڷ�Χ��
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
			RS485_TX_BUFF[2]=0x05; //�쳣��
			RS485_SendData(RS485_TX_BUFF,3);
		}
	}
	else if((startRegAddr+RegNum)!=0x04)//�Ĵ�����ַ+����������Χ
	{
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
		RS485_TX_BUFF[2]=0x02; //�쳣��
		RS485_SendData(RS485_TX_BUFF,3);
	}
	else if(cnt>0x05)//�����˹涨д���ֽ���
	{
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
		RS485_TX_BUFF[2]=0x03; //�쳣��
		RS485_SendData(RS485_TX_BUFF,3);
	}
}

//Modbus������18�������
//��set_voltagevalue
void Modbus_18_Solve(void)
{
	u8 convertbuf[10]="";
	u8 cnt;
	u8 len;
	u8 i=0;
	RegNum= (((u16)RS485_RX_BUFF[4])<<8)|RS485_RX_BUFF[5];//��ȡ�Ĵ�������
	if((startRegAddr+RegNum)==0x04)//�Ĵ�����ַ+�����ڷ�Χ��
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
	else //�Ĵ�����ַ+����������Χ
	{
		RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
		RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
		RS485_TX_BUFF[2]=0x02; //�쳣��
		RS485_SendData(RS485_TX_BUFF,3);
	}
}


void MODBUS_Service(void)
{
//	char convertbuf[20]="";
    u16 recCRC;
    if(RS485_FrameFlag==1)
    {
        if(RS485_RX_BUFF[0]==RS485_Addr)//��ַ��ȷ
        {
            if((RS485_RX_BUFF[1]==0x03)||(RS485_RX_BUFF[1]==0x04)||(RS485_RX_BUFF[1]==0x06)||(RS485_RX_BUFF[1]==0x17)||(RS485_RX_BUFF[1]==0x18))//��������ȷ
            {
                startRegAddr=(((u16)RS485_RX_BUFF[2])<<8)|RS485_RX_BUFF[3];//��ȡ�Ĵ�����ʼ��ַ
                if(startRegAddr<0x04)//�Ĵ�����ַ�ڷ�Χ��
                {
                    calCRC=CRC16_Compute(RS485_RX_BUFF,RS485_RX_CNT-2);//�������������ݵ�CRC
//					sprintf(convertbuf,"cal:%x\n",calCRC);
//					RS485_SendData((u8*)convertbuf,strlen(convertbuf));
                    recCRC=RS485_RX_BUFF[RS485_RX_CNT-2]|(((u16)RS485_RX_BUFF[RS485_RX_CNT-1])<<8);//���յ���CRC(���ֽ���ǰ�����ֽ��ں�)
//					sprintf(convertbuf,"rec:%x\n",recCRC);
//					RS485_SendData((u8*)convertbuf,strlen(convertbuf));
                    if(calCRC==recCRC)//CRCУ����ȷ
                    {
                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        switch(RS485_RX_BUFF[1])//���ݲ�ͬ�Ĺ�������д���
                        {
							case 0x03://�����뿪����:8202ֵ �����ĵ��ֽ���ǰ���ֽ��ں� checked
                        {
                            Modbus_03_Solve();
                            break;
                        }

                        case 0x04://�����������:ADCֵ checked
                        {
                            Modbus_04_Solve();
                            break;
                        }

                        case 0x06://д������������� дGP8202 д����ֽ���ǰ���ֽ��ں� checked
                        {
                            Modbus_06_Solve();
                            break;
                        }

                        case 0x17://д������������ дset_voltagevalue �ַ���д�� ���5λ��������С���㣩 ��Χ1.068~3.617 checked
                        {
                            Modbus_17_Solve();
                            break;
                        }

                        case 0x18: //������Ĵ��� ��set_voltagevalue checked
                        {
                            Modbus_18_Solve();
                            break;
                        }
						default:
							break;
                        }
                        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    }
                    else//CRCУ�����
                    {
                        RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
                        RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
                        RS485_TX_BUFF[2]=0x04; //�쳣��
                        RS485_SendData(RS485_TX_BUFF,3);
                    }
                }
                else//�Ĵ�����ַ������Χ
                {
                    RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
                    RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
                    RS485_TX_BUFF[2]=0x02; //�쳣��
                    RS485_SendData(RS485_TX_BUFF,3);
                }
            }
            else//���������
            {
                RS485_TX_BUFF[0]=RS485_RX_BUFF[0];
                RS485_TX_BUFF[1]=RS485_RX_BUFF[1]|0x80;
                RS485_TX_BUFF[2]=0x01; //�쳣��
                RS485_SendData(RS485_TX_BUFF,3);
            }
        }

        RS485_FrameFlag=0;//��λ֡������־
        RS485_RX_CNT=0;//���ռ���������
        RS485_TX_EN=0;//��������ģʽ
    }
}