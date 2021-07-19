///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:43 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\common\stdlib. /
//                    c                                                       /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\common\stdlib. /
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
//                    rld\RAM_128KB\List\stdlib.s                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stdlib

        #define SHT_PROGBITS 0x1

        PUBLIC isalnum
        PUBLIC isdigit
        PUBLIC isspace
        PUBLIC isupper
        PUBLIC memcpy
        PUBLIC memset
        PUBLIC strcasecmp
        PUBLIC strcat
        PUBLIC strcmp
        PUBLIC strcpy
        PUBLIC strlen
        PUBLIC strncasecmp
        PUBLIC strncat
        PUBLIC strncmp
        PUBLIC strncpy
        PUBLIC strtoul

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\common\stdlib.c
//    1 /*
//    2  * File:        stdlib.c
//    3  * Purpose:     Functions normally found in a standard C lib.
//    4  *
//    5  * Notes:       This supports ASCII only!!!
//    6  *
//    7  */
//    8 
//    9 #include "common.h"
//   10 #include "stdlib.h"
//   11 
//   12 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   13 int
//   14 isspace (int ch)
//   15 {
isspace:
        MOVS     R1,R0
//   16     if ((ch == ' ') || (ch == '\t'))    /* \n ??? */
        CMP      R1,#+32
        BEQ.N    ??isspace_0
        CMP      R1,#+9
        BNE.N    ??isspace_1
//   17         return TRUE;
??isspace_0:
        MOVS     R0,#+1
        B.N      ??isspace_2
//   18     else
//   19         return FALSE;
??isspace_1:
        MOVS     R0,#+0
??isspace_2:
        BX       LR               ;; return
//   20 }
//   21 
//   22 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   23 int
//   24 isalnum (int ch)
//   25 {
isalnum:
        MOVS     R1,R0
//   26     /* ASCII only */
//   27     if (((ch >= '0') && (ch <= '9')) ||
//   28         ((ch >= 'A') && (ch <= 'Z')) ||
//   29         ((ch >= 'a') && (ch <= 'z')))
        CMP      R1,#+48
        BLT.N    ??isalnum_0
        CMP      R1,#+58
        BLT.N    ??isalnum_1
??isalnum_0:
        CMP      R1,#+65
        BLT.N    ??isalnum_2
        CMP      R1,#+91
        BLT.N    ??isalnum_1
??isalnum_2:
        CMP      R1,#+97
        BLT.N    ??isalnum_3
        CMP      R1,#+123
        BGE.N    ??isalnum_3
//   30         return TRUE;
??isalnum_1:
        MOVS     R0,#+1
        B.N      ??isalnum_4
//   31     else
//   32         return FALSE;
??isalnum_3:
        MOVS     R0,#+0
??isalnum_4:
        BX       LR               ;; return
//   33 }
//   34 
//   35 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 int
//   37 isdigit (int ch)
//   38 {
isdigit:
        MOVS     R1,R0
//   39     /* ASCII only */
//   40     if ((ch >= '0') && (ch <= '9'))
        CMP      R1,#+48
        BLT.N    ??isdigit_0
        CMP      R1,#+58
        BGE.N    ??isdigit_0
//   41         return TRUE;
        MOVS     R0,#+1
        B.N      ??isdigit_1
//   42     else
//   43         return FALSE;
??isdigit_0:
        MOVS     R0,#+0
??isdigit_1:
        BX       LR               ;; return
//   44 }
//   45 
//   46 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   47 int
//   48 isupper (int ch)
//   49 {
isupper:
        MOVS     R1,R0
//   50     /* ASCII only */
//   51     if ((ch >= 'A') && (ch <= 'Z'))
        CMP      R1,#+65
        BLT.N    ??isupper_0
        CMP      R1,#+91
        BGE.N    ??isupper_0
//   52         return TRUE;
        MOVS     R0,#+1
        B.N      ??isupper_1
//   53     else
//   54         return FALSE;
??isupper_0:
        MOVS     R0,#+0
??isupper_1:
        BX       LR               ;; return
//   55 }
//   56 
//   57 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   58 int
//   59 strcasecmp (const char *s1, const char *s2)
//   60 {
strcasecmp:
        PUSH     {R4,R5}
        MOVS     R2,R0
//   61     char    c1, c2;
//   62     int     result = 0;
        MOVS     R0,#+0
//   63 
//   64     while (result == 0)
??strcasecmp_0:
        CMP      R0,#+0
        BNE.N    ??strcasecmp_1
//   65     {
//   66         c1 = *s1++;
        LDRB     R5,[R2, #+0]
        MOVS     R3,R5
        ADDS     R2,R2,#+1
//   67         c2 = *s2++;
        LDRB     R5,[R1, #+0]
        MOVS     R4,R5
        ADDS     R1,R1,#+1
//   68         if ((c1 >= 'a') && (c1 <= 'z'))
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+97
        BCC.N    ??strcasecmp_2
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+123
        BCS.N    ??strcasecmp_2
//   69             c1 = (char)(c1 - ' ');
        SUBS     R3,R3,#+32
//   70         if ((c2 >= 'a') && (c2 <= 'z'))
??strcasecmp_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+97
        BCC.N    ??strcasecmp_3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+123
        BCS.N    ??strcasecmp_3
//   71             c2 = (char)(c2 - ' ');
        SUBS     R4,R4,#+32
//   72         if ((result = (c1 - c2)) != 0)
??strcasecmp_3:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        SUBS     R5,R3,R4
        MOVS     R0,R5
        CMP      R5,#+0
        BNE.N    ??strcasecmp_1
//   73             break;
//   74         if ((c1 == 0) || (c2 == 0))
??strcasecmp_4:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??strcasecmp_5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??strcasecmp_0
//   75             break;
//   76     }
//   77     return result;
??strcasecmp_5:
??strcasecmp_1:
        POP      {R4,R5}
        BX       LR               ;; return
//   78 }
//   79 
//   80 
//   81 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   82 int
//   83 strncasecmp (const char *s1, const char *s2, int n)
//   84 {
strncasecmp:
        PUSH     {R4-R7}
        MOVS     R3,R0
//   85     char    c1, c2;
//   86     int     k = 0;
        MOVS     R6,#+0
//   87     int     result = 0;
        MOVS     R0,#+0
//   88 
//   89     while ( k++ < n )
??strncasecmp_0:
        MOVS     R7,R6
        ADDS     R6,R7,#+1
        CMP      R7,R2
        BGE.N    ??strncasecmp_1
//   90     {
//   91         c1 = *s1++;
        LDRB     R7,[R3, #+0]
        MOVS     R4,R7
        ADDS     R3,R3,#+1
//   92         c2 = *s2++;
        LDRB     R7,[R1, #+0]
        MOVS     R5,R7
        ADDS     R1,R1,#+1
//   93         if ((c1 >= 'a') && (c1 <= 'z'))
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+97
        BCC.N    ??strncasecmp_2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+123
        BCS.N    ??strncasecmp_2
//   94             c1 = (char)(c1 - ' ');
        SUBS     R4,R4,#+32
//   95         if ((c2 >= 'a') && (c2 <= 'z'))
??strncasecmp_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+97
        BCC.N    ??strncasecmp_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+123
        BCS.N    ??strncasecmp_3
//   96             c2 = (char)(c2 - ' ');
        SUBS     R5,R5,#+32
//   97         if ((result = (c1 - c2)) != 0)
??strncasecmp_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R7,R4,R5
        MOVS     R0,R7
        CMP      R7,#+0
        BNE.N    ??strncasecmp_1
//   98             break;
//   99         if ((c1 == 0) || (c2 == 0))
??strncasecmp_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??strncasecmp_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??strncasecmp_0
//  100             break;
//  101     }
//  102     return result;
??strncasecmp_5:
??strncasecmp_1:
        POP      {R4-R7}
        BX       LR               ;; return
//  103 }
//  104 
//  105 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 uint32
//  107 strtoul (char *str, char **ptr, int base)
//  108 {
strtoul:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  109     unsigned long rvalue;
//  110     int c, err, neg;
//  111     char *endp;
//  112     char *startp;
//  113 
//  114     rvalue = 0;  err = 0;  neg = 0;
        MOVS     R0,#+0
        MOVS     R7,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        MOV      R8,R0
//  115 
//  116     /* Check for invalid arguments */
//  117     if ((str == NULL) || (base < 0) || (base == 1) || (base > 36))
        CMP      R4,#+0
        BEQ.N    ??strtoul_0
        CMP      R6,#+0
        BMI.N    ??strtoul_0
        CMP      R6,#+1
        BEQ.N    ??strtoul_0
        CMP      R6,#+37
        BLT.N    ??strtoul_1
//  118     {
//  119         if (ptr != NULL)
??strtoul_0:
        CMP      R5,#+0
        BEQ.N    ??strtoul_2
//  120         {
//  121             *ptr = str;
        STR      R4,[R5, #+0]
//  122         }
//  123         return 0;
??strtoul_2:
        MOVS     R0,#+0
        B.N      ??strtoul_3
//  124     }
//  125 
//  126     /* Skip leading white spaces */
//  127     for (startp = str; isspace(*startp); ++startp)
??strtoul_1:
        MOV      R10,R4
??strtoul_4:
        LDRB     R0,[R10, #+0]
        BL       isspace
        CMP      R0,#+0
        BEQ.N    ??strtoul_5
        ADDS     R10,R10,#+1
        B.N      ??strtoul_4
//  128         ;
//  129 
//  130     /* Check for notations */
//  131     switch (startp[0])
??strtoul_5:
        LDRB     R0,[R10, #+0]
        CMP      R0,#+45
        BEQ.N    ??strtoul_6
        CMP      R0,#+48
        BNE.N    ??strtoul_7
//  132     {
//  133         case '0':
//  134             if ((startp[1] == 'x') || (startp[1] == 'X'))
??strtoul_8:
        LDRB     R0,[R10, #+1]
        CMP      R0,#+120
        BEQ.N    ??strtoul_9
        LDRB     R0,[R10, #+1]
        CMP      R0,#+88
        BNE.N    ??strtoul_10
//  135             {
//  136                 if ((base == 0) || (base == 16))
??strtoul_9:
        CMP      R6,#+0
        BEQ.N    ??strtoul_11
        CMP      R6,#+16
        BNE.N    ??strtoul_10
//  137                 {
//  138                     base = 16;
??strtoul_11:
        MOVS     R0,#+16
        MOVS     R6,R0
//  139                     startp = &startp[2];
        ADDS     R10,R10,#+2
//  140                 }
//  141             }
//  142             break;
??strtoul_10:
        B.N      ??strtoul_12
//  143         case '-':
//  144             neg = 1;
??strtoul_6:
        MOVS     R0,#+1
        MOV      R8,R0
//  145             startp = &startp[1];
        ADDS     R10,R10,#+1
//  146             break;
        B.N      ??strtoul_12
//  147         default:
//  148             break;
//  149     }
//  150 
//  151     if (base == 0)
??strtoul_7:
??strtoul_12:
        CMP      R6,#+0
        BNE.N    ??strtoul_13
//  152         base = 10;
        MOVS     R0,#+10
        MOVS     R6,R0
//  153 
//  154     /* Check for invalid chars in str */
//  155     for ( endp = startp; (c = *endp) != '\0'; ++endp)
??strtoul_13:
        MOV      R9,R10
??strtoul_14:
        LDRB     R0,[R9, #+0]
        MOV      R11,R0
        CMP      R0,#+0
        BEQ.N    ??strtoul_15
//  156     {
//  157         /* Check for 0..9,Aa-Zz */
//  158         if (!isalnum(c))
        MOV      R0,R11
        BL       isalnum
        CMP      R0,#+0
        BNE.N    ??strtoul_16
//  159         {
//  160             err = 1;
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
//  161             break;
        B.N      ??strtoul_15
//  162         }
//  163 
//  164         /* Convert char to num in 0..36 */
//  165         if (isdigit(c))
??strtoul_16:
        MOV      R0,R11
        BL       isdigit
        CMP      R0,#+0
        BEQ.N    ??strtoul_17
//  166         {
//  167             c = c - '0';
        SUBS     R11,R11,#+48
        B.N      ??strtoul_18
//  168         }
//  169         else
//  170         {
//  171             if (isupper(c))
??strtoul_17:
        MOV      R0,R11
        BL       isupper
        CMP      R0,#+0
        BEQ.N    ??strtoul_19
//  172             {
//  173                 c = c - 'A' + 10;
        SUBS     R11,R11,#+55
        B.N      ??strtoul_18
//  174             }
//  175             else
//  176             {
//  177                 c = c - 'a' + 10;
??strtoul_19:
        SUBS     R11,R11,#+87
//  178             }
//  179         }
//  180 
//  181         /* check c against base */
//  182         if (c >= base)
??strtoul_18:
        CMP      R11,R6
        BLT.N    ??strtoul_20
//  183         {
//  184             err = 1;
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
//  185             break;
        B.N      ??strtoul_15
//  186         }
//  187 
//  188         if (neg)
??strtoul_20:
        CMP      R8,#+0
        BEQ.N    ??strtoul_21
//  189         {
//  190             rvalue = (rvalue * base) - c;
        MUL      R0,R6,R7
        SUBS     R7,R0,R11
        B.N      ??strtoul_22
//  191         }
//  192         else
//  193         {
//  194             rvalue = (rvalue * base) + c;
??strtoul_21:
        MLA      R7,R6,R7,R11
//  195         }
//  196     }
??strtoul_22:
        ADDS     R9,R9,#+1
        B.N      ??strtoul_14
//  197 
//  198     /* Upon exit, endp points to the character at which valid info */
//  199     /* STOPS.  No chars including and beyond endp are used.        */
//  200 
//  201     if (ptr != NULL)
??strtoul_15:
        CMP      R5,#+0
        BEQ.N    ??strtoul_23
//  202         *ptr = endp;
        STR      R9,[R5, #+0]
//  203 
//  204     if (err)
??strtoul_23:
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??strtoul_24
//  205     {
//  206         if (ptr != NULL)
        CMP      R5,#+0
        BEQ.N    ??strtoul_25
//  207             *ptr = str;
        STR      R4,[R5, #+0]
//  208         
//  209         return 0;
??strtoul_25:
        MOVS     R0,#+0
        B.N      ??strtoul_3
//  210     }
//  211     else
//  212     {
//  213         return rvalue;
??strtoul_24:
        MOVS     R0,R7
??strtoul_3:
        POP      {R1,R4-R11,PC}   ;; return
//  214     }
//  215 }
//  216 
//  217 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  218 int
//  219 strlen (const char *str)
//  220 {
strlen:
        MOVS     R1,R0
//  221     char *s = (char *)str;
        MOVS     R2,R1
//  222     int len = 0;
        MOVS     R3,#+0
//  223 
//  224     if (s == NULL)
        CMP      R2,#+0
        BNE.N    ??strlen_0
//  225         return 0;
        MOVS     R0,#+0
        B.N      ??strlen_1
//  226 
//  227     while (*s++ != '\0')
??strlen_0:
        MOVS     R0,R2
        ADDS     R2,R0,#+1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??strlen_2
//  228         ++len;
        ADDS     R3,R3,#+1
        B.N      ??strlen_0
//  229 
//  230     return len;
??strlen_2:
        MOVS     R0,R3
??strlen_1:
        BX       LR               ;; return
//  231 }
//  232 
//  233 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  234 char *
//  235 strcat (char *dest, const char *src)
//  236 {
strcat:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  237     char *dp;
//  238     char *sp = (char *)src;
        MOVS     R7,R5
//  239 
//  240     if ((dest != NULL) && (src != NULL))
        CMP      R4,#+0
        BEQ.N    ??strcat_0
        CMP      R5,#+0
        BEQ.N    ??strcat_0
//  241     {
//  242         dp = &dest[strlen(dest)];
        MOVS     R0,R4
        BL       strlen
        ADDS     R0,R0,R4
        MOVS     R6,R0
//  243 
//  244         while (*sp != '\0')
??strcat_1:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+0
        BEQ.N    ??strcat_2
//  245         {
//  246             *dp++ = *sp++;
        LDRB     R0,[R7, #+0]
        STRB     R0,[R6, #+0]
        ADDS     R7,R7,#+1
        ADDS     R6,R6,#+1
        B.N      ??strcat_1
//  247         }
//  248         *dp = '\0';
??strcat_2:
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
//  249     }
//  250     return dest;
??strcat_0:
        MOVS     R0,R4
        POP      {R1,R4-R7,PC}    ;; return
//  251 }
//  252 
//  253 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  254 char *
//  255 strncat (char *dest, const char *src, int n)
//  256 {
strncat:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R8,R2
//  257     char *dp;
//  258     char *sp = (char *)src;
        MOVS     R7,R5
//  259 
//  260     if ((dest != NULL) && (src != NULL) && (n > 0))
        CMP      R4,#+0
        BEQ.N    ??strncat_0
        CMP      R5,#+0
        BEQ.N    ??strncat_0
        CMP      R8,#+1
        BLT.N    ??strncat_0
//  261     {
//  262         dp = &dest[strlen(dest)];
        MOVS     R0,R4
        BL       strlen
        ADDS     R0,R0,R4
        MOVS     R6,R0
//  263 
//  264         while ((*sp != '\0') && (n-- > 0))
??strncat_1:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+0
        BEQ.N    ??strncat_2
        MOV      R0,R8
        SUBS     R8,R0,#+1
        CMP      R0,#+1
        BLT.N    ??strncat_2
//  265         {
//  266             *dp++ = *sp++;
        LDRB     R0,[R7, #+0]
        STRB     R0,[R6, #+0]
        ADDS     R7,R7,#+1
        ADDS     R6,R6,#+1
        B.N      ??strncat_1
//  267         }
//  268         *dp = '\0';
??strncat_2:
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
//  269     }
//  270     return dest;
??strncat_0:
        MOVS     R0,R4
        POP      {R4-R8,PC}       ;; return
//  271 }
//  272 
//  273 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  274 char *
//  275 strcpy (char *dest, const char *src)
//  276 {
strcpy:
        PUSH     {R4}
//  277     char *dp = (char *)dest;
        MOVS     R2,R0
//  278     char *sp = (char *)src;
        MOVS     R3,R1
//  279 
//  280     if ((dest != NULL) && (src != NULL))
        CMP      R0,#+0
        BEQ.N    ??strcpy_0
        CMP      R1,#+0
        BEQ.N    ??strcpy_0
//  281     {
//  282         while (*sp != '\0')
??strcpy_1:
        LDRB     R4,[R3, #+0]
        CMP      R4,#+0
        BEQ.N    ??strcpy_2
//  283         {
//  284             *dp++ = *sp++;
        LDRB     R4,[R3, #+0]
        STRB     R4,[R2, #+0]
        ADDS     R3,R3,#+1
        ADDS     R2,R2,#+1
        B.N      ??strcpy_1
//  285         }
//  286         *dp = '\0';
??strcpy_2:
        MOVS     R4,#+0
        STRB     R4,[R2, #+0]
//  287     }
//  288     return dest;
??strcpy_0:
        POP      {R4}
        BX       LR               ;; return
//  289 }
//  290 
//  291 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  292 char *
//  293 strncpy (char *dest, const char *src, int n)
//  294 {
strncpy:
        PUSH     {R4,R5}
//  295     char *dp = (char *)dest;
        MOVS     R3,R0
//  296     char *sp = (char *)src;
        MOVS     R4,R1
//  297 
//  298     if ((dest != NULL) && (src != NULL) && (n > 0))
        CMP      R0,#+0
        BEQ.N    ??strncpy_0
        CMP      R1,#+0
        BEQ.N    ??strncpy_0
        CMP      R2,#+1
        BLT.N    ??strncpy_0
//  299     {
//  300         while ((*sp != '\0') && (n-- > 0))
??strncpy_1:
        LDRB     R5,[R4, #+0]
        CMP      R5,#+0
        BEQ.N    ??strncpy_2
        MOVS     R5,R2
        SUBS     R2,R5,#+1
        CMP      R5,#+1
        BLT.N    ??strncpy_2
//  301         {
//  302             *dp++ = *sp++;
        LDRB     R5,[R4, #+0]
        STRB     R5,[R3, #+0]
        ADDS     R4,R4,#+1
        ADDS     R3,R3,#+1
        B.N      ??strncpy_1
//  303         }
//  304         *dp = '\0';
??strncpy_2:
        MOVS     R5,#+0
        STRB     R5,[R3, #+0]
//  305     }
//  306     return dest;
??strncpy_0:
        POP      {R4,R5}
        BX       LR               ;; return
//  307 }
//  308 
//  309 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  310 int
//  311 strcmp (const char *s1, const char *s2)
//  312 {
strcmp:
        PUSH     {R4,R5}
        MOVS     R2,R0
//  313     /* No checks for NULL */
//  314     char *s1p = (char *)s1;
        MOVS     R0,R2
//  315     char *s2p = (char *)s2;
        MOVS     R3,R1
//  316 
//  317     while (*s2p != '\0')
??strcmp_0:
        LDRB     R4,[R3, #+0]
        CMP      R4,#+0
        BEQ.N    ??strcmp_1
//  318     {
//  319         if (*s1p != *s2p)
        LDRB     R4,[R0, #+0]
        LDRB     R5,[R3, #+0]
        CMP      R4,R5
        BNE.N    ??strcmp_1
//  320             break;
//  321 
//  322         ++s1p;
??strcmp_2:
        ADDS     R0,R0,#+1
//  323         ++s2p;
        ADDS     R3,R3,#+1
        B.N      ??strcmp_0
//  324     }
//  325     return (*s1p - *s2p);
??strcmp_1:
        LDRB     R0,[R0, #+0]
        LDRB     R3,[R3, #+0]
        SUBS     R0,R0,R3
        POP      {R4,R5}
        BX       LR               ;; return
//  326 }
//  327 
//  328 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  329 int
//  330 strncmp (const char *s1, const char *s2, int n)
//  331 {
strncmp:
        PUSH     {R4-R6}
        MOVS     R3,R0
//  332     /* No checks for NULL */
//  333     char *s1p = (char *)s1;
        MOVS     R4,R3
//  334     char *s2p = (char *)s2;
        MOVS     R5,R1
//  335 
//  336     if (n <= 0)
        CMP      R2,#+1
        BGE.N    ??strncmp_0
//  337         return 0;
        MOVS     R0,#+0
        B.N      ??strncmp_1
//  338 
//  339     while (*s2p != '\0')
??strncmp_0:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BEQ.N    ??strncmp_2
//  340     {
//  341         if (*s1p != *s2p)
        LDRB     R0,[R4, #+0]
        LDRB     R6,[R5, #+0]
        CMP      R0,R6
        BNE.N    ??strncmp_2
//  342             break;
//  343 
//  344         if (--n == 0)
??strncmp_3:
        SUBS     R2,R2,#+1
        CMP      R2,#+0
        BEQ.N    ??strncmp_2
//  345             break;
//  346 
//  347         ++s1p;
??strncmp_4:
        ADDS     R4,R4,#+1
//  348         ++s2p;
        ADDS     R5,R5,#+1
        B.N      ??strncmp_0
//  349     }
//  350     return (*s1p - *s2p);
??strncmp_2:
        LDRB     R0,[R4, #+0]
        LDRB     R4,[R5, #+0]
        SUBS     R0,R0,R4
??strncmp_1:
        POP      {R4-R6}
        BX       LR               ;; return
//  351 }
//  352 
//  353 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  354 void *
//  355 memcpy (void *dest, const void *src, unsigned n)
//  356 {
memcpy:
        PUSH     {R4-R7,LR}
//  357     int longs, bytes;
//  358     uint32 *dpl = (uint32 *)dest;
        MOVS     R4,R0
//  359     uint32 *spl = (uint32 *)src;
        MOVS     R5,R1
//  360     uint8  *dpb, *spb;
//  361 
//  362     if ((dest != NULL) && (src != NULL) && (n > 0))
        CMP      R0,#+0
        BEQ.N    ??memcpy_0
        CMP      R1,#+0
        BEQ.N    ??memcpy_0
        CMP      R2,#+0
        BEQ.N    ??memcpy_0
//  363     {
//  364         bytes = (n & 0x3);
        ANDS     LR,R2,#0x3
        MOV      R3,LR
//  365         longs = (n - bytes) >> 2;
        SUBS     LR,R2,R3
        LSRS     LR,LR,#+2
        MOV      R12,LR
//  366     
//  367         while (longs--)
??memcpy_1:
        MOV      LR,R12
        SUBS     R12,LR,#+1
        CMP      LR,#+0
        BEQ.N    ??memcpy_2
//  368             *dpl++ = *spl++;
        LDR      LR,[R5, #+0]
        STR      LR,[R4, #+0]
        ADDS     R5,R5,#+4
        ADDS     R4,R4,#+4
        B.N      ??memcpy_1
//  369         
//  370         dpb = (uint8 *)dpl;
??memcpy_2:
        MOVS     R6,R4
//  371         spb = (uint8 *)spl;
        MOVS     R7,R5
//  372         
//  373         while (bytes--)
??memcpy_3:
        MOV      LR,R3
        SUBS     R3,LR,#+1
        CMP      LR,#+0
        BEQ.N    ??memcpy_0
//  374             *dpb++ = *spb++;
        LDRB     LR,[R7, #+0]
        STRB     LR,[R6, #+0]
        ADDS     R7,R7,#+1
        ADDS     R6,R6,#+1
        B.N      ??memcpy_3
//  375     }
//  376     return dest;
??memcpy_0:
        POP      {R4-R7,PC}       ;; return
//  377 }
//  378 
//  379 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  380 void *
//  381 memset (void *s, int c, unsigned n)
//  382 {
memset:
        PUSH     {R4}
//  383     /* Not optimized, but very portable */
//  384     unsigned char *sp = (unsigned char *)s;
        MOVS     R3,R0
//  385 
//  386     if ((s != NULL) && (n > 0))
        CMP      R0,#+0
        BEQ.N    ??memset_0
        CMP      R2,#+0
        BEQ.N    ??memset_0
//  387     {
//  388         while (n--)
??memset_1:
        MOVS     R4,R2
        SUBS     R2,R4,#+1
        CMP      R4,#+0
        BEQ.N    ??memset_0
//  389         {
//  390             *sp++ = (unsigned char)c;
        STRB     R1,[R3, #+0]
        ADDS     R3,R3,#+1
        B.N      ??memset_1
//  391         }
//  392     }
//  393     return s;
??memset_0:
        POP      {R4}
        BX       LR               ;; return
//  394 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  395 
//  396 /****************************************************************/
// 
// 966 bytes in section .text
// 
// 966 bytes of CODE memory
//
//Errors: none
//Warnings: none
