///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      07/May/2014  11:01:06 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\s /
//                    rc\drivers\OLED\Oled_Printf.c                           /
//    Command line =  C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\s /
//                    rc\drivers\OLED\Oled_Printf.c -D IAR -D TWR_K60N512     /
//                    -lCN C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_O /
//                    LED\build\iar\hello_world\RAM_128KB\List\ -lB           /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\RAM_128KB\List\ -o                 /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\RAM_128KB\Obj\ --no_cse            /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_clustering --no_scheduling --debug                 /
//                    --endian=little --cpu=Cortex-M4 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\arm\INC\c\DLib_Config_Normal.h" -I           /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\projects\hello_world\ /
//                     -I C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OL /
//                    ED\build\iar\hello_world\..\..\..\src\common\ -I        /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\cpu\ -I               /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\cpu\headers\ -I       /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\adc16\ -I     /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\enet\ -I      /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\pmc\ -I       /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\rtc\ -I       /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\lptmr\ -I     /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\uart\ -I      /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\mcg\ -I       /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\wdog\ -I      /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\platforms\ -I         /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\ftm\ -I       /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\SPI\ -I       /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\..\..\src\drivers\OLED\ -I      /
//                    C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\..\ -On --use_c++_inline           /
//    List file    =  C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\b /
//                    uild\iar\hello_world\RAM_128KB\List\Oled_Printf.s       /
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

// C:\Users\me\Desktop\OLED客户资料\KinetisK60_Demo_OLED\src\drivers\OLED\Oled_Printf.c
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
//   41 
//   42 /****************************************************************************
//   43 
//   44 
//   45 char setColumn, 选择开始的列
//   46 
//   47 char setRow,   选择开始显示的行
//   48 
//   49 char IncrementFlag  选择字符
//   50 
//   51 
//   52 
//   53 ***************************************************************************/
//   54 
//   55 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   56 void OLED_PrintfSetColumnRow(char setColumn, char setRow, char IncrementFlag)
//   57 {
//   58 	row = setRow;
OLED_PrintfSetColumnRow:
        LDR.N    R3,??DataTable3_1
        STRB     R1,[R3, #+0]
//   59 	columnIncrementFlag = (enum e_columnIncrementFlag)IncrementFlag;
        LDR.N    R3,??DataTable3
        STRB     R2,[R3, #+0]
//   60 	
//   61 	if (columnIncrementFlag == SMALL_FONT)
        LDR.N    R3,??DataTable3
        LDRB     R3,[R3, #+0]
        CMP      R3,#+1
        BNE.N    ??OLED_PrintfSetColumnRow_0
//   62 		columnIncrementSmallFont = setColumn;
        LDR.N    R3,??DataTable3_2
        STRB     R0,[R3, #+0]
//   63 	
//   64 	if (columnIncrementFlag == LARGE_FONT)
??OLED_PrintfSetColumnRow_0:
        LDR.N    R3,??DataTable3
        LDRB     R3,[R3, #+0]
        CMP      R3,#+2
        BNE.N    ??OLED_PrintfSetColumnRow_1
//   65 		columnIncrementLargeFont = setColumn;  
        LDR.N    R3,??DataTable3_3
        STRB     R0,[R3, #+0]
//   66 }
??OLED_PrintfSetColumnRow_1:
        BX       LR               ;; return
//   67 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   68 static const unsigned long dv[] = {
dv:
        DATA
        DC32 1000000000, 100000000, 10000000, 1000000, 100000, 10000, 1000, 100
        DC32 10, 1
//   69 //  4294967296      // 32 bit unsigned max
//   70     1000000000,     // +0
//   71      100000000,     // +1
//   72       10000000,     // +2
//   73        1000000,     // +3
//   74         100000,     // +4
//   75 //       65535      // 16 bit unsigned max     
//   76          10000,     // +5
//   77           1000,     // +6
//   78            100,     // +7
//   79             10,     // +8
//   80              1,     // +9
//   81 };
//   82 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   83 static void xtoa(unsigned long x, const unsigned long *dp)
//   84 {
xtoa:
        PUSH     {R3-R7,LR}
        MOVS     R7,R0
        MOVS     R5,R1
//   85     char c;
//   86     unsigned long d;
//   87     if(x) {
        CMP      R7,#+0
        BEQ.N    ??xtoa_0
//   88         while(x < *dp) ++dp;
??xtoa_1:
        LDR      R0,[R5, #+0]
        CMP      R7,R0
        BCS.N    ??xtoa_2
        ADDS     R5,R5,#+4
        B.N      ??xtoa_1
//   89         do {
//   90             d = *dp++;
??xtoa_2:
        LDR      R0,[R5, #+0]
        MOVS     R4,R0
        ADDS     R5,R5,#+4
//   91             c = '0';
        MOVS     R0,#+48
        MOVS     R6,R0
//   92             while(x >= d) ++c, x -= d;
??xtoa_3:
        CMP      R7,R4
        BCC.N    ??xtoa_4
        ADDS     R6,R6,#+1
        SUBS     R7,R7,R4
        B.N      ??xtoa_3
//   93             putc(c);
??xtoa_4:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       putc
//   94         } while(!(d & 1));
        MOVS     R0,R4
        LSLS     R0,R0,#+31
        BMI.N    ??xtoa_5
        B.N      ??xtoa_2
//   95     } else
//   96         putc('0');
??xtoa_0:
        MOVS     R0,#+48
        BL       putc
//   97 }
??xtoa_5:
        POP      {R0,R4-R7,PC}    ;; return
//   98 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   99 static void puth(unsigned n)
//  100 {
puth:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  101     static const char hex[16] = { '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
//  102     putc(hex[n & 15]);
        ANDS     R0,R4,#0xF
        LDR.N    R1,??DataTable3_4
        LDRB     R0,[R0, R1]
        BL       putc
//  103 }
        POP      {R4,PC}          ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
??hex:
        DATA
        DC8 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70
//  104 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  105 void OLED_Printf(char *format, ...)
//  106 {
OLED_Printf:
        PUSH     {R1-R3}
        PUSH     {R3-R8,LR}
        MOVS     R4,R0
//  107     char c;
//  108     int i;
//  109     long n;
//  110     
//  111     va_list a;
//  112     va_start(a, format);
        ADD      R0,SP,#+28
        MOV      R8,R0
//  113     while(c = *format++) {
??OLED_Printf_0:
        LDRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
        MOVS     R5,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??OLED_Printf_1
//  114         if(c == '%') {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??OLED_Printf_2
//  115             switch(c = *format++) {
        LDRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
        MOVS     R5,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??OLED_Printf_3
        CMP      R0,#+99
        BEQ.N    ??OLED_Printf_4
        CMP      R0,#+100
        BEQ.N    ??OLED_Printf_5
        CMP      R0,#+105
        BEQ.N    ??OLED_Printf_5
        CMP      R0,#+108
        BEQ.N    ??OLED_Printf_6
        CMP      R0,#+110
        BEQ.N    ??OLED_Printf_6
        CMP      R0,#+115
        BEQ.N    ??OLED_Printf_7
        CMP      R0,#+117
        BEQ.N    ??OLED_Printf_5
        CMP      R0,#+120
        BEQ.N    ??OLED_Printf_8
        B.N      ??OLED_Printf_9
//  116                 case 's':                       // String
//  117                     puts(va_arg(a, char*));
??OLED_Printf_7:
        MOV      R0,R8
        ADDS     R8,R0,#+4
        LDR      R0,[R0, #+0]
        BL       puts
//  118                     break;
        B.N      ??OLED_Printf_0
//  119                 case 'c':                       // Char
//  120                     putc(va_arg(a, char));
??OLED_Printf_4:
        ADDS     R8,R8,#+4
        LDRB     R0,[R8, #-4]
        BL       putc
//  121                     break;
        B.N      ??OLED_Printf_0
//  122                 case 'i':                       // 16 bit Integer
//  123                 case 'd':                       // 16 bit Integer
//  124                 case 'u':                       // 16 bit Unsigned
//  125                     i = va_arg(a, int);
??OLED_Printf_5:
        LDR      R0,[R8, #+0]
        MOVS     R6,R0
        ADDS     R8,R8,#+4
//  126                     if(c == 'i' && i < 0) i = -i, putc('-');
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+105
        BNE.N    ??OLED_Printf_10
        CMP      R6,#+0
        BPL.N    ??OLED_Printf_10
        RSBS     R6,R6,#+0
        MOVS     R0,#+45
        BL       putc
//  127                     xtoa((unsigned)i, dv + 5);
??OLED_Printf_10:
        LDR.N    R1,??DataTable3_5
        MOVS     R0,R6
        BL       xtoa
//  128                     break;
        B.N      ??OLED_Printf_0
//  129                 case 'l':                       // 32 bit Long
//  130                 case 'n':                       // 32 bit uNsigned loNg
//  131                     n = va_arg(a, long);
??OLED_Printf_6:
        LDR      R0,[R8, #+0]
        MOVS     R7,R0
        ADDS     R8,R8,#+4
//  132                     if(c == 'l' &&  n < 0) n = -n, putc('-');
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+108
        BNE.N    ??OLED_Printf_11
        CMP      R7,#+0
        BPL.N    ??OLED_Printf_11
        RSBS     R7,R7,#+0
        MOVS     R0,#+45
        BL       putc
//  133                     xtoa((unsigned long)n, dv);
??OLED_Printf_11:
        LDR.N    R1,??DataTable3_6
        MOVS     R0,R7
        BL       xtoa
//  134                     break;
        B.N      ??OLED_Printf_0
//  135                 case 'x':                       // 16 bit heXadecimal
//  136                     i = va_arg(a, int);
??OLED_Printf_8:
        LDR      R0,[R8, #+0]
        MOVS     R6,R0
        ADDS     R8,R8,#+4
//  137                     puth(i >> 12);
        ASRS     R0,R6,#+12
        BL       puth
//  138                     puth(i >> 8);
        ASRS     R0,R6,#+8
        BL       puth
//  139                     puth(i >> 4);
        ASRS     R0,R6,#+4
        BL       puth
//  140                     puth(i);
        MOVS     R0,R6
        BL       puth
//  141                     break;
        B.N      ??OLED_Printf_0
//  142                 case 0: return;
??OLED_Printf_3:
        B.N      ??OLED_Printf_12
//  143                 default: goto bad_fmt;
//  144             }
//  145         } else
//  146         {
//  147 				bad_fmt:    putc(c);
??OLED_Printf_9:
??OLED_Printf_2:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       putc
        B.N      ??OLED_Printf_0
//  148 		                
//  149         }
//  150     }
//  151     va_end(a);
//  152 }
??OLED_Printf_1:
??OLED_Printf_12:
        POP      {R0,R4-R8}
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
// 464 bytes in section .text
// 
// 464 bytes of CODE  memory
//  56 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
