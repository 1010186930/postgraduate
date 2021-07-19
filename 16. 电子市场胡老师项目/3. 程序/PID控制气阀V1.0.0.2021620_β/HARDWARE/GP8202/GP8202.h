#ifndef   _GP8202_H
#define   _GP8202_H
#include "sys.h"

#define GP8202_ADDR    0X00<<1 //GP8202地址位
void GP8202_Init(void); //初始化iic
u8 GP8202_WriteOneByte(u8 data_low,u8 data_high);
void GP8202_SendDate(u16 sv); //发送电压数据
//void GP8202_ReadData(u16 ReadVdata); //读取电压数据


#endif
