///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\projects\hello /
//                    _world\hello_world.c                                    /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\projects\hello /
//                    _world\hello_world.c -D IAR -D TWR_K60N512 -lCN         /
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
//                    rld\RAM_128KB\List\hello_world.s                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME hello_world

        #define SHT_PROGBITS 0x1

        EXTERN GPIOx
        EXTERN LCD_Clear
        EXTERN LCD_DrawRectangle
        EXTERN LCD_Init
        EXTERN LCD_ShowNum2412
        EXTERN POINT_COLOR
        EXTERN SPI_Init
        EXTERN Show_Str
        EXTERN gpio_init

        PUBLIC Time
        PUBLIC main

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\projects\hello_world\hello_world.c
//    1 /*
//    2  * File:		hello_world.c
//    3  * Purpose:		Main process
//    4  *
//    5  */
//    6 
//    7 #include "common.h"
//    8 #include"HAL_SPI.h"
//    9 #include "SPI_FLASH.H"
//   10 #include "uart.h"
//   11 #include "sysinit.h"
//   12 #include "start.h"
//   13 #include "lcd.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 unsigned long Time;
Time:
        DS8 4
//   15 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   16 void main (void)
//   17 {
main:
        PUSH     {R5-R7,LR}
//   18         gpio_init  (PORTB,23,GPO,HIGH); //初始化LED1引脚
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+23
        MOVS     R0,#+1
        BL       gpio_init
//   19       
//   20         gpio_init  (PORTB,22,GPO,HIGH); //初始化LED2/C引脚
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+22
        MOVS     R0,#+1
        BL       gpio_init
//   21          
//   22         SPI_Init(SPI0, SPI_SCK_DIV_512, 1); //选择SPI0 100Mhz /64 = 1.5Mhz
        MOVS     R2,#+1
        MOVS     R1,#+9
        MOVS     R0,#+0
        BL       SPI_Init
//   23         
//   24         //OLED_Init();			//初始化OLED      
//   25   	//OLED_ShowString(1,0, "0.96' OLED TEST");  
//   26   	//OLED_ShowString(1,16,"mcudev.taobao");  
//   27   	//"欢迎光临");  
//   28         //OLED_ShowCHinese(1,32,0);
//   29         // OLED_ShowCHinese(16,32,0);
//   30         //  OLED_ShowCHinese(32,32,1);
//   31         //   OLED_ShowCHinese(48,32,2);
//   32         //    OLED_ShowCHinese(64,32,3);
//   33         //     OLED_ShowCHinese(80,32,4);
//   34         //     OLED_ShowCHinese(96,32,0);
//   35         //     OLED_ShowCHinese(112,32,0);
//   36              
//   37         
//   38         
//   39       //  OLED_ShowString(1,48,"         2014-05");    
//   40 
//   41         
//   42         LCD_Init();	   //
        BL       LCD_Init
//   43 	LCD_Clear(BLACK); //
        MOVS     R0,#+0
        BL       LCD_Clear
//   44 
//   45 	POINT_COLOR=WHITE; 
        LDR.N    R0,??main_0+0x8
        MOVW     R1,#+65535
        STRH     R1,[R0, #+0]
//   46 	
//   47 	LCD_DrawRectangle(0,0,128-1,128-1);	//
        MOVS     R3,#+127
        MOVS     R2,#+127
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_DrawRectangle
//   48 
//   49 	Show_Str(32,5,BLUE,YELLOW,"?μí3?à??",16,0);
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+16
        STR      R0,[SP, #+4]
        LDR.N    R0,??main_0+0xC
        STR      R0,[SP, #+0]
        MOVW     R3,#+65504
        MOVS     R2,#+31
        MOVS     R1,#+5
        MOVS     R0,#+32
        BL       Show_Str
//   50 	
//   51 	Show_Str(5,25,RED,YELLOW,"???è     ??",24,1);
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+24
        STR      R0,[SP, #+4]
        LDR.N    R0,??main_0+0x10
        STR      R0,[SP, #+0]
        MOVW     R3,#+65504
        MOV      R2,#+63488
        MOVS     R1,#+25
        MOVS     R0,#+5
        BL       Show_Str
//   52 	
//   53 	LCD_ShowNum2412(5+48,25,RED,YELLOW,":32",24,1);
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+24
        STR      R0,[SP, #+4]
        ADR.N    R0,??main_0      ;; ":32"
        STR      R0,[SP, #+0]
        MOVW     R3,#+65504
        MOV      R2,#+63488
        MOVS     R1,#+25
        MOVS     R0,#+53
        BL       LCD_ShowNum2412
//   54 
//   55 	Show_Str(5,50,YELLOW,YELLOW,"êa?è     ￡￥",24,1);
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+24
        STR      R0,[SP, #+4]
        LDR.N    R0,??main_0+0x14
        STR      R0,[SP, #+0]
        MOVW     R3,#+65504
        MOVW     R2,#+65504
        MOVS     R1,#+50
        MOVS     R0,#+5
        BL       Show_Str
//   56 	LCD_ShowNum2412(5+48,50,YELLOW,YELLOW,":20",24,1);
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+24
        STR      R0,[SP, #+4]
        ADR.N    R0,??main_0+0x4  ;; ":20"
        STR      R0,[SP, #+0]
        MOVW     R3,#+65504
        MOVW     R2,#+65504
        MOVS     R1,#+50
        MOVS     R0,#+53
        BL       LCD_ShowNum2412
//   57 
//   58 	Show_Str(5,75,WHITE,YELLOW,"μ??1      ￡?",24,1);
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+24
        STR      R0,[SP, #+4]
        LDR.N    R0,??main_0+0x18
        STR      R0,[SP, #+0]
        MOVW     R3,#+65504
        MOVW     R2,#+65535
        MOVS     R1,#+75
        MOVS     R0,#+5
        BL       Show_Str
//   59 	LCD_ShowNum2412(5+48,75,WHITE,YELLOW,":3.2",24,1);
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+24
        STR      R0,[SP, #+4]
        LDR.N    R0,??main_0+0x1C
        STR      R0,[SP, #+0]
        MOVW     R3,#+65504
        MOVW     R2,#+65535
        MOVS     R1,#+75
        MOVS     R0,#+53
        BL       LCD_ShowNum2412
//   60 
//   61 	Show_Str(5,100,GREEN,YELLOW,"μ?á÷      ￡á",24,1);
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+24
        STR      R0,[SP, #+4]
        LDR.N    R0,??main_0+0x20
        STR      R0,[SP, #+0]
        MOVW     R3,#+65504
        MOV      R2,#+2016
        MOVS     R1,#+100
        MOVS     R0,#+5
        BL       Show_Str
//   62 	LCD_ShowNum2412(5+48,100,GREEN,YELLOW,":0.2",24,1);	  
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+24
        STR      R0,[SP, #+4]
        LDR.N    R0,??main_0+0x24
        STR      R0,[SP, #+0]
        MOVW     R3,#+65504
        MOV      R2,#+2016
        MOVS     R1,#+100
        MOVS     R0,#+53
        BL       LCD_ShowNum2412
//   63         
//   64 	while(1)
//   65 	{
//   66 	
//   67           GPIO_SET(PORTB,23,0);//LED灯
??main_1:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+4]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x800000
        LDR.N    R1,??main_0+0x28
        LDR      R1,[R1, #+4]
        STR      R0,[R1, #+0]
//   68           
//   69          for(Time=0;Time<0xfffff;Time++);//延时
        LDR.N    R0,??main_0+0x2C
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
??main_2:
        LDR.N    R0,??main_0+0x2C
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x30  ;; 0xfffff
        CMP      R0,R1
        BCS.N    ??main_3
        LDR.N    R0,??main_0+0x2C
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??main_0+0x2C
        STR      R0,[R1, #+0]
        B.N      ??main_2
//   70           
//   71           GPIO_SET(PORTB,23,1);
??main_3:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+4]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??main_0+0x28
        LDR      R1,[R1, #+4]
        STR      R0,[R1, #+0]
//   72           
//   73          for(Time=0;Time<0xfffff;Time++);//延时
        LDR.N    R0,??main_0+0x2C
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
??main_4:
        LDR.N    R0,??main_0+0x2C
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x30  ;; 0xfffff
        CMP      R0,R1
        BCS.N    ??main_5
        LDR.N    R0,??main_0+0x2C
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??main_0+0x2C
        STR      R0,[R1, #+0]
        B.N      ??main_4
//   74            
//   75           GPIO_SET(PORTB,22,0);//LED灯
??main_5:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+4]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x400000
        LDR.N    R1,??main_0+0x28
        LDR      R1,[R1, #+4]
        STR      R0,[R1, #+0]
//   76           
//   77         for(Time=0;Time<0xfffff;Time++);//延时
        LDR.N    R0,??main_0+0x2C
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
??main_6:
        LDR.N    R0,??main_0+0x2C
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x30  ;; 0xfffff
        CMP      R0,R1
        BCS.N    ??main_7
        LDR.N    R0,??main_0+0x2C
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??main_0+0x2C
        STR      R0,[R1, #+0]
        B.N      ??main_6
//   78     
//   79           GPIO_SET(PORTB,22,1);
??main_7:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+4]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400000
        LDR.N    R1,??main_0+0x28
        LDR      R1,[R1, #+4]
        STR      R0,[R1, #+0]
        B.N      ??main_1
        Nop      
        DATA
??main_0:
        DC8      ":32"
        DC8      ":20"
        DC32     POINT_COLOR
        DC32     `?<Constant "?\\246\\314\\250\\2523?\\250\\244??">`
        DC32     `?<Constant "???\\250\\250     ??">`
        DC32     `?<Constant "\\250\\272a?\\250\\250     \\241\\352\\24`
        DC32     `?<Constant "\\246\\314??1      \\241\\352?">`
        DC32     `?<Constant ":3.2">`
        DC32     `?<Constant "\\246\\314?\\250\\242\\241\\302      \\24`
        DC32     `?<Constant ":0.2">`
        DC32     GPIOx
        DC32     Time
        DC32     0xfffff
//   80          
//   81           
//   82           
//   83 	} 
//   84 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "?\\246\\314\\250\\2523?\\250\\244??">`:
        DATA
        DC8 "?\246\314\250\2523?\250\244??"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "???\\250\\250     ??">`:
        DATA
        DC8 "???\250\250     ??"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 ":32"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\250\\272a?\\250\\250     \\241\\352\\24`:
        DATA
        DC8 "\250\272a?\250\250     \241\352\243\244"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 ":20"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\246\\314??1      \\241\\352?">`:
        DATA
        DC8 "\246\314??1      \241\352?"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ":3.2">`:
        DATA
        DC8 ":3.2"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\246\\314?\\250\\242\\241\\302      \\24`:
        DATA
        DC8 "\246\314?\250\242\241\302      \241\352\250\242"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ":0.2">`:
        DATA
        DC8 ":0.2"
        DC8 0, 0, 0

        END
//   85 
//   86 
//   87 
//   88 
//   89 
//   90 
//   91 
//   92 
//   93 /********************************************************************/
// 
//   4 bytes in section .bss
// 104 bytes in section .rodata
// 520 bytes in section .text
// 
// 520 bytes of CODE  memory
// 104 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
