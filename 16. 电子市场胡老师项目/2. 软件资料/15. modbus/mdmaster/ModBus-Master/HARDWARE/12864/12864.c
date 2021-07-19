
/**********************************************************************************	 
*       LCD12864驱动代码	
*       电赛电源类开发板
*       长沙理工大学
*       制作人：邹智强
*
*       本程序只供学习使用，未经作者许可，不得用于其它任何用途
*       版权所有，盗版必究。									  
************************************************************************************/ 
#include"12864.h"

/***********************************************************
*      功    能：Delay 延时函数
*      入口参数：z 延时时间
*      返    回：
*      备    注：
************************************************************/
void Delay(uint z)
{
     uint x,y;
     for(y=z;y>0;y--)
       for(x=110;x>0;x--);
          
}



/***********************************************************
*      功    能： SendByte i2c发送一个字节
*      入口参数：byte 一个字节的数据
*      返    回：
*      备    注：
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
      SIDL;                             //数据
    }
                                    //脉冲
    SCLKH;
		Delay(1);
  }
}

/***********************************************************
*      功    能：LCDclear 清屏
*      入口参数：无
*      返    回：无
*      备    注：无
************************************************************/
void LCDclear()
{
   WriteCom(0x01);
   WriteCom(0x34);
   WriteCom(0x30);

}

/***********************************************************
*      功    能：WriteCom 写命令
*      入口参数：ddata指令
*      返    回：无
*      备    注：无
************************************************************/
void WriteCom(uchar ddata)
{
	uchar Hdata,Ldata;
  CSH;
  Hdata=ddata&0xf0;		  //取高四位
  Ldata=(ddata<<4)&0xf0;  //取低四位
  SendByte(0xf8);	  //发送写命令起始信号
  SendByte(Hdata);	      
  SendByte(Ldata);
  CSL;
}

/***********************************************************
*      功    能：WriteData 写数据
*      入口参数：ddata 数据
*      返    回：无
*      备    注：无
************************************************************/
void WriteData(uchar ddata)
{
  uchar Hdata,Ldata;
  CSH;
  Hdata=ddata&0xf0;		  //取高四位
  Ldata=(ddata<<4)&0xf0;  //取低四位
  SendByte(0xfa);	  //发送写数据起始信号
   
  SendByte(Hdata);	      
  
  SendByte(Ldata);
	
  CSL;
}
/***********************************************************
*      功    能：LCD12864_Init 12864初始化
*      入口参数：无
*      返    回：无
*      备    注：亢
************************************************************/
void LCD12864_Init()
{
  GPIO_InitTypeDef  GPIO_InitStructure;
 	
 RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);	 //使能PB,PE端口时钟
	
 GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10|GPIO_Pin_11|GPIO_Pin_12;				 //LED0-->PB.5 端口配置
 GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		 //推挽输出
 GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;		 //IO口速度为50MHz
 GPIO_Init(GPIOA, &GPIO_InitStructure);					 //根据设定参数初始化GPIOB.5
  WriteCom(0x30);
  WriteCom(0x0c);
  WriteCom(0x06); // 显示光标移动设置
  WriteCom(0x01);
}

/***********************************************************
*      功    能：SetWindow 设置写数据的起始地址
*      入口参数：第x行，第y个
*      返    回：无
*      备    注：无
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
*      功    能：DisplayChar显示字符串
*      入口参数：p 指向字符串首地址
*      返    回：无
*      备    注：无
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
*      功    能：DisplayInt显示4位数字
*      入口参数：num 要显示的数字
*      返    回：无
*      备    注：无
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
	DisplayChar(" S通讯 ");//首字符架空
	 	SetWindow(1,0);
	DisplayChar("A 相电压");
	 	SetWindow(2,0);
	DisplayChar("B 相电压");
	 	SetWindow(3,0);
	DisplayChar("C 相电压");
}


