/*
 * File:        sysinit.c
 * Purpose:     Kinetis Configuration
 *              Initializes processor to a default state
 *
 * Notes:
 *
 */

#include "common.h"
#include "sysinit.h"
#include "uart.h"

/********************************************************************/

/* Actual system clock frequency */
int core_clk_khz;   //内核时钟(KHz)
int core_clk_mhz;   //内核时钟(MHz)
int periph_clk_khz;  //外围总线时钟

/********************************************************************/
void sysinit (void)
{
        /*
         * Enable all of the port clocks. These have to be enabled to configure
         * pin muxing options, so most code will need all of these on anyway.
         */
        /* 使能所有端口PORT时钟   */
  
        SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
                      | SIM_SCGC5_PORTB_MASK
                      | SIM_SCGC5_PORTC_MASK
                      | SIM_SCGC5_PORTD_MASK
                      | SIM_SCGC5_PORTE_MASK );

#if defined(NO_PLL_INIT)       //如果定义不初始化锁相环，则进入 FEI mode
          core_clk_mhz = 21; //FEI mode
#else 
 	/* Ramp up the system clock */
	core_clk_mhz = pll_init(CORE_CLK_MHZ, REF_CLK);
#endif

	/*
         * Use the value obtained from the pll_init function to define variables
	 * for the core clock in kHz and also the peripheral clock. These
	 * variables can be used by other functions that need awareness of the
	 * system frequency.
	 */
        
        //通过pll_init函数的返回值来计算内核时钟和外设时钟，便于其他函数可查询时钟频率
        
	core_clk_khz = core_clk_mhz * 1000;
  	periph_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> 24)+ 1);

  	/* For debugging purposes, enable the trace clock and/or FB_CLK so that
  	 * we'll be able to monitor clocks and know the PLL is at the frequency
  	 * that we expect.
  	 */
	trace_clk_init();    //使能跟踪时钟，用于调试
  	fb_clk_init();         //FlexBus时钟初始化

  	/* Enable the pins for the selected UART */
        
         //初始化 printf 函数所用到的串口
        
        //找到TERM_PORT的宏定义位置，就可以设置工作串口
        
         
       

  	

  	
  	/* UART0 and UART1 are clocked from the core clock, but all other UARTs are
         * clocked from the peripheral clock. So we have to determine which clock
         * to send to the uart_init function.
         */
    //    if ((TERM_PORT == UART0_BASE_PTR) | (TERM_PORT == UART1_BASE_PTR))  //计算波特率，串口0、1使用内核时钟，其它串口使用外设时钟
    //        uart_init (TERM_PORT, core_clk_khz, TERMINAL_BAUD);
    //    else
    //	    uart_init (TERM_PORT, periph_clk_khz, TERMINAL_BAUD); //初始化使用串口的通信波特率
}
/********************************************************************/
void trace_clk_init(void)
{
	/* Set the trace clock to the core clock frequency */
	SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;

	/* Enable the TRACE_CLKOUT pin function on PTA6 (alt7 function) */
	PORTA_PCR6 = ( PORT_PCR_MUX(0x7));
}
/********************************************************************/
void fb_clk_init(void)
{
	/* Enable the clock to the FlexBus module */
        SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;

 	/* Enable the FB_CLKOUT function on PTC3 (alt5 function) */
	PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
}
/********************************************************************/
