///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:39 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\cpu\sysinit.c  /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\cpu\sysinit.c  /
//                    -D IAR -D TWR_K60N512 -lCN                              /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\RAM_128KB\List\ -lB C:\Users\Ping\Desktop\K60_TFT14 /
//                    4_SPI\build\iar\hello_world\RAM_128KB\List\ -o          /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\RAM_128KB\Obj\ --no_cse --no_unroll --no_inline     /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.0 Evaluation\arm\INC\c\DLib_Config_Normal.h" -I       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\projects\hello_world\ -I               /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\common\ -I                             /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\cpu\ -I C:\Users\Ping\Desktop\K60_TFT1 /
//                    44_SPI\build\iar\hello_world\..\..\..\src\cpu\headers\  /
//                    -I C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello /
//                    _world\..\..\..\src\drivers\adc16\ -I                   /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\enet\ -I                       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\pmc\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\rtc\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\lptmr\ -I                      /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\uart\ -I                       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\mcg\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\wdog\ -I                       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\platforms\ -I                          /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\ftm\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\SPI\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\OLED\ -I                       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\TFT\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\ -On --use_c++_inline                            /
//    List file    =  C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\RAM_128KB\List\sysinit.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME sysinit

        #define SHT_PROGBITS 0x1

        EXTERN pll_init

        PUBLIC core_clk_khz
        PUBLIC core_clk_mhz
        PUBLIC fb_clk_init
        PUBLIC periph_clk_khz
        PUBLIC sysinit
        PUBLIC trace_clk_init

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\cpu\sysinit.c
//    1 /*
//    2  * File:        sysinit.c
//    3  * Purpose:     Kinetis Configuration
//    4  *              Initializes processor to a default state
//    5  *
//    6  * Notes:
//    7  *
//    8  */
//    9 
//   10 #include "common.h"
//   11 #include "sysinit.h"
//   12 #include "uart.h"
//   13 
//   14 /********************************************************************/
//   15 
//   16 /* Actual system clock frequency */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 int core_clk_khz;   //内核时钟(KHz)
core_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 int core_clk_mhz;   //内核时钟(MHz)
core_clk_mhz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 int periph_clk_khz;  //外围总线时钟
periph_clk_khz:
        DS8 4
//   20 
//   21 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 void sysinit (void)
//   23 {
sysinit:
        PUSH     {R7,LR}
//   24         /*
//   25          * Enable all of the port clocks. These have to be enabled to configure
//   26          * pin muxing options, so most code will need all of these on anyway.
//   27          */
//   28         /* 使能所有端口PORT时钟   */
//   29   
//   30         SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//   31                       | SIM_SCGC5_PORTB_MASK
//   32                       | SIM_SCGC5_PORTC_MASK
//   33                       | SIM_SCGC5_PORTD_MASK
//   34                       | SIM_SCGC5_PORTE_MASK );
        LDR.N    R0,??DataTable2  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable2  ;; 0x40048038
        STR      R0,[R1, #+0]
//   35 
//   36 #if defined(NO_PLL_INIT)       //如果定义不初始化锁相环，则进入 FEI mode
//   37           core_clk_mhz = 21; //FEI mode
//   38 #else 
//   39  	/* Ramp up the system clock */
//   40 	core_clk_mhz = pll_init(CORE_CLK_MHZ, REF_CLK);
        MOVS     R1,#+3
        MOVS     R0,#+2
        BL       pll_init
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+0]
//   41 #endif
//   42 
//   43 	/*
//   44          * Use the value obtained from the pll_init function to define variables
//   45 	 * for the core clock in kHz and also the peripheral clock. These
//   46 	 * variables can be used by other functions that need awareness of the
//   47 	 * system frequency.
//   48 	 */
//   49         
//   50         //通过pll_init函数的返回值来计算内核时钟和外设时钟，便于其他函数可查询时钟频率
//   51         
//   52 	core_clk_khz = core_clk_mhz * 1000;
        LDR.N    R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//   53   	periph_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> 24)+ 1);
        LDR.N    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_3  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+24,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.N    R1,??DataTable2_4
        STR      R0,[R1, #+0]
//   54 
//   55   	/* For debugging purposes, enable the trace clock and/or FB_CLK so that
//   56   	 * we'll be able to monitor clocks and know the PLL is at the frequency
//   57   	 * that we expect.
//   58   	 */
//   59 	trace_clk_init();    //使能跟踪时钟，用于调试
        BL       trace_clk_init
//   60   	fb_clk_init();         //FlexBus时钟初始化
        BL       fb_clk_init
//   61 
//   62   	/* Enable the pins for the selected UART */
//   63         
//   64          //初始化 printf 函数所用到的串口
//   65         
//   66         //找到TERM_PORT的宏定义位置，就可以设置工作串口
//   67         
//   68          
//   69        
//   70 
//   71   	
//   72 
//   73   	
//   74   	/* UART0 and UART1 are clocked from the core clock, but all other UARTs are
//   75          * clocked from the peripheral clock. So we have to determine which clock
//   76          * to send to the uart_init function.
//   77          */
//   78     //    if ((TERM_PORT == UART0_BASE_PTR) | (TERM_PORT == UART1_BASE_PTR))  //计算波特率，串口0、1使用内核时钟，其它串口使用外设时钟
//   79     //        uart_init (TERM_PORT, core_clk_khz, TERMINAL_BAUD);
//   80     //    else
//   81     //	    uart_init (TERM_PORT, periph_clk_khz, TERMINAL_BAUD); //初始化使用串口的通信波特率
//   82 }
        POP      {R0,PC}          ;; return
//   83 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 void trace_clk_init(void)
//   85 {
//   86 	/* Set the trace clock to the core clock frequency */
//   87 	SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;
trace_clk_init:
        LDR.N    R0,??DataTable2_5  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable2_5  ;; 0x40048004
        STR      R0,[R1, #+0]
//   88 
//   89 	/* Enable the TRACE_CLKOUT pin function on PTA6 (alt7 function) */
//   90 	PORTA_PCR6 = ( PORT_PCR_MUX(0x7));
        LDR.N    R0,??DataTable2_6  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//   91 }
        BX       LR               ;; return
//   92 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   93 void fb_clk_init(void)
//   94 {
//   95 	/* Enable the clock to the FlexBus module */
//   96         SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
fb_clk_init:
        LDR.N    R0,??DataTable2_7  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable2_7  ;; 0x40048040
        STR      R0,[R1, #+0]
//   97 
//   98  	/* Enable the FB_CLKOUT function on PTC3 (alt5 function) */
//   99 	PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable2_8  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  100 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     core_clk_mhz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     core_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x40049018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x40048040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x4004b00c

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  101 /********************************************************************/
// 
//  12 bytes in section .bss
// 152 bytes in section .text
// 
// 152 bytes of CODE memory
//  12 bytes of DATA memory
//
//Errors: none
//Warnings: none
