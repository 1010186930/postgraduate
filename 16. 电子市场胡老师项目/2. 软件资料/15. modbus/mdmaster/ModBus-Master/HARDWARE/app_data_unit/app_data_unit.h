
#ifndef __APP_DATA_UNIT_H_
#define __APP_DATA_UNIT_H_
#include "stm32f0xx.h"
#include "type.h"
#include "app_data_type.h"


#define SE_CFG_SAVE_BASE        0x0000
#define SE_CFG_PA_OFFSET		0x0000                  //压差模式
#define SE_CFG_TEMP_OFFSET      0x0010                  //温度湿度模式
#define SE_CFG_LUX_OFFSET       0x0020                  //光照模式


#define AVG_ARRAY_SIZE          5


//#if defined (DEV_USE_SPD610)                  //压差模式
//  #define SE_SYSCONFIG_BASE       (SE_CFG_SAVE_BASE + SE_CFG_PA_OFFSET)
//#elif defined (DEV_USE_SHT20)                 //温度湿度模式
//  #define SE_SYSCONFIG_BASE       (SE_CFG_SAVE_BASE + SE_CFG_TEMP_OFFSET)
//#elif defined (DEV_USE_BOTH)               //光照模式
//#define SE_SYSCONFIG_BASE       (SE_CFG_SAVE_BASE + SE_CFG_LUX_OFFSET)
//#endif

#define SE_SYSCONFIG_BASE       (SE_CFG_SAVE_BASE)

///////////////////////////////////////////////////////////////
#define REG_EMPTY_DATA          (0x7FFF)
#define SYS_REG_SIZE                (sizeof(Sys_Reg_TypeDef) / sizeof(u16))

//#define REG_PA_MAX_LIMIT        (300)
//#define REG_PA_MIN_LIMIT        (0)

extern __IO Sys_Reg_TypeDef Sys_Reg;
extern __IO u16 *regdata;
extern __IO Dev_Info_TypeDef Dev_Info;

extern __IO Reg_Line_TypeDef Line_Reg;
extern __IO Reg_Node_TypeDef Node_Reg[6];            //

BOOL App_RS485_01_Handle(void);
void App_RS485_01_Send_Pack03(void);
void App_RS485_01_Send_Pack06(void);


BOOL App_RS485_02_Handle(void);
void App_RS485_02_Send_Pack03(void);
void App_RS485_02_Send_Pack06(void);

void App_RF485_02_Send_Pack03(void);
void App_RF485_02_Send_Pack03(void);
void App_RF485_02_Send_Pack06(void);

void App_Data_02_Polling(void);

u16 App_Tab_Get_CRC16( u8 * pucFrame, u16 usLen );
u16 App_Calc_Get_CRC16(__IO u8 *ptr,u8 len);


s16 App_Temp_Get_VaildData(void);       //取有效的值
u16 App_Humi_Get_VaildData(void);       //取有效的值

////////////////////////
BOOL App_Pa_GetX(__IO s16 *result);
void App_Pa_toArray(s16 temp, s16 index);
s16 App_Pa_Avg(void);

////////////////////////
BOOL App_Temp_GetX(__IO u16 *result);
void App_Temp_toArray(u16 temp, u16 index);
u16 App_Temp_Avg(void);

////////////////////////
BOOL App_Humi_GetX(__IO u16 *result);
void App_Humi_toArray(u16 humi, u16 index);
u16 App_Humi_Avg(void);


/////------------------
BOOL App_IO_Switch_Check(void);
void App_IO_Switch_Set(void);
BOOL App_IO_Switch_AddrErrChk(void);

void App_Sys_Reg_Config_Init(void);               //寄存器初始化

void App_Reg_Exec(void);
BOOL App_Reg_Check(u16 addr, u16 data);

BOOL App_Reg_Pa_Check(void);                        ///// 数据合法性检测 ////

BOOL App_Config_DeInit(void);
BOOL App_Config_Init(void);
BOOL App_Config_Save(void);

#endif /* __APP_DATA_UNIT_H_ */
