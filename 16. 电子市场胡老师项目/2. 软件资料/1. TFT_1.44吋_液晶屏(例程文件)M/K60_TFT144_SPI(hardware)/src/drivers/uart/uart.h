/*
 * File:		uart.h
 * Purpose:     Provide common ColdFire UART routines for polled serial IO
 *
 * Notes:
 */

#ifndef __UART_H__
#define __UART_H__

#include "vectors.h"
#include "isr.h"
#include "common.h"

/* 声明底层中断服务子程序 */

//UART模块中断服务定义
//#undef  VECTOR_061
//#define VECTOR_061 UART_Isr
//#undef  VECTOR_063
//#define VECTOR_063 USART3_IRQHandler直接在vectors.c里面修改中断定义
//#undef  VECTOR_065
//#define VECTOR_065 UART_Isr
//#undef  VECTOR_067
//#define VECTOR_067 UART_Isr
//#undef  VECTOR_069
//#define VECTOR_069 UART_Isr
//#undef  VECTOR_071
//#define VECTOR_071 UART_Isr
//以下函数在LPLD_Kinetis底层包，不必修改
extern void LPLD_UART_Isr(void);

/*
 * UART模块
 *
 */
typedef enum UARTx
{
  UART0,
  UART1,
  UART2,
  UART3,
  UART4,
  UART5
}UARTx;

/********************************************************************/

void uart_init (UART_MemMapPtr uartch, int sysclk, int baud);
char uart_getchar (UART_MemMapPtr channel);
void uart_putchar (UART_MemMapPtr channel, char ch);
int uart_getchar_present (UART_MemMapPtr channel);


//UART模块中断回调函数类型
typedef void (*UART_ISR_CALLBACK)(void);

//UART接收中断使能
void uart_irq_EN(UART_MemMapPtr channel,uint8 UART_NUM);
//UART接收中断禁用
void uart_irq_DIS(UART_MemMapPtr channel,uint8 UART_NUM);
//UART中断服务
//void UART_Isr(void);

void USART3_IRQHandler(void);

/********************************************************************/

#endif /* __UART_H__ */
