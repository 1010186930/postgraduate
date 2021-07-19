///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:43 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\comm /
//                    on\memtest.c                                            /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\com /
//                    mon\memtest.c" -D IAR -D TWR_K60N512 -lCN               /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\memtest.s         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME memtest

        #define SHT_PROGBITS 0x1

        PUBLIC memTestAddressBus
        PUBLIC memTestDataBus
        PUBLIC memTestDevice

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\common\memtest.c
//    1 /**********************************************************************
//    2  *
//    3  * Filename:    memtest.c
//    4  * 
//    5  * Description: General-purpose memory testing functions.
//    6  *
//    7  * Notes:       This software can be easily ported to systems with
//    8  *              different data bus widths by redefining 'datum'.
//    9  *
//   10  * 
//   11  * Copyright (c) 1998 by Michael Barr.  This software is placed into
//   12  * the public domain and may be used for any purpose.  However, this
//   13  * notice must not be changed or removed and no warranty is either
//   14  * expressed or implied by its publication or distribution.
//   15  **********************************************************************/
//   16 
//   17 
//   18 #include "memtest.h"
//   19 
//   20 
//   21 /**********************************************************************
//   22  *
//   23  * Function:    memTestDataBus()
//   24  *
//   25  * Description: Test the data bus wiring in a memory region by
//   26  *              performing a walking 1's test at a fixed address
//   27  *              within that region.  The address (and hence the
//   28  *              memory region) is selected by the caller.
//   29  *
//   30  * Notes:       
//   31  *
//   32  * Returns:     0 if the test succeeds.  
//   33  *              A non-zero result is the first pattern that failed.
//   34  *
//   35  **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 datum
//   37 memTestDataBus(volatile datum * address)
//   38 {
//   39     datum pattern;
//   40 
//   41 
//   42     /*
//   43      * Perform a walking 1's test at the given address.
//   44      */
//   45     for (pattern = 1; pattern != 0; pattern <<= 1)
memTestDataBus:
        MOVS     R1,#+1
        B.N      ??memTestDataBus_0
??memTestDataBus_1:
        LSLS     R1,R1,#+1
??memTestDataBus_0:
        CMP      R1,#+0
        BEQ.N    ??memTestDataBus_2
//   46     {
//   47         /*
//   48          * Write the test pattern.
//   49          */
//   50         *address = pattern;
        STR      R1,[R0, #+0]
//   51 
//   52         /*
//   53          * Read it back (immediately is okay for this test).
//   54          */
//   55         if (*address != pattern) 
        LDR      R2,[R0, #+0]
        CMP      R2,R1
        BEQ.N    ??memTestDataBus_1
//   56         {
//   57             return (pattern);
        MOVS     R0,R1
        B.N      ??memTestDataBus_3
//   58         }
//   59     }
//   60 
//   61     return (0);
??memTestDataBus_2:
        MOVS     R0,#+0
??memTestDataBus_3:
        BX       LR               ;; return
//   62 
//   63 }   /* memTestDataBus() */
//   64 
//   65 
//   66 /**********************************************************************
//   67  *
//   68  * Function:    memTestAddressBus()
//   69  *
//   70  * Description: Test the address bus wiring in a memory region by
//   71  *              performing a walking 1's test on the relevant bits
//   72  *              of the address and checking for aliasing. This test
//   73  *              will find single-bit address failures such as stuck
//   74  *              -high, stuck-low, and shorted pins.  The base address
//   75  *              and size of the region are selected by the caller.
//   76  *
//   77  * Notes:       For best results, the selected base address should
//   78  *              have enough LSB 0's to guarantee single address bit
//   79  *              changes.  For example, to test a 64-Kbyte region, 
//   80  *              select a base address on a 64-Kbyte boundary.  Also, 
//   81  *              select the region size as a power-of-two--if at all 
//   82  *              possible.
//   83  *
//   84  * Returns:     NULL if the test succeeds.  
//   85  *              A non-zero result is the first address at which an
//   86  *              aliasing problem was uncovered.  By examining the
//   87  *              contents of memory, it may be possible to gather
//   88  *              additional information about the problem.
//   89  *
//   90  **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   91 datum * 
//   92 memTestAddressBus(volatile datum * baseAddress, unsigned long nBytes)
//   93 {
memTestAddressBus:
        PUSH     {R4-R6}
//   94     unsigned long addressMask = (nBytes/sizeof(datum) - 1);
        LSRS     R1,R1,#+2
        SUBS     R1,R1,#+1
//   95     unsigned long offset;
//   96     unsigned long testOffset;
//   97 
//   98     datum pattern     = (datum) 0xAAAAAAAA;
        MOVS     R4,#-1431655766
//   99     datum antipattern = (datum) 0x55555555;
        MOVS     R5,#+1431655765
//  100 
//  101 
//  102     /*
//  103      * Write the default pattern at each of the power-of-two offsets.
//  104      */
//  105     for (offset = 1; (offset & addressMask) != 0; offset <<= 1)
        MOVS     R2,#+1
        B.N      ??memTestAddressBus_0
//  106     {
//  107         baseAddress[offset] = pattern;
??memTestAddressBus_1:
        STR      R4,[R0, R2, LSL #+2]
//  108     }
        LSLS     R2,R2,#+1
??memTestAddressBus_0:
        TST      R2,R1
        BNE.N    ??memTestAddressBus_1
//  109 
//  110     /* 
//  111      * Check for address bits stuck high.
//  112      */
//  113     testOffset = 0;
        MOVS     R3,#+0
//  114     baseAddress[testOffset] = antipattern;
        STR      R5,[R0, R3, LSL #+2]
//  115 
//  116     for (offset = 1; (offset & addressMask) != 0; offset <<= 1)
        MOVS     R2,#+1
        B.N      ??memTestAddressBus_2
??memTestAddressBus_3:
        LSLS     R2,R2,#+1
??memTestAddressBus_2:
        TST      R2,R1
        BEQ.N    ??memTestAddressBus_4
//  117     {
//  118         if (baseAddress[offset] != pattern)
        LDR      R6,[R0, R2, LSL #+2]
        CMP      R6,R4
        BEQ.N    ??memTestAddressBus_3
//  119         {
//  120             return ((datum *) &baseAddress[offset]);
        ADDS     R0,R0,R2, LSL #+2
        B.N      ??memTestAddressBus_5
//  121         }
//  122     }
//  123 
//  124     baseAddress[testOffset] = pattern;
??memTestAddressBus_4:
        STR      R4,[R0, R3, LSL #+2]
//  125 
//  126     /*
//  127      * Check for address bits stuck low or shorted.
//  128      */
//  129     for (testOffset = 1; (testOffset & addressMask) != 0; testOffset <<= 1)
        MOVS     R3,#+1
        B.N      ??memTestAddressBus_6
//  130     {
//  131         baseAddress[testOffset] = antipattern;
//  132 
//  133 		if (baseAddress[0] != pattern)
//  134 		{
//  135 			return ((datum *) &baseAddress[testOffset]);
//  136 		}
//  137 
//  138         for (offset = 1; (offset & addressMask) != 0; offset <<= 1)
//  139         {
//  140             if ((baseAddress[offset] != pattern) && (offset != testOffset))
//  141             {
//  142                 return ((datum *) &baseAddress[testOffset]);
//  143             }
//  144         }
//  145 
//  146         baseAddress[testOffset] = pattern;
??memTestAddressBus_7:
        STR      R4,[R0, R3, LSL #+2]
        LSLS     R3,R3,#+1
??memTestAddressBus_6:
        TST      R3,R1
        BEQ.N    ??memTestAddressBus_8
        STR      R5,[R0, R3, LSL #+2]
        LDR      R2,[R0, #+0]
        CMP      R2,R4
        BEQ.N    ??memTestAddressBus_9
        ADDS     R0,R0,R3, LSL #+2
        B.N      ??memTestAddressBus_5
??memTestAddressBus_9:
        MOVS     R2,#+1
        B.N      ??memTestAddressBus_10
??memTestAddressBus_11:
        LSLS     R2,R2,#+1
??memTestAddressBus_10:
        TST      R2,R1
        BEQ.N    ??memTestAddressBus_7
        LDR      R6,[R0, R2, LSL #+2]
        CMP      R6,R4
        BEQ.N    ??memTestAddressBus_11
        CMP      R2,R3
        BEQ.N    ??memTestAddressBus_11
        ADDS     R0,R0,R3, LSL #+2
        B.N      ??memTestAddressBus_5
//  147     }
//  148 
//  149     return (NULL);
??memTestAddressBus_8:
        MOVS     R0,#+0
??memTestAddressBus_5:
        POP      {R4-R6}
        BX       LR               ;; return
//  150 
//  151 }   /* memTestAddressBus() */
//  152 
//  153 
//  154 /**********************************************************************
//  155  *
//  156  * Function:    memTestDevice()
//  157  *
//  158  * Description: Test the integrity of a physical memory device by
//  159  *              performing an increment/decrement test over the
//  160  *              entire region.  In the process every storage bit 
//  161  *              in the device is tested as a zero and a one.  The
//  162  *              base address and the size of the region are
//  163  *              selected by the caller.
//  164  *
//  165  * Notes:       
//  166  *
//  167  * Returns:     NULL if the test succeeds.
//  168  *
//  169  *              A non-zero result is the first address at which an
//  170  *              incorrect value was read back.  By examining the
//  171  *              contents of memory, it may be possible to gather
//  172  *              additional information about the problem.
//  173  *
//  174  **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  175 datum * 
//  176 memTestDevice(volatile datum * baseAddress, unsigned long nBytes)	
//  177 {
memTestDevice:
        PUSH     {R4,R5}
//  178     unsigned long offset;
//  179     unsigned long nWords = nBytes / sizeof(datum);
        LSRS     R2,R1,#+2
//  180 
//  181     datum pattern;
//  182     datum antipattern;
//  183 
//  184 
//  185     /*
//  186      * Fill memory with a known pattern.
//  187      */
//  188     for (pattern = 1, offset = 0; offset < nWords; pattern++, offset++)
        MOVS     R3,#+1
        MOVS     R1,#+0
        B.N      ??memTestDevice_0
//  189     {
//  190         baseAddress[offset] = pattern;
??memTestDevice_1:
        STR      R3,[R0, R1, LSL #+2]
//  191     }
        ADDS     R3,R3,#+1
        ADDS     R1,R1,#+1
??memTestDevice_0:
        CMP      R1,R2
        BCC.N    ??memTestDevice_1
//  192 
//  193     /*
//  194      * Check each location and invert it for the second pass.
//  195      */
//  196     for (pattern = 1, offset = 0; offset < nWords; pattern++, offset++)
        MOVS     R3,#+1
        MOVS     R1,#+0
        B.N      ??memTestDevice_2
//  197     {
//  198         if (baseAddress[offset] != pattern)
//  199         {
//  200             return ((datum *) &baseAddress[offset]);
//  201         }
//  202 
//  203         antipattern = ~pattern;
??memTestDevice_3:
        MVNS     R4,R3
//  204         baseAddress[offset] = antipattern;
        STR      R4,[R0, R1, LSL #+2]
        ADDS     R3,R3,#+1
        ADDS     R1,R1,#+1
??memTestDevice_2:
        CMP      R1,R2
        BCS.N    ??memTestDevice_4
        LDR      R4,[R0, R1, LSL #+2]
        CMP      R4,R3
        BEQ.N    ??memTestDevice_3
        ADDS     R0,R0,R1, LSL #+2
        B.N      ??memTestDevice_5
//  205     }
//  206 
//  207     /*
//  208      * Check each location for the inverted pattern and zero it.
//  209      */
//  210     for (pattern = 1, offset = 0; offset < nWords; pattern++, offset++)
??memTestDevice_4:
        MOVS     R3,#+1
        MOVS     R1,#+0
        B.N      ??memTestDevice_6
??memTestDevice_7:
        ADDS     R3,R3,#+1
        ADDS     R1,R1,#+1
??memTestDevice_6:
        CMP      R1,R2
        BCS.N    ??memTestDevice_8
//  211     {
//  212         antipattern = ~pattern;
        MVNS     R4,R3
//  213         if (baseAddress[offset] != antipattern)
        LDR      R5,[R0, R1, LSL #+2]
        CMP      R5,R4
        BEQ.N    ??memTestDevice_7
//  214         {
//  215             return ((datum *) &baseAddress[offset]);
        ADDS     R0,R0,R1, LSL #+2
        B.N      ??memTestDevice_5
//  216         }
//  217     }
//  218 
//  219     return (NULL);
??memTestDevice_8:
        MOVS     R0,#+0
??memTestDevice_5:
        POP      {R4,R5}
        BX       LR               ;; return
//  220 
//  221 }   /* memTestDevice() */

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 244 bytes in section .text
// 
// 244 bytes of CODE memory
//
//Errors: none
//Warnings: none
