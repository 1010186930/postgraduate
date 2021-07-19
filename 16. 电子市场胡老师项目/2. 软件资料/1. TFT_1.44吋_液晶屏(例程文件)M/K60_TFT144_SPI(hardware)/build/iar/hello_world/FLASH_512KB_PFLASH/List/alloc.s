///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\comm /
//                    on\alloc.c                                              /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\com /
//                    mon\alloc.c" -D IAR -D TWR_K60N512 -lCN                 /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\alloc.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME alloc

        #define SHT_PROGBITS 0x1

        SECTION HEAP:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        PUBLIC free
        PUBLIC malloc

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\common\alloc.c
//    1 /*
//    2  * File:        alloc.c
//    3  * Purpose:     generic malloc() and free() engine
//    4  *
//    5  * Notes:       99% of this code stolen/borrowed from the K&R C
//    6  *              examples.
//    7  *
//    8  */
//    9 
//   10 #include "common.h"
//   11 #include "stdlib.h"
//   12 
//   13 #pragma section = "HEAP"
//   14 
//   15 /********************************************************************/
//   16 
//   17 /*
//   18  * This struct forms the minimum block size which is allocated, and
//   19  * also forms the linked list for the memory space used with alloc()
//   20  * and free().  It is padded so that on a 32-bit machine, all malloc'ed
//   21  * pointers are 16-byte aligned.
//   22  */
//   23 typedef struct ALLOC_HDR
//   24 {
//   25     struct
//   26     {
//   27         struct ALLOC_HDR     *ptr;
//   28         unsigned int size;
//   29     } s;
//   30     unsigned int align;
//   31     unsigned int pad;
//   32 } ALLOC_HDR;
//   33 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 static ALLOC_HDR base;
base:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 static ALLOC_HDR *freep = NULL;
freep:
        DS8 4
//   36 
//   37 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   38 void
//   39 free (void *ap)
//   40 {
//   41     ALLOC_HDR *bp, *p;
//   42 
//   43     bp = (ALLOC_HDR *)ap - 1;   /* point to block header */
free:
        SUBS     R0,R0,#+16
//   44     for (p = freep; !((bp > p) && (bp < p->s.ptr)) ; p = p->s.ptr)
        LDR.N    R1,??DataTable1
        LDR      R1,[R1, #+0]
        B.N      ??free_0
??free_1:
        LDR      R1,[R1, #+0]
??free_0:
        CMP      R1,R0
        BCS.N    ??free_2
        LDR      R2,[R1, #+0]
        CMP      R0,R2
        BCC.N    ??free_3
//   45     {
//   46         if ((p >= p->s.ptr) && ((bp > p) || (bp < p->s.ptr)))
??free_2:
        LDR      R2,[R1, #+0]
        CMP      R1,R2
        BCC.N    ??free_1
        CMP      R1,R0
        BCC.N    ??free_4
        LDR      R2,[R1, #+0]
        CMP      R0,R2
        BCS.N    ??free_1
//   47         {
//   48             break; /* freed block at start or end of arena */
//   49         }
//   50     }
//   51 
//   52     if ((bp + bp->s.size) == p->s.ptr)
??free_4:
??free_3:
        LDR      R2,[R0, #+4]
        ADDS     R2,R0,R2, LSL #+4
        LDR      R3,[R1, #+0]
        CMP      R2,R3
        BNE.N    ??free_5
//   53     {
//   54         bp->s.size += p->s.ptr->s.size;
        LDR      R2,[R0, #+4]
        LDR      R3,[R1, #+0]
        LDR      R3,[R3, #+4]
        ADDS     R2,R3,R2
        STR      R2,[R0, #+4]
//   55         bp->s.ptr = p->s.ptr->s.ptr;
        LDR      R2,[R1, #+0]
        LDR      R2,[R2, #+0]
        STR      R2,[R0, #+0]
        B.N      ??free_6
//   56     }
//   57     else
//   58     {
//   59         bp->s.ptr = p->s.ptr;
??free_5:
        LDR      R2,[R1, #+0]
        STR      R2,[R0, #+0]
//   60     }
//   61 
//   62     if ((p + p->s.size) == bp)
??free_6:
        LDR      R2,[R1, #+4]
        ADDS     R2,R1,R2, LSL #+4
        CMP      R2,R0
        BNE.N    ??free_7
//   63     {
//   64         p->s.size += bp->s.size;
        LDR      R2,[R1, #+4]
        LDR      R3,[R0, #+4]
        ADDS     R2,R3,R2
        STR      R2,[R1, #+4]
//   65         p->s.ptr = bp->s.ptr;
        LDR      R0,[R0, #+0]
        STR      R0,[R1, #+0]
        B.N      ??free_8
//   66     }
//   67     else
//   68     {
//   69         p->s.ptr = bp;
??free_7:
        STR      R0,[R1, #+0]
//   70     }
//   71 
//   72     freep = p;
??free_8:
        LDR.N    R0,??DataTable1
        STR      R1,[R0, #+0]
//   73 }
        BX       LR               ;; return
//   74 
//   75 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   76 void *
//   77 malloc (unsigned nbytes)
//   78 {
//   79     /* Get addresses for the HEAP start and end */
//   80 	#if (defined(CW))	
//   81       extern char __HEAP_START;
//   82       extern char __HEAP_END[];
//   83     #elif (defined(IAR))
//   84       char* __HEAP_START = __section_begin("HEAP");
malloc:
        LDR.N    R1,??DataTable1_1
//   85       char* __HEAP_END = __section_end("HEAP");
        LDR.N    R2,??DataTable1_2
//   86     #endif
//   87    
//   88     ALLOC_HDR *p, *prevp;
//   89     unsigned nunits;
//   90 
//   91     nunits = ((nbytes+sizeof(ALLOC_HDR)-1) / sizeof(ALLOC_HDR)) + 1;
        ADDS     R0,R0,#+15
        LSRS     R0,R0,#+4
        ADDS     R0,R0,#+1
//   92 
//   93     if ((prevp = freep) == NULL)
        LDR.N    R3,??DataTable1
        LDR      R3,[R3, #+0]
        CMP      R3,#+0
        BNE.N    ??malloc_0
//   94     {
//   95         p = (ALLOC_HDR *)__HEAP_START;
//   96         p->s.size = ( ((uint32)__HEAP_END - (uint32)__HEAP_START)
//   97             / sizeof(ALLOC_HDR) );
        SUBS     R2,R2,R1
        LSRS     R2,R2,#+4
        STR      R2,[R1, #+4]
//   98         p->s.ptr = &base;
        LDR.N    R2,??DataTable1_3
        STR      R2,[R1, #+0]
//   99         base.s.ptr = p;
        LDR.N    R2,??DataTable1_3
        STR      R1,[R2, #+0]
//  100         base.s.size = 0;
        LDR.N    R1,??DataTable1_3
        MOVS     R2,#+0
        STR      R2,[R1, #+4]
//  101         prevp = freep = &base;
        LDR.N    R3,??DataTable1_3
        LDR.N    R1,??DataTable1
        STR      R3,[R1, #+0]
//  102     }
//  103 
//  104     for (p = prevp->s.ptr; ; prevp = p, p = p->s.ptr)
??malloc_0:
        LDR      R1,[R3, #+0]
        B.N      ??malloc_1
??malloc_2:
        MOVS     R3,R1
        LDR      R1,[R1, #+0]
//  105     {
//  106         if (p->s.size >= nunits)
??malloc_1:
        LDR      R2,[R1, #+4]
        CMP      R2,R0
        BCC.N    ??malloc_3
//  107         {
//  108             if (p->s.size == nunits)
        LDR      R2,[R1, #+4]
        CMP      R2,R0
        BNE.N    ??malloc_4
//  109             {
//  110                 prevp->s.ptr = p->s.ptr;
        LDR      R0,[R1, #+0]
        STR      R0,[R3, #+0]
        B.N      ??malloc_5
//  111             }
//  112             else
//  113             {
//  114                 p->s.size -= nunits;
??malloc_4:
        LDR      R2,[R1, #+4]
        SUBS     R2,R2,R0
        STR      R2,[R1, #+4]
//  115                 p += p->s.size;
        LDR      R2,[R1, #+4]
        ADDS     R1,R1,R2, LSL #+4
//  116                 p->s.size = nunits;
        STR      R0,[R1, #+4]
//  117             }
//  118             freep = prevp;
??malloc_5:
        LDR.N    R0,??DataTable1
        STR      R3,[R0, #+0]
//  119             return (void *)(p + 1);
        ADDS     R0,R1,#+16
        B.N      ??malloc_6
//  120         }
//  121 
//  122         if (p == freep)
??malloc_3:
        LDR.N    R2,??DataTable1
        LDR      R2,[R2, #+0]
        CMP      R1,R2
        BNE.N    ??malloc_2
//  123             return NULL;
        MOVS     R0,#+0
??malloc_6:
        BX       LR               ;; return
//  124     }
//  125 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     freep

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     SFB(HEAP)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     SFE(HEAP)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     base

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION HEAP:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  126 
//  127 /********************************************************************/
// 
//  20 bytes in section .bss
// 224 bytes in section .text
// 
// 224 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none
