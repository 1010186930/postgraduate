//////////////////////////////////////////////////////////////////////////////////	 
//本程序只供学习使用，未经作者许可，不得用于其它任何用途
//测试硬件：STC12LE5A60S2
//1.5寸TFT_ST7735液晶驱动
//xiao冯@ShenZhen QDtech co.,LTD
//公司网站:www.qdtech.net
//淘宝网站：http://qdtech.taobao.com
//我司提供底层技术支持，任何技术问题欢迎随时交流学习
//固话(传真) :+86 0755-23594567 
//手机:15989313508（冯工） 
//邮箱:QDtech2008@gmail.com 
//Skype:QDtech2008
//创建日期:2013/5/13
//版本：V1.0
//版权所有，盗版必究。
//Copyright(C) 深圳市全动电子技术有限公司 2009-2019
//All rights reserved
//********************************************************************************

#include<reg51.h>
#include<absacc.h>
#include<intrins.h>
#include<string.h>
#define uchar unsigned char
#define uint unsigned int

//测试硬件平台：STC12LE5A60S2(3.3V单片机)
//主频：12MHZ
//---------------------------液晶屏接线说明-------------------------------------//
//接线前请参考液晶屏说明书第10页引脚定义
sbit bl        =P3^2;//接模块BL引脚，背光可以采用IO控制或者PWM控制，也可以直接接到高电平常亮
sbit scl       =P1^7;//接模块CLK引脚,接裸屏Pin9_SCL
sbit sda       =P1^5;//接模块DIN/MOSI引脚，接裸屏Pin8_SDA
sbit rs        =P1^2;//接模块D/C引脚，接裸屏Pin7_A0
sbit cs        =P1^3;//接模块CE引脚，接裸屏Pin12_CS
sbit reset     =P3^3;//接模块RST引脚，接裸屏Pin6_RES
//---------------------------End of液晶屏接线---------------------------------//


//单片机IO推挽输出设置定义
#define MCU_STC12//如果您使用的单片机不是STC12系列(如STC89C52)请屏蔽此宏定义
#ifdef MCU_STC12
sfr P3M1  = 0xB1;	//P3M1.n,P3M0.n 	=00--->Standard,	01--->push-pull
sfr P3M0  = 0xB2;	//					=10--->pure input,	11--->open drain
#endif

//定义常用颜色
#define RED  		0xf800
#define GREEN		0x07e0
#define BLUE 		0x001f
#define WHITE		0xffff
#define BLACK		0x0000
#define YELLOW  0xFFE0
#define GRAY0   0xEF7D   
#define GRAY1   0x8410      	
#define GRAY2   0x4208   

void delay(uint time)
{
 uint i,j;
  for(i=0;i<time;i++)
   for(j=0;j<250;j++);
}

//向SPI总线传输一个8位数据
void  SPI_WriteData(uchar Data)
{
	unsigned char i=0;
	for(i=8;i>0;i--)
	{
		if(Data&0x80)	
		sda=1; //输出数据
		else sda=0;
		scl=0;
		scl=1;
		Data<<=1;
	}
}
//向液晶屏写一个8位指令
void  Lcd_WriteIndex(uchar Data)
{
		
		cs=0;
		rs=0;
		SPI_WriteData(Data); 		
		cs=1;
}
//向液晶屏写一个8位数据
void  Lcd_WriteData(uchar Data)
{	
		unsigned char i=0;
		cs=0;
		rs=1;
		SPI_WriteData(Data); 	
		cs=1;
}
//向液晶屏写一个16位数据
void  Lcd_WriteData_16(unsigned int Data)
{
	unsigned char i=0;
	cs=0;
	rs=1;
	SPI_WriteData(Data>>8); 	//写入高8位数据
	SPI_WriteData(Data); 			//写入低8位数据
	cs=1;

}
//LCD复位时序
void Reset(void)
{
    reset=0;
    delay(100);
    reset=1;
    delay(100);
}
//////////////////////////////////////////////////////////////////////////////////////////////
//液晶屏初始化 for S6D02A1
void lcd_initial(void)
{
	Reset();//Reset before LCD Init.
		
	//LCD Init For 1.44Inch LCD Panel with ST7735R.
	Lcd_WriteIndex(0x11);//Sleep exit 
	delay (120);
		
	//ST7735R Frame Rate
	Lcd_WriteIndex(0xB1); 
	Lcd_WriteData(0x01); 
	Lcd_WriteData(0x2C); 
	Lcd_WriteData(0x2D); 

	Lcd_WriteIndex(0xB2); 
	Lcd_WriteData(0x01); 
	Lcd_WriteData(0x2C); 
	Lcd_WriteData(0x2D); 

	Lcd_WriteIndex(0xB3); 
	Lcd_WriteData(0x01); 
	Lcd_WriteData(0x2C); 
	Lcd_WriteData(0x2D); 
	Lcd_WriteData(0x01); 
	Lcd_WriteData(0x2C); 
	Lcd_WriteData(0x2D); 
	
	Lcd_WriteIndex(0xB4); //Column inversion 
	Lcd_WriteData(0x07); 
	
	//ST7735R Power Sequence
	Lcd_WriteIndex(0xC0); 
	Lcd_WriteData(0xA2); 
	Lcd_WriteData(0x02); 
	Lcd_WriteData(0x84); 
	Lcd_WriteIndex(0xC1); 
	Lcd_WriteData(0xC5); 

	Lcd_WriteIndex(0xC2); 
	Lcd_WriteData(0x0A); 
	Lcd_WriteData(0x00); 

	Lcd_WriteIndex(0xC3); 
	Lcd_WriteData(0x8A); 
	Lcd_WriteData(0x2A); 
	Lcd_WriteIndex(0xC4); 
	Lcd_WriteData(0x8A); 
	Lcd_WriteData(0xEE); 
	
	Lcd_WriteIndex(0xC5); //VCOM 
	Lcd_WriteData(0x0E); 
	
	Lcd_WriteIndex(0x36); //MX, MY, RGB mode 
	Lcd_WriteData(0xC8); 
	
	//ST7735R Gamma Sequence
	Lcd_WriteIndex(0xe0); 
	Lcd_WriteData(0x0f); 
	Lcd_WriteData(0x1a); 
	Lcd_WriteData(0x0f); 
	Lcd_WriteData(0x18); 
	Lcd_WriteData(0x2f); 
	Lcd_WriteData(0x28); 
	Lcd_WriteData(0x20); 
	Lcd_WriteData(0x22); 
	Lcd_WriteData(0x1f); 
	Lcd_WriteData(0x1b); 
	Lcd_WriteData(0x23); 
	Lcd_WriteData(0x37); 
	Lcd_WriteData(0x00); 	
	Lcd_WriteData(0x07); 
	Lcd_WriteData(0x02); 
	Lcd_WriteData(0x10); 

	Lcd_WriteIndex(0xe1); 
	Lcd_WriteData(0x0f); 
	Lcd_WriteData(0x1b); 
	Lcd_WriteData(0x0f); 
	Lcd_WriteData(0x17); 
	Lcd_WriteData(0x33); 
	Lcd_WriteData(0x2c); 
	Lcd_WriteData(0x29); 
	Lcd_WriteData(0x2e); 
	Lcd_WriteData(0x30); 
	Lcd_WriteData(0x30); 
	Lcd_WriteData(0x39); 
	Lcd_WriteData(0x3f); 
	Lcd_WriteData(0x00); 
	Lcd_WriteData(0x07); 
	Lcd_WriteData(0x03); 
	Lcd_WriteData(0x10);  
	
	Lcd_WriteIndex(0x2a);
	Lcd_WriteData(0x00);
	Lcd_WriteData(0x00+2);
	Lcd_WriteData(0x00);
	Lcd_WriteData(0x80+2);

	Lcd_WriteIndex(0x2b);
	Lcd_WriteData(0x00);
	Lcd_WriteData(0x00+3);
	Lcd_WriteData(0x00);
	Lcd_WriteData(0x80+3);
	
	Lcd_WriteIndex(0xF0); //Enable test command  
	Lcd_WriteData(0x01); 
	Lcd_WriteIndex(0xF6); //Disable ram power save mode 
	Lcd_WriteData(0x00); 
	
	Lcd_WriteIndex(0x3A); //65k mode 
	Lcd_WriteData(0x05); 
	
	
	Lcd_WriteIndex(0x29);//Display on

}
/*************************************************
函数名：LCD_Set_Region
功能：设置lcd显示区域，在此区域写点数据自动换行
入口参数：xy起点和终点
返回值：无
*************************************************/
void Lcd_SetRegion(unsigned int x_start,unsigned int y_start,unsigned int x_end,unsigned int y_end)
{		
	Lcd_WriteIndex(0x2a);
	Lcd_WriteData(0x00);
	Lcd_WriteData(x_start+2);
	Lcd_WriteData(0x00);
	Lcd_WriteData(x_end+2);

	Lcd_WriteIndex(0x2b);
	Lcd_WriteData(0x00);
	Lcd_WriteData(y_start+3);
	Lcd_WriteData(0x00);
	Lcd_WriteData(y_end+3);
	
	Lcd_WriteIndex(0x2c);

}

//全屏填充函数
void LCD_Clear(unsigned int Color)
{
	uchar i,j;
	Lcd_SetRegion(0,0,128-1,128-1);
	for (i=0;i<128;i++)
	{
    	for (j=0;j<128;j++)
		{
        	Lcd_WriteData_16(Color);
		}
	}
}



void main(void)
{
#ifdef MCU_STC12
  P3M1 &= ~(1<<2),	P3M0 |=  (1<<2);	//P3.2 set as push-pull output mode
#endif
  lcd_initial(); //液晶屏初始化
  bl=1;//背光采用IO控制，也可以直接接到高电平常亮
  while(1)
  { 
	LCD_Clear(RED);			//红色
	delay(500);	
	LCD_Clear(GREEN);		//绿色
	delay(500);	
	LCD_Clear(BLUE);		//蓝色
	delay(500);	
	LCD_Clear(BLACK);		//黑色		
	delay(500);	
	LCD_Clear(WHITE);		//白色
	delay(500);	
   }

}



