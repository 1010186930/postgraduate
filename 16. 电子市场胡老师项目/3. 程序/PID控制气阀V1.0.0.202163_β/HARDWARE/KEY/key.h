#ifndef __KEY_H
#define __KEY_H	 
#include "sys.h"


#define KEY1  GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_2)
#define KEY2  GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_3)


 

#define KEY1_PRES 	1	
#define KEY2_PRES	2	



void KEY_Init(void);//IO初始化
u8 KEY_Scan(u8);  	//按键扫描函数					    
#endif
