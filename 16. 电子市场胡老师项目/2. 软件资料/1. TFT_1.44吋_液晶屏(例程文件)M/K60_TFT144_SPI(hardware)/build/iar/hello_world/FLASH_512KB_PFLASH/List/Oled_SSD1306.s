///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      04/May/2014  15:25:59 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\完成设计的产品\K60资料\OLED资料                      /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\src\drivers\OLED\Oled /
//                    _SSD1306.c                                              /
//    Command line =  "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\src\drivers\OLED\Oled /
//                    _SSD1306.c" -D IAR -D TWR_K60N512 -lCN                  /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \FLASH_512KB_PFLASH\List\" -lB                          /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \FLASH_512KB_PFLASH\List\" -o                           /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \FLASH_512KB_PFLASH\Obj\" --no_cse --no_unroll          /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.0 Evaluation\arm\INC\c\DLib_Config_Normal.h" -I       /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\projects\hello_world\" -I                 /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\common\" -I "E:\完成设计的产品\K60资料\OL /
//                    ED资料 (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hell /
//                    o_world\..\..\..\src\cpu\" -I                           /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\cpu\headers\" -I                          /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\adc16\" -I                        /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\enet\" -I                         /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\pmc\" -I                          /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\rtc\" -I                          /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\lptmr\" -I                        /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\uart\" -I                         /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\mcg\" -I                          /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\wdog\" -I                         /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\platforms\" -I                            /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\ftm\" -I                          /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\SPI\" -I                          /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\..\..\src\drivers\OLED\" -I                         /
//                    "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \..\" -Ol --use_c++_inline                              /
//    List file    =  E:\完成设计的产品\K60资料\OLED资料                      /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\build\iar\hello_world /
//                    \FLASH_512KB_PFLASH\List\Oled_SSD1306.s                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Oled_SSD1306

        #define SHT_PROGBITS 0x1

        EXTERN GPIOx
        EXTERN SPI_Master_WriteRead

        PUBLIC Fill_RAM
        PUBLIC Fill_RAM_FONT
        PUBLIC Fill_RAM_FONT_SMALL
        PUBLIC Fill_RAM_PAGE
        PUBLIC SSD1306Init
        PUBLIC SSD1306SendCommand
        PUBLIC SSD1306SendData
        PUBLIC Set_Start_Column
        PUBLIC Set_Start_Page
        PUBLIC data_table_LARGE
        PUBLIC data_table_SMALL

// E:\完成设计的产品\K60资料\OLED资料 (1)\OLED资料\KinetisK60_Demo_OLED\src\drivers\OLED\Oled_SSD1306.c
//    1 /******************************************************************************
//    2  * File Name   :  OLED_SSD1306.c
//    3  * Author      :  
//    4                :  
//    5  * Description :  Lowlevel driver for the OLED SSD1306 
//    6  * Date        :  October 21, 2011.
//    7  *****************************************************************************/
//    8 
//    9 #include "CourierNew_14x15.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const data_table_LARGE[2548]
data_table_LARGE:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 6, 198, 6, 0, 0, 0, 0, 0, 0, 0, 0, 224, 254, 224, 0, 0
        DC8 224, 254, 224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 4, 4, 4, 63, 196, 4, 4, 63, 196, 4, 4, 0, 0, 0, 32, 32, 34, 252
        DC8 32, 32, 34, 252, 32, 32, 32, 0, 0, 0, 0, 28, 34, 66, 65, 193, 65
        DC8 97, 112, 0, 0, 0, 0, 0, 0, 56, 16, 8, 8, 14, 8, 152, 240, 0, 0, 0
        DC8 0, 0, 0, 120, 132, 133, 133, 133, 121, 2, 2, 0, 0, 0, 0, 0, 0, 128
        DC8 128, 60, 66, 66, 66, 66, 60, 0, 0, 0, 0, 0, 0, 0, 0, 31, 48, 32, 32
        DC8 48, 32, 0, 0, 0, 0, 0, 0, 120, 132, 130, 130, 98, 28, 52, 66, 2, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 224, 254, 224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 28, 96, 128, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 248, 14, 0, 0, 0, 0, 0, 0, 0, 0, 128, 96
        DC8 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 248, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 16, 16, 17, 18, 252, 18, 17, 16, 16, 0, 0, 0, 0, 0, 0
        DC8 0, 128, 0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 128, 128, 128, 128, 128, 252, 128, 128, 128, 128
        DC8 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 14, 14, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 14
        DC8 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6, 24, 96, 128, 0, 0, 0, 0
        DC8 0, 0, 6, 24, 96, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 96, 128
        DC8 128, 128, 128, 96, 31, 0, 0, 0, 0, 0, 0, 240, 12, 2, 2, 2, 2, 12
        DC8 240, 0, 0, 0, 0, 0, 0, 64, 64, 64, 128, 255, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 2, 2, 2, 2, 254, 2, 2, 2, 2, 0, 0, 0, 0, 48, 64, 128, 128, 128
        DC8 128, 129, 66, 60, 0, 0, 0, 0, 0, 6, 10, 18, 34, 66, 130, 2, 2, 6, 0
        DC8 0, 0, 0, 0, 32, 64, 192, 128, 130, 130, 130, 69, 56, 0, 0, 0, 0, 0
        DC8 8, 4, 2, 2, 2, 2, 6, 12, 248, 0, 0, 0, 0, 0, 0, 0, 3, 12, 16, 96
        DC8 128, 255, 0, 0, 0, 0, 0, 0, 0, 224, 32, 32, 34, 34, 34, 254, 34, 0
        DC8 0, 0, 0, 0, 0, 254, 130, 132, 132, 132, 132, 132, 2, 1, 0, 0, 0, 0
        DC8 8, 4, 4, 2, 2, 2, 2, 4, 12, 240, 0, 0, 0, 0, 0, 7, 24, 33, 66, 66
        DC8 130, 130, 129, 128, 0, 0, 0, 0, 0, 224, 216, 4, 2, 2, 2, 2, 4, 248
        DC8 0, 0, 0, 0, 192, 128, 128, 128, 128, 128, 131, 156, 224, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 6, 56, 192, 0, 0, 0, 0, 0, 0, 0, 0, 60, 66, 129, 129
        DC8 129, 129, 66, 60, 0, 0, 0, 0, 0, 0, 120, 132, 2, 2, 2, 2, 132, 120
        DC8 0, 0, 0, 0, 0, 0, 62, 65, 128, 128, 128, 128, 65, 50, 15, 0, 0, 0
        DC8 0, 0, 2, 2, 130, 130, 130, 132, 8, 16, 224, 0, 0, 0, 0, 0, 0, 0, 14
        DC8 14, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 14, 14, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 2
        DC8 30, 28, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 4, 4, 8, 16, 16, 32
        DC8 32, 0, 0, 128, 128, 64, 32, 32, 16, 16, 8, 4, 4, 2, 0, 0, 0, 4, 4
        DC8 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 64, 64, 64, 64, 64, 64, 64, 64
        DC8 64, 64, 64, 64, 0, 0, 0, 32, 32, 16, 16, 8, 4, 4, 2, 2, 1, 0, 0, 0
        DC8 0, 2, 2, 4, 4, 8, 16, 16, 32, 32, 64, 128, 128, 0, 0, 0, 56, 32, 64
        DC8 64, 64, 64, 33, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 230, 134, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 127, 64, 128, 3, 4, 8, 136, 127, 0, 0, 0, 0, 0, 0
        DC8 252, 2, 0, 192, 32, 32, 34, 224, 32, 0, 0, 0, 0, 64, 64, 67, 92, 96
        DC8 96, 28, 3, 0, 0, 0, 0, 2, 2, 14, 50, 194, 64, 64, 64, 64, 194, 114
        DC8 14, 2, 2, 0, 64, 64, 127, 65, 65, 65, 65, 65, 34, 28, 0, 0, 0, 0, 2
        DC8 2, 254, 2, 2, 2, 2, 2, 130, 132, 120, 0, 0, 0, 7, 24, 32, 96, 64
        DC8 64, 64, 64, 32, 32, 120, 0, 0, 0, 224, 24, 4, 4, 2, 2, 2, 2, 2, 4
        DC8 8, 0, 0, 0, 64, 64, 127, 64, 64, 64, 64, 64, 64, 32, 24, 7, 0, 0, 2
        DC8 2, 254, 2, 2, 2, 2, 2, 2, 4, 24, 224, 0, 0, 64, 64, 127, 65, 65, 65
        DC8 71, 64, 64, 64, 112, 0, 0, 0, 2, 2, 254, 2, 2, 2, 194, 2, 2, 2, 62
        DC8 0, 0, 0, 64, 64, 127, 65, 65, 65, 71, 64, 64, 64, 112, 0, 0, 0, 2
        DC8 2, 254, 2, 2, 2, 194, 0, 0, 0, 0, 0, 0, 0, 7, 24, 32, 32, 64, 64
        DC8 64, 64, 32, 32, 112, 0, 0, 0, 240, 8, 4, 2, 2, 2, 66, 66, 66, 66
        DC8 124, 64, 64, 0, 64, 64, 127, 65, 65, 1, 1, 65, 65, 127, 64, 64, 0
        DC8 0, 2, 2, 254, 2, 2, 0, 0, 2, 2, 254, 2, 2, 0, 0, 0, 64, 64, 64, 64
        DC8 127, 64, 64, 64, 64, 0, 0, 0, 0, 0, 2, 2, 2, 2, 254, 2, 2, 2, 2, 0
        DC8 0, 0, 0, 0, 0, 0, 64, 64, 64, 64, 64, 127, 64, 64, 0, 0, 0, 0, 120
        DC8 4, 2, 2, 2, 2, 4, 248, 0, 0, 0, 0, 0, 64, 64, 127, 64, 65, 2, 4, 8
        DC8 80, 96, 64, 64, 0, 0, 2, 2, 254, 130, 130, 128, 64, 96, 24, 6, 2, 2
        DC8 0, 0, 0, 0, 64, 64, 127, 64, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2
        DC8 254, 2, 2, 2, 2, 2, 2, 126, 0, 64, 64, 127, 96, 28, 3, 0, 0, 3, 28
        DC8 96, 127, 64, 64, 2, 2, 254, 2, 2, 0, 192, 96, 128, 2, 2, 254, 2, 2
        DC8 64, 64, 127, 96, 24, 4, 3, 0, 0, 64, 64, 127, 64, 64, 2, 2, 254, 2
        DC8 2, 0, 0, 192, 32, 24, 6, 254, 0, 0, 0, 7, 24, 32, 32, 64, 64, 64
        DC8 64, 32, 32, 24, 7, 0, 0, 224, 24, 4, 2, 2, 2, 2, 2, 4, 4, 24, 224
        DC8 0, 0, 0, 64, 64, 127, 64, 64, 64, 64, 64, 64, 33, 30, 0, 0, 0, 2, 2
        DC8 254, 130, 130, 130, 130, 128, 128, 0, 0, 0, 0, 7, 24, 32, 32, 64
        DC8 64, 64, 64, 32, 32, 24, 7, 0, 0, 224, 24, 4, 4, 2, 2, 2, 2, 4, 4
        DC8 24, 224, 0, 0, 64, 64, 127, 64, 64, 64, 64, 64, 33, 30, 0, 0, 0, 0
        DC8 2, 2, 254, 130, 130, 128, 128, 192, 32, 24, 6, 2, 0, 0, 0, 0, 28
        DC8 34, 65, 65, 65, 65, 65, 32, 120, 0, 0, 0, 0, 30, 4, 6, 2, 2, 2, 2
        DC8 2, 132, 120, 0, 0, 0, 124, 64, 64, 64, 64, 127, 64, 64, 64, 64, 124
        DC8 0, 0, 0, 0, 0, 0, 2, 2, 254, 2, 2, 0, 0, 0, 0, 0, 0, 64, 64, 127
        DC8 64, 64, 0, 0, 0, 64, 64, 127, 64, 64, 0, 0, 0, 248, 4, 2, 2, 2, 2
        DC8 2, 4, 248, 0, 0, 64, 64, 112, 78, 65, 0, 0, 0, 0, 64, 71, 120, 64
        DC8 64, 0, 0, 0, 0, 192, 56, 6, 2, 14, 112, 128, 0, 0, 0, 64, 124, 67
        DC8 64, 0, 3, 12, 3, 0, 64, 67, 124, 64, 64, 0, 0, 252, 2, 60, 192, 0
        DC8 192, 60, 2, 252, 0, 0, 0, 0, 64, 64, 96, 88, 4, 3, 4, 88, 96, 64
        DC8 64, 0, 0, 0, 2, 14, 18, 98, 128, 0, 128, 96, 18, 14, 2, 2, 0, 0, 0
        DC8 64, 96, 88, 68, 3, 0, 3, 68, 88, 96, 64, 0, 0, 0, 0, 0, 0, 2, 2
        DC8 254, 2, 2, 0, 0, 0, 0, 0, 0, 0, 124, 64, 64, 64, 65, 70, 72, 80, 96
        DC8 0, 0, 0, 0, 6, 10, 18, 98, 130, 2, 2, 2, 2, 62, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 255, 128, 128, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 128, 96, 24, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 192, 48, 12, 2, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 255, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 2, 12, 16, 32, 192, 32, 16, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 64, 32, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4
        DC8 8, 8, 8, 8, 4, 3, 0, 0, 0, 0, 0, 28, 34, 66, 66, 66, 66, 68, 68
        DC8 254, 2, 2, 0, 128, 128, 255, 2, 4, 8, 8, 8, 8, 4, 2, 1, 0, 0, 2, 2
        DC8 254, 8, 4, 2, 2, 2, 2, 4, 8, 240, 0, 0, 0, 0, 1, 2, 4, 8, 8, 8, 8
        DC8 8, 4, 14, 0, 0, 0, 0, 240, 8, 4, 2, 2, 2, 2, 2, 4, 4, 8, 0, 0, 1, 2
        DC8 4, 8, 8, 8, 8, 8, 132, 130, 255, 0, 0, 0, 240, 8, 4, 2, 2, 2, 2, 2
        DC8 4, 8, 254, 2, 2, 0, 0, 1, 2, 4, 8, 8, 8, 8, 4, 2, 1, 0, 0, 0, 0
        DC8 240, 72, 68, 66, 66, 66, 66, 66, 68, 200, 0, 0, 0, 0, 0, 8, 8, 8
        DC8 127, 200, 136, 136, 136, 136, 128, 0, 0, 0, 0, 2, 2, 2, 254, 2, 2
        DC8 2, 2, 2, 0, 0, 0, 62, 65, 128, 128, 128, 128, 128, 128, 65, 255, 0
        DC8 0, 0, 0, 0, 0, 128, 130, 130, 130, 130, 130, 4, 248, 0, 0, 0, 0
        DC8 128, 128, 255, 4, 4, 8, 8, 8, 4, 3, 0, 0, 0, 0, 2, 2, 254, 2, 2, 0
        DC8 0, 2, 2, 254, 2, 2, 0, 0, 0, 8, 8, 8, 8, 143, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 2, 2, 2, 2, 2, 254, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 223, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 4, 248, 0, 0, 0, 0, 0, 0
        DC8 0, 128, 128, 255, 0, 0, 1, 10, 12, 8, 8, 0, 0, 0, 0, 2, 2, 254, 64
        DC8 192, 32, 18, 10, 6, 2, 2, 0, 0, 0, 128, 128, 128, 128, 255, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 254, 2, 2, 2, 2, 2, 0, 0, 8, 8, 15, 4
        DC8 8, 8, 8, 7, 4, 8, 8, 8, 7, 0, 2, 2, 254, 2, 2, 0, 0, 254, 2, 2, 0
        DC8 0, 254, 2, 0, 8, 8, 15, 4, 4, 8, 8, 8, 4, 3, 0, 0, 0, 0, 2, 2, 254
        DC8 2, 2, 0, 0, 2, 2, 254, 2, 2, 0, 0, 1, 2, 4, 8, 8, 8, 8, 8, 4, 2, 1
        DC8 0, 0, 0, 240, 8, 4, 2, 2, 2, 2, 2, 4, 8, 240, 0, 0, 0, 0, 255, 65
        DC8 128, 128, 128, 128, 128, 128, 193, 62, 0, 0, 2, 2, 254, 2, 130, 130
        DC8 128, 128, 128, 128, 0, 0, 0, 0, 0, 62, 65, 128, 128, 128, 128, 128
        DC8 128, 65, 255, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 130, 130, 2
        DC8 254, 2, 2, 0, 0, 0, 8, 8, 15, 2, 4, 4, 8, 8, 8, 6, 0, 0, 0, 2, 2, 2
        DC8 254, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 7, 8, 8, 8, 8, 8, 4, 14, 0
        DC8 0, 0, 0, 0, 14, 4, 130, 130, 130, 130, 130, 68, 56, 0, 0, 0, 0, 8
        DC8 8, 8, 255, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 248, 4, 2, 2, 2
        DC8 2, 2, 4, 4, 0, 0, 8, 8, 15, 0, 0, 0, 0, 8, 8, 15, 0, 0, 0, 0, 0, 0
        DC8 252, 2, 2, 2, 2, 4, 4, 254, 2, 2, 0, 0, 8, 8, 14, 9, 0, 0, 0, 0, 9
        DC8 14, 8, 8, 0, 0, 0, 0, 0, 192, 56, 6, 6, 56, 192, 0, 0, 0, 0, 8, 8
        DC8 15, 8, 8, 0, 0, 1, 0, 0, 8, 8, 15, 8, 0, 0, 128, 124, 2, 28, 96
        DC8 128, 96, 28, 2, 124, 128, 0, 0, 0, 8, 12, 10, 9, 0, 0, 9, 10, 12, 8
        DC8 0, 0, 0, 2, 6, 10, 18, 32, 192, 192, 32, 18, 10, 6, 2, 0, 0, 0, 192
        DC8 48, 14, 1, 0, 1, 14, 48, 192, 0, 0, 0, 0, 2, 2, 2, 6, 154, 98, 128
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 8, 8, 8, 8, 8, 9, 10, 12, 0, 0, 0, 0
        DC8 0, 6, 10, 18, 34, 66, 130, 2, 2, 14, 0, 0
//   10 #include "CourierNew_5x7.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const data_table_SMALL[455]
data_table_SMALL:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 250, 0, 0, 128, 0, 128, 0, 72, 254, 72, 254
        DC8 72, 0, 96, 84, 254, 92, 194, 204, 254, 202, 142, 0, 30, 226, 186
        DC8 198, 0, 0, 128, 0, 0, 0, 0, 252, 2, 0, 0, 0, 2, 252, 0, 0, 40, 112
        DC8 120, 48, 0, 16, 16, 120, 16, 0, 0, 0, 6, 0, 0, 16, 16, 16, 16, 0, 0
        DC8 2, 0, 0, 0, 6, 24, 96, 128, 0, 124, 142, 242, 124, 0, 0, 128, 254
        DC8 0, 0, 134, 142, 146, 226, 0, 2, 162, 210, 156, 0, 8, 56, 104, 254
        DC8 0, 226, 162, 162, 156, 0, 124, 162, 162, 156, 0, 0, 134, 248, 192
        DC8 0, 108, 146, 146, 108, 0, 242, 146, 146, 124, 0, 0, 72, 0, 0, 0, 0
        DC8 0, 22, 0, 0, 16, 40, 68, 130, 0, 40, 40, 40, 40, 0, 130, 68, 56, 16
        DC8 0, 64, 128, 154, 224, 120, 252, 236, 156, 112, 2, 60, 200, 120, 14
        DC8 0, 254, 162, 178, 110, 0, 124, 130, 130, 130, 0, 254, 130, 130, 124
        DC8 0, 254, 146, 146, 130, 0, 254, 144, 144, 128, 0, 124, 130, 130, 156
        DC8 0, 254, 16, 16, 254, 0, 130, 254, 130, 0, 0, 12, 2, 2, 252, 0, 254
        DC8 48, 120, 132, 0, 254, 2, 2, 2, 254, 224, 48, 192, 254, 0, 254, 224
        DC8 28, 254, 0, 124, 130, 130, 124, 0, 254, 144, 144, 96, 0, 124, 130
        DC8 134, 126, 0, 254, 144, 152, 100, 0, 226, 146, 138, 142, 0, 128, 128
        DC8 254, 128, 0, 252, 2, 2, 252, 128, 112, 14, 28, 224, 240, 14, 252
        DC8 62, 254, 130, 124, 56, 198, 0, 0, 128, 96, 62, 192, 0, 134, 154
        DC8 226, 130, 0, 0, 254, 0, 0, 0, 192, 48, 12, 2, 0, 0, 0, 254, 0, 128
        DC8 128, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 44, 82, 82, 62, 0
        DC8 254, 66, 66, 60, 0, 60, 66, 66, 66, 0, 60, 66, 66, 254, 0, 60, 74
        DC8 74, 58, 16, 16, 126, 144, 128, 0, 60, 66, 66, 126, 0, 254, 64, 64
        DC8 62, 0, 0, 126, 0, 0, 0, 0, 0, 126, 0, 0, 254, 16, 108, 66, 0, 0
        DC8 254, 2, 0, 126, 64, 62, 64, 126, 0, 126, 64, 64, 62, 0, 60, 66, 66
        DC8 60, 0, 126, 66, 66, 60, 0, 60, 66, 66, 126, 0, 126, 64, 64, 64, 0
        DC8 52, 82, 74, 44, 0, 64, 254, 66, 66, 0, 124, 2, 2, 124, 96, 28, 14
        DC8 112, 0, 120, 6, 56, 14, 126, 66, 60, 28, 102, 0, 0, 96, 28, 30, 96
        DC8 0, 66, 78, 114, 66, 0
//   11 #include "Oled_Config.h"
//   12 #include "OLED_SSD1306.h"
//   13 
//   14 
//   15 /* Function    : SSD1306Init()
//   16  * Description : Initializes the OLED display
//   17  * Input       : None
//   18  * Output      : None
//   19  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   20 void SSD1306Init( void )
//   21 {
SSD1306Init:
        PUSH     {R7,LR}
//   22   unsigned int i;
//   23     
//   24     SPI_OLED_RST_LOW();
        LDR.N    R0,??DataTable4
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x200
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   25     
//   26     for(i=0;i<0xffff;i++);
        MOVS     R0,#+0
        B.N      ??SSD1306Init_0
??SSD1306Init_1:
        ADDS     R0,R0,#+1
??SSD1306Init_0:
        MOVW     R1,#+65535
        CMP      R0,R1
        BCC.N    ??SSD1306Init_1
//   27     
//   28     SPI_OLED_RST_HIGH();
        LDR.N    R0,??DataTable4
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   29 
//   30    SSD1306SendCommand(0xae);//--turn off oled panel 
        MOVS     R0,#+174
        BL       SSD1306SendCommand
//   31    SSD1306SendCommand(0x00);//---set low column address 
        MOVS     R0,#+0
        BL       SSD1306SendCommand
//   32    SSD1306SendCommand(0x10);//---set high column address 
        MOVS     R0,#+16
        BL       SSD1306SendCommand
//   33    SSD1306SendCommand(0x40);//--set start line address 
        MOVS     R0,#+64
        BL       SSD1306SendCommand
//   34    SSD1306SendCommand(0x81);//--set contrast control register 
        MOVS     R0,#+129
        BL       SSD1306SendCommand
//   35    SSD1306SendCommand(0xcf); 
        MOVS     R0,#+207
        BL       SSD1306SendCommand
//   36    SSD1306SendCommand(0xa1);//--set segment re-map 95 to 0 
        MOVS     R0,#+161
        BL       SSD1306SendCommand
//   37    SSD1306SendCommand(0xa6);//--set normal display 
        MOVS     R0,#+166
        BL       SSD1306SendCommand
//   38    SSD1306SendCommand(0xa8);//--set multiplex ratio(1 to 64) 
        MOVS     R0,#+168
        BL       SSD1306SendCommand
//   39    SSD1306SendCommand(0x3f);//--1/64 duty 
        MOVS     R0,#+63
        BL       SSD1306SendCommand
//   40    SSD1306SendCommand(0xd3);//-set display offset 
        MOVS     R0,#+211
        BL       SSD1306SendCommand
//   41    SSD1306SendCommand(0x00);//-not offset 
        MOVS     R0,#+0
        BL       SSD1306SendCommand
//   42    SSD1306SendCommand(0xd5);//--set display clock divide ratio/oscillator frequency 
        MOVS     R0,#+213
        BL       SSD1306SendCommand
//   43    SSD1306SendCommand(0x80);//--set divide ratio 
        MOVS     R0,#+128
        BL       SSD1306SendCommand
//   44    SSD1306SendCommand(0xd9);//--set pre-charge period 
        MOVS     R0,#+217
        BL       SSD1306SendCommand
//   45    SSD1306SendCommand(0xf1); 
        MOVS     R0,#+241
        BL       SSD1306SendCommand
//   46    SSD1306SendCommand(0xda);//--set com pins hardware configuration 
        MOVS     R0,#+218
        BL       SSD1306SendCommand
//   47    SSD1306SendCommand(0x12); 
        MOVS     R0,#+18
        BL       SSD1306SendCommand
//   48    SSD1306SendCommand(0xdb);//--set vcomh 
        MOVS     R0,#+219
        BL       SSD1306SendCommand
//   49    SSD1306SendCommand(0x40); 
        MOVS     R0,#+64
        BL       SSD1306SendCommand
//   50    SSD1306SendCommand(0x8d);//--set Charge Pump enable/disable 
        MOVS     R0,#+141
        BL       SSD1306SendCommand
//   51    SSD1306SendCommand(0x14);//--set(0x10) disable 
        MOVS     R0,#+20
        BL       SSD1306SendCommand
//   52    SSD1306SendCommand(0xaf);//--turn on oled panel
        MOVS     R0,#+175
        BL       SSD1306SendCommand
//   53    Fill_RAM(0x00);				// Clear Screen
        MOVS     R0,#+0
        BL       Fill_RAM
//   54 }
        POP      {R0,PC}          ;; return
//   55 
//   56 /* Function    : SSD1306SendCommand( char c )
//   57  * Description : Sends a command to the OLED display
//   58  * Input       : Command
//   59  * Output      : None
//   60  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   61 void SSD1306SendCommand( char c )
//   62 { 
SSD1306SendCommand:
        PUSH     {R7,LR}
//   63  
//   64   
//   65    
//   66    SPI_OLED_CD_LOW();//设置为命令模式：D/C引脚为低的时候，是输入命令状态
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+8]
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x400
        LDR.N    R2,??DataTable4
        LDR      R2,[R2, #+8]
        STR      R1,[R2, #+0]
//   67    
//   68    SPI_OLED_CS_LOW();
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+8]
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x100
        LDR.N    R2,??DataTable4
        LDR      R2,[R2, #+8]
        STR      R1,[R2, #+0]
//   69    
//   70    
//   71    
//   72    SPI_Master_WriteRead(SPI0,c,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   73    
//   74    SPI_OLED_CS_HIGH();
        LDR.N    R0,??DataTable4
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   75    
//   76    SPI_OLED_CD_HIGH();//设置为命令模式：D/C引脚为低的时候，是输入命令状态，为高的时候，为输入数据状态
        LDR.N    R0,??DataTable4
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   77      
//   78      
//   79    //USICNT |= 9;                              
//   80    //while (!(USIIFG & USICTL1));            
//   81    //P2OUT |= OLED_CS;  
//   82 }
        POP      {R0,PC}          ;; return
//   83 
//   84 /* Function    : SSD1306SendData( char c )
//   85  * Description : Sends data to the OLED display
//   86  * Input       : Data
//   87  * Output      : None
//   88  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   89 void SSD1306SendData( char c )
//   90 {
SSD1306SendData:
        PUSH     {R7,LR}
//   91    
//   92    
//   93   //P2OUT &= ~OLED_CS; 
//   94   // USICNT |= 9;           
//   95   // while (!(USIIFG & USICTL1));          
//   96   // P2OUT |= OLED_CS;  
//   97   
//   98    SPI_OLED_CD_HIGH();//设置为命令模式：D/C引脚为低的时候，是输入命令状态，为高的时候，为输入数据状态
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+8]
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x400
        LDR.N    R2,??DataTable4
        LDR      R2,[R2, #+8]
        STR      R1,[R2, #+0]
//   99    
//  100    SPI_OLED_CS_LOW();
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+8]
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x100
        LDR.N    R2,??DataTable4
        LDR      R2,[R2, #+8]
        STR      R1,[R2, #+0]
//  101    
//  102      
//  103    SPI_Master_WriteRead(SPI0,c,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//  104    
//  105    
//  106     SPI_OLED_CS_HIGH();
        LDR.N    R0,??DataTable4
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  107    
//  108 }
        POP      {R0,PC}          ;; return
//  109 
//  110 /* Function    : Fill_RAM( unsigned char c )
//  111  * Description : Fills the OLED with one particular data
//  112  * Input       : Data
//  113  * Output      : None
//  114  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  115 void Fill_RAM(unsigned char Data)
//  116 {
Fill_RAM:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//  117    unsigned char i,j;
//  118 
//  119    for(i=0;i<8;i++)
        MOVS     R5,#+0
        B.N      ??Fill_RAM_0
//  120    {
//  121       Set_Start_Page(i);
//  122       Set_Start_Column(0x00);
//  123 
//  124       for(j=0;j<128;j++)
//  125       {
//  126          SSD1306SendData(Data);
??Fill_RAM_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SSD1306SendData
//  127       }
        ADDS     R6,R6,#+1
??Fill_RAM_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+128
        BCC.N    ??Fill_RAM_1
        ADDS     R5,R5,#+1
??Fill_RAM_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BCS.N    ??Fill_RAM_3
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Set_Start_Page
        MOVS     R0,#+0
        BL       Set_Start_Column
        MOVS     R6,#+0
        B.N      ??Fill_RAM_2
//  128    }
//  129 }
??Fill_RAM_3:
        POP      {R4-R6,PC}       ;; return
//  130 
//  131 /* Function    : Fill_RAM_PAGE
//  132  * Description : Fills an OLED page with a particular data
//  133  * Input       : page no.[0-7], Data
//  134  * Output      : None
//  135  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  136 void Fill_RAM_PAGE(unsigned char page, unsigned char Data)
//  137 {
Fill_RAM_PAGE:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
//  138    unsigned char j;
//  139 
//  140    Set_Start_Page(page);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Set_Start_Page
//  141    Set_Start_Column(0x00);
        MOVS     R0,#+0
        BL       Set_Start_Column
//  142 
//  143    for(j=0;j<128;j++)
        MOVS     R5,#+0
        B.N      ??Fill_RAM_PAGE_0
//  144    {
//  145       SSD1306SendData(Data);
??Fill_RAM_PAGE_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SSD1306SendData
//  146    }
        ADDS     R5,R5,#+1
??Fill_RAM_PAGE_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BCC.N    ??Fill_RAM_PAGE_1
//  147 }
        POP      {R0,R4,R5,PC}    ;; return
//  148 
//  149 /* Function    : Fill_RAM_FONT_SMALL
//  150  * Description : Writes a charcter on the OLED display at a column, row.
//  151  *               with a small font.
//  152  * Input       : character, column, row
//  153  * Output      : None
//  154  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  155 void Fill_RAM_FONT_SMALL(  unsigned char number, 
//  156                            unsigned char column,
//  157                            unsigned char row )
//  158 {
Fill_RAM_FONT_SMALL:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R2
//  159 	int j=0;
        MOVS     R6,#+0
//  160 	Set_Start_Page(row);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Set_Start_Page
//  161 	Set_Start_Column(column);	
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Set_Start_Column
//  162 	
//  163 	for(j=0;j<SMALL_FONT_WIDTH;j++)
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??Fill_RAM_FONT_SMALL_0
//  164 	{
//  165 		SSD1306SendData(data_table_SMALL[j+(number*SMALL_FONT_WIDTH)]);
??Fill_RAM_FONT_SMALL_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+5
        MLA      R0,R0,R4,R6
        LDR.N    R1,??DataTable4_1
        LDRB     R0,[R0, R1]
        BL       SSD1306SendData
//  166 	}
        ADDS     R6,R6,#+1
??Fill_RAM_FONT_SMALL_0:
        CMP      R6,#+5
        BLT.N    ??Fill_RAM_FONT_SMALL_1
//  167 }
        POP      {R4-R6,PC}       ;; return
//  168 
//  169 /* Function    : Fill_RAM_FONT
//  170  * Description : Writes a charcter on the OLED display at a column, row.
//  171  *               with a large font.
//  172  * Input       : character, column, row, span and width
//  173  * Output      : None
//  174  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  175 void Fill_RAM_FONT(  unsigned char number, 
//  176                      unsigned char column,
//  177                      unsigned char row,
//  178                      unsigned char span, 
//  179                      unsigned char width )
//  180 {
Fill_RAM_FONT:
        PUSH     {R3-R11,LR}
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R4,[SP, #+40]
//  181 int i,j,test; 
//  182 int adder=0;
        MOVS     R8,#+0
//  183 int jump = 0;
        MOVS     R9,#+0
//  184 
//  185    jump = (number - 32);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R0,R0,#+32
        MOV      R9,R0
//  186 	for(i=row;i>=row-span+1;i--)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOV      R10,R6
        B.N      ??Fill_RAM_FONT_0
//  187 	{
//  188 		Set_Start_Page(i);
//  189 		Set_Start_Column(column);
//  190 	
//  191 		for(j=0;j<width;j++)
//  192 		{
//  193 			test = 	j+(adder*width)+(jump*28);
??Fill_RAM_FONT_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MLA      R0,R4,R8,R11
        MOVS     R1,#+28
        MLA      R0,R1,R9,R0
//  194 			SSD1306SendData(data_table_LARGE[test]);
        LDR.N    R1,??DataTable4_2
        LDRB     R0,[R0, R1]
        BL       SSD1306SendData
//  195 		}
        ADDS     R11,R11,#+1
??Fill_RAM_FONT_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R11,R4
        BLT.N    ??Fill_RAM_FONT_1
//  196 		adder++;
        ADDS     R8,R8,#+1
        SUBS     R10,R10,#+1
??Fill_RAM_FONT_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        SUBS     R0,R6,R7
        ADDS     R0,R0,#+1
        CMP      R10,R0
        BLT.N    ??Fill_RAM_FONT_3
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Set_Start_Page
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Set_Start_Column
        MOVS     R11,#+0
        B.N      ??Fill_RAM_FONT_2
//  197 	}
//  198 
//  199 }
??Fill_RAM_FONT_3:
        POP      {R0,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     GPIOx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     data_table_SMALL

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     data_table_LARGE
//  200 
//  201 /* Function    : Set_Start_Column
//  202  * Description : Sets a start column to start writing at.
//  203  * Input       : column[0-127]
//  204  * Output      : None
//  205  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  206 void Set_Start_Column(unsigned char d)
//  207 {
Set_Start_Column:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  208 	// Set Lower Column Start Address for Page Addressing Mode. Default => 0x00
//  209    SSD1306SendCommand(0x00+d%16);		
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+16
        SDIV     R0,R4,R1
        MLS      R0,R0,R1,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SSD1306SendCommand
//  210 	
//  211 	// Set Higher Column Start Address for Page Addressing Mode. Default => 0x10
//  212    SSD1306SendCommand(0x10+d/16);		
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+16
        SDIV     R0,R4,R0
        ADDS     R0,R0,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SSD1306SendCommand
//  213 						
//  214 }
        POP      {R4,PC}          ;; return
//  215 
//  216 /* Function    : Set_Start_Page
//  217  * Description : Sets a start page to start writing at.
//  218  * Input       : column[0-7]
//  219  * Output      : None
//  220  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  221 void Set_Start_Page(unsigned char d)
//  222 {
Set_Start_Page:
        PUSH     {R7,LR}
//  223 	// Set Page Start Address for Page Addressing Mode. Default => 0xB0 (0x00)
//  224    SSD1306SendCommand(0xB0|d);			
        ORRS     R0,R0,#0xB0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SSD1306SendCommand
//  225 						
//  226 }
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  227 
//  228 
//  229 #if 0
//  230 void Set_Addressing_Mode(unsigned char d)
//  231 {
//  232 	// Set Memory Addressing Mode
//  233    SSD1306SendCommand(0x20);		
//  234 	//   Default => 0x02
//  235    SSD1306SendCommand(d);			
//  236    //     0x00 => Horizontal Addressing Mode
//  237    //     0x01 => Vertical Addressing Mode
//  238    //     0x02 => Page Addressing Mode
//  239 }
//  240 
//  241 
//  242 void Set_Column_Address(unsigned char a, unsigned char b)
//  243 {
//  244 	// Set Column Address
//  245    SSD1306SendCommand(0x21);		
//  246 	//   Default => 0x00 (Column Start Address)
//  247    SSD1306SendCommand(a);			
//  248 	//   Default => 0x7F (Column End Address)
//  249    SD1306SendCommand(b);			
//  250 }
//  251 
//  252 
//  253 void Set_Page_Address(unsigned char a, unsigned char b)
//  254 {
//  255 	// Set Page Address
//  256    SSD1306SendCommand(0x22);		
//  257 	//   Default => 0x00 (Page Start Address)
//  258    SSD1306SendCommand(a);			
//  259 	//   Default => 0x07 (Page End Address)
//  260    SSD1306SendCommand(b);			
//  261 }
//  262 
//  263 
//  264 void Set_Start_Line(unsigned char d)
//  265 {
//  266 	// Set Display Start Line
//  267    SSD1306SendCommand(0x40|d);			
//  268 	//   Default => 0x40 (0x00)					
//  269 }
//  270 
//  271 
//  272 void Set_Contrast_Control(unsigned char d)
//  273 {
//  274 	// Set Contrast Control
//  275    SSD1306SendCommand(0x81);			
//  276 	//   Default => 0x7F
//  277    SSD1306SendCommand(d);			
//  278 }
//  279 
//  280 
//  281 void Set_Charge_Pump(unsigned char d)
//  282 {
//  283 	// Set Charge Pump
//  284    SSD1306SendCommand(0x8D);			
//  285 	//   Default => 0x10.
//  286    SSD1306SendCommand(0x10|d);			
//  287 	//     0x10 (0x00) => Disable Charge Pump
//  288 	//     0x14 (0x04) => Enable Charge Pump
//  289 }
//  290 
//  291 
//  292 void Set_Segment_Remap(unsigned char d)
//  293 {
//  294 	// Set Segment Re-Map
//  295    SSD1306SendCommand(0xA0|d);			
//  296    //   Default => 0xA0
//  297    //     0xA0 (0x00) => Column Address 0 Mapped to SEG0
//  298    //     0xA1 (0x01) => Column Address 0 Mapped to SEG127
//  299 }
//  300 
//  301 
//  302 void Set_Entire_Display(unsigned char d)
//  303 {
//  304 	// Set Entire Display On / Off
//  305    SSD1306SendCommand(0xA4|d);			
//  306    //   Default => 0xA4
//  307    //     0xA4 (0x00) => Normal Display
//  308    //     0xA5 (0x01) => Entire Display On
//  309 }
//  310 
//  311 
//  312 void Set_Inverse_Display(unsigned char d)
//  313 {
//  314 	// Set Inverse Display On/Off
//  315    SSD1306SendCommand(0xA6|d);			
//  316 	//   Default => 0xA6
//  317 	//     0xA6 (0x00) => Normal Display
//  318 	//     0xA7 (0x01) => Inverse Display On
//  319 }
//  320 
//  321 
//  322 void Set_Multiplex_Ratio(unsigned char d)
//  323 {
//  324 	// Set Multiplex Ratio
//  325    SSD1306SendCommand(0xA8);			
//  326 	SSD1306SendCommand(d);			
//  327    //   Default => 0x3F (1/64 Duty)
//  328 }
//  329 
//  330 
//  331 void Set_Display_On_Off(unsigned char d)	
//  332 {
//  333 	// Set Display On/OffSSD1306
//  334    SendCommand(0xAE|d);			
//  335 	//   Default => 0xAE
//  336 	//     0xAE (0x00) => Display Off
//  337 	//     0xAF (0x01) => Display On
//  338 }
//  339 
//  340 
//  341 void Set_Common_Remap(unsigned char d)
//  342 {
//  343 	// Set COM Output Scan Direction
//  344    SSD1306SendCommand(0xC0|d);			
//  345    //   Default => 0xC0
//  346    //     0xC0 (0x00) => Scan from COM0 to 63
//  347    //     0xC8 (0x08) => Scan from COM63 to 0
//  348 }
//  349 
//  350 
//  351 void Set_Display_Offset(unsigned char d)
//  352 {
//  353 	// Set Display Offset
//  354    SSD1306SendCommand(0xD3);			
//  355 	//   Default => 0x00
//  356    SSD1306SendCommand(d);			
//  357 }
//  358 
//  359 
//  360 void Set_Display_Clock(unsigned char d)
//  361 {
//  362 	// Set Display Clock Divide Ratio / Oscillator Frequency
//  363    SSD1306SendCommand(0xD5);			
//  364 	SSD1306SendCommand(d);		
//  365    //   Default => 0x80
//  366 	//     D[3:0] => Display Clock Divider
//  367 	//     D[7:4] => Oscillator Frequency
//  368 }
//  369 
//  370 
//  371 void Set_Precharge_Period(unsigned char d)
//  372 {
//  373 	// Set Pre-Charge Period
//  374    SSD1306SendCommand(0xD9);			
//  375 	SSD1306SendCommand(d);			
//  376    //   Default => 0x22 (2 Display Clocks [Phase 2] / 2 Display Clocks [Phase 1])
//  377 	//     D[3:0] => Phase 1 Period in 1~15 Display Clocks
//  378 	//     D[7:4] => Phase 2 Period in 1~15 Display Clocks
//  379 }
//  380 
//  381 
//  382 void Set_Common_Config(unsigned char d)
//  383 {
//  384 	// Set COM Pins Hardware Configuration
//  385    SSD1306SendCommand(0xDA);			
//  386 	SSD1306SendCommand(0x02|d);			
//  387    //   Default => 0x12 (0x10)
//  388 	//     Alternative COM Pin Configuration
//  389 	//     Disable COM Left/Right Re-Map
//  390 }
//  391 
//  392 
//  393 void Set_VCOMH(unsigned char d)
//  394 {
//  395 	// Set VCOMH Deselect Level
//  396    SSD1306SendCommand(0xDB);			
//  397 	SSD1306SendCommand(d);			
//  398    //   Default => 0x20 (0.77*VCC)
//  399 }
//  400 #endif
// 
// 3 004 bytes in section .rodata
//   666 bytes in section .text
// 
//   666 bytes of CODE  memory
// 3 004 bytes of CONST memory
//
//Errors: none
//Warnings: none
