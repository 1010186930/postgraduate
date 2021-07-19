#include "myiic.h"
#include "delay.h"
 	  

//��ʼ��IIC
void IIC_Init(void)
{					     
	GPIO_InitTypeDef GPIO_InitStructure;
	//RCC->APB2ENR|=1<<4;//��ʹ������IO PORTCʱ�� 
	RCC_APB2PeriphClockCmd(	RCC_APB2Periph_GPIOA, ENABLE );	
	   
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4|GPIO_Pin_5;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP ;   //�������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz; //8202 CLK 40M
	GPIO_Init(GPIOA, &GPIO_InitStructure);
	GPIO_SetBits(GPIOA,GPIO_Pin_4|GPIO_Pin_5);

}
//����IIC��ʼ�ź�
void IIC_Start(void)
{
	SDA_OUT();     //sda�����
	IIC_SDA=1;
	delay_us(5);	
	IIC_SCL=1;
	delay_us(5);
 	IIC_SDA=0;//START:when CLK is high,DATA change form high to low 
	delay_us(5);
	IIC_SCL=0;//ǯסI2C���ߣ�׼�����ͻ�������� 
}	  
//����IICֹͣ�ź�
void IIC_Stop(void)
{
	SDA_OUT();//sda�����
	IIC_SDA=0;//STOP:when CLK is high DATA change form low to high
 	delay_us(5);
	IIC_SCL=1; 
	delay_us(5);
	IIC_SDA=1;//����I2C���߽����ź�
								   	
}
//�ȴ�Ӧ���źŵ���
//����ֵ��1������Ӧ��ʧ��
//        0������Ӧ��ɹ�
u8 IIC_Wait_Ack(void)
{
	u8 ucErrTime=0;
	SDA_IN();      //SDA����Ϊ���� 
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
	IIC_SCL=0;//ʱ�����0 	   
	return 0;  
} 
//����ACKӦ��
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
//������ACKӦ��		    
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
//IIC����һ���ֽ�
//���شӻ�����Ӧ��
//1����Ӧ��
//0����Ӧ��			  
void IIC_Send_Byte(u8 txd)
{                        
    u8 t;   
	SDA_OUT(); 	    
    for(t=0;t<8;t++)
    {       
		IIC_SCL=0;//����ʱ�ӿ�ʼ���ݴ���
		delay_us(5);
        IIC_SDA=(txd&0x80)>>7;
		delay_us(5);
		IIC_SCL=1;
		delay_us(5);
        txd<<=1; 	  
    }
	IIC_SCL=0;	
} 	    
//��1���ֽڣ�ack=1ʱ������ACK��ack=0������nACK   
u8 IIC_Read_Byte(unsigned char ack)
{
	unsigned char i,receive=0;
	SDA_IN();//SDA����Ϊ����
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
        IIC_NAck();//����nACK
    else
        IIC_Ack(); //����ACK   
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
	return AckFlag;		// Ӧ�𷵻أ�0;��Ӧ�𷵻أ�1
}

void change_data(u16 DAC_data)
{
	IIC_Start();			// ���Ϳ�ʼ�ź�
	W_Byte1(0xb0);			//1011 			000		0
							//оƬ����		��ַλ
	IIC_RdAck();  			// ��Ӧ���ź�
	W_Byte1(0x02);			//������
	IIC_RdAck();			// ��Ӧ���ź�
	W_Byte1(DAC_data%256);	//���� �Ͱ�λ											
	IIC_RdAck();			// ��Ӧ���ź�
	W_Byte1(DAC_data>>8);	//���� ����λ		
	IIC_RdAck();			// ��Ӧ���ź�
	IIC_Stop();
}
























