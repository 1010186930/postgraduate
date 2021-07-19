
/**********************************************************************************	 
*       LCD12864��������	
*       ������Դ�࿪����
*       ��ɳ����ѧ
*       �����ˣ�����ǿ
*
*       ������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
*       ��Ȩ���У�����ؾ���									  
************************************************************************************/ 
#include"12864.h"

/***********************************************************
*      ��    �ܣ�Delay ��ʱ����
*      ��ڲ�����z ��ʱʱ��
*      ��    �أ�
*      ��    ע��
************************************************************/
void Delay(uint z)
{
     uint x,y;
     for(y=z;y>0;y--)
       for(x=110;x>0;x--);
          
}



/***********************************************************
*      ��    �ܣ� SendByte i2c����һ���ֽ�
*      ��ڲ�����byte һ���ֽڵ�����
*      ��    �أ�
*      ��    ע��
************************************************************/
void SendByte(uchar byte)
{
  uchar i;
  
  SCLKL;
  for(i=0;i<8;i++)
  {
    
    
    SCLKL;
    if((byte<<i)&0x80)
    {
      SIDH;
    }
    else
    {
      SIDL;                             //����
    }
                                    //����
    SCLKH;
		Delay(1);
  }
}

/***********************************************************
*      ��    �ܣ�LCDclear ����
*      ��ڲ�������
*      ��    �أ���
*      ��    ע����
************************************************************/
void LCDclear()
{
   WriteCom(0x01);
   WriteCom(0x34);
   WriteCom(0x30);

}

/***********************************************************
*      ��    �ܣ�WriteCom д����
*      ��ڲ�����ddataָ��
*      ��    �أ���
*      ��    ע����
************************************************************/
void WriteCom(uchar ddata)
{
	uchar Hdata,Ldata;
  CSH;
  Hdata=ddata&0xf0;		  //ȡ����λ
  Ldata=(ddata<<4)&0xf0;  //ȡ����λ
  SendByte(0xf8);	  //����д������ʼ�ź�
  SendByte(Hdata);	      
  SendByte(Ldata);
  CSL;
}

/***********************************************************
*      ��    �ܣ�WriteData д����
*      ��ڲ�����ddata ����
*      ��    �أ���
*      ��    ע����
************************************************************/
void WriteData(uchar ddata)
{
  uchar Hdata,Ldata;
  CSH;
  Hdata=ddata&0xf0;		  //ȡ����λ
  Ldata=(ddata<<4)&0xf0;  //ȡ����λ
  SendByte(0xfa);	  //����д������ʼ�ź�
   
  SendByte(Hdata);	      
  
  SendByte(Ldata);
	
  CSL;
}
/***********************************************************
*      ��    �ܣ�LCD12864_Init 12864��ʼ��
*      ��ڲ�������
*      ��    �أ���
*      ��    ע����
************************************************************/
void LCD12864_Init()
{
  GPIO_InitTypeDef  GPIO_InitStructure;
 	
 RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);	 //ʹ��PB,PE�˿�ʱ��
	
 GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10|GPIO_Pin_11|GPIO_Pin_12;				 //LED0-->PB.5 �˿�����
 GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		 //�������
 GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;		 //IO���ٶ�Ϊ50MHz
 GPIO_Init(GPIOA, &GPIO_InitStructure);					 //�����趨������ʼ��GPIOB.5
  WriteCom(0x30);
  WriteCom(0x0c);
  WriteCom(0x06); // ��ʾ����ƶ�����
  WriteCom(0x01);
}

/***********************************************************
*      ��    �ܣ�SetWindow ����д���ݵ���ʼ��ַ
*      ��ڲ�������x�У���y��
*      ��    �أ���
*      ��    ע����
************************************************************/

void SetWindow(uchar x,uchar y)
{
	uchar pos;
	if(x==0)
		x=0x80;
	if(x==1)
		x=0x90;
	if(x==2)
		x=0x88;
	if(x==3)
		x=0x98;
	pos=x+y;
	WriteCom(pos);

}

/***********************************************************
*      ��    �ܣ�DisplayChar��ʾ�ַ���
*      ��ڲ�����p ָ���ַ����׵�ַ
*      ��    �أ���
*      ��    ע����
************************************************************/
void DisplayChar(uchar *p)
{  
   int i;
   for(i=0;p[i]!='\0';i++)
   {
      WriteData(p[i]); 
   }
   
   
}

/***********************************************************
*      ��    �ܣ�DisplayInt��ʾ4λ����
*      ��ڲ�����num Ҫ��ʾ������
*      ��    �أ���
*      ��    ע����
************************************************************/
void DisplayInt4(uint num)
{
  
     WriteData('0'+num/1000);
	   WriteData('0'+num%1000/100);
	   WriteData('0'+num%100/10);
	   WriteData('0'+num%10);
}

void DisplayInt1(uint num)
{
	   WriteData('0'+num%10);
}

void screen_stateprint()
{
	SetWindow(0,0);
	DisplayChar(" SͨѶ ");//���ַ��ܿ�
	 	SetWindow(1,0);
	DisplayChar("A ���ѹ");
	 	SetWindow(2,0);
	DisplayChar("B ���ѹ");
	 	SetWindow(3,0);
	DisplayChar("C ���ѹ");
}


