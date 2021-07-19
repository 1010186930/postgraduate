//////////////////////////////////////////////////////////////////////////////////	 
//本程序只供学习使用，未经作者许可，不得用于其它任何用途
//包括delay_us,delay_ms
//版本：V1.0
//********************************************************************************


#ifndef __OLED_H
#define __OLED_H
#include "stdlib.h"	
#include "common.h"


//OLED模式设置
//0:4线串行模式

#define OLED_MODE 0
	

//-----------------OLED端口定义----------------  					   

#define OLED_CS_Clr()  GPIO_SET(PORTC,8,0)//CS
#define OLED_CS_Set()  GPIO_SET(PORTC,8,1)

#define OLED_RST_Clr() GPIO_SET(PORTC,9,0)//RES
#define OLED_RST_Set() GPIO_SET(PORTC,9,1)

#define OLED_RS_Clr() GPIO_SET(PORTC,10,0)//DC
#define OLED_RS_Set() GPIO_SET(PORTC,10,1)


//PC0~7,作为数据线
//#define DATAOUT(x) GPIO_Write(GPIOC,x);//输出  
//使用4线串行接口时使用 

//#define OLED_SCLK_Clr() GPIO_ResetBits(GPIOC,GPIO_Pin_0)//CLK
//#define OLED_SCLK_Set() GPIO_SetBits(GPIOC,GPIO_Pin_0)

//#define OLED_SDIN_Clr() GPIO_ResetBits(GPIOC,GPIO_Pin_1)//DIN
//#define OLED_SDIN_Set() GPIO_SetBits(GPIOC,GPIO_Pin_1)

 		     
#define OLED_CMD  0	//写命令
#define OLED_DATA 1	//写数据
//OLED控制用函数
void OLED_WR_Byte(unsigned char dat,unsigned char cmd);	    
void OLED_Display_On(void);
void OLED_Display_Off(void);
void OLED_Refresh_Gram(void);		   
							   		    
void OLED_Init(void);
void OLED_Clear(void);
void OLED_DrawPoint(unsigned char x,unsigned char y,unsigned char t);
void OLED_Fill(unsigned char x1,unsigned char y1,unsigned char x2,unsigned char y2,unsigned char dot);
void OLED_ShowCHinese(unsigned char x,unsigned char y,unsigned char no);
void OLED_ShowChar(unsigned char x,unsigned char y,unsigned char chr,unsigned char size,unsigned char mode);
void OLED_ShowNum(unsigned char x,unsigned char y,unsigned int num,unsigned char len,unsigned char size);
void OLED_ShowString(unsigned char x,unsigned char y,const unsigned char *p);	 
void LCD_Set_Pos(unsigned char x, unsigned char y) ;
#endif  
	 



