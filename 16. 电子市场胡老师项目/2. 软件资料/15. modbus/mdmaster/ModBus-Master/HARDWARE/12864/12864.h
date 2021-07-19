#include "stm32f10x.h"
/**********************************************************************************	 
*       LCD12864��������	
*       ������Դ�࿪����
*       ��ɳ����ѧ
*       �����ˣ�����ǿ
*
*       ������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
*       ��Ȩ���У�����ؾ���									  
************************************************************************************/ 

#define uint unsigned int
#define uchar unsigned char

#define CSH GPIO_SetBits(GPIOA,GPIO_Pin_10);    
#define CSL GPIO_ResetBits(GPIOA,GPIO_Pin_10);  
//ƬѡRS	
#define SIDH GPIO_SetBits(GPIOA,GPIO_Pin_11);  
#define SIDL GPIO_ResetBits(GPIOA,GPIO_Pin_11);
//����RW
#define SCLKH GPIO_SetBits(GPIOA,GPIO_Pin_12);
#define SCLKL GPIO_ResetBits(GPIOA,GPIO_Pin_12);
void SetWindow(uchar x,uchar y);
void LCD12864_Init(void);      //12864��ʼ��
void LCDclear(void);   //
void WriteData(uchar ddata);
void WriteCom(uchar ddata);
void SendByte(uchar byte);
void Delay(uint z);
void DisplayChar(uchar *p);
void DisplayInt4(uint num);//��ʾ����
void DisplayInt1(uint num);
void screen_stateprint(void);

