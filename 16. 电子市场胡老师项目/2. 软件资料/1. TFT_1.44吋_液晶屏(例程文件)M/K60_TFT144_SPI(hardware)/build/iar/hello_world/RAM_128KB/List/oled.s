///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:19:26 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\OLED\o /
//                    led.c                                                   /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\OLED\o /
//                    led.c -D IAR -D TWR_K60N512 -lCN                        /
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
//                    rld\..\ -On --use_c++_inline                            /
//    List file    =  C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\RAM_128KB\List\oled.s                               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME oled

        #define SHT_PROGBITS 0x1

        EXTERN GPIOx
        EXTERN SPI_Master_WriteRead
        EXTERN delay_ms

        PUBLIC CHINESE
        PUBLIC LCD_Set_Pos
        PUBLIC OLED_Clear
        PUBLIC OLED_Display_Off
        PUBLIC OLED_Display_On
        PUBLIC OLED_DrawPoint
        PUBLIC OLED_Fill
        PUBLIC OLED_GRAM
        PUBLIC OLED_Init
        PUBLIC OLED_Refresh_Gram
        PUBLIC OLED_ShowCHinese
        PUBLIC OLED_ShowChar
        PUBLIC OLED_ShowNum
        PUBLIC OLED_ShowString
        PUBLIC OLED_WR_Byte
        PUBLIC oled_asc2_1206
        PUBLIC oled_asc2_1608
        PUBLIC oled_pow

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\OLED\oled.c
//    1 //////////////////////////////////////////////////////////////////////////////////	 
//    2 //本程序只供学习使用，未经作者许可，不得用于其它任何用途
//    3 //All rights reserved
//    4 //********************************************************************************
//    5 #include "oled.h"
//    6 #include "stdlib.h"
//    7 #include "oledfont.h"  	 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const oled_asc2_1206[95][12]
oled_asc2_1206:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 64, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 48, 0, 64, 0, 48, 0, 64, 0, 0, 0, 9, 0, 11, 192, 61, 0
        DC8 11, 192, 61, 0, 9, 0, 24, 192, 36, 64, 127, 224, 34, 64, 49, 128, 0
        DC8 0, 24, 0, 36, 192, 27, 0, 13, 128, 50, 64, 1, 128, 3, 128, 28, 64
        DC8 39, 64, 28, 128, 7, 64, 0, 64, 16, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 31, 128, 32, 64, 64, 32, 0, 0, 64, 32, 32, 64, 31
        DC8 128, 0, 0, 0, 0, 9, 0, 6, 0, 31, 128, 6, 0, 9, 0, 0, 0, 4, 0, 4, 0
        DC8 63, 128, 4, 0, 4, 0, 0, 0, 0, 16, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 4
        DC8 0, 4, 0, 4, 0, 4, 0, 4, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 32, 1, 192, 6, 0, 56, 0, 64, 0, 0, 0, 31, 128, 32, 64, 32, 64
        DC8 32, 64, 31, 128, 0, 0, 0, 0, 16, 64, 63, 192, 0, 64, 0, 0, 0, 0, 24
        DC8 192, 33, 64, 34, 64, 36, 64, 24, 64, 0, 0, 16, 128, 32, 64, 36, 64
        DC8 36, 64, 27, 128, 0, 0, 2, 0, 13, 0, 17, 0, 63, 192, 1, 64, 0, 0, 60
        DC8 128, 36, 64, 36, 64, 36, 64, 35, 128, 0, 0, 31, 128, 36, 64, 36, 64
        DC8 52, 64, 3, 128, 0, 0, 48, 0, 32, 0, 39, 192, 56, 0, 32, 0, 0, 0, 27
        DC8 128, 36, 64, 36, 64, 36, 64, 27, 128, 0, 0, 28, 0, 34, 192, 34, 64
        DC8 34, 64, 31, 128, 0, 0, 0, 0, 0, 0, 8, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 4, 96, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 10, 0, 17, 0, 32, 128, 64
        DC8 64, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 0, 0, 0, 0, 64, 64, 32, 128, 17
        DC8 0, 10, 0, 4, 0, 24, 0, 32, 0, 35, 64, 36, 0, 24, 0, 0, 0, 31, 128
        DC8 32, 64, 39, 64, 41, 64, 31, 64, 0, 0, 0, 64, 7, 192, 57, 0, 15, 0
        DC8 1, 192, 0, 64, 32, 64, 63, 192, 36, 64, 36, 64, 27, 128, 0, 0, 31
        DC8 128, 32, 64, 32, 64, 32, 64, 48, 128, 0, 0, 32, 64, 63, 192, 32, 64
        DC8 32, 64, 31, 128, 0, 0, 32, 64, 63, 192, 36, 64, 46, 64, 48, 192, 0
        DC8 0, 32, 64, 63, 192, 36, 64, 46, 0, 48, 0, 0, 0, 15, 0, 16, 128, 32
        DC8 64, 34, 64, 51, 128, 2, 0, 32, 64, 63, 192, 4, 0, 4, 0, 63, 192, 32
        DC8 64, 32, 64, 32, 64, 63, 192, 32, 64, 32, 64, 0, 0, 0, 96, 32, 32
        DC8 32, 32, 63, 192, 32, 0, 32, 0, 32, 64, 63, 192, 36, 64, 11, 0, 48
        DC8 192, 32, 64, 32, 64, 63, 192, 32, 64, 0, 64, 0, 64, 0, 192, 63, 192
        DC8 60, 0, 3, 192, 60, 0, 63, 192, 0, 0, 32, 64, 63, 192, 12, 64, 35, 0
        DC8 63, 192, 32, 0, 31, 128, 32, 64, 32, 64, 32, 64, 31, 128, 0, 0, 32
        DC8 64, 63, 192, 36, 64, 36, 0, 24, 0, 0, 0, 31, 128, 33, 64, 33, 64
        DC8 32, 224, 31, 160, 0, 0, 32, 64, 63, 192, 36, 64, 38, 0, 25, 192, 0
        DC8 64, 24, 192, 36, 64, 36, 64, 34, 64, 49, 128, 0, 0, 48, 0, 32, 64
        DC8 63, 192, 32, 64, 48, 0, 0, 0, 32, 0, 63, 128, 0, 64, 0, 64, 63, 128
        DC8 32, 0, 32, 0, 62, 0, 1, 192, 7, 0, 56, 0, 32, 0, 56, 0, 7, 192, 60
        DC8 0, 7, 192, 56, 0, 0, 0, 32, 64, 57, 192, 6, 0, 57, 192, 32, 64, 0
        DC8 0, 32, 0, 56, 64, 7, 192, 56, 64, 32, 0, 0, 0, 48, 64, 33, 192, 38
        DC8 64, 56, 64, 32, 192, 0, 0, 0, 0, 0, 0, 127, 224, 64, 32, 64, 32, 0
        DC8 0, 0, 0, 112, 0, 12, 0, 3, 128, 0, 64, 0, 0, 0, 0, 64, 32, 64, 32
        DC8 127, 224, 0, 0, 0, 0, 0, 0, 32, 0, 64, 0, 32, 0, 0, 0, 0, 0, 0, 16
        DC8 0, 16, 0, 16, 0, 16, 0, 16, 0, 16, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 2, 128, 5, 64, 5, 64, 3, 192, 0, 64, 32, 0, 63, 192, 4, 64
        DC8 4, 64, 3, 128, 0, 0, 0, 0, 3, 128, 4, 64, 4, 64, 6, 64, 0, 0, 0, 0
        DC8 3, 128, 4, 64, 36, 64, 63, 192, 0, 64, 0, 0, 3, 128, 5, 64, 5, 64
        DC8 3, 64, 0, 0, 0, 0, 4, 64, 31, 192, 36, 64, 36, 64, 32, 0, 0, 0, 2
        DC8 224, 5, 80, 5, 80, 6, 80, 4, 32, 32, 64, 63, 192, 4, 64, 4, 0, 3
        DC8 192, 0, 64, 0, 0, 4, 64, 39, 192, 0, 64, 0, 0, 0, 0, 0, 16, 0, 16
        DC8 4, 16, 39, 224, 0, 0, 0, 0, 32, 64, 63, 192, 1, 64, 7, 0, 4, 192, 4
        DC8 64, 32, 64, 32, 64, 63, 192, 0, 64, 0, 64, 0, 0, 7, 192, 4, 0, 7
        DC8 192, 4, 0, 3, 192, 0, 0, 4, 64, 7, 192, 4, 64, 4, 0, 3, 192, 0, 64
        DC8 0, 0, 3, 128, 4, 64, 4, 64, 3, 128, 0, 0, 4, 16, 7, 240, 4, 80, 4
        DC8 64, 3, 128, 0, 0, 0, 0, 3, 128, 4, 64, 4, 80, 7, 240, 0, 16, 4, 64
        DC8 7, 192, 2, 64, 4, 0, 4, 0, 0, 0, 0, 0, 6, 64, 5, 64, 5, 64, 4, 192
        DC8 0, 0, 0, 0, 4, 0, 31, 128, 4, 64, 0, 64, 0, 0, 4, 0, 7, 128, 0, 64
        DC8 4, 64, 7, 192, 0, 64, 4, 0, 7, 0, 4, 192, 1, 128, 6, 0, 4, 0, 6, 0
        DC8 1, 192, 7, 0, 1, 192, 6, 0, 0, 0, 4, 64, 6, 192, 1, 0, 6, 192, 4
        DC8 64, 0, 0, 4, 16, 7, 16, 4, 224, 1, 128, 6, 0, 4, 0, 0, 0, 4, 64, 5
        DC8 192, 6, 64, 4, 64, 0, 0, 0, 0, 0, 0, 4, 0, 123, 224, 64, 32, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 255, 240, 0, 0, 0, 0, 0, 0, 64, 32, 123, 224, 4
        DC8 0, 0, 0, 0, 0, 64, 0, 128, 0, 64, 0, 32, 0, 32, 0, 64, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const oled_asc2_1608[95][16]
oled_asc2_1608:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 31, 204, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 48, 0, 96, 0, 8, 0
        DC8 48, 0, 96, 0, 0, 0, 2, 32, 3, 252, 30, 32, 2, 32, 3, 252, 30, 32, 2
        DC8 32, 0, 0, 0, 0, 14, 24, 17, 4, 63, 255, 16, 132, 12, 120, 0, 0, 0
        DC8 0, 15, 0, 16, 132, 15, 56, 0, 192, 7, 120, 24, 132, 0, 120, 0, 0, 0
        DC8 120, 15, 132, 16, 196, 17, 36, 14, 152, 0, 228, 0, 132, 0, 8, 8, 0
        DC8 104, 0, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7
        DC8 224, 24, 24, 32, 4, 64, 2, 0, 0, 0, 0, 64, 2, 32, 4, 24, 24, 7, 224
        DC8 0, 0, 0, 0, 0, 0, 2, 64, 2, 64, 1, 128, 15, 240, 1, 128, 2, 64, 2
        DC8 64, 0, 0, 0, 128, 0, 128, 0, 128, 15, 248, 0, 128, 0, 128, 0, 128
        DC8 0, 0, 0, 1, 0, 13, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 128, 0, 128, 0, 128, 0, 128, 0, 128, 0, 128, 0, 128, 0, 0, 0, 12, 0
        DC8 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 24, 0, 96, 1, 128
        DC8 6, 0, 24, 0, 32, 0, 0, 0, 7, 240, 8, 8, 16, 4, 16, 4, 8, 8, 7, 240
        DC8 0, 0, 0, 0, 8, 4, 8, 4, 31, 252, 0, 4, 0, 4, 0, 0, 0, 0, 0, 0, 14
        DC8 12, 16, 20, 16, 36, 16, 68, 17, 132, 14, 12, 0, 0, 0, 0, 12, 24, 16
        DC8 4, 17, 4, 17, 4, 18, 136, 12, 112, 0, 0, 0, 0, 0, 224, 3, 32, 4, 36
        DC8 8, 36, 31, 252, 0, 36, 0, 0, 0, 0, 31, 152, 16, 132, 17, 4, 17, 4
        DC8 16, 136, 16, 112, 0, 0, 0, 0, 7, 240, 8, 136, 17, 4, 17, 4, 24, 136
        DC8 0, 112, 0, 0, 0, 0, 28, 0, 16, 0, 16, 252, 19, 0, 28, 0, 16, 0, 0
        DC8 0, 0, 0, 14, 56, 17, 68, 16, 132, 16, 132, 17, 68, 14, 56, 0, 0, 0
        DC8 0, 7, 0, 8, 140, 16, 68, 16, 68, 8, 136, 7, 240, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 3, 12, 3, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 6, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 1, 64, 2, 32, 4, 16, 8, 8, 16, 4, 0
        DC8 0, 2, 32, 2, 32, 2, 32, 2, 32, 2, 32, 2, 32, 2, 32, 0, 0, 0, 0, 16
        DC8 4, 8, 8, 4, 16, 2, 32, 1, 64, 0, 128, 0, 0, 0, 0, 14, 0, 18, 0, 16
        DC8 12, 16, 108, 16, 128, 15, 0, 0, 0, 3, 224, 12, 24, 19, 228, 20, 36
        DC8 23, 196, 8, 40, 7, 208, 0, 0, 0, 4, 0, 60, 3, 196, 28, 64, 7, 64, 0
        DC8 228, 0, 28, 0, 4, 16, 4, 31, 252, 17, 4, 17, 4, 17, 4, 14, 136, 0
        DC8 112, 0, 0, 3, 224, 12, 24, 16, 4, 16, 4, 16, 4, 16, 8, 28, 16, 0, 0
        DC8 16, 4, 31, 252, 16, 4, 16, 4, 16, 4, 8, 8, 7, 240, 0, 0, 16, 4, 31
        DC8 252, 17, 4, 17, 4, 23, 196, 16, 4, 8, 24, 0, 0, 16, 4, 31, 252, 17
        DC8 4, 17, 0, 23, 192, 16, 0, 8, 0, 0, 0, 3, 224, 12, 24, 16, 4, 16, 4
        DC8 16, 68, 28, 120, 0, 64, 0, 0, 16, 4, 31, 252, 16, 132, 0, 128, 0
        DC8 128, 16, 132, 31, 252, 16, 4, 0, 0, 16, 4, 16, 4, 31, 252, 16, 4
        DC8 16, 4, 0, 0, 0, 0, 0, 3, 0, 1, 16, 1, 16, 1, 31, 254, 16, 0, 16, 0
        DC8 0, 0, 16, 4, 31, 252, 17, 4, 3, 128, 20, 100, 24, 28, 16, 4, 0, 0
        DC8 16, 4, 31, 252, 16, 4, 0, 4, 0, 4, 0, 4, 0, 12, 0, 0, 16, 4, 31
        DC8 252, 31, 0, 0, 252, 31, 0, 31, 252, 16, 4, 0, 0, 16, 4, 31, 252, 12
        DC8 4, 3, 0, 0, 224, 16, 24, 31, 252, 16, 0, 7, 240, 8, 8, 16, 4, 16, 4
        DC8 16, 4, 8, 8, 7, 240, 0, 0, 16, 4, 31, 252, 16, 132, 16, 128, 16
        DC8 128, 16, 128, 15, 0, 0, 0, 7, 240, 8, 24, 16, 36, 16, 36, 16, 28, 8
        DC8 10, 7, 242, 0, 0, 16, 4, 31, 252, 17, 4, 17, 0, 17, 192, 17, 48, 14
        DC8 12, 0, 4, 0, 0, 14, 28, 17, 4, 16, 132, 16, 132, 16, 68, 28, 56, 0
        DC8 0, 24, 0, 16, 0, 16, 4, 31, 252, 16, 4, 16, 0, 24, 0, 0, 0, 16, 0
        DC8 31, 248, 16, 4, 0, 4, 0, 4, 16, 4, 31, 248, 16, 0, 16, 0, 30, 0, 17
        DC8 224, 0, 28, 0, 112, 19, 128, 28, 0, 16, 0, 31, 192, 16, 60, 0, 224
        DC8 31, 0, 0, 224, 16, 60, 31, 192, 0, 0, 16, 4, 24, 12, 22, 52, 1, 192
        DC8 1, 192, 22, 52, 24, 12, 16, 4, 16, 0, 28, 0, 19, 4, 0, 252, 19, 4
        DC8 28, 0, 16, 0, 0, 0, 8, 4, 16, 28, 16, 100, 16, 132, 19, 4, 28, 4
        DC8 16, 24, 0, 0, 0, 0, 0, 0, 0, 0, 127, 254, 64, 2, 64, 2, 64, 2, 0, 0
        DC8 0, 0, 48, 0, 12, 0, 3, 128, 0, 96, 0, 28, 0, 3, 0, 0, 0, 0, 64, 2
        DC8 64, 2, 64, 2, 127, 254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 64, 0
        DC8 64, 0, 64, 0, 32, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
        DC8 0, 1, 0, 0, 64, 0, 64, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 152, 1, 36, 1, 68, 1, 68, 1, 68, 0, 252, 0, 4, 16, 0, 31, 252, 0
        DC8 136, 1, 4, 1, 4, 0, 136, 0, 112, 0, 0, 0, 0, 0, 112, 0, 136, 1, 4
        DC8 1, 4, 1, 4, 0, 136, 0, 0, 0, 0, 0, 112, 0, 136, 1, 4, 1, 4, 17, 8
        DC8 31, 252, 0, 4, 0, 0, 0, 248, 1, 68, 1, 68, 1, 68, 1, 68, 0, 200, 0
        DC8 0, 0, 0, 1, 4, 1, 4, 15, 252, 17, 4, 17, 4, 17, 0, 24, 0, 0, 0, 0
        DC8 214, 1, 41, 1, 41, 1, 41, 1, 201, 1, 6, 0, 0, 16, 4, 31, 252, 0
        DC8 132, 1, 0, 1, 0, 1, 4, 0, 252, 0, 4, 0, 0, 1, 4, 25, 4, 25, 252, 0
        DC8 4, 0, 4, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1, 1, 1, 25, 1, 25, 254, 0, 0
        DC8 0, 0, 16, 4, 31, 252, 0, 36, 0, 64, 1, 180, 1, 12, 1, 4, 0, 0, 0, 0
        DC8 16, 4, 16, 4, 31, 252, 0, 4, 0, 4, 0, 0, 0, 0, 1, 4, 1, 252, 1, 4
        DC8 1, 0, 1, 252, 1, 4, 1, 0, 0, 252, 1, 4, 1, 252, 0, 132, 1, 0, 1, 0
        DC8 1, 4, 0, 252, 0, 4, 0, 0, 0, 248, 1, 4, 1, 4, 1, 4, 1, 4, 0, 248, 0
        DC8 0, 1, 1, 1, 255, 0, 133, 1, 4, 1, 4, 0, 136, 0, 112, 0, 0, 0, 0, 0
        DC8 112, 0, 136, 1, 4, 1, 4, 1, 5, 1, 255, 0, 1, 1, 4, 1, 4, 1, 252, 0
        DC8 132, 1, 4, 1, 0, 1, 128, 0, 0, 0, 0, 0, 204, 1, 36, 1, 36, 1, 36, 1
        DC8 36, 1, 152, 0, 0, 0, 0, 1, 0, 1, 0, 7, 248, 1, 4, 1, 4, 0, 0, 0, 0
        DC8 1, 0, 1, 248, 0, 4, 0, 4, 0, 4, 1, 8, 1, 252, 0, 4, 1, 0, 1, 128, 1
        DC8 112, 0, 12, 0, 16, 1, 96, 1, 128, 1, 0, 1, 240, 1, 12, 0, 48, 1
        DC8 192, 0, 48, 1, 12, 1, 240, 1, 0, 0, 0, 1, 4, 1, 140, 0, 116, 1, 112
        DC8 1, 140, 1, 4, 0, 0, 1, 1, 1, 129, 1, 113, 0, 14, 0, 24, 1, 96, 1
        DC8 128, 1, 0, 0, 0, 1, 132, 1, 12, 1, 52, 1, 68, 1, 132, 1, 12, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 62, 252, 64, 2, 64, 2, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 64, 2, 64, 2, 62, 252, 1
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 128, 0, 128, 0, 64, 0, 64, 0, 32
        DC8 0, 32, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const CHINESE[5][32]
CHINESE:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 8, 36, 16, 34, 96, 33, 128, 38, 65
        DC8 57, 50, 2, 4, 12, 24, 240, 96, 19, 128, 16, 96, 16, 24, 20, 4, 24
        DC8 2, 0, 1, 0, 0, 2, 0, 2, 2, 66, 4, 51, 248, 0, 4, 0, 2, 63, 242, 32
        DC8 34, 64, 66, 0, 2, 63, 254, 32, 66, 32, 34, 63, 194, 0, 2, 0, 0, 2
        DC8 1, 2, 1, 66, 2, 34, 4, 26, 24, 3, 224, 2, 0, 254, 0, 2, 0, 3, 252
        DC8 10, 2, 18, 2, 98, 2, 2, 2, 2, 30, 0, 0, 0, 0, 31, 248, 0, 0, 0, 0
        DC8 255, 255, 2, 0, 4, 0, 24, 254, 240, 132, 24, 132, 22, 252, 16, 132
        DC8 16, 132, 16, 254, 16, 0, 0, 0
//    8 
//    9 //OLED的显存
//   10 //存放格式如下.
//   11 //[0]0 1 2 3 ... 127	
//   12 //[1]0 1 2 3 ... 127	
//   13 //[2]0 1 2 3 ... 127	
//   14 //[3]0 1 2 3 ... 127	
//   15 //[4]0 1 2 3 ... 127	
//   16 //[5]0 1 2 3 ... 127	
//   17 //[6]0 1 2 3 ... 127	
//   18 //[7]0 1 2 3 ... 127 			   

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 unsigned char OLED_GRAM[128][8];	 
OLED_GRAM:
        DS8 1024
//   20 
//   21 //更新显存到LCD		 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 void OLED_Refresh_Gram(void)
//   23 {
OLED_Refresh_Gram:
        PUSH     {R3-R5,LR}
//   24 	unsigned char i,n;		    
//   25 	for(i=0;i<8;i++)  
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Refresh_Gram_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BCS.N    ??OLED_Refresh_Gram_1
//   26 	{  
//   27 		OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
        MOVS     R1,#+0
        SUBS     R0,R4,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_WR_Byte
//   28 		OLED_WR_Byte (0x02,OLED_CMD);      //设置显示位置—列低地址
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       OLED_WR_Byte
//   29 		OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址   
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       OLED_WR_Byte
//   30 		for(n=0;n<128;n++)OLED_WR_Byte(OLED_GRAM[n][i],OLED_DATA); 
        MOVS     R0,#+0
        MOVS     R5,R0
??OLED_Refresh_Gram_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BCS.N    ??OLED_Refresh_Gram_3
        MOVS     R1,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable6
        ADDS     R0,R0,R5, LSL #+3
        LDRB     R0,[R4, R0]
        BL       OLED_WR_Byte
        ADDS     R5,R5,#+1
        B.N      ??OLED_Refresh_Gram_2
//   31 	}   
??OLED_Refresh_Gram_3:
        ADDS     R4,R4,#+1
        B.N      ??OLED_Refresh_Gram_0
//   32 }
??OLED_Refresh_Gram_1:
        POP      {R0,R4,R5,PC}    ;; return
//   33 #if OLED_MODE==1
//   34 //向SSD1306写入一个字节。
//   35 //dat:要写入的数据/命令
//   36 //cmd:数据/命令标志 0,表示命令;1,表示数据;
//   37 void OLED_WR_Byte(unsigned char dat,unsigned char cmd)
//   38 {
//   39 	DATAOUT(dat);	    
//   40 	if(cmd)
//   41 	  OLED_RS_Set();
//   42 	else 
//   43 	  OLED_RS_Clr();		   
//   44 	OLED_CS_Clr();
//   45 	OLED_WR_Clr();	 
//   46 	OLED_WR_Set();
//   47 	OLED_CS_Set();	  
//   48 	OLED_RS_Set();	 
//   49 } 	    	    
//   50 #else
//   51 //向SSD1306写入一个字节。
//   52 //dat:要写入的数据/命令
//   53 //cmd:数据/命令标志 0,表示命令;1,表示数据;

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   54 void OLED_WR_Byte(unsigned char dat,unsigned char cmd)
//   55 {	
OLED_WR_Byte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   56 	unsigned char i;			  
//   57 	if(cmd)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??OLED_WR_Byte_0
//   58 	  OLED_RS_Set();
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable6_1
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
        B.N      ??OLED_WR_Byte_1
//   59 	else 
//   60 	  OLED_RS_Clr();		  
??OLED_WR_Byte_0:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x400
        LDR.W    R1,??DataTable6_1
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   61 	OLED_CS_Clr();
??OLED_WR_Byte_1:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.W    R1,??DataTable6_1
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   62 	
//   63         SPI_Master_WriteRead(SPI0,dat,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   64         
//   65         /*
//   66         for(i=0;i<8;i++)
//   67 	{			  
//   68 		OLED_SCLK_Clr();
//   69 		if(dat&0x80)
//   70 		   OLED_SDIN_Set();
//   71 		else 
//   72 		   OLED_SDIN_Clr();
//   73 		OLED_SCLK_Set();
//   74 		dat<<=1;   
//   75 	}	
//   76         
//   77         */
//   78         
//   79 	OLED_CS_Set();
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable6_1
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   80 	OLED_RS_Set();   	  
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable6_1
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   81 } 
        POP      {R0,R4,R5,PC}    ;; return
//   82 #endif
//   83 	  	  
//   84 //开启OLED显示    

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   85 void OLED_Display_On(void)
//   86 {
OLED_Display_On:
        PUSH     {R7,LR}
//   87 	OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
        MOVS     R1,#+0
        MOVS     R0,#+141
        BL       OLED_WR_Byte
//   88 	OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       OLED_WR_Byte
//   89 	OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
        MOVS     R1,#+0
        MOVS     R0,#+175
        BL       OLED_WR_Byte
//   90 }
        POP      {R0,PC}          ;; return
//   91 //关闭OLED显示     

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   92 void OLED_Display_Off(void)
//   93 {
OLED_Display_Off:
        PUSH     {R7,LR}
//   94 	OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
        MOVS     R1,#+0
        MOVS     R0,#+141
        BL       OLED_WR_Byte
//   95 	OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       OLED_WR_Byte
//   96 	OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
        MOVS     R1,#+0
        MOVS     R0,#+174
        BL       OLED_WR_Byte
//   97 }		   			 
        POP      {R0,PC}          ;; return
//   98 //清屏函数,清完屏,整个屏幕是黑色的!和没点亮一样!!!	  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   99 void OLED_Clear(void)  
//  100 {  
OLED_Clear:
        PUSH     {R3-R5,LR}
//  101 	unsigned char i,n;  
//  102 	for(i=0;i<8;i++)for(n=0;n<128;n++)OLED_GRAM[n][i]=0X00;  
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Clear_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BCS.N    ??OLED_Clear_1
        MOVS     R0,#+0
        MOVS     R5,R0
??OLED_Clear_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BCS.N    ??OLED_Clear_3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable6
        ADDS     R0,R0,R5, LSL #+3
        MOVS     R1,#+0
        STRB     R1,[R4, R0]
        ADDS     R5,R5,#+1
        B.N      ??OLED_Clear_2
??OLED_Clear_3:
        ADDS     R4,R4,#+1
        B.N      ??OLED_Clear_0
//  103 	OLED_Refresh_Gram();//更新显示
??OLED_Clear_1:
        BL       OLED_Refresh_Gram
//  104 }
        POP      {R0,R4,R5,PC}    ;; return
//  105 //设置坐标点

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 void LCD_Set_Pos(unsigned char x, unsigned char y) 
//  107 { 
LCD_Set_Pos:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  108 OLED_WR_Byte(0xb0+(7-y/8),OLED_CMD);
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+8
        SDIV     R0,R5,R0
        RSBS     R0,R0,#+183
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_WR_Byte
//  109 OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
        MOVS     R1,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R0,R4,#+4
        ORRS     R0,R0,#0x10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_WR_Byte
//  110 OLED_WR_Byte((x&0x0f),OLED_CMD); 
        MOVS     R1,#+0
        ANDS     R0,R4,#0xF
        BL       OLED_WR_Byte
//  111 } 
        POP      {R0,R4,R5,PC}    ;; return
//  112 //画点 
//  113 //x:0~127
//  114 //y:0~63
//  115 //t:1 填充 0,清空				   

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  116 void OLED_DrawPoint(unsigned char x,unsigned char y,unsigned char t)
//  117 {
OLED_DrawPoint:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  118 	unsigned char pos,bx,temp=0;
        MOVS     R9,#+0
//  119 	LCD_Set_Pos(x, y);  
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
//  120 	if(x>127||y>64)return;//超出范围了.
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+128
        BCS.N    ??OLED_DrawPoint_0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+65
        BCC.N    ??OLED_DrawPoint_1
??OLED_DrawPoint_0:
        B.N      ??OLED_DrawPoint_2
//  121 	pos=7-y/8;
??OLED_DrawPoint_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+8
        SDIV     R0,R5,R0
        RSBS     R0,R0,#+7
        MOVS     R7,R0
//  122 	bx=y%8;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+8
        SDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        MOV      R8,R1
//  123 	temp=1<<(7-bx);
        MOVS     R0,#+1
        RSBS     R1,R8,#+7
        LSLS     R0,R0,R1
        MOV      R9,R0
//  124 	if(t)OLED_GRAM[x][pos]|=temp;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??OLED_DrawPoint_3
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable6
        ADDS     R0,R0,R4, LSL #+3
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable6
        ADDS     R1,R1,R4, LSL #+3
        LDRB     R1,[R7, R1]
        ORRS     R1,R9,R1
        STRB     R1,[R7, R0]
        B.N      ??OLED_DrawPoint_4
//  125 	else OLED_GRAM[x][pos]&=~temp;	
??OLED_DrawPoint_3:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable6
        ADDS     R0,R0,R4, LSL #+3
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable6
        ADDS     R1,R1,R4, LSL #+3
        LDRB     R1,[R7, R1]
        BICS     R1,R1,R9
        STRB     R1,[R7, R0]
//  126 	  
//  127      //设置显示位置—列高地址   
//  128 	OLED_WR_Byte(OLED_GRAM[x][pos],OLED_DATA); 
??OLED_DrawPoint_4:
        MOVS     R1,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable6
        ADDS     R0,R0,R4, LSL #+3
        LDRB     R0,[R7, R0]
        BL       OLED_WR_Byte
//  129 
//  130 }
??OLED_DrawPoint_2:
        POP      {R0,R4-R9,PC}    ;; return
//  131 //x1,y1,x2,y2 填充区域的对角坐标
//  132 //确保x1<=x2;y1<=y2 0<=x1<=127 0<=y1<=63	 	 
//  133 //dot:0,清空;1,填充	  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  134 void OLED_Fill(unsigned char x1,unsigned char y1,unsigned char x2,unsigned char y2,unsigned char dot)  
//  135 {  
OLED_Fill:
        PUSH     {R4-R10,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
        LDR      R4,[SP, #+32]
//  136 	unsigned char x,y;  
//  137 	for(x=x1;x<=x2;x++)
        MOV      R9,R5
??OLED_Fill_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R7,R9
        BCC.N    ??OLED_Fill_1
//  138 	{
//  139 		for(y=y1;y<=y2;y++)OLED_DrawPoint(x,y,dot);
        MOV      R10,R6
??OLED_Fill_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R8,R10
        BCC.N    ??OLED_Fill_3
        MOVS     R2,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOV      R1,R10
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_DrawPoint
        ADDS     R10,R10,#+1
        B.N      ??OLED_Fill_2
//  140 	}													    
??OLED_Fill_3:
        ADDS     R9,R9,#+1
        B.N      ??OLED_Fill_0
//  141 	OLED_Refresh_Gram();//更新显示
??OLED_Fill_1:
        BL       OLED_Refresh_Gram
//  142 }
        POP      {R4-R10,PC}      ;; return
//  143 //在指定位置显示一个字符,包括部分字符
//  144 //x:0~127
//  145 //y:0~63
//  146 //mode:0,反白显示;1,正常显示				 
//  147 //size:选择字体 16/12 
//  148 
//  149 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  150 void OLED_ShowChar(unsigned char x,unsigned char y,unsigned char chr,unsigned char size,unsigned char mode)
//  151 {      			    
OLED_ShowChar:
        PUSH     {R3-R11,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
        LDR      R4,[SP, #+40]
//  152 	unsigned char temp,t,t1;
//  153 	unsigned char y0=y;
        STRB     R6,[SP, #+0]
//  154 	chr=chr-' ';//得到偏移后的值				   
        SUBS     R7,R7,#+32
//  155     for(t=0;t<size;t++)
        MOVS     R0,#+0
        MOV      R10,R0
??OLED_ShowChar_0:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R10,R8
        BCS.N    ??OLED_ShowChar_1
//  156     {   
//  157 		if(size==12)temp=oled_asc2_1206[chr][t];  //调用1206字体
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+12
        BNE.N    ??OLED_ShowChar_2
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+12
        LDR.N    R1,??DataTable6_2
        MLA      R0,R0,R7,R1
        LDRB     R0,[R10, R0]
        MOV      R9,R0
        B.N      ??OLED_ShowChar_3
//  158 		else temp=oled_asc2_1608[chr][t];		 //调用1608字体 	                          
??OLED_ShowChar_2:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR.N    R0,??DataTable6_3
        ADDS     R0,R0,R7, LSL #+4
        LDRB     R0,[R10, R0]
        MOV      R9,R0
//  159         for(t1=0;t1<8;t1++)
??OLED_ShowChar_3:
        MOVS     R0,#+0
        MOV      R11,R0
??OLED_ShowChar_4:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+8
        BCS.N    ??OLED_ShowChar_5
//  160 		{
//  161 			if(temp&0x80)OLED_DrawPoint(x,y,mode);
        LSLS     R0,R9,#+24
        BPL.N    ??OLED_ShowChar_6
        MOVS     R2,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_DrawPoint
        B.N      ??OLED_ShowChar_7
//  162 			else OLED_DrawPoint(x,y,!mode);
??OLED_ShowChar_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??OLED_ShowChar_8
        MOVS     R2,#+1
        B.N      ??OLED_ShowChar_9
??OLED_ShowChar_8:
        MOVS     R2,#+0
??OLED_ShowChar_9:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_DrawPoint
//  163 			temp<<=1;
??OLED_ShowChar_7:
        LSLS     R9,R9,#+1
//  164 			y++;
        ADDS     R6,R6,#+1
//  165 			if((y-y0)==size)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRB     R0,[SP, #+0]
        SUBS     R0,R6,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R0,R8
        BNE.N    ??OLED_ShowChar_10
//  166 			{
//  167 				y=y0;
        LDRB     R0,[SP, #+0]
        MOVS     R6,R0
//  168 				x++;
        ADDS     R5,R5,#+1
//  169 				break;
        B.N      ??OLED_ShowChar_5
//  170 			}
//  171 		}  	 
??OLED_ShowChar_10:
        ADDS     R11,R11,#+1
        B.N      ??OLED_ShowChar_4
//  172     }          
??OLED_ShowChar_5:
        ADDS     R10,R10,#+1
        B.N      ??OLED_ShowChar_0
//  173 }
??OLED_ShowChar_1:
        POP      {R0,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  174 void OLED_ShowCHinese(unsigned char x,unsigned char y,unsigned char no)//显示中文
//  175 {      			    
OLED_ShowCHinese:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  176 	unsigned char temp,t,t1;
//  177 	unsigned char y0=y;
        MOV      R10,R5
//  178 	unsigned char mode=1;
        MOVS     R11,#+1
//  179 	//chr=chr-' ';//得到偏移后的值				   
//  180     for(t=0;t<32;t++)
        MOVS     R0,#+0
        MOV      R8,R0
??OLED_ShowCHinese_0:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+32
        BCS.N    ??OLED_ShowCHinese_1
//  181     {   
//  182 	
//  183 	temp= CHINESE[no][t];		 //调用1608字体 	
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable6_4
        ADDS     R0,R0,R6, LSL #+5
        LDRB     R0,[R8, R0]
        MOVS     R7,R0
//  184         
//  185         for(t1=0;t1<8;t1++)
        MOVS     R0,#+0
        MOV      R9,R0
??OLED_ShowCHinese_2:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+8
        BCS.N    ??OLED_ShowCHinese_3
//  186 		{
//  187 			if(temp&0x80)OLED_DrawPoint(x,y,mode);
        LSLS     R0,R7,#+24
        BPL.N    ??OLED_ShowCHinese_4
        MOV      R2,R11
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_DrawPoint
        B.N      ??OLED_ShowCHinese_5
//  188 			else OLED_DrawPoint(x,y,!mode);
??OLED_ShowCHinese_4:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BNE.N    ??OLED_ShowCHinese_6
        MOVS     R2,#+1
        B.N      ??OLED_ShowCHinese_7
??OLED_ShowCHinese_6:
        MOVS     R2,#+0
??OLED_ShowCHinese_7:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_DrawPoint
//  189 			temp<<=1;
??OLED_ShowCHinese_5:
        LSLS     R7,R7,#+1
//  190 			y++;
        ADDS     R5,R5,#+1
//  191 			if((y-y0)==16)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        SUBS     R0,R5,R10
        CMP      R0,#+16
        BNE.N    ??OLED_ShowCHinese_8
//  192 			{
//  193 				y=y0;
        MOV      R5,R10
//  194 				x++;
        ADDS     R4,R4,#+1
//  195 				break;
        B.N      ??OLED_ShowCHinese_3
//  196 			}
//  197 		}  	 
??OLED_ShowCHinese_8:
        ADDS     R9,R9,#+1
        B.N      ??OLED_ShowCHinese_2
//  198       }          
??OLED_ShowCHinese_3:
        ADDS     R8,R8,#+1
        B.N      ??OLED_ShowCHinese_0
//  199 }
??OLED_ShowCHinese_1:
        POP      {R0,R4-R11,PC}   ;; return
//  200 
//  201 
//  202 //m^n函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  203 unsigned  int oled_pow(unsigned char m,unsigned char n)
//  204 {
oled_pow:
        MOVS     R2,R0
//  205 	unsigned  int result=1;	 
        MOVS     R0,#+1
//  206 	while(n--)result*=m;    
??oled_pow_0:
        MOVS     R3,R1
        SUBS     R1,R3,#+1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??oled_pow_1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MULS     R0,R2,R0
        B.N      ??oled_pow_0
//  207 	return result;
??oled_pow_1:
        BX       LR               ;; return
//  208 }				  
//  209 //显示2个数字
//  210 //x,y :起点坐标	 
//  211 //len :数字的位数
//  212 //size:字体大小
//  213 //mode:模式	0,填充模式;1,叠加模式
//  214 //num:数值(0~4294967295);	 		  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  215 void OLED_ShowNum(unsigned char x,unsigned char y,unsigned  int num,unsigned char len,unsigned char size)
//  216 {         	
OLED_ShowNum:
        PUSH     {R3-R11,LR}
        MOVS     R5,R0
        MOV      R11,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R4,[SP, #+40]
//  217 	unsigned char t,temp;
//  218 	unsigned char enshow=0;						   
        MOVS     R10,#+0
//  219 	for(t=0;t<len;t++)
        MOVS     R0,#+0
        MOV      R8,R0
??OLED_ShowNum_0:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R8,R7
        BCS.N    ??OLED_ShowNum_1
//  220 	{
//  221 		temp=(num/oled_pow(10,len-t-1))%10;
        SUBS     R0,R7,R8
        SUBS     R1,R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+10
        BL       oled_pow
        UDIV     R0,R6,R0
        MOVS     R1,#+10
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        MOV      R9,R0
//  222 		if(enshow==0&&t<(len-1))
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BNE.N    ??OLED_ShowNum_2
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        SUBS     R0,R7,#+1
        CMP      R8,R0
        BGE.N    ??OLED_ShowNum_2
//  223 		{
//  224 			if(temp==0)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.N    ??OLED_ShowNum_3
//  225 			{
//  226 				OLED_ShowChar(x+(size/2)*t,y,' ',size,1);
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,R4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,#+32
        MOV      R1,R11
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+2
        SDIV     R0,R4,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MUL      R0,R8,R0
        UXTAB    R0,R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_ShowChar
//  227 				continue;
        B.N      ??OLED_ShowNum_4
//  228 			}else enshow=1; 
??OLED_ShowNum_3:
        MOVS     R0,#+1
        MOV      R10,R0
//  229 		 	 
//  230 		}
//  231 	 	OLED_ShowChar(x+(size/2)*t,y,temp+'0',size,1); 
??OLED_ShowNum_2:
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,R4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ADDS     R2,R9,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOV      R1,R11
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+2
        SDIV     R0,R4,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MUL      R0,R8,R0
        UXTAB    R0,R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_ShowChar
//  232 	}
??OLED_ShowNum_4:
        ADDS     R8,R8,#+1
        B.N      ??OLED_ShowNum_0
//  233 } 
??OLED_ShowNum_1:
        POP      {R0,R4-R11,PC}   ;; return
//  234 //显示字符串
//  235 //x,y:起点坐标  
//  236 //*p:字符串起始地址
//  237 //用16字体

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  238 void OLED_ShowString(unsigned char x,unsigned char y,const unsigned char *p)
//  239 {
OLED_ShowString:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  240 #define MAX_CHAR_POSX 127
//  241 #define MAX_CHAR_POSY 63         
//  242     while(*p!='\0')
??OLED_ShowString_0:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+0
        BEQ.N    ??OLED_ShowString_1
//  243     {       
//  244         if(x>MAX_CHAR_POSX){x=0;y+=16;}
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+128
        BCC.N    ??OLED_ShowString_2
        MOVS     R0,#+0
        MOVS     R4,R0
        ADDS     R5,R5,#+16
//  245         if(y>MAX_CHAR_POSY){y=x=0;OLED_Clear();}
??OLED_ShowString_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+64
        BCC.N    ??OLED_ShowString_3
        MOVS     R0,#+0
        MOVS     R4,R0
        MOVS     R5,R0
        BL       OLED_Clear
//  246         OLED_ShowChar(x,y,*p,16,1);	 
??OLED_ShowString_3:
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+16
        LDRB     R2,[R6, #+0]
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       OLED_ShowChar
//  247         x+=8;
        ADDS     R4,R4,#+8
//  248         p++;
        ADDS     R6,R6,#+1
        B.N      ??OLED_ShowString_0
//  249     }  
//  250 }	
??OLED_ShowString_1:
        POP      {R0,R1,R4-R6,PC}  ;; return
//  251 
//  252 
//  253 
//  254 
//  255 //初始化SSD1306					    

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  256 void OLED_Init(void)
//  257 { 	
OLED_Init:
        PUSH     {R7,LR}
//  258  
//  259 						  
//  260 	OLED_RST_Clr();
        LDR.N    R0,??DataTable6_1
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x200
        LDR.N    R1,??DataTable6_1
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  261 	delay_ms(100);
        MOVS     R0,#+100
        BL       delay_ms
//  262 	OLED_RST_Set(); 
        LDR.N    R0,??DataTable6_1
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable6_1
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  263 					  
//  264 	OLED_WR_Byte(0xAE,OLED_CMD); //关闭显示
        MOVS     R1,#+0
        MOVS     R0,#+174
        BL       OLED_WR_Byte
//  265 	OLED_WR_Byte(0xD5,OLED_CMD); //设置时钟分频因子,震荡频率
        MOVS     R1,#+0
        MOVS     R0,#+213
        BL       OLED_WR_Byte
//  266 	OLED_WR_Byte(80,OLED_CMD);   //[3:0],分频因子;[7:4],震荡频率
        MOVS     R1,#+0
        MOVS     R0,#+80
        BL       OLED_WR_Byte
//  267 	OLED_WR_Byte(0xA8,OLED_CMD); //设置驱动路数
        MOVS     R1,#+0
        MOVS     R0,#+168
        BL       OLED_WR_Byte
//  268 	OLED_WR_Byte(0X3F,OLED_CMD); //默认0X3F(1/64) 
        MOVS     R1,#+0
        MOVS     R0,#+63
        BL       OLED_WR_Byte
//  269 	OLED_WR_Byte(0xD3,OLED_CMD); //设置显示偏移
        MOVS     R1,#+0
        MOVS     R0,#+211
        BL       OLED_WR_Byte
//  270 	OLED_WR_Byte(0X00,OLED_CMD); //默认为0
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       OLED_WR_Byte
//  271 
//  272 	OLED_WR_Byte(0x40,OLED_CMD); //设置显示开始行 [5:0],行数.
        MOVS     R1,#+0
        MOVS     R0,#+64
        BL       OLED_WR_Byte
//  273 													    
//  274 	OLED_WR_Byte(0x8D,OLED_CMD); //电荷泵设置
        MOVS     R1,#+0
        MOVS     R0,#+141
        BL       OLED_WR_Byte
//  275 	OLED_WR_Byte(0x14,OLED_CMD); //bit2，开启/关闭
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       OLED_WR_Byte
//  276 	OLED_WR_Byte(0x20,OLED_CMD); //设置内存地址模式
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       OLED_WR_Byte
//  277 	OLED_WR_Byte(0x02,OLED_CMD); //[1:0],00，列地址模式;01，行地址模式;10,页地址模式;默认10;
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       OLED_WR_Byte
//  278 	OLED_WR_Byte(0xA1,OLED_CMD); //段重定义设置,bit0:0,0->0;1,0->127;
        MOVS     R1,#+0
        MOVS     R0,#+161
        BL       OLED_WR_Byte
//  279 	OLED_WR_Byte(0xC0,OLED_CMD); //设置COM扫描方向;bit3:0,普通模式;1,重定义模式 COM[N-1]->COM0;N:驱动路数
        MOVS     R1,#+0
        MOVS     R0,#+192
        BL       OLED_WR_Byte
//  280 	OLED_WR_Byte(0xDA,OLED_CMD); //设置COM硬件引脚配置
        MOVS     R1,#+0
        MOVS     R0,#+218
        BL       OLED_WR_Byte
//  281 	OLED_WR_Byte(0x12,OLED_CMD); //[5:4]配置
        MOVS     R1,#+0
        MOVS     R0,#+18
        BL       OLED_WR_Byte
//  282 		 
//  283 	OLED_WR_Byte(0x81,OLED_CMD); //对比度设置
        MOVS     R1,#+0
        MOVS     R0,#+129
        BL       OLED_WR_Byte
//  284 	OLED_WR_Byte(0xEF,OLED_CMD); //1~255;默认0X7F (亮度设置,越大越亮)
        MOVS     R1,#+0
        MOVS     R0,#+239
        BL       OLED_WR_Byte
//  285 	OLED_WR_Byte(0xD9,OLED_CMD); //设置预充电周期
        MOVS     R1,#+0
        MOVS     R0,#+217
        BL       OLED_WR_Byte
//  286 	OLED_WR_Byte(0xf1,OLED_CMD); //[3:0],PHASE 1;[7:4],PHASE 2;
        MOVS     R1,#+0
        MOVS     R0,#+241
        BL       OLED_WR_Byte
//  287 	OLED_WR_Byte(0xDB,OLED_CMD); //设置VCOMH 电压倍率
        MOVS     R1,#+0
        MOVS     R0,#+219
        BL       OLED_WR_Byte
//  288 	OLED_WR_Byte(0x30,OLED_CMD); //[6:4] 000,0.65*vcc;001,0.77*vcc;011,0.83*vcc;
        MOVS     R1,#+0
        MOVS     R0,#+48
        BL       OLED_WR_Byte
//  289 
//  290 	OLED_WR_Byte(0xA4,OLED_CMD); //全局显示开启;bit0:1,开启;0,关闭;(白屏/黑屏)
        MOVS     R1,#+0
        MOVS     R0,#+164
        BL       OLED_WR_Byte
//  291 	OLED_WR_Byte(0xA6,OLED_CMD); //设置显示方式;bit0:1,反相显示;0,正常显示	    						   
        MOVS     R1,#+0
        MOVS     R0,#+166
        BL       OLED_WR_Byte
//  292 	OLED_WR_Byte(0xAF,OLED_CMD); //开启显示	 
        MOVS     R1,#+0
        MOVS     R0,#+175
        BL       OLED_WR_Byte
//  293 	OLED_Clear();
        BL       OLED_Clear
//  294 }  
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     OLED_GRAM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     GPIOx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     oled_asc2_1206

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     oled_asc2_1608

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     CHINESE

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  295 
//  296 
//  297 
//  298 
//  299 
//  300 
//  301 
//  302 
//  303 
//  304 
//  305 
//  306 
//  307 
//  308 
//  309 
//  310 
//  311 
//  312 
//  313 
//  314 
//  315 
//  316 
//  317 
//  318 
//  319 
//  320 
//  321 
//  322 
//  323 
// 
// 1 024 bytes in section .bss
// 2 820 bytes in section .rodata
// 1 532 bytes in section .text
// 
// 1 532 bytes of CODE  memory
// 2 820 bytes of CONST memory
// 1 024 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
