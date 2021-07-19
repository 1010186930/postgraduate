///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:43 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\comm /
//                    on\queue.c                                              /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\com /
//                    mon\queue.c" -D IAR -D TWR_K60N512 -lCN                 /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\queue.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME queue

        #define SHT_PROGBITS 0x1

        PUBLIC queue_add
        PUBLIC queue_init
        PUBLIC queue_isempty
        PUBLIC queue_move
        PUBLIC queue_peek
        PUBLIC queue_remove

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\common\queue.c
//    1 /*
//    2  * File:    queue.c
//    3  * Purpose: Implement a first in, first out linked list
//    4  *
//    5  * Notes:   
//    6  */
//    7 
//    8 #include "common.h"
//    9 #include "queue.h"
//   10 
//   11 /********************************************************************/
//   12 /* 
//   13  * Initialize the specified queue to an empty state
//   14  * 
//   15  * Parameters:
//   16  *  q   Pointer to queue structure
//   17  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   18 void
//   19 queue_init(QUEUE *q)
//   20 {
//   21     q->head = NULL;
queue_init:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   22 }
        BX       LR               ;; return
//   23 /********************************************************************/
//   24 /* 
//   25  * Check for an empty queue
//   26  *
//   27  * Parameters:
//   28  *  q       Pointer to queue structure
//   29  * 
//   30  * Return Value:
//   31  *  1 if Queue is empty
//   32  *  0 otherwise
//   33  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   34 int
//   35 queue_isempty(QUEUE *q)
//   36 {
//   37     return (q->head == NULL);
queue_isempty:
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??queue_isempty_0
        MOVS     R0,#+1
        B.N      ??queue_isempty_1
??queue_isempty_0:
        MOVS     R0,#+0
??queue_isempty_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//   38 }
//   39 /********************************************************************/
//   40 /* 
//   41  * Add an item to the end of the queue 
//   42  *
//   43  * Parameters:
//   44  *  q       Pointer to queue structure
//   45  *  node    New node to add to the queue
//   46  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   47 void
//   48 queue_add(QUEUE *q, QNODE *node)
//   49 {
queue_add:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   50     if (queue_isempty(q))
        MOVS     R0,R4
        BL       queue_isempty
        CMP      R0,#+0
        BEQ.N    ??queue_add_0
//   51     {
//   52         q->head = q->tail = node;
        STR      R5,[R4, #+4]
        STR      R5,[R4, #+0]
        B.N      ??queue_add_1
//   53     }
//   54     else
//   55     {
//   56         q->tail->next = node;
??queue_add_0:
        LDR      R0,[R4, #+4]
        STR      R5,[R0, #+0]
//   57         q->tail = node;
        STR      R5,[R4, #+4]
//   58     }
//   59     
//   60     node->next = NULL;
??queue_add_1:
        MOVS     R0,#+0
        STR      R0,[R5, #+0]
//   61 }
        POP      {R0,R4,R5,PC}    ;; return
//   62 
//   63 /********************************************************************/
//   64 /* 
//   65  * Remove and return first (oldest) entry from the specified queue 
//   66  *
//   67  * Parameters:
//   68  *  q       Pointer to queue structure
//   69  *
//   70  * Return Value:
//   71  *  Node at head of queue - NULL if queue is empty
//   72  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   73 QNODE*
//   74 queue_remove(QUEUE *q)
//   75 {
queue_remove:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   76     QNODE *oldest;
//   77     
//   78     if (queue_isempty(q))
        MOVS     R0,R4
        BL       queue_isempty
        CMP      R0,#+0
        BEQ.N    ??queue_remove_0
//   79         return NULL;
        MOVS     R0,#+0
        B.N      ??queue_remove_1
//   80     
//   81     oldest = q->head;
??queue_remove_0:
        LDR      R0,[R4, #+0]
//   82     q->head = oldest->next;
        LDR      R1,[R0, #+0]
        STR      R1,[R4, #+0]
//   83     return oldest;
??queue_remove_1:
        POP      {R4,PC}          ;; return
//   84 }
//   85 /********************************************************************/
//   86 /* 
//   87  * Peek into the queue and return pointer to first (oldest) entry.
//   88  * The queue is not modified
//   89  *
//   90  * Parameters:
//   91  *  q       Pointer to queue structure
//   92  *
//   93  * Return Value:
//   94  *  Node at head of queue - NULL if queue is empty
//   95  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   96 QNODE*
//   97 queue_peek(QUEUE *q)
//   98 {
//   99     return q->head;
queue_peek:
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
//  100 }
//  101 /********************************************************************/
//  102 /* 
//  103  * Move entire contents of one queue to the other
//  104  *
//  105  * Parameters:
//  106  *  src     Pointer to source queue
//  107  *  dst     Pointer to destination queue
//  108  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  109 void
//  110 queue_move(QUEUE *dst, QUEUE *src)
//  111 {
queue_move:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  112     if (queue_isempty(src))
        MOVS     R0,R5
        BL       queue_isempty
        CMP      R0,#+0
        BNE.N    ??queue_move_0
//  113         return;
//  114     
//  115     if (queue_isempty(dst))
??queue_move_1:
        MOVS     R0,R4
        BL       queue_isempty
        CMP      R0,#+0
        BEQ.N    ??queue_move_2
//  116         dst->head = src->head;
        LDR      R0,[R5, #+0]
        STR      R0,[R4, #+0]
        B.N      ??queue_move_3
//  117     else
//  118         dst->tail->next = src->head;
??queue_move_2:
        LDR      R0,[R4, #+4]
        LDR      R1,[R5, #+0]
        STR      R1,[R0, #+0]
//  119 
//  120     dst->tail = src->tail;
??queue_move_3:
        LDR      R0,[R5, #+4]
        STR      R0,[R4, #+4]
//  121     src->head = NULL;
        MOVS     R0,#+0
        STR      R0,[R5, #+0]
//  122     return;
??queue_move_0:
        POP      {R0,R4,R5,PC}    ;; return
//  123 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  124 /********************************************************************/
// 
// 134 bytes in section .text
// 
// 134 bytes of CODE memory
//
//Errors: none
//Warnings: none
