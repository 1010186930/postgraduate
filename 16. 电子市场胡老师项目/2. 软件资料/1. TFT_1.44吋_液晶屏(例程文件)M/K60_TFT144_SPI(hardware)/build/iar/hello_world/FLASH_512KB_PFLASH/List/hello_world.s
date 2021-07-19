///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:42 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\proj /
//                    ects\hello_world\hello_world.c                          /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\pro /
//                    jects\hello_world\hello_world.c" -D IAR -D TWR_K60N512  /
//                    -lCN "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\bu /
//                    ild\iar\hello_world\FLASH_512KB_PFLASH\List\" -lB       /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\hello_world.s     /
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

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\projects\hello_world\hello_world.c
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
//   22         SPI_Init(SPI0, SPI_SCK_DIV_4, 1); //如果显示异常，请修改SPI的接口速度，选择SPI0 SPI_SCK_DIV_4
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       SPI_Init
//   23         
//   24 	LCD_Init();	   //液晶屏初始化
        BL       LCD_Init
//   25 	
//   26         LCD_Clear(BLACK); //清屏
        MOVS     R0,#+0
        BL       LCD_Clear
//   27 
//   28 	POINT_COLOR=WHITE; 
        LDR.N    R0,??main_0+0x8
        MOVW     R1,#+65535
        STRH     R1,[R0, #+0]
//   29 	
//   30 	LCD_DrawRectangle(0,0,128-1,128-1);	//画矩形 
        MOVS     R3,#+127
        MOVS     R2,#+127
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_DrawRectangle
//   31 
//   32 	Show_Str(32,5,BLUE,YELLOW,"系统监控",16,0);
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
//   33 	
//   34 	Show_Str(5,25,RED,YELLOW,"温度     ℃",24,1);
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
//   35 	
//   36 	LCD_ShowNum2412(5+48,25,RED,YELLOW,":32",24,1);
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
//   37 
//   38 	Show_Str(5,50,YELLOW,YELLOW,"湿度     ％",24,1);
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
//   39 	LCD_ShowNum2412(5+48,50,YELLOW,YELLOW,":20",24,1);
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
//   40 
//   41 	Show_Str(5,75,WHITE,YELLOW,"电压      Ｖ",24,1);
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
//   42 	LCD_ShowNum2412(5+48,75,WHITE,YELLOW,":3.2",24,1);
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
//   43 
//   44 	Show_Str(5,100,GREEN,YELLOW,"电流      Ａ",24,1);
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
//   45 	LCD_ShowNum2412(5+48,100,GREEN,YELLOW,":0.2",24,1);		  
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
        B.N      ??main_1
//   46         
//   47 	while(1)
//   48 	{
//   49 	
//   50           GPIO_SET(PORTB,23,0);//LED灯
//   51           
//   52          for(Time=0;Time<0xfffff;Time++);//延时
//   53           
//   54           GPIO_SET(PORTB,23,1);
//   55           
//   56          for(Time=0;Time<0xfffff;Time++);//延时
//   57            
//   58           GPIO_SET(PORTB,22,0);//LED灯
//   59           
//   60         for(Time=0;Time<0xfffff;Time++);//延时
??main_2:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??main_0+0x28
        STR      R0,[R1, #+0]
??main_3:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x2C  ;; 0xfffff
        CMP      R0,R1
        BCC.N    ??main_2
//   61     
//   62           GPIO_SET(PORTB,22,1);
        LDR.N    R0,??main_0+0x30
        LDR      R0,[R0, #+4]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400000
        LDR.N    R1,??main_0+0x30
        LDR      R1,[R1, #+4]
        STR      R0,[R1, #+0]
??main_1:
        LDR.N    R0,??main_0+0x30
        LDR      R0,[R0, #+4]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x800000
        LDR.N    R1,??main_0+0x30
        LDR      R1,[R1, #+4]
        STR      R0,[R1, #+0]
        LDR.N    R0,??main_0+0x28
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        B.N      ??main_4
??main_5:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??main_0+0x28
        STR      R0,[R1, #+0]
??main_4:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x2C  ;; 0xfffff
        CMP      R0,R1
        BCC.N    ??main_5
        LDR.N    R0,??main_0+0x30
        LDR      R0,[R0, #+4]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??main_0+0x30
        LDR      R1,[R1, #+4]
        STR      R0,[R1, #+0]
        LDR.N    R0,??main_0+0x28
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        B.N      ??main_6
??main_7:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??main_0+0x28
        STR      R0,[R1, #+0]
??main_6:
        LDR.N    R0,??main_0+0x28
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x2C  ;; 0xfffff
        CMP      R0,R1
        BCC.N    ??main_7
        LDR.N    R0,??main_0+0x30
        LDR      R0,[R0, #+4]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x400000
        LDR.N    R1,??main_0+0x30
        LDR      R1,[R1, #+4]
        STR      R0,[R1, #+0]
        LDR.N    R0,??main_0+0x28
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        B.N      ??main_3
        Nop      
        DATA
??main_0:
        DC8      ":32"
        DC8      ":20"
        DC32     POINT_COLOR
        DC32     `?<Constant "\\317\\265\\315\\263\\274\\340\\277\\330">`
        DC32     `?<Constant "\\316\\302\\266\\310     \\241\\346">`
        DC32     `?<Constant "\\312\\252\\266\\310     \\243\\245">`
        DC32     `?<Constant "\\265\\347\\321\\271      \\243\\326">`
        DC32     `?<Constant ":3.2">`
        DC32     `?<Constant "\\265\\347\\301\\367      \\243\\301">`
        DC32     `?<Constant ":0.2">`
        DC32     Time
        DC32     0xfffff
        DC32     GPIOx
//   63          
//   64           
//   65           
//   66 	} 
//   67 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\317\\265\\315\\263\\274\\340\\277\\330">`:
        DATA
        DC8 "\317\265\315\263\274\340\277\330"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\316\\302\\266\\310     \\241\\346">`:
        DATA
        DC8 "\316\302\266\310     \241\346"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 ":32"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\312\\252\\266\\310     \\243\\245">`:
        DATA
        DC8 "\312\252\266\310     \243\245"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 ":20"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\265\\347\\321\\271      \\243\\326">`:
        DATA
        DC8 "\265\347\321\271      \243\326"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ":3.2">`:
        DATA
        DC8 ":3.2"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\265\\347\\301\\367      \\243\\301">`:
        DATA
        DC8 "\265\347\301\367      \243\301"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ":0.2">`:
        DATA
        DC8 ":0.2"
        DC8 0, 0, 0

        END
//   68 
//   69 
//   70 
//   71 
//   72 
//   73 
//   74 
//   75 
//   76 /********************************************************************/
// 
//   4 bytes in section .bss
//  92 bytes in section .rodata
// 520 bytes in section .text
// 
// 520 bytes of CODE  memory
//  92 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
