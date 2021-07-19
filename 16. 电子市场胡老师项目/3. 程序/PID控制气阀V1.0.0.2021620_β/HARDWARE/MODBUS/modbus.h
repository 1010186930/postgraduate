#ifndef __MODBUS_H
#define __MODBUS_H
#include "sys.h"

extern u8 RS485_Addr;
extern u16 startRegAddr;
extern u16 RegNum;
extern u16 calCRC;

void MODBUS_Service(void);
void Modbus_03_Solve(void);
void Modbus_04_Solve(void);
void Modbus_06_Solve(void);
void Modbus_17_Solve(void);
void Modbus_18_Solve(void);


#endif
