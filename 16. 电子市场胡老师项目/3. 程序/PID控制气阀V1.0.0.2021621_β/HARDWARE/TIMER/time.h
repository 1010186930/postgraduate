#ifndef _time_H
#define _time_H
#include "sys.h"
extern double voltage_pid;	//PID�����ĵ�ѹ
extern u8 set_flag;	//�Ƿ�Ҫ����set_flowvalue�ı�־��0Ҫ����
extern __IO u8 key1_pressed; 
extern double set_flowvalue;	//�趨������ֵ
extern double set_voltagevalue;	//�趨�ĵ�ѹֵ
extern char display_setflowvalue[10];	//��ʾ�趨������������
extern const char valve_unit[3];	//ml
extern u8 thousand;
extern u8 hundred;
extern u8 ten;
extern u8 unit;
extern u8 tenths;
extern u8 percentile;
extern u8 thousandth;
extern double voltage_adc;
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
