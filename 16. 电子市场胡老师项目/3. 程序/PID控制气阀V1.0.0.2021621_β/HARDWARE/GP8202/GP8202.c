#include "GP8202.h"
#include "myiic.h"
#include "delay.h"

/** 
  * @name   GP8202_Init
  *
  * @brief  GP8202��ʼ��
  *
  * @param  ��

  * @retval ��
  */
void GP8202_Init(void)	//��ʼ��I2C
{
	IIC_Init();
}
/** 
  * @name   GP8202_SendDate
  *
  * @brief  ���趨ֵд��GP8202
  *
  * @param  Sv��*��Чλ*12bit������ֵ

  * @retval ��
  */
void GP8202_SendDate(u16 Sv) //���͵�ѹ����
{
	u8 low,high;
	low=Sv&0XFF;
	high=Sv>>8;
	GP8202_WriteOneByte(low,high);
}	

/** 
  * @name   GP8202_WriteOneByte
  *
  * @brief  ��GP8202��I2Cʱ��д������
  *
  * @param  data_low������ĵ�8λ data_high������ĸ�8λ����4λ��Ч

  * @retval ��
  */
u8 GP8202_WriteOneByte(u8 data_low,u8 data_high)  //д��ѹ����
{
    IIC_Start();
    IIC_Send_Byte(GP8202_ADDR|0xb0|0X00);//����������ַ+д����
    IIC_Wait_Ack();             //�ȴ�Ӧ��
	IIC_Send_Byte(0X02);
	IIC_Wait_Ack();   		
    IIC_Send_Byte(data_low);        //��������
	IIC_Wait_Ack();      
	IIC_Send_Byte(data_high);
	IIC_Wait_Ack();     
    IIC_Stop();
    return 0;
}






