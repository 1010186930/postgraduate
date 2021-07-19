#ifndef __MASTER_H
#define __MASTER_H
#include "sys.h"

#define READ_COIL     01
#define READ_DI       02
#define READ_HLD_REG  03
#define READ_AI       04
#define SET_COIL      05
#define SET_HLD_REG   06
#define WRITE_COIL    15
#define WRITE_HLD_REG 16


#define HI(n) ((n)>>8)
#define LOW(n) ((n)&0xff)



#define RS485_TX_EN PDout(7)

void RS485_Init(void);
void Timer4_enable(u16 arr);

void Modbus_RegMap(void);

void Modbus_01_Solve(void);
void Modbus_02_Solve(void);
void Modbus_03_Solve(void);
void Modbus_05_Solve(void);
void Modbus_06_Solve(void);
void Modbus_15_Solve(void);
void Modbus_16_Solve(void);
	
void Timer7_Init(void);
void RS485_TX_Service(void);
void Master_Service(u8 SlaverAddr,u8 Fuction,u16 StartAddr,u16 ValueOrLenth);
void RS485_RX_Service(void);
void modbus_rtu(void);
void modbus_text(void);   //空载测试输出函数，注意在实际应用的时候屏蔽掉
u16 Master_ReadReginput(u8 teamcounter);
u16 Master_sendReginput(u8 teamcounter);
u16 RS485_RX_BUFFback(u8 count);
u16 volback(void); //电压值读回，本函数嵌套位置位于解析函数中；
u16 erroeback(void);//报错信息
u16 errpaceback(void);// 接收错误信息
u16 stateback(void);//通讯情况测试
#endif









