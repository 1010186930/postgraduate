#include "stm32f10x.h"
#include "includes.h"
#include <string.h>

extern void Uart1_Bsp_Init(void);
extern u32  Uart1_Dat_Get(u8* pdat);
extern void Uart1_Buff_Send(u8 *str,u32 length);
extern void Uart1_Send_Handler(void);

extern void Uart2_Bsp_Init(void);
extern u32  Uart2_Dat_Get(u8* pdat);
extern void Uart2_Buff_Send(u8 *str,u32 length);

extern void Uart3_Bsp_Init(void);
extern u32  Uart3_Dat_Get(u8* pdat);
extern void Uart3_Buff_Send(u8 *str,u32 length);

extern void Uart4_Bsp_Init(void);
extern u32  Uart4_Dat_Get(u8* pdat);
extern void Uart4_Buff_Send(u8 *str,u32 length);

extern void Uart5_Bsp_Init(void);
extern u32  Uart5_Dat_Get(u8* pdat);
extern void Uart5_Buff_Send(u8 *str,u32 length);
