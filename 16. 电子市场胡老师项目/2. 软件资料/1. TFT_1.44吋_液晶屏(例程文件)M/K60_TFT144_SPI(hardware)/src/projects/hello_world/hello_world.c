/*
 * File:		hello_world.c
 * Purpose:		Main process
 *
 */

#include "common.h"
#include"HAL_SPI.h"
#include "SPI_FLASH.H"
#include "uart.h"
#include "sysinit.h"
#include "start.h"
#include "lcd.h"
unsigned long Time;
/********************************************************************/
void main (void)
{
        gpio_init  (PORTB,23,GPO,HIGH); //��ʼ��LED1����
      
        gpio_init  (PORTB,22,GPO,HIGH); //��ʼ��LED2/C����
         
        SPI_Init(SPI0, SPI_SCK_DIV_4, 1); //�����ʾ�쳣�����޸�SPI�Ľӿ��ٶȣ�ѡ��SPI0 SPI_SCK_DIV_4
        
	LCD_Init();	   //Һ������ʼ��
	
        LCD_Clear(BLACK); //����

	POINT_COLOR=WHITE; 
	
	LCD_DrawRectangle(0,0,128-1,128-1);	//������ 

	Show_Str(32,5,BLUE,YELLOW,"ϵͳ���",16,0);
	
	Show_Str(5,25,RED,YELLOW,"�¶�     ��",24,1);
	
	LCD_ShowNum2412(5+48,25,RED,YELLOW,":32",24,1);

	Show_Str(5,50,YELLOW,YELLOW,"ʪ��     ��",24,1);
	LCD_ShowNum2412(5+48,50,YELLOW,YELLOW,":20",24,1);

	Show_Str(5,75,WHITE,YELLOW,"��ѹ      ��",24,1);
	LCD_ShowNum2412(5+48,75,WHITE,YELLOW,":3.2",24,1);

	Show_Str(5,100,GREEN,YELLOW,"����      ��",24,1);
	LCD_ShowNum2412(5+48,100,GREEN,YELLOW,":0.2",24,1);		  
        
	while(1)
	{
	
          GPIO_SET(PORTB,23,0);//LED��
          
         for(Time=0;Time<0xfffff;Time++);//��ʱ
          
          GPIO_SET(PORTB,23,1);
          
         for(Time=0;Time<0xfffff;Time++);//��ʱ
           
          GPIO_SET(PORTB,22,0);//LED��
          
        for(Time=0;Time<0xfffff;Time++);//��ʱ
    
          GPIO_SET(PORTB,22,1);
         
          
          
	} 
}








/********************************************************************/
