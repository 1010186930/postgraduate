///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:42 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\comm /
//                    on\io.c                                                 /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\com /
//                    mon\io.c" -D IAR -D TWR_K60N512 -lCN                    /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\FLASH_512KB_PFLASH\List\" -lB            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\FLASH_512KB_PFLASH\List\" -o             /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\FLASH_512KB_PFLASH\Obj\" --no_cse        /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_clustering --no_scheduling --debug                 /
//                    --endian=little --cpu=Cortex-M4 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\arm\INC\c\DLib_Config_Normal.h" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\projects\hello_world\" -I   /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\common\" -I                 /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\cpu\" -I                    /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\cpu\headers\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\adc16\" -I          /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\enet\" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\pmc\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\rtc\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\lptmr\" -I          /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\uart\" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\mcg\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\wdog\" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\platforms\" -I              /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\ftm\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\SPI\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\OLED\" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\TFT\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\" -Ol --use_c++_inline                /
//    List file    =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\ia /
//                    r\hello_world\FLASH_512KB_PFLASH\List\io.s              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME io

        #define SHT_PROGBITS 0x1

        EXTERN assert_failed
        EXTERN uart_getchar
        EXTERN uart_getchar_present
        EXTERN uart_putchar

        PUBLIC GPIOx
        PUBLIC PORTX
        PUBLIC char_present
        PUBLIC gpio_get
        PUBLIC gpio_init
        PUBLIC gpio_set
        PUBLIC gpio_turn
        PUBLIC in_char
        PUBLIC out_char

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\common\io.c
//    1 /*
//    2  * File:		io.c
//    3  * Purpose:		Serial Input/Output routines
//    4  *
//    5  * Notes:       TERMINAL_PORT defined in <board>.h
//    6  */
//    7 
//    8 #include "common.h"
//    9 #include "uart.h"
//   10 
//   11 
//   12 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13 volatile struct GPIO_MemMap *GPIOx[5] = {PTA_BASE_PTR, PTB_BASE_PTR, PTC_BASE_PTR, PTD_BASE_PTR, PTE_BASE_PTR}; //定义五个指针数组保存 GPIOx 的地址
GPIOx:
        DATA
        DC32 400FF000H, 400FF040H, 400FF080H, 400FF0C0H, 400FF100H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   14 volatile struct PORT_MemMap *PORTX[5] = {PORTA_BASE_PTR, PORTB_BASE_PTR, PORTC_BASE_PTR, PORTD_BASE_PTR, PORTE_BASE_PTR};
PORTX:
        DATA
        DC32 40049000H, 4004A000H, 4004B000H, 4004C000H, 4004D000H
//   15 
//   16 /*************************************************************************
//   17 *
//   18 *  函数名称：gpio_init
//   19 *  功能说明：初始化gpio
//   20 *  参数说明：PORTx       端口号（PORTA,PORTB,PORTC,PORTD,PORTE）
//   21 *            n           端口引脚
//   22 *            IO          引脚方向,0=输入,1=输出
//   23 *            data        输出初始状态,0=低电平,1=高电平 （对输入无效）
//   24 *  函数返回：无
//   25 *  修改时间：2012-1-15   已测试
//   26 *  备    注：
//   27 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 void gpio_init (PORTx portx, u8 n, GPIO_CFG cfg, u8 data)
//   29 {
gpio_init:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//   30     ASSERT( (n < 32u)  && (data < 2u) );           //使用断言检查输入、电平 是否为1bit
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+32
        BCS.N    ??gpio_init_0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+2
        BCC.N    ??gpio_init_1
??gpio_init_0:
        MOVS     R1,#+30
        LDR.N    R0,??DataTable6
        BL       assert_failed
//   31 
//   32     //选择功能脚 PORTx_PCRx ，每个端口都有个寄存器 PORTx_PCRx
//   33     PORT_PCR_REG(PORTX[portx], n) = (0 | PORT_PCR_MUX(1) | cfg);
??gpio_init_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable6_1
        LDR      R0,[R0, R4, LSL #+2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOV      R1,#+256
        ORRS     R1,R1,R6
        STR      R1,[R0, R5, LSL #+2]
//   34 
//   35     //端口方向控制输入还是输出
//   36     if( ( (cfg & 0x01) == GPI) || (cfg == GPI_UP) ||     (cfg == GPI_UP_PF)      )
        LSLS     R0,R6,#+31
        BPL.N    ??gpio_init_2
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BEQ.N    ??gpio_init_2
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+19
        BNE.N    ??gpio_init_3
//   37         //   最低位为0则输入   ||   输入上拉模式  ||   输入上拉，带无源滤波器
//   38     {
//   39         GPIO_PDDR_REG(GPIOx[portx]) &= ~(1 << n);  //设置端口方向为输入
??gpio_init_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+20]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        BICS     R0,R0,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+20]
        B.N      ??gpio_init_4
//   40     }
//   41     else
//   42     {
//   43         GPIO_PDDR_REG(GPIOx[portx]) |= (1 << n);    //设置端口方向为输出
??gpio_init_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+20]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        ORRS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+20]
//   44         if(data == 1)//output
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??gpio_init_5
//   45         {
//   46             GPIO_SET(portx, n, 1);                  //对端口输出控制，输出为1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        ORRS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
        B.N      ??gpio_init_4
//   47         }
//   48         else
//   49         {
//   50             GPIO_SET(portx, n, 0);                  //对端口输出控制，输出为0
??gpio_init_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        BICS     R0,R0,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//   51         }
//   52     }
//   53 }
??gpio_init_4:
        POP      {R0,R4-R7,PC}    ;; return
//   54 
//   55 /*************************************************************************
//   56 *
//   57 *  函数名称：gpio_set
//   58 *  功能说明：设置引脚状态
//   59 *  参数说明：PORTx       端口号（PORTA,PORTB,PORTC,PORTD,PORTE）
//   60 *            n           端口引脚
//   61 *            data        输出初始状态,0=低电平,1=高电平
//   62 *  函数返回：无
//   63 *  修改时间：2012-1-16   已测试
//   64 *  备    注：
//   65 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   66 void gpio_set (PORTx portx, u8 n, u8 data)
//   67 {
gpio_set:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   68     ASSERT( (n < 32u)  && (data < 2u) );           //使用断言检查输入、电平 是否为1bit
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+32
        BCS.N    ??gpio_set_0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BCC.N    ??gpio_set_1
??gpio_set_0:
        MOVS     R1,#+68
        LDR.N    R0,??DataTable6
        BL       assert_failed
//   69 
//   70     if(data == 1)               //输出
??gpio_set_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??gpio_set_2
//   71         GPIO_SET(portx, n, 1);  //GPIO_PDOR_REG(PORTx) |= (1<<n);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        ORRS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
        B.N      ??gpio_set_3
//   72     else
//   73         GPIO_SET(portx, n, 0);  //GPIO_PDOR_REG(PORTx) &= ~(1<<n);
??gpio_set_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        BICS     R0,R0,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//   74 }
??gpio_set_3:
        POP      {R4-R6,PC}       ;; return
//   75 
//   76 /*************************************************************************
//   77 *
//   78 *  函数名称：gpio_turn
//   79 *  功能说明：反转引脚状态
//   80 *  参数说明：PORTx       端口号（PORTA,PORTB,PORTC,PORTD,PORTE）
//   81 *            n           端口引脚
//   82 *  函数返回：无
//   83 *  修改时间：2012-1-15   已测试
//   84 *  备    注：
//   85 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   86 void gpio_turn (PORTx portx, u8 n)
//   87 {
gpio_turn:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   88     ASSERT( n < 32u );           //使用断言检查引脚号
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+32
        BCC.N    ??gpio_turn_0
        MOVS     R1,#+88
        LDR.N    R0,??DataTable6
        BL       assert_failed
//   89     GPIO_TURN(portx, n);
??gpio_turn_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        EORS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//   90 }
        POP      {R0,R4,R5,PC}    ;; return
//   91 
//   92 /*************************************************************************
//   93 *
//   94 *  函数名称：gpio_get
//   95 *  功能说明：读取引脚输入状态
//   96 *  参数说明：PORTx       端口号（PORTA,PORTB,PORTC,PORTD,PORTE）
//   97 *            n           端口引脚
//   98 *  函数返回：无
//   99 *  修改时间：2012-1-15   已测试
//  100 *  备    注：
//  101 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  102 u8 gpio_get(PORTx portx, u8 n)          //读取引脚状态
//  103 {
gpio_get:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  104     ASSERT( n < 32u );                  //使用断言检查引脚号
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+32
        BCC.N    ??gpio_get_0
        MOVS     R1,#+104
        LDR.N    R0,??DataTable6
        BL       assert_failed
//  105     return GPIO_Get(portx, n);
??gpio_get_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+16]
        LSRS     R0,R0,R5
        ANDS     R0,R0,#0x1
        POP      {R1,R4,R5,PC}    ;; return
//  106 }
//  107 
//  108 
//  109 
//  110 
//  111 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 char
//  113 in_char (void)
//  114 {
in_char:
        PUSH     {R7,LR}
//  115 	return uart_getchar(TERM_PORT);
        LDR.N    R0,??DataTable6_3  ;; 0x4006d000
        BL       uart_getchar
        POP      {R1,PC}          ;; return
//  116 }
//  117 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  118 void
//  119 out_char (char ch)
//  120 {
out_char:
        PUSH     {R7,LR}
//  121 	uart_putchar(TERM_PORT, ch);
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable6_3  ;; 0x4006d000
        BL       uart_putchar
//  122 }
        POP      {R0,PC}          ;; return
//  123 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  124 int
//  125 char_present (void)
//  126 {
char_present:
        PUSH     {R7,LR}
//  127 	return uart_getchar_present(TERM_PORT);
        LDR.N    R0,??DataTable6_3  ;; 0x4006d000
        BL       uart_getchar_present
        POP      {R1,PC}          ;; return
//  128 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     `?<Constant "C:\\\\Users\\\\Ping\\\\Desktop...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     PORTX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     GPIOx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x4006d000

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "C:\\\\Users\\\\Ping\\\\Desktop...">`:
        DATA
        DC8 43H, 3AH, 5CH, 55H, 73H, 65H, 72H, 73H
        DC8 5CH, 50H, 69H, 6EH, 67H, 5CH, 44H, 65H
        DC8 73H, 6BH, 74H, 6FH, 70H, 5CH, 4BH, 36H
        DC8 30H, 5FH, 54H, 46H, 54H, 31H, 34H, 34H
        DC8 5FH, 53H, 50H, 49H, 28H, 68H, 61H, 72H
        DC8 64H, 77H, 61H, 72H, 65H, 29H, 5CH, 73H
        DC8 72H, 63H, 5CH, 63H, 6FH, 6DH, 6DH, 6FH
        DC8 6EH, 5CH, 69H, 6FH, 2EH, 63H, 0
        DC8 0

        END
//  129 /********************************************************************/
// 
//  40 bytes in section .data
//  64 bytes in section .rodata
// 410 bytes in section .text
// 
// 410 bytes of CODE  memory
//  64 bytes of CONST memory
//  40 bytes of DATA  memory
//
//Errors: none
//Warnings: none
