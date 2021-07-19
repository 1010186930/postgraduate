///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\common\printf. /
//                    c                                                       /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\common\printf. /
//                    c -D IAR -D TWR_K60N512 -lCN                            /
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
//                    rld\RAM_128KB\List\printf.s                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME printf

        #define SHT_PROGBITS 0x1

        EXTERN out_char
        EXTERN strlen

        PUBLIC `__iar_default_requirements$$_Printf<unknown>printf`
`__iar_default_requirements$$_Printf<unknown>printf` EQU 0
        PUBLIC `__iar_default_requirements$$_Printf<unknown>sprintf`
`__iar_default_requirements$$_Printf<unknown>sprintf` EQU 0
        PUBLIC printf
        PUBLIC printk
        PUBLIC sprintf

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\common\printf.c
//    1 /*
//    2  * File:        printk.c
//    3  * Purpose:     The standard C library routine printf(), but without
//    4  *              all the baggage.
//    5  */
//    6 
//    7 #include "common.h"
//    8 #include <stdarg.h>
//    9 
//   10 /********************************************************************/
//   11 
//   12 typedef struct
//   13 {
//   14     int dest;
//   15     void (*func)(char);
//   16     char *loc;
//   17 } PRINTK_INFO;
//   18 
//   19 int 
//   20 printk (PRINTK_INFO *, const char *, va_list);
//   21 
//   22 /********************************************************************/
//   23 
//   24 #define DEST_CONSOLE    (1)
//   25 #define DEST_STRING     (2)
//   26 
//   27 #define FLAGS_MINUS     (0x01)
//   28 #define FLAGS_PLUS      (0x02)
//   29 #define FLAGS_SPACE     (0x04)
//   30 #define FLAGS_ZERO      (0x08)
//   31 #define FLAGS_POUND     (0x10)
//   32 
//   33 #define IS_FLAG_MINUS(a)    (a & FLAGS_MINUS)
//   34 #define IS_FLAG_PLUS(a)     (a & FLAGS_PLUS)
//   35 #define IS_FLAG_SPACE(a)    (a & FLAGS_SPACE)
//   36 #define IS_FLAG_ZERO(a)     (a & FLAGS_ZERO)
//   37 #define IS_FLAG_POUND(a)    (a & FLAGS_POUND)
//   38 
//   39 #define LENMOD_h        (0x01)
//   40 #define LENMOD_l        (0x02)
//   41 #define LENMOD_L        (0x04)
//   42 
//   43 #define IS_LENMOD_h(a)  (a & LENMOD_h)
//   44 #define IS_LENMOD_l(a)  (a & LENMOD_l)
//   45 #define IS_LENMOD_L(a)  (a & LENMOD_L)
//   46 
//   47 #define FMT_d   (0x0001)
//   48 #define FMT_o   (0x0002)
//   49 #define FMT_x   (0x0004)
//   50 #define FMT_X   (0x0008)
//   51 #define FMT_u   (0x0010)
//   52 #define FMT_c   (0x0020)
//   53 #define FMT_s   (0x0040)
//   54 #define FMT_p   (0x0080)
//   55 #define FMT_n   (0x0100)
//   56 
//   57 #define IS_FMT_d(a)     (a & FMT_d)
//   58 #define IS_FMT_o(a)     (a & FMT_o)
//   59 #define IS_FMT_x(a)     (a & FMT_x)
//   60 #define IS_FMT_X(a)     (a & FMT_X)
//   61 #define IS_FMT_u(a)     (a & FMT_u)
//   62 #define IS_FMT_c(a)     (a & FMT_c)
//   63 #define IS_FMT_s(a)     (a & FMT_s)
//   64 #define IS_FMT_p(a)     (a & FMT_p)
//   65 #define IS_FMT_n(a)     (a & FMT_n)
//   66 
//   67 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   68 static void
//   69 printk_putc (int c, int *count, PRINTK_INFO *info)
//   70 {
printk_putc:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   71     switch (info->dest)
        LDR      R0,[R6, #+0]
        CMP      R0,#+1
        BEQ.N    ??printk_putc_0
        CMP      R0,#+2
        BEQ.N    ??printk_putc_1
        B.N      ??printk_putc_2
//   72     {
//   73         case DEST_CONSOLE:
//   74             info->func((char)c);
??printk_putc_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R6, #+4]
        BLX      R1
//   75             break;
        B.N      ??printk_putc_3
//   76         case DEST_STRING:
//   77             *(info->loc) = (unsigned char)c;
??printk_putc_1:
        LDR      R0,[R6, #+8]
        STRB     R4,[R0, #+0]
//   78             ++(info->loc);
        LDR      R0,[R6, #+8]
        ADDS     R0,R0,#+1
        STR      R0,[R6, #+8]
//   79             break;
        B.N      ??printk_putc_3
//   80         default:
//   81             break;
//   82     }
//   83     *count += 1;
??printk_putc_2:
??printk_putc_3:
        LDR      R0,[R5, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[R5, #+0]
//   84 }
        POP      {R4-R6,PC}       ;; return
//   85 
//   86 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   87 static int
//   88 printk_mknumstr (char *numstr, void *nump, int neg, int radix)
//   89 {
printk_mknumstr:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
//   90     int a,b,c;
//   91     unsigned int ua,ub,uc;
//   92 
//   93     int nlen;
//   94     char *nstrp;
//   95 
//   96     nlen = 0;
        MOVS     R10,#+0
        MOV      R0,R10
//   97     nstrp = numstr;
        MOV      R9,R4
//   98     *nstrp++ = '\0';
        MOVS     R10,#+0
        STRB     R10,[R9, #+0]
        ADDS     R9,R9,#+1
//   99 
//  100     if (neg)
        CMP      R2,#+0
        BEQ.N    ??printk_mknumstr_0
//  101     {
//  102         a = *(int *)nump;
        LDR      R10,[R1, #+0]
        MOV      R5,R10
//  103         if (a == 0)
        CMP      R5,#+0
        BNE.N    ??printk_mknumstr_1
//  104         {
//  105             *nstrp = '0';
        MOVS     R10,#+48
        STRB     R10,[R9, #+0]
//  106             ++nlen;
        ADDS     R0,R0,#+1
//  107             goto done;
        B.N      ??printk_mknumstr_2
//  108         }
//  109         while (a != 0)
??printk_mknumstr_1:
        CMP      R5,#+0
        BEQ.N    ??printk_mknumstr_2
//  110         {
//  111             b = (int)a / (int)radix;
        SDIV     R10,R5,R3
        MOV      R6,R10
//  112             c = (int)a - ((int)b * (int)radix);
        MLS      R10,R3,R6,R5
        MOV      R7,R10
//  113             if (c < 0)
        CMP      R7,#+0
        BPL.N    ??printk_mknumstr_3
//  114             {
//  115                 c = ~c + 1 + '0';
        MVNS     R7,R7
        ADDS     R7,R7,#+49
        B.N      ??printk_mknumstr_4
//  116             }
//  117             else
//  118             {
//  119                 c = c + '0';
??printk_mknumstr_3:
        ADDS     R7,R7,#+48
//  120             }
//  121             a = b;
??printk_mknumstr_4:
        MOVS     R5,R6
//  122             *nstrp++ = (char)c;
        STRB     R7,[R9, #+0]
        ADDS     R9,R9,#+1
//  123             ++nlen;
        ADDS     R0,R0,#+1
        B.N      ??printk_mknumstr_1
//  124         }
//  125     }
//  126     else
//  127     {
//  128         ua = *(unsigned int *)nump;
??printk_mknumstr_0:
        LDR      R10,[R1, #+0]
        MOV      R12,R10
//  129         if (ua == 0)
        CMP      R12,#+0
        BNE.N    ??printk_mknumstr_5
//  130         {
//  131             *nstrp = '0';
        MOVS     R10,#+48
        STRB     R10,[R9, #+0]
//  132             ++nlen;
        ADDS     R0,R0,#+1
//  133             goto done;
        B.N      ??printk_mknumstr_2
//  134         }
//  135         while (ua != 0)
??printk_mknumstr_5:
        CMP      R12,#+0
        BEQ.N    ??printk_mknumstr_2
//  136         {
//  137             ub = (unsigned int)ua / (unsigned int)radix;
        UDIV     R10,R12,R3
        MOV      LR,R10
//  138             uc = (unsigned int)ua - ((unsigned int)ub * (unsigned int)radix);
        MLS      R10,R3,LR,R12
        MOV      R8,R10
//  139             if (uc < 10)
        CMP      R8,#+10
        BCS.N    ??printk_mknumstr_6
//  140             {
//  141                 uc = uc + '0';
        ADDS     R8,R8,#+48
        B.N      ??printk_mknumstr_7
//  142             }
//  143             else
//  144             {
//  145                 uc = uc - 10 + 'A';
??printk_mknumstr_6:
        ADDS     R8,R8,#+55
//  146             }
//  147             ua = ub;
??printk_mknumstr_7:
        MOV      R12,LR
//  148             *nstrp++ = (char)uc;
        STRB     R8,[R9, #+0]
        ADDS     R9,R9,#+1
//  149             ++nlen;
        ADDS     R0,R0,#+1
        B.N      ??printk_mknumstr_5
//  150         }
//  151     }
//  152     done:
//  153     return nlen;
??printk_mknumstr_2:
        POP      {R4-R10,PC}      ;; return
//  154 }
//  155 
//  156 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  157 static void
//  158 printk_pad_zero (int curlen, int field_width, int *count, PRINTK_INFO *info)
//  159 {
printk_pad_zero:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  160     int i;
//  161 
//  162     for (i = curlen; i < field_width; i++)
        MOV      R8,R4
??printk_pad_zero_0:
        CMP      R8,R5
        BGE.N    ??printk_pad_zero_1
//  163     {
//  164         printk_putc('0',count, info);
        MOVS     R2,R7
        MOVS     R1,R6
        MOVS     R0,#+48
        BL       printk_putc
//  165     }
        ADDS     R8,R8,#+1
        B.N      ??printk_pad_zero_0
//  166 }
??printk_pad_zero_1:
        POP      {R4-R8,PC}       ;; return
//  167 
//  168 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  169 static void
//  170 printk_pad_space (int curlen, int field_width, int *count, PRINTK_INFO *info)
//  171 {
printk_pad_space:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  172     int i;
//  173 
//  174     for (i = curlen; i < field_width; i++)
        MOV      R8,R4
??printk_pad_space_0:
        CMP      R8,R5
        BGE.N    ??printk_pad_space_1
//  175     {
//  176         printk_putc(' ',count, info);
        MOVS     R2,R7
        MOVS     R1,R6
        MOVS     R0,#+32
        BL       printk_putc
//  177     }
        ADDS     R8,R8,#+1
        B.N      ??printk_pad_space_0
//  178 }
??printk_pad_space_1:
        POP      {R4-R8,PC}       ;; return
//  179 
//  180 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  181 int
//  182 printk (PRINTK_INFO *info, const char *fmt, va_list ap)
//  183 {
printk:
        PUSH     {R1,R4-R11,LR}
        SUB      SP,SP,#+72
        MOVS     R4,R0
        MOVS     R5,R2
//  184     /* va_list ap; */
//  185     char *p;
//  186     int c;
//  187 
//  188     char vstr[33];
//  189     char *vstrp;
//  190     int vlen;
//  191 
//  192     int done;
//  193     int count = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  194 
//  195     int flags_used;
//  196     int field_width;
//  197 #if 0
//  198     int precision_used;
//  199     int precision_width;
//  200     int length_modifier;
//  201 #endif
//  202 
//  203     int ival;
//  204     int schar, dschar;
//  205     int *ivalp;
//  206     char *sval;
//  207     int cval;
//  208     unsigned int uval;
//  209 
//  210     /*
//  211      * Start parsing apart the format string and display appropriate
//  212      * formats and data.
//  213      */
//  214     for (p = (char *)fmt; (c = *p) != 0; p++)
        LDR      R0,[SP, #+72]
        MOV      R11,R0
??printk_0:
        LDRB     R0,[R11, #+0]
        STR      R0,[SP, #+20]
        CMP      R0,#+0
        BEQ.W    ??printk_1
//  215     {
//  216         /*
//  217          * All formats begin with a '%' marker.  Special chars like
//  218          * '\n' or '\t' are normally converted to the appropriate
//  219          * character by the __compiler__.  Thus, no need for this
//  220          * routine to account for the '\' character.
//  221          */
//  222         if (c != '%')
        LDR      R0,[SP, #+20]
        CMP      R0,#+37
        BEQ.N    ??printk_2
//  223         {
//  224             /*
//  225              * This needs to be replaced with something like
//  226              * 'out_char()' or call an OS routine.
//  227              */
//  228 #ifndef UNIX_DEBUG
//  229             if (c != '\n')
        LDR      R0,[SP, #+20]
        CMP      R0,#+10
        BEQ.N    ??printk_3
//  230             {
//  231                 printk_putc(c, &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        LDR      R0,[SP, #+20]
        BL       printk_putc
        B.N      ??printk_4
//  232             }
//  233             else
//  234             {
//  235                 printk_putc(0x0D /* CR */, &count, info);
??printk_3:
        MOVS     R2,R4
        ADD      R1,SP,#+0
        MOVS     R0,#+13
        BL       printk_putc
//  236                 printk_putc(0x0A /* LF */, &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        MOVS     R0,#+10
        BL       printk_putc
//  237             }
//  238 #else
//  239             printk_putc(c, &count, info);
//  240 #endif
//  241 
//  242             /*
//  243              * By using 'continue', the next iteration of the loop
//  244              * is used, skipping the code that follows.
//  245              */
//  246             continue;
??printk_4:
        B.N      ??printk_5
//  247         }
//  248 
//  249         /*
//  250          * First check for specification modifier flags.
//  251          */
//  252         flags_used = 0;
??printk_2:
        MOVS     R0,#+0
        MOV      R9,R0
//  253         done = FALSE;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  254         while (!done)
??printk_6:
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BNE.N    ??printk_7
//  255         {
//  256             switch (/* c = */ *++p)
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        CMP      R0,#+32
        BEQ.N    ??printk_8
        CMP      R0,#+35
        BEQ.N    ??printk_9
        CMP      R0,#+43
        BEQ.N    ??printk_10
        CMP      R0,#+45
        BEQ.N    ??printk_11
        CMP      R0,#+48
        BEQ.N    ??printk_12
        B.N      ??printk_13
//  257             {
//  258                 case '-':
//  259                     flags_used |= FLAGS_MINUS;
??printk_11:
        ORRS     R9,R9,#0x1
//  260                     break;
        B.N      ??printk_6
//  261                 case '+':
//  262                     flags_used |= FLAGS_PLUS;
??printk_10:
        ORRS     R9,R9,#0x2
//  263                     break;
        B.N      ??printk_6
//  264                 case ' ':
//  265                     flags_used |= FLAGS_SPACE;
??printk_8:
        ORRS     R9,R9,#0x4
//  266                     break;
        B.N      ??printk_6
//  267                 case '0':
//  268                     flags_used |= FLAGS_ZERO;
??printk_12:
        ORRS     R9,R9,#0x8
//  269                     break;
        B.N      ??printk_6
//  270                 case '#':
//  271                     flags_used |= FLAGS_POUND;
??printk_9:
        ORRS     R9,R9,#0x10
//  272                     break;
        B.N      ??printk_6
//  273                 default:
//  274                     /* we've gone one char too far */
//  275                     --p;
??printk_13:
        SUBS     R11,R11,#+1
//  276                     done = TRUE;
        MOVS     R0,#+1
        STR      R0,[SP, #+12]
//  277                     break;
        B.N      ??printk_6
//  278             }
//  279         }
//  280 
//  281         /*
//  282          * Next check for minimum field width.
//  283          */
//  284         field_width = 0;
??printk_7:
        MOVS     R0,#+0
        MOV      R10,R0
//  285         done = FALSE;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  286         while (!done)
??printk_14:
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BNE.N    ??printk_15
//  287         {
//  288             switch (c = *++p)
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        STR      R0,[SP, #+20]
        SUBS     R0,R0,#+48
        CMP      R0,#+9
        BHI.N    ??printk_16
//  289             {
//  290                 case '0':
//  291                 case '1':
//  292                 case '2':
//  293                 case '3':
//  294                 case '4':
//  295                 case '5':
//  296                 case '6':
//  297                 case '7':
//  298                 case '8':
//  299                 case '9':
//  300                     field_width = (field_width * 10) + (c - '0');
??printk_17:
        MOVS     R0,#+10
        LDR      R1,[SP, #+20]
        MLA      R0,R0,R10,R1
        SUBS     R10,R0,#+48
//  301                     break;
        B.N      ??printk_14
//  302                 default:
//  303                     /* we've gone one char too far */
//  304                     --p;
??printk_16:
        SUBS     R11,R11,#+1
//  305                     done = TRUE;
        MOVS     R0,#+1
        STR      R0,[SP, #+12]
//  306                     break;
        B.N      ??printk_14
//  307             }
//  308         }
//  309 
//  310         /*
//  311          * Next check for the width and precision field separator.
//  312          */
//  313         if (/* (c = *++p) */ *++p == '.')
??printk_15:
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        CMP      R0,#+46
        BNE.N    ??printk_18
//  314         {
//  315             /* precision_used = TRUE; */
//  316 
//  317             /*
//  318              * Must get precision field width, if present.
//  319              */
//  320             /* precision_width = 0; */
//  321             done = FALSE;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  322             while (!done)
??printk_19:
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BNE.N    ??printk_20
//  323             {
//  324                 switch (/* c = uncomment if used below */ *++p)
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+9
        BHI.N    ??printk_21
//  325                 {
//  326                     case '0':
//  327                     case '1':
//  328                     case '2':
//  329                     case '3':
//  330                     case '4':
//  331                     case '5':
//  332                     case '6':
//  333                     case '7':
//  334                     case '8':
//  335                     case '9':
//  336 #if 0
//  337                         precision_width = (precision_width * 10) +
//  338                             (c - '0');
//  339 #endif
//  340                         break;
??printk_22:
        B.N      ??printk_19
//  341                     default:
//  342                         /* we've gone one char too far */
//  343                         --p;
??printk_21:
        SUBS     R11,R11,#+1
//  344                         done = TRUE;
        MOVS     R0,#+1
        STR      R0,[SP, #+12]
//  345                         break;
        B.N      ??printk_19
//  346                 }
//  347             }
//  348         }
//  349         else
//  350         {
//  351             /* we've gone one char too far */
//  352             --p;
??printk_18:
        SUBS     R11,R11,#+1
//  353 #if 0
//  354             precision_used = FALSE;
//  355             precision_width = 0;
//  356 #endif
//  357         }
//  358 
//  359         /*
//  360          * Check for the length modifier.
//  361          */
//  362         /* length_modifier = 0; */
//  363         switch (/* c = */ *++p)
??printk_20:
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        CMP      R0,#+76
        BEQ.N    ??printk_23
        CMP      R0,#+104
        BEQ.N    ??printk_24
        CMP      R0,#+108
        BEQ.N    ??printk_25
        B.N      ??printk_26
//  364         {
//  365             case 'h':
//  366                 /* length_modifier |= LENMOD_h; */
//  367                 break;
??printk_24:
        B.N      ??printk_27
//  368             case 'l':
//  369                 /* length_modifier |= LENMOD_l; */
//  370                 break;
??printk_25:
        B.N      ??printk_27
//  371             case 'L':
//  372                 /* length_modifier |= LENMOD_L; */
//  373                 break;
??printk_23:
        B.N      ??printk_27
//  374             default:
//  375                 /* we've gone one char too far */
//  376                 --p;
??printk_26:
        SUBS     R11,R11,#+1
//  377                 break;
//  378         }
//  379 
//  380         /*
//  381          * Now we're ready to examine the format.
//  382          */
//  383         switch (c = *++p)
??printk_27:
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        STR      R0,[SP, #+20]
        CMP      R0,#+88
        BEQ.N    ??printk_28
        CMP      R0,#+98
        BEQ.W    ??printk_29
        CMP      R0,#+99
        BEQ.W    ??printk_30
        CMP      R0,#+100
        BEQ.N    ??printk_31
        CMP      R0,#+105
        BEQ.N    ??printk_31
        CMP      R0,#+110
        BEQ.W    ??printk_32
        CMP      R0,#+111
        BEQ.W    ??printk_33
        CMP      R0,#+112
        BEQ.W    ??printk_34
        CMP      R0,#+115
        BEQ.W    ??printk_35
        CMP      R0,#+117
        BEQ.W    ??printk_36
        CMP      R0,#+120
        BEQ.N    ??printk_28
        B.N      ??printk_37
//  384         {
//  385             case 'd':
//  386             case 'i':
//  387                 ival = (int)va_arg(ap, int);
??printk_31:
        LDR      R0,[R5, #+0]
        STR      R0,[SP, #+24]
        ADDS     R5,R5,#+4
//  388                 vlen = printk_mknumstr(vstr,&ival,TRUE,10);
        MOVS     R3,#+10
        MOVS     R2,#+1
        ADD      R1,SP,#+24
        ADD      R0,SP,#+36
        BL       printk_mknumstr
        MOVS     R7,R0
//  389                 vstrp = &vstr[vlen];
        ADD      R0,SP,#+36
        ADDS     R0,R7,R0
        MOVS     R6,R0
//  390 
//  391                 if (ival < 0)
        LDR      R0,[SP, #+24]
        CMP      R0,#+0
        BPL.N    ??printk_38
//  392                 {
//  393                     schar = '-';
        MOVS     R0,#+45
        STR      R0,[SP, #+8]
//  394                     ++vlen;
        ADDS     R7,R7,#+1
        B.N      ??printk_39
//  395                 }
//  396                 else
//  397                 {
//  398                     if (IS_FLAG_PLUS(flags_used))
??printk_38:
        MOV      R0,R9
        LSLS     R0,R0,#+30
        BPL.N    ??printk_40
//  399                     {
//  400                         schar = '+';
        MOVS     R0,#+43
        STR      R0,[SP, #+8]
//  401                         ++vlen;
        ADDS     R7,R7,#+1
        B.N      ??printk_39
//  402                     }
//  403                     else
//  404                     {
//  405                         if (IS_FLAG_SPACE(flags_used))
??printk_40:
        MOV      R0,R9
        LSLS     R0,R0,#+29
        BPL.N    ??printk_41
//  406                         {
//  407                             schar = ' ';
        MOVS     R0,#+32
        STR      R0,[SP, #+8]
//  408                             ++vlen;
        ADDS     R7,R7,#+1
        B.N      ??printk_39
//  409                         }
//  410                         else
//  411                         {
//  412                             schar = 0;
??printk_41:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  413                         }
//  414                     }
//  415                 }
//  416                 dschar = FALSE;
??printk_39:
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  417             
//  418                 /*
//  419                  * do the ZERO pad.
//  420                  */
//  421                 if (IS_FLAG_ZERO(flags_used))
        MOV      R0,R9
        LSLS     R0,R0,#+28
        BPL.N    ??printk_42
//  422                 {
//  423                     if (schar)
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??printk_43
//  424                         printk_putc(schar, &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        LDR      R0,[SP, #+8]
        BL       printk_putc
//  425                     dschar = TRUE;
??printk_43:
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
//  426             
//  427                     printk_pad_zero (vlen, field_width, &count, info);
        MOVS     R3,R4
        ADD      R2,SP,#+0
        MOV      R1,R10
        MOVS     R0,R7
        BL       printk_pad_zero
//  428                     vlen = field_width;
        MOV      R7,R10
        B.N      ??printk_44
//  429                 }
//  430                 else
//  431                 {
//  432                     if (!IS_FLAG_MINUS(flags_used))
??printk_42:
        MOV      R0,R9
        LSLS     R0,R0,#+31
        BMI.N    ??printk_44
//  433                     {
//  434                         printk_pad_space (vlen, field_width, &count, info);
        MOVS     R3,R4
        ADD      R2,SP,#+0
        MOV      R1,R10
        MOVS     R0,R7
        BL       printk_pad_space
//  435             
//  436                         if (schar)
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??printk_45
//  437                             printk_putc(schar, &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        LDR      R0,[SP, #+8]
        BL       printk_putc
//  438                         dschar = TRUE;
??printk_45:
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
//  439                     }
//  440                 }
//  441             
//  442                 /* the string was built in reverse order, now display in */
//  443                 /* correct order */
//  444                 if (!dschar && schar)
??printk_44:
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BNE.N    ??printk_46
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??printk_46
//  445                 {
//  446                     printk_putc(schar, &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        LDR      R0,[SP, #+8]
        BL       printk_putc
//  447                 }
//  448                 goto cont_xd;
??printk_46:
        B.N      ??printk_47
//  449 
//  450             case 'x':
//  451             case 'X':
//  452                 uval = (unsigned int)va_arg(ap, unsigned int);
??printk_28:
        LDR      R0,[R5, #+0]
        STR      R0,[SP, #+4]
        ADDS     R5,R5,#+4
//  453                 vlen = printk_mknumstr(vstr,&uval,FALSE,16);
        MOVS     R3,#+16
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+36
        BL       printk_mknumstr
        MOVS     R7,R0
//  454                 vstrp = &vstr[vlen];
        ADD      R0,SP,#+36
        ADDS     R0,R7,R0
        MOVS     R6,R0
//  455 
//  456                 dschar = FALSE;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  457                 if (IS_FLAG_ZERO(flags_used))
        MOV      R0,R9
        LSLS     R0,R0,#+28
        BPL.N    ??printk_48
//  458                 {
//  459                     if (IS_FLAG_POUND(flags_used))
        MOV      R0,R9
        LSLS     R0,R0,#+27
        BPL.N    ??printk_49
//  460                     {
//  461                         printk_putc('0', &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        MOVS     R0,#+48
        BL       printk_putc
//  462                         printk_putc('x', &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        MOVS     R0,#+120
        BL       printk_putc
//  463                         /*vlen += 2;*/
//  464                         dschar = TRUE;
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
//  465                     }
//  466                     printk_pad_zero (vlen, field_width, &count, info);
??printk_49:
        MOVS     R3,R4
        ADD      R2,SP,#+0
        MOV      R1,R10
        MOVS     R0,R7
        BL       printk_pad_zero
//  467                     vlen = field_width;
        MOV      R7,R10
        B.N      ??printk_50
//  468                 }
//  469                 else
//  470                 {
//  471                     if (!IS_FLAG_MINUS(flags_used))
??printk_48:
        MOV      R0,R9
        LSLS     R0,R0,#+31
        BMI.N    ??printk_50
//  472                     {
//  473                         if (IS_FLAG_POUND(flags_used))
        MOV      R0,R9
        LSLS     R0,R0,#+27
        BPL.N    ??printk_51
//  474                         {
//  475                             vlen += 2;
        ADDS     R7,R7,#+2
//  476                         }
//  477                         printk_pad_space (vlen, field_width, &count, info);
??printk_51:
        MOVS     R3,R4
        ADD      R2,SP,#+0
        MOV      R1,R10
        MOVS     R0,R7
        BL       printk_pad_space
//  478                         if (IS_FLAG_POUND(flags_used))
        MOV      R0,R9
        LSLS     R0,R0,#+27
        BPL.N    ??printk_50
//  479                         {
//  480                             printk_putc('0', &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        MOVS     R0,#+48
        BL       printk_putc
//  481                             printk_putc('x', &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        MOVS     R0,#+120
        BL       printk_putc
//  482                             dschar = TRUE;
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
//  483                         }
//  484                     }
//  485                 }
//  486 
//  487                 if ((IS_FLAG_POUND(flags_used)) && !dschar)
??printk_50:
        MOV      R0,R9
        LSLS     R0,R0,#+27
        BPL.N    ??printk_52
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BNE.N    ??printk_52
//  488                 {
//  489                     printk_putc('0', &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        MOVS     R0,#+48
        BL       printk_putc
//  490                     printk_putc('x', &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        MOVS     R0,#+120
        BL       printk_putc
//  491                     vlen += 2;
        ADDS     R7,R7,#+2
//  492                 }
//  493                 goto cont_xd;
??printk_52:
        B.N      ??printk_47
//  494 
//  495             case 'o':
//  496                 uval = (unsigned int)va_arg(ap, unsigned int);
??printk_33:
        LDR      R0,[R5, #+0]
        STR      R0,[SP, #+4]
        ADDS     R5,R5,#+4
//  497                 vlen = printk_mknumstr(vstr,&uval,FALSE,8);
        MOVS     R3,#+8
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+36
        BL       printk_mknumstr
        MOVS     R7,R0
//  498                 goto cont_u;
        B.N      ??printk_53
//  499             case 'b':
//  500                 uval = (unsigned int)va_arg(ap, unsigned int);
??printk_29:
        LDR      R0,[R5, #+0]
        STR      R0,[SP, #+4]
        ADDS     R5,R5,#+4
//  501                 vlen = printk_mknumstr(vstr,&uval,FALSE,2);
        MOVS     R3,#+2
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+36
        BL       printk_mknumstr
        MOVS     R7,R0
//  502                 goto cont_u;
        B.N      ??printk_53
//  503             case 'p':
//  504                 uval = (unsigned int)va_arg(ap, void *);
??printk_34:
        LDR      R0,[R5, #+0]
        STR      R0,[SP, #+4]
        ADDS     R5,R5,#+4
//  505                 vlen = printk_mknumstr(vstr,&uval,FALSE,16);
        MOVS     R3,#+16
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+36
        BL       printk_mknumstr
        MOVS     R7,R0
//  506                 goto cont_u;
        B.N      ??printk_53
//  507             case 'u':
//  508                 uval = (unsigned int)va_arg(ap, unsigned int);
??printk_36:
        LDR      R0,[R5, #+0]
        STR      R0,[SP, #+4]
        ADDS     R5,R5,#+4
//  509                 vlen = printk_mknumstr(vstr,&uval,FALSE,10);
        MOVS     R3,#+10
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+36
        BL       printk_mknumstr
        MOVS     R7,R0
//  510 
//  511                 cont_u:
//  512                     vstrp = &vstr[vlen];
??printk_53:
        ADD      R0,SP,#+36
        ADDS     R0,R7,R0
        MOVS     R6,R0
//  513 
//  514                     if (IS_FLAG_ZERO(flags_used))
        MOV      R0,R9
        LSLS     R0,R0,#+28
        BPL.N    ??printk_54
//  515                     {
//  516                         printk_pad_zero (vlen, field_width, &count, info);
        MOVS     R3,R4
        ADD      R2,SP,#+0
        MOV      R1,R10
        MOVS     R0,R7
        BL       printk_pad_zero
//  517                         vlen = field_width;
        MOV      R7,R10
        B.N      ??printk_47
//  518                     }
//  519                     else
//  520                     {
//  521                         if (!IS_FLAG_MINUS(flags_used))
??printk_54:
        MOV      R0,R9
        LSLS     R0,R0,#+31
        BMI.N    ??printk_47
//  522                         {
//  523                             printk_pad_space (vlen, field_width, &count, info);
        MOVS     R3,R4
        ADD      R2,SP,#+0
        MOV      R1,R10
        MOVS     R0,R7
        BL       printk_pad_space
//  524                         }
//  525                     }
//  526 
//  527                 cont_xd:
//  528                     while (*vstrp)
??printk_47:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+0
        BEQ.N    ??printk_55
//  529                         printk_putc(*vstrp--, &count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        LDRB     R0,[R6, #+0]
        BL       printk_putc
        SUBS     R6,R6,#+1
        B.N      ??printk_47
//  530 
//  531                     if (IS_FLAG_MINUS(flags_used))
??printk_55:
        MOV      R0,R9
        LSLS     R0,R0,#+31
        BPL.N    ??printk_56
//  532                     {
//  533                         printk_pad_space (vlen, field_width, &count, info);
        MOVS     R3,R4
        ADD      R2,SP,#+0
        MOV      R1,R10
        MOVS     R0,R7
        BL       printk_pad_space
//  534                     }
//  535                 break;
??printk_56:
        B.N      ??printk_5
//  536 
//  537             case 'c':
//  538                 cval = (char)va_arg(ap, unsigned int);
??printk_30:
        LDRB     R0,[R5, #+0]
        STR      R0,[SP, #+28]
        ADDS     R5,R5,#+4
//  539                 printk_putc(cval,&count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        LDR      R0,[SP, #+28]
        BL       printk_putc
//  540                 break;
        B.N      ??printk_5
//  541             case 's':
//  542                 sval = (char *)va_arg(ap, char *);
??printk_35:
        LDR      R0,[R5, #+0]
        MOV      R8,R0
        ADDS     R5,R5,#+4
//  543                 if (sval)
        CMP      R8,#+0
        BEQ.N    ??printk_57
//  544                 {
//  545                     vlen = strlen(sval);
        MOV      R0,R8
        BL       strlen
        MOVS     R7,R0
//  546                     if (!IS_FLAG_MINUS(flags_used))
        MOV      R0,R9
        LSLS     R0,R0,#+31
        BMI.N    ??printk_58
//  547                     {
//  548                         printk_pad_space (vlen, field_width, &count, info);
        MOVS     R3,R4
        ADD      R2,SP,#+0
        MOV      R1,R10
        MOVS     R0,R7
        BL       printk_pad_space
//  549                     }
//  550                     while (*sval)
??printk_58:
        LDRB     R0,[R8, #+0]
        CMP      R0,#+0
        BEQ.N    ??printk_59
//  551                         printk_putc(*sval++,&count, info);
        MOVS     R2,R4
        ADD      R1,SP,#+0
        LDRB     R0,[R8, #+0]
        BL       printk_putc
        ADDS     R8,R8,#+1
        B.N      ??printk_58
//  552                     if (IS_FLAG_MINUS(flags_used))
??printk_59:
        MOV      R0,R9
        LSLS     R0,R0,#+31
        BPL.N    ??printk_57
//  553                     {
//  554                         printk_pad_space (vlen, field_width, &count, info);
        MOVS     R3,R4
        ADD      R2,SP,#+0
        MOV      R1,R10
        MOVS     R0,R7
        BL       printk_pad_space
//  555                     }
//  556                 }
//  557                 break;
??printk_57:
        B.N      ??printk_5
//  558             case 'n':
//  559                 ivalp = (int *)va_arg(ap, int *);
??printk_32:
        LDR      R0,[R5, #+0]
        STR      R0,[SP, #+32]
        ADDS     R5,R5,#+4
//  560                 *ivalp = count;
        LDR      R0,[SP, #+32]
        LDR      R1,[SP, #+0]
        STR      R1,[R0, #+0]
//  561                 break;
        B.N      ??printk_5
//  562             default:
//  563                 printk_putc(c,&count, info);
??printk_37:
        MOVS     R2,R4
        ADD      R1,SP,#+0
        LDR      R0,[SP, #+20]
        BL       printk_putc
//  564                 break;
//  565         }
//  566     }
??printk_5:
        ADDS     R11,R11,#+1
        B.N      ??printk_0
//  567     return count;
??printk_1:
        LDR      R0,[SP, #+0]
        ADD      SP,SP,#+76
        POP      {R4-R11,PC}      ;; return
//  568 }
//  569 
//  570 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  571 int
//  572 printf (const char *fmt, ...)
//  573 {
printf:
        PUSH     {R1-R3}
        PUSH     {R1-R6,LR}
        MOVS     R4,R0
//  574     va_list ap;
//  575     int rvalue;
//  576     PRINTK_INFO info;
//  577 
//  578 
//  579     info.dest = DEST_CONSOLE;
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
//  580     info.func = &out_char;
        LDR.N    R0,??DataTable0
        STR      R0,[SP, #+4]
//  581     /*
//  582      * Initialize the pointer to the variable length argument list.
//  583      */
//  584     va_start(ap, fmt);
        ADD      R0,SP,#+28
        MOVS     R5,R0
//  585     rvalue = printk(&info, fmt, ap);
        MOVS     R2,R5
        MOVS     R1,R4
        ADD      R0,SP,#+0
        BL       printk
        MOVS     R6,R0
//  586     /*
//  587      * Cleanup the variable length argument list.
//  588      */
//  589     va_end(ap);
//  590     return rvalue;
        MOVS     R0,R6
        POP      {R1-R6}
        LDR      PC,[SP], #+16    ;; return
//  591 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     out_char
//  592 
//  593 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  594 int
//  595 sprintf (char *s, const char *fmt, ...)
//  596 {
sprintf:
        PUSH     {R2,R3}
        PUSH     {R1-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  597     va_list ap;
//  598     int rvalue = 0;
        MOVS     R7,#+0
//  599     PRINTK_INFO info;
//  600 
//  601     /*
//  602      * Initialize the pointer to the variable length argument list.
//  603      */
//  604     if (s != 0)
        CMP      R4,#+0
        BEQ.N    ??sprintf_0
//  605     {
//  606         info.dest = DEST_STRING;
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
//  607         info.loc = s;
        STR      R4,[SP, #+8]
//  608         va_start(ap, fmt);
        ADD      R0,SP,#+32
        MOVS     R6,R0
//  609         rvalue = printk(&info, fmt, ap);
        MOVS     R2,R6
        MOVS     R1,R5
        ADD      R0,SP,#+0
        BL       printk
        MOVS     R7,R0
//  610         *info.loc = '\0';
        LDR      R0,[SP, #+8]
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  611         va_end(ap);
//  612     }
//  613     return rvalue;
??sprintf_0:
        MOVS     R0,R7
        POP      {R1-R7}
        LDR      PC,[SP], #+12    ;; return
//  614 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  615 
//  616 /********************************************************************/
// 
// 1 422 bytes in section .text
// 
// 1 422 bytes of CODE memory
//
//Errors: none
//Warnings: none
