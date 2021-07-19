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
//                    _Printf.c                                               /
//    Command line =  "E:\完成设计的产品\K60资料\OLED资料                     /
//                    (1)\OLED资料\KinetisK60_Demo_OLED\src\drivers\OLED\Oled /
//                    _Printf.c" -D IAR -D TWR_K60N512 -lCN                   /
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
//                    \FLASH_512KB_PFLASH\List\Oled_Printf.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Oled_Printf

        #define SHT_PROGBITS 0x1

        EXTERN Fill_RAM_FONT
        EXTERN Fill_RAM_FONT_SMALL
        EXTERN puts

        PUBLIC OLED_Printf
        PUBLIC OLED_PrintfSetColumnRow
        PUBLIC putc

// E:\完成设计的产品\K60资料\OLED资料 (1)\OLED资料\KinetisK60_Demo_OLED\src\drivers\OLED\Oled_Printf.c
//    1 /******************************************************************************
//    2  * File Name   :  oledPrint.c
//    3  * Author      :  43oh - - MSP430 News Projects and Forums.
//    4  *             :  Modified version of printf provided by:
//    5  *             :  oPossum[ http://www.43oh.com/forum/viewtopic.php?f=10&t=1732]
//    6  * Description :  printf extension for the SSD1306 OLED
//    7  * Date        :  October 21, 2011.
//    8  *****************************************************************************/
//    9 #include "stdarg.h"
//   10 #include "stdio.h"
//   11 #include "Oled_Config.h"
//   12 #include "Oled_SSD1306.h"
//   13 #include "Oled_Printf.h"
//   14 
//   15 
//   16 
//   17 
//   18 static 	char column = 0;

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   19 static 	char row = 0;
row:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   20 static	char columnIncrementSmallFont = 0;
columnIncrementSmallFont:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   21 static	char columnIncrementLargeFont = 0;
columnIncrementLargeFont:
        DS8 1
//   22 static	enum e_columnIncrementFlag 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   23 					columnIncrementFlag		 = NO_FONT;
columnIncrementFlag:
        DS8 1
//   24 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   25 void putc(unsigned char character)
//   26 {
putc:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
//   27    if (columnIncrementFlag == SMALL_FONT)
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??putc_0
//   28    {
//   29    	Fill_RAM_FONT_SMALL(character-32,columnIncrementSmallFont,row);
        LDR.N    R0,??DataTable3_1
        LDRB     R2,[R0, #+0]
        LDR.N    R0,??DataTable3_2
        LDRB     R1,[R0, #+0]
        SUBS     R0,R4,#+32
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Fill_RAM_FONT_SMALL
//   30    	columnIncrementSmallFont = columnIncrementSmallFont+SMALL_FONT_WIDTH;
        LDR.N    R0,??DataTable3_2
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+0]
//   31    }
//   32 
//   33    if (columnIncrementFlag == LARGE_FONT)
??putc_0:
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??putc_1
//   34    {
//   35    	Fill_RAM_FONT(character,columnIncrementLargeFont,row,LARGE_FONT_SPAN,LARGE_FONT_WIDTH);
        MOVS     R0,#+14
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        LDR.N    R0,??DataTable3_1
        LDRB     R2,[R0, #+0]
        LDR.N    R0,??DataTable3_3
        LDRB     R1,[R0, #+0]
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Fill_RAM_FONT
//   36    	columnIncrementLargeFont = columnIncrementLargeFont+LARGE_FONT_WIDTH;
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+14
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
//   37    }   	
//   38 }
??putc_1:
        POP      {R0,R1,R4,PC}    ;; return
//   39 
//   40 
//   41 /*
//   42 
//   43 void puts(char *s)
//   44 {
//   45   while(*s) 
//   46   {
//   47     if (columnIncrementFlag == SMALL_FONT)
//   48     {
//   49       Fill_RAM_FONT_SMALL(*s-32,columnIncrementSmallFont,row);
//   50       columnIncrementSmallFont = columnIncrementSmallFont+SMALL_FONT_WIDTH;
//   51     }
//   52 
//   53     if (columnIncrementFlag == LARGE_FONT)
//   54     {
//   55       Fill_RAM_FONT(*s,columnIncrementLargeFont,row,LARGE_FONT_SPAN,LARGE_FONT_WIDTH);
//   56       columnIncrementLargeFont = columnIncrementLargeFont+LARGE_FONT_WIDTH;
//   57     }   
//   58     *s++;
//   59   }
//   60 }
//   61 
//   62 
//   63 */
//   64 /****************************************************************************
//   65 
//   66 
//   67 char setColumn, 选择开始的列
//   68 
//   69 char setRow,   选择开始显示的行
//   70 
//   71 char IncrementFlag  选择字符
//   72 
//   73 
//   74 
//   75 ***************************************************************************/
//   76 
//   77 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   78 void OLED_PrintfSetColumnRow(char setColumn, char setRow, char IncrementFlag)
//   79 {
//   80 	row = setRow;
OLED_PrintfSetColumnRow:
        LDR.N    R3,??DataTable3_1
        STRB     R1,[R3, #+0]
//   81 	columnIncrementFlag = (enum e_columnIncrementFlag)IncrementFlag;
        LDR.N    R1,??DataTable3
        STRB     R2,[R1, #+0]
//   82 	
//   83 	if (columnIncrementFlag == SMALL_FONT)
        LDR.N    R1,??DataTable3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+1
        BNE.N    ??OLED_PrintfSetColumnRow_0
//   84 		columnIncrementSmallFont = setColumn;
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+0]
//   85 	
//   86 	if (columnIncrementFlag == LARGE_FONT)
??OLED_PrintfSetColumnRow_0:
        LDR.N    R1,??DataTable3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+2
        BNE.N    ??OLED_PrintfSetColumnRow_1
//   87 		columnIncrementLargeFont = setColumn;  
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
//   88 }
??OLED_PrintfSetColumnRow_1:
        BX       LR               ;; return
//   89 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   90 static const unsigned long dv[] = {
dv:
        DATA
        DC32 1000000000, 100000000, 10000000, 1000000, 100000, 10000, 1000, 100
        DC32 10, 1
//   91 //  4294967296      // 32 bit unsigned max
//   92     1000000000,     // +0
//   93      100000000,     // +1
//   94       10000000,     // +2
//   95        1000000,     // +3
//   96         100000,     // +4
//   97 //       65535      // 16 bit unsigned max     
//   98          10000,     // +5
//   99           1000,     // +6
//  100            100,     // +7
//  101             10,     // +8
//  102              1,     // +9
//  103 };
//  104 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  105 static void xtoa(unsigned long x, const unsigned long *dp)
//  106 {
xtoa:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  107     char c;
//  108     unsigned long d;
//  109     if(x) {
        CMP      R4,#+0
        BNE.N    ??xtoa_0
//  110         while(x < *dp) ++dp;
//  111         do {
//  112             d = *dp++;
//  113             c = '0';
//  114             while(x >= d) ++c, x -= d;
//  115             putc(c);
//  116         } while(!(d & 1));
//  117     } else
//  118         putc('0');
        MOVS     R0,#+48
        BL       putc
//  119 }
??xtoa_1:
        POP      {R4-R6,PC}       ;; return
??xtoa_2:
        ADDS     R5,R5,#+4
??xtoa_0:
        LDR      R0,[R5, #+0]
        CMP      R4,R0
        BCC.N    ??xtoa_2
??xtoa_3:
        LDR      R6,[R5, #+0]
        ADDS     R5,R5,#+4
        MOVS     R0,#+48
        B.N      ??xtoa_4
??xtoa_5:
        ADDS     R0,R0,#+1
        SUBS     R4,R4,R6
??xtoa_4:
        CMP      R4,R6
        BCS.N    ??xtoa_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       putc
        LSLS     R0,R6,#+31
        BMI.N    ??xtoa_1
        B.N      ??xtoa_3
//  120 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  121 static void puth(unsigned n)
//  122 {
puth:
        PUSH     {R7,LR}
//  123     static const char hex[16] = { '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
//  124     putc(hex[n & 15]);
        ANDS     R0,R0,#0xF
        LDR.N    R1,??DataTable3_4
        LDRB     R0,[R0, R1]
        BL       putc
//  125 }
        POP      {R0,PC}          ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
??hex:
        DATA
        DC8 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70
//  126 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  127 void OLED_Printf(char *format, ...)
//  128 {
OLED_Printf:
        PUSH     {R1-R3}
        PUSH     {R3-R6,LR}
        MOVS     R4,R0
//  129     char c;
//  130     int i;
//  131     long n;
//  132     
//  133     va_list a;
//  134     va_start(a, format);
        ADD      R6,SP,#+20
        B.N      ??OLED_Printf_0
//  135     while(c = *format++) {
//  136         if(c == '%') {
//  137             switch(c = *format++) {
//  138                 case 's':                       // String
//  139                     puts(va_arg(a, char*));
//  140                     break;
//  141                 case 'c':                       // Char
//  142                     putc(va_arg(a, char));
//  143                     break;
//  144                 case 'i':                       // 16 bit Integer
//  145                 case 'd':                       // 16 bit Integer
//  146                 case 'u':                       // 16 bit Unsigned
//  147                     i = va_arg(a, int);
//  148                     if(c == 'i' && i < 0) i = -i, putc('-');
//  149                     xtoa((unsigned)i, dv + 5);
//  150                     break;
//  151                 case 'l':                       // 32 bit Long
//  152                 case 'n':                       // 32 bit uNsigned loNg
//  153                     n = va_arg(a, long);
//  154                     if(c == 'l' &&  n < 0) n = -n, putc('-');
//  155                     xtoa((unsigned long)n, dv);
//  156                     break;
//  157                 case 'x':                       // 16 bit heXadecimal
//  158                     i = va_arg(a, int);
//  159                     puth(i >> 12);
//  160                     puth(i >> 8);
//  161                     puth(i >> 4);
//  162                     puth(i);
//  163                     break;
//  164                 case 0: return;
//  165                 default: goto bad_fmt;
//  166             }
//  167         } else
//  168         {
//  169 				bad_fmt:    putc(c);
??OLED_Printf_1:
??OLED_Printf_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       putc
//  170 		                
//  171         }
??OLED_Printf_0:
        LDRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??OLED_Printf_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+37
        BNE.N    ??OLED_Printf_2
        LDRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??OLED_Printf_4
        CMP      R1,#+99
        BEQ.N    ??OLED_Printf_5
        CMP      R1,#+100
        BEQ.N    ??OLED_Printf_6
        CMP      R1,#+105
        BEQ.N    ??OLED_Printf_6
        CMP      R1,#+108
        BEQ.N    ??OLED_Printf_7
        CMP      R1,#+110
        BEQ.N    ??OLED_Printf_7
        CMP      R1,#+115
        BEQ.N    ??OLED_Printf_8
        CMP      R1,#+117
        BEQ.N    ??OLED_Printf_6
        CMP      R1,#+120
        BEQ.N    ??OLED_Printf_9
        B.N      ??OLED_Printf_1
??OLED_Printf_8:
        MOVS     R0,R6
        ADDS     R6,R0,#+4
        LDR      R0,[R0, #+0]
        BL       puts
        B.N      ??OLED_Printf_0
??OLED_Printf_5:
        ADDS     R6,R6,#+4
        LDRB     R0,[R6, #-4]
        BL       putc
        B.N      ??OLED_Printf_0
??OLED_Printf_6:
        LDR      R5,[R6, #+0]
        ADDS     R6,R6,#+4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+105
        BNE.N    ??OLED_Printf_10
        CMP      R5,#+0
        BPL.N    ??OLED_Printf_10
        RSBS     R5,R5,#+0
        MOVS     R0,#+45
        BL       putc
??OLED_Printf_10:
        LDR.N    R1,??DataTable3_5
        MOVS     R0,R5
        BL       xtoa
        B.N      ??OLED_Printf_0
??OLED_Printf_7:
        LDR      R5,[R6, #+0]
        ADDS     R6,R6,#+4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+108
        BNE.N    ??OLED_Printf_11
        CMP      R5,#+0
        BPL.N    ??OLED_Printf_11
        RSBS     R5,R5,#+0
        MOVS     R0,#+45
        BL       putc
??OLED_Printf_11:
        LDR.N    R1,??DataTable3_6
        MOVS     R0,R5
        BL       xtoa
        B.N      ??OLED_Printf_0
??OLED_Printf_9:
        LDR      R5,[R6, #+0]
        ADDS     R6,R6,#+4
        ASRS     R0,R5,#+12
        BL       puth
        ASRS     R0,R5,#+8
        BL       puth
        ASRS     R0,R5,#+4
        BL       puth
        MOVS     R0,R5
        BL       puth
        B.N      ??OLED_Printf_0
??OLED_Printf_4:
        B.N      ??OLED_Printf_12
//  172     }
//  173     va_end(a);
//  174 }
??OLED_Printf_3:
??OLED_Printf_12:
        POP      {R0,R4-R6}
        LDR      PC,[SP], #+16    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     columnIncrementFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     row

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     columnIncrementSmallFont

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     columnIncrementLargeFont

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     ??hex

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     dv+0x14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     dv

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//   4 bytes in section .bss
//  56 bytes in section .rodata
// 422 bytes in section .text
// 
// 422 bytes of CODE  memory
//  56 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
