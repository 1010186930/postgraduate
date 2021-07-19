///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\cpu\arm_cm4.c  /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\cpu\arm_cm4.c  /
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
//                    rld\RAM_128KB\List\arm_cm4.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME arm_cm4

        #define SHT_PROGBITS 0x1

        EXTERN printf

        PUBLIC disable_irq
        PUBLIC enable_irq
        PUBLIC set_irq_priority
        PUBLIC stop
        PUBLIC wait
        PUBLIC write_vtor

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\cpu\arm_cm4.c
//    1 /*
//    2  * File:		arm_cm4.c
//    3  * Purpose:		Generic high-level routines for ARM Cortex M4 processors
//    4  *
//    5  * Notes:
//    6  */
//    7 
//    8 #include "common.h"
//    9 
//   10 /***********************************************************************/
//   11 /*
//   12  * Configures the ARM system control register for STOP (deep sleep) mode
//   13  * and then executes the WFI instruction to enter the mode.
//   14  *
//   15  * Parameters:
//   16  * none
//   17  *
//   18  * Note: Might want to change this later to allow for passing in a parameter
//   19  *       to optionally set the sleep on exit bit.
//   20  */
//   21 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   22 void stop (void)
//   23 {
//   24 	/* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//   25 	SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;	
stop:
        LDR.N    R0,??DataTable5  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable5  ;; 0xe000ed10
        STR      R0,[R1, #+0]
//   26 
//   27 	/* WFI instruction will start entry into STOP mode */
//   28 	asm("WFI");
        WFI              
//   29 }
        BX       LR               ;; return
//   30 /***********************************************************************/
//   31 /*
//   32  * Configures the ARM system control register for WAIT (sleep) mode
//   33  * and then executes the WFI instruction to enter the mode.
//   34  *
//   35  * Parameters:
//   36  * none
//   37  *
//   38  * Note: Might want to change this later to allow for passing in a parameter
//   39  *       to optionally set the sleep on exit bit.
//   40  */
//   41 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   42 void wait (void)
//   43 {
//   44 	/* Clear the SLEEPDEEP bit to make sure we go into WAIT (sleep) mode instead
//   45 	 * of deep sleep.
//   46 	 */
//   47 	SCB_SCR &= ~SCB_SCR_SLEEPDEEP_MASK;	
wait:
        LDR.N    R0,??DataTable5  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable5  ;; 0xe000ed10
        STR      R0,[R1, #+0]
//   48 
//   49 	/* WFI instruction will start entry into WAIT mode */
//   50 	asm("WFI");
        WFI              
//   51 }
        BX       LR               ;; return
//   52 /***********************************************************************/
//   53 /*
//   54  * Change the value of the vector table offset register to the specified value.
//   55  *
//   56  * Parameters:
//   57  * vtor     new value to write to the VTOR
//   58  */
//   59 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   60 void write_vtor (int vtor)
//   61 {
//   62         /* Write the VTOR with the new value */
//   63         SCB_VTOR = vtor;	
write_vtor:
        LDR.N    R1,??DataTable5_1  ;; 0xe000ed08
        STR      R0,[R1, #+0]
//   64 }
        BX       LR               ;; return
//   65 /***********************************************************************/
//   66 /*
//   67  * Initialize the NVIC to enable the specified IRQ.
//   68  * 
//   69  * NOTE: The function only initializes the NVIC to enable a single IRQ. 
//   70  * Interrupts will also need to be enabled in the ARM core. This can be 
//   71  * done using the EnableInterrupts macro.
//   72  *
//   73  * Parameters:
//   74  * irq    irq number to be enabled (the irq number NOT the vector number)
//   75  */
//   76 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   77 void enable_irq (int irq)
//   78 {
enable_irq:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   79     int div;
//   80     
//   81     /* Make sure that the IRQ is an allowable number. Right now up to 91 is 
//   82      * used.
//   83      */
//   84     if (irq > 91)
        CMP      R4,#+92
        BLT.N    ??enable_irq_0
//   85         printf("\nERR! Invalid IRQ value passed to enable irq function!\n");
        LDR.N    R0,??DataTable5_2
        BL       printf
//   86     
//   87     /* Determine which of the NVICISERs corresponds to the irq */
//   88     div = irq/32;
??enable_irq_0:
        MOVS     R0,#+32
        SDIV     R0,R4,R0
        MOVS     R5,R0
//   89     
//   90     switch (div)
        CMP      R5,#+0
        BEQ.N    ??enable_irq_1
        CMP      R5,#+2
        BEQ.N    ??enable_irq_2
        BCC.N    ??enable_irq_3
        B.N      ??enable_irq_4
//   91     {
//   92     	case 0x0:
//   93               NVICICPR0 = 1 << (irq%32);
??enable_irq_1:
        MOVS     R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        LSLS     R0,R0,R2
        LDR.N    R1,??DataTable5_3  ;; 0xe000e280
        STR      R0,[R1, #+0]
//   94               NVICISER0 = 1 << (irq%32);
        MOVS     R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        LSLS     R0,R0,R2
        LDR.N    R1,??DataTable5_4  ;; 0xe000e100
        STR      R0,[R1, #+0]
//   95               break;
        B.N      ??enable_irq_4
//   96     	case 0x1:
//   97               NVICICPR1 = 1 << (irq%32);
??enable_irq_3:
        MOVS     R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        LSLS     R0,R0,R2
        LDR.N    R1,??DataTable5_5  ;; 0xe000e284
        STR      R0,[R1, #+0]
//   98               NVICISER1 = 1 << (irq%32);
        MOVS     R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        LSLS     R0,R0,R2
        LDR.N    R1,??DataTable5_6  ;; 0xe000e104
        STR      R0,[R1, #+0]
//   99               break;
        B.N      ??enable_irq_4
//  100     	case 0x2:
//  101               NVICICPR2 = 1 << (irq%32);
??enable_irq_2:
        MOVS     R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        LSLS     R0,R0,R2
        LDR.N    R1,??DataTable5_7  ;; 0xe000e288
        STR      R0,[R1, #+0]
//  102               NVICISER2 = 1 << (irq%32);
        MOVS     R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        LSLS     R0,R0,R2
        LDR.N    R1,??DataTable5_8  ;; 0xe000e108
        STR      R0,[R1, #+0]
//  103               break;
//  104     }              
//  105 }
??enable_irq_4:
        POP      {R0,R4,R5,PC}    ;; return
//  106 /***********************************************************************/
//  107 /*
//  108  * Initialize the NVIC to disable the specified IRQ.
//  109  * 
//  110  * NOTE: The function only initializes the NVIC to disable a single IRQ. 
//  111  * If you want to disable all interrupts, then use the DisableInterrupts
//  112  * macro instead. 
//  113  *
//  114  * Parameters:
//  115  * irq    irq number to be disabled (the irq number NOT the vector number)
//  116  */
//  117 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  118 void disable_irq (int irq)
//  119 {
disable_irq:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  120     int div;
//  121     
//  122     /* Make sure that the IRQ is an allowable number. Right now up to 91 is 
//  123      * used.
//  124      */
//  125     if (irq > 91)
        CMP      R4,#+92
        BLT.N    ??disable_irq_0
//  126         printf("\nERR! Invalid IRQ value passed to disable irq function!\n");
        LDR.N    R0,??DataTable5_9
        BL       printf
//  127     
//  128     /* Determine which of the NVICICERs corresponds to the irq */
//  129     div = irq/32;
??disable_irq_0:
        MOVS     R0,#+32
        SDIV     R0,R4,R0
        MOVS     R5,R0
//  130     
//  131     switch (div)
        CMP      R5,#+0
        BEQ.N    ??disable_irq_1
        CMP      R5,#+2
        BEQ.N    ??disable_irq_2
        BCC.N    ??disable_irq_3
        B.N      ??disable_irq_4
//  132     {
//  133     	case 0x0:
//  134                NVICICER0 = 1 << (irq%32);
??disable_irq_1:
        MOVS     R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        LSLS     R0,R0,R2
        LDR.N    R1,??DataTable5_10  ;; 0xe000e180
        STR      R0,[R1, #+0]
//  135               break;
        B.N      ??disable_irq_4
//  136     	case 0x1:
//  137               NVICICER1 = 1 << (irq%32);
??disable_irq_3:
        MOVS     R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        LSLS     R0,R0,R2
        LDR.N    R1,??DataTable5_11  ;; 0xe000e184
        STR      R0,[R1, #+0]
//  138               break;
        B.N      ??disable_irq_4
//  139     	case 0x2:
//  140               NVICICER2 = 1 << (irq%32);
??disable_irq_2:
        MOVS     R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        LSLS     R0,R0,R2
        LDR.N    R1,??DataTable5_12  ;; 0xe000e188
        STR      R0,[R1, #+0]
//  141               break;
//  142     }              
//  143 }
??disable_irq_4:
        POP      {R0,R4,R5,PC}    ;; return
//  144 /***********************************************************************/
//  145 /*
//  146  * Initialize the NVIC to set specified IRQ priority.
//  147  * 
//  148  * NOTE: The function only initializes the NVIC to set a single IRQ priority. 
//  149  * Interrupts will also need to be enabled in the ARM core. This can be 
//  150  * done using the EnableInterrupts macro.
//  151  *
//  152  * Parameters:
//  153  * irq    irq number to be enabled (the irq number NOT the vector number)
//  154  * prio   irq priority. 0-15 levels. 0 max priority
//  155  */
//  156 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  157 void set_irq_priority (int irq, int prio)
//  158 {
set_irq_priority:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  159     /*irq priority pointer*/
//  160     uint8 *prio_reg;
//  161     
//  162     /* Make sure that the IRQ is an allowable number. Right now up to 91 is 
//  163      * used.
//  164      */
//  165     if (irq > 91)
        CMP      R4,#+92
        BLT.N    ??set_irq_priority_0
//  166         printf("\nERR! Invalid IRQ value passed to priority irq function!\n");
        LDR.N    R0,??DataTable5_13
        BL       printf
//  167 
//  168     if (prio > 15)
??set_irq_priority_0:
        CMP      R5,#+16
        BLT.N    ??set_irq_priority_1
//  169         printf("\nERR! Invalid priority value passed to priority irq function!\n");
        LDR.N    R0,??DataTable5_14
        BL       printf
//  170     
//  171     /* Determine which of the NVICIPx corresponds to the irq */
//  172     prio_reg = (uint8 *)(((uint32)&NVICIP0) + irq);
??set_irq_priority_1:
        ADD      R0,R4,#-536870912
        ADDS     R0,R0,#+58368
        MOVS     R6,R0
//  173     /* Assign priority to IRQ */
//  174     *prio_reg = ( (prio&0xF) << (8 - ARM_INTERRUPT_LEVEL_BITS) );             
        LSLS     R0,R5,#+4
        STRB     R0,[R6, #+0]
//  175 }
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xe000ed10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0xe000ed08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     `?<Constant "\\nERR! Invalid IRQ val...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0xe000e284

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0xe000e104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0xe000e288

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0xe000e108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     `?<Constant "\\nERR! Invalid IRQ val...">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0xe000e184

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0xe000e188

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     `?<Constant "\\nERR! Invalid IRQ val...">_2`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     `?<Constant "\\nERR! Invalid priorit...">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nERR! Invalid IRQ val...">`:
        DATA
        DC8 0AH, 45H, 52H, 52H, 21H, 20H, 49H, 6EH
        DC8 76H, 61H, 6CH, 69H, 64H, 20H, 49H, 52H
        DC8 51H, 20H, 76H, 61H, 6CH, 75H, 65H, 20H
        DC8 70H, 61H, 73H, 73H, 65H, 64H, 20H, 74H
        DC8 6FH, 20H, 65H, 6EH, 61H, 62H, 6CH, 65H
        DC8 20H, 69H, 72H, 71H, 20H, 66H, 75H, 6EH
        DC8 63H, 74H, 69H, 6FH, 6EH, 21H, 0AH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nERR! Invalid IRQ val...">_1`:
        DATA
        DC8 0AH, 45H, 52H, 52H, 21H, 20H, 49H, 6EH
        DC8 76H, 61H, 6CH, 69H, 64H, 20H, 49H, 52H
        DC8 51H, 20H, 76H, 61H, 6CH, 75H, 65H, 20H
        DC8 70H, 61H, 73H, 73H, 65H, 64H, 20H, 74H
        DC8 6FH, 20H, 64H, 69H, 73H, 61H, 62H, 6CH
        DC8 65H, 20H, 69H, 72H, 71H, 20H, 66H, 75H
        DC8 6EH, 63H, 74H, 69H, 6FH, 6EH, 21H, 0AH
        DC8 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nERR! Invalid IRQ val...">_2`:
        DATA
        DC8 0AH, 45H, 52H, 52H, 21H, 20H, 49H, 6EH
        DC8 76H, 61H, 6CH, 69H, 64H, 20H, 49H, 52H
        DC8 51H, 20H, 76H, 61H, 6CH, 75H, 65H, 20H
        DC8 70H, 61H, 73H, 73H, 65H, 64H, 20H, 74H
        DC8 6FH, 20H, 70H, 72H, 69H, 6FH, 72H, 69H
        DC8 74H, 79H, 20H, 69H, 72H, 71H, 20H, 66H
        DC8 75H, 6EH, 63H, 74H, 69H, 6FH, 6EH, 21H
        DC8 0AH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nERR! Invalid priorit...">`:
        DATA
        DC8 0AH, 45H, 52H, 52H, 21H, 20H, 49H, 6EH
        DC8 76H, 61H, 6CH, 69H, 64H, 20H, 70H, 72H
        DC8 69H, 6FH, 72H, 69H, 74H, 79H, 20H, 76H
        DC8 61H, 6CH, 75H, 65H, 20H, 70H, 61H, 73H
        DC8 73H, 65H, 64H, 20H, 74H, 6FH, 20H, 70H
        DC8 72H, 69H, 6FH, 72H, 69H, 74H, 79H, 20H
        DC8 69H, 72H, 71H, 20H, 66H, 75H, 6EH, 63H
        DC8 74H, 69H, 6FH, 6EH, 21H, 0AH, 0
        DC8 0

        END
//  176 /***********************************************************************/
//  177 
// 
// 240 bytes in section .rodata
// 382 bytes in section .text
// 
// 382 bytes of CODE  memory
// 240 bytes of CONST memory
//
//Errors: none
//Warnings: none
