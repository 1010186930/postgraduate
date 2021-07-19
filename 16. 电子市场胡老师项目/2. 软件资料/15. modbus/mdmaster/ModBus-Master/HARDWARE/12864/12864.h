#include "stm32f10x.h"
/**********************************************************************************	 
*       LCD12864驱动代码	
*       电赛电源类开发板
*       长沙理工大学
*       制作人：邹智强
*
*       本程序只供学习使用，未经作者许可，不得用于其它任何用途
*       版权所有，盗版必究。									  
************************************************************************************/ 

#define uint unsigned int
#define uchar unsigned char

#define CSH GPIO_SetBits(GPIOA,GPIO_Pin_10);    
#define CSL GPIO_ResetBits(GPIOA,GPIO_Pin_10);  
//片选RS	
#define SIDH GPIO_SetBits(GPIOA,GPIO_Pin_11);  
#define SIDL GPIO_ResetBits(GPIOA,GPIO_Pin_11);
//数据RW
#define SCLKH GPIO_SetBits(GPIOA,GPIO_Pin_12);
#define SCLKL GPIO_ResetBits(GPIOA,GPIO_Pin_12);
void SetWindow(uchar x,uchar y);
void LCD12864_Init(void);      //12864初始化
void LCDclear(void);   //
void WriteData(uchar ddata);
void WriteCom(uchar ddata);
void SendByte(uchar byte);
void Delay(uint z);
void DisplayChar(uchar *p);
void DisplayInt4(uint num);//显示数字
void DisplayInt1(uint num);
void screen_stateprint(void);

