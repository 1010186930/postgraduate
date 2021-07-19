#ifndef _time_H
#define _time_H
#include "sys.h"
extern double voltage_pid;
extern u8 set_flag;
extern __IO u8 key1_pressed; 
extern double set_flowvalue;
extern double set_voltagevalue;
extern char display_setflowvalue[10];
extern const char valve_unit[3];
typedef enum
{
	FALSE=0,
	TRUE=!FALSE
}bool;

void TIM4_Init(u16 per,u16 psc);
void TIM3_Init(u16 per,u16 psc);
void K_UP_sacnf_func(u8 len,u8* thousand,u8* hundred,u8* ten,u8* unit,u8* tenths, u8* percentile,u8* thousandth);
u8 Float_to_Bit(double num,u8* thousand,u8* hundred,u8* ten,u8* unit,u8* tenths, u8* percentile,u8* thousandth);
#endif
