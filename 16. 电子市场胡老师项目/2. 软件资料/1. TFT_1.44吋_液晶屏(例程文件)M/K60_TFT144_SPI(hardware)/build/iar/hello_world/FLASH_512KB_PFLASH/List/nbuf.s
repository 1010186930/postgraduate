///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:43 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\driv /
//                    ers\enet\nbuf.c                                         /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\dri /
//                    vers\enet\nbuf.c" -D IAR -D TWR_K60N512 -lCN            /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\nbuf.s            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME nbuf

        #define SHT_PROGBITS 0x1

        EXTERN printf

        PUBLIC enet_fill_txbds
        PUBLIC enet_get_received_packet
        PUBLIC enet_transmit_packet
        PUBLIC nbuf_alloc
        PUBLIC nbuf_flush
        PUBLIC nbuf_init
        PUBLIC nbuf_start_rx

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\drivers\enet\nbuf.c
//    1 /* Buffer Descriptors -- must be aligned on a 4-byte boundary but a 
//    2  * 16-byte boundary is recommended. To avoid playing games with the 
//    3  * various compilers and their different extension to ANSI C, these 
//    4  * buffers are aligned by allocating an extra line of data and 
//    5  * adjusting the pointers in nbuf_init().
//    6  */
//    7 
//    8 #include "common.h"
//    9 #include "nbuf.h"
//   10 
//   11 /*FSL: to avoid overlapping, buffers must be declared at the beggining of file*/
//   12 /*then pointers can access them correctly*/
//   13 
//   14 /* Data Buffers -- must be aligned on a 16-byte boundary. To avoid 
//   15  * playing games with the various compilers and their different 
//   16  * extension to ANSI C, these buffers are aligned by allocating an 
//   17  * extra line of data and adjusting the pointers in nbuf_init().
//   18  */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 static uint8_t unaligned_txbd[(sizeof(NBUF) * NUM_TXBDS) + 16];
unaligned_txbd:
        DS8 656

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 static uint8_t unaligned_rxbd[(sizeof(NBUF) * NUM_RXBDS) + 16];
unaligned_rxbd:
        DS8 656
//   21 #ifdef USE_DEDICATED_TX_BUFFERS
//   22 static uint8_t unaligned_txbuffer[(TX_BUFFER_SIZE * NUM_TXBDS) + 16];
//   23 #endif

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 static uint8_t unaligned_rxbuffer[(RX_BUFFER_SIZE * NUM_RXBDS) + 16];
unaligned_rxbuffer:
        DS8 5136
//   25 
//   26 /* Pointers to alligned buffer descriptors */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 static NBUF *TxNBUF;
TxNBUF:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 static NBUF *RxNBUF;
RxNBUF:
        DS8 4
//   29 
//   30 /* Pointers to alligned Tx/Rx data buffers */
//   31 #ifdef USE_DEDICATED_TX_BUFFERS
//   32 static uint8_t *TxBuffer;
//   33 #endif

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 static uint8_t *RxBuffer;
RxBuffer:
        DS8 4
//   35 
//   36 /* Next BD indicators for static BD queue */ 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   37 static int next_txbd;
next_txbd:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   38 static int next_rxbd;
next_rxbd:
        DS8 4
//   39 
//   40 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   41 void 
//   42 nbuf_alloc(int ch)
//   43 {
//   44 	int i;
//   45 	//uint32_t *temp;
//   46 
//   47         next_txbd = 0;
nbuf_alloc:
        LDR.N    R0,??DataTable6
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   48         next_rxbd = 0;
        LDR.N    R0,??DataTable6_1
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   49 
//   50 	TxNBUF = (NBUF *)(((uint32_t)(unaligned_txbd)) & 0xFFFFFFF0);
        LDR.N    R0,??DataTable6_2
        LDR.N    R1,??DataTable6_3
        LSRS     R1,R1,#+4
        LSLS     R1,R1,#+4
        STR      R1,[R0, #+0]
//   51 	RxNBUF = (NBUF *)(((uint32_t)(unaligned_rxbd)) & 0xFFFFFFF0);
        LDR.N    R0,??DataTable6_4
        LDR.N    R1,??DataTable6_5
        LSRS     R1,R1,#+4
        LSLS     R1,R1,#+4
        STR      R1,[R0, #+0]
//   52 
//   53 	RxBuffer = (uint8_t *)(((uint32_t)(unaligned_rxbuffer)) & 0xFFFFFFF0);
        LDR.N    R0,??DataTable6_6
        LDR.N    R1,??DataTable6_7
        LSRS     R1,R1,#+4
        LSLS     R1,R1,#+4
        STR      R1,[R0, #+0]
//   54 #ifdef USE_DEDICATED_TX_BUFFERS
//   55 	TxBuffer = (uint8_t *)(((uint32_t)(unaligned_txbuffer)) & 0xFFFFFFF0);
//   56 #endif
//   57 	// Initialize transmit descriptor ring
//   58 	for (i = 0; i < NUM_TXBDS; i++)
        MOVS     R0,#+0
        B.N      ??nbuf_alloc_0
//   59 	{
//   60 		TxNBUF[i].status = 0x0000;
??nbuf_alloc_1:
        LSLS     R1,R0,#+5
        LDR.N    R2,??DataTable6_2
        LDR      R2,[R2, #+0]
        MOVS     R3,#+0
        STRH     R3,[R1, R2]
//   61 		TxNBUF[i].length = 0;		
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0, LSL #+5
        MOVS     R2,#+0
        STRH     R2,[R1, #+2]
//   62 	        #ifdef USE_DEDICATED_TX_BUFFERS
//   63 	           #ifdef NBUF_LITTLE_ENDIAN 
//   64 	           TxNBUF[i].data = (uint8_t *)__REV((uint32_t)&TxBuffer[i * TX_BUFFER_SIZE]);
//   65                    #else
//   66                    TxNBUF[i].data = (uint8_t *)(uint32_t)&TxBuffer[i * TX_BUFFER_SIZE];
//   67                    #endif
//   68                 #endif
//   69         
//   70                 #ifdef ENHANCED_BD
//   71                    TxNBUF[i].ebd_status = TX_BD_IINS | TX_BD_PINS;
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0, LSL #+5
        MOVS     R2,#+24
        STR      R2,[R1, #+8]
//   72                 #endif
//   73 	}
        ADDS     R0,R0,#+1
??nbuf_alloc_0:
        CMP      R0,#+20
        BLT.N    ??nbuf_alloc_1
//   74 
//   75 	// Initialize receive descriptor ring
//   76 	for (i = 0; i < NUM_RXBDS; i++)
        MOVS     R0,#+0
        B.N      ??nbuf_alloc_2
//   77 	{
//   78 		RxNBUF[i].status = RX_BD_E;
??nbuf_alloc_3:
        LSLS     R1,R0,#+5
        LDR.N    R2,??DataTable6_4
        LDR      R2,[R2, #+0]
        MOVS     R3,#+128
        STRH     R3,[R1, R2]
//   79 		RxNBUF[i].length = 0;
        LDR.N    R1,??DataTable6_4
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0, LSL #+5
        MOVS     R2,#+0
        STRH     R2,[R1, #+2]
//   80                 #ifdef NBUF_LITTLE_ENDIAN
//   81 		RxNBUF[i].data = (uint8_t *)__REV((uint32_t)&RxBuffer[i * RX_BUFFER_SIZE]);
        MOV      R1,#+256
        LDR.N    R2,??DataTable6_6
        LDR      R2,[R2, #+0]
        MLA      R1,R1,R0,R2
        REV      R1,R1
        LDR.N    R2,??DataTable6_4
        LDR      R2,[R2, #+0]
        ADDS     R2,R2,R0, LSL #+5
        STR      R1,[R2, #+4]
//   82                 #else
//   83                 RxNBUF[i].data = (uint8_t *)(uint32_t)&RxBuffer[i * RX_BUFFER_SIZE];
//   84                 #endif
//   85 
//   86                 #ifdef ENHANCED_BD
//   87 	        RxNBUF[i].bdu = 0x00000000;
        LDR.N    R1,??DataTable6_4
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0, LSL #+5
        MOVS     R2,#+0
        STR      R2,[R1, #+16]
//   88 	        RxNBUF[i].ebd_status = RX_BD_INT;
        LDR.N    R1,??DataTable6_4
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0, LSL #+5
        MOV      R2,#+32768
        STR      R2,[R1, #+8]
//   89                 #endif               
//   90 	}
        ADDS     R0,R0,#+1
??nbuf_alloc_2:
        CMP      R0,#+20
        BLT.N    ??nbuf_alloc_3
//   91         
//   92 	// Set the Wrap bit on the last one in the ring
//   93 	RxNBUF[NUM_RXBDS - 1].status |= RX_BD_W;
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        LDRH     R0,[R0, #+608]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable6_4
        LDR      R1,[R1, #+0]
        STRH     R0,[R1, #+608]
//   94 	TxNBUF[NUM_TXBDS - 1].status |= TX_BD_W;
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDRH     R0,[R0, #+608]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRH     R0,[R1, #+608]
//   95 }
        BX       LR               ;; return
//   96 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   97 void 
//   98 nbuf_flush(int ch)
//   99 {
//  100 	int i;
//  101 
//  102 	next_txbd = 0;
nbuf_flush:
        LDR.N    R0,??DataTable6
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  103 	next_rxbd = 0;
        LDR.N    R0,??DataTable6_1
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  104 	
//  105 	// Reset enet hardware bd pointers also ??
//  106 
//  107 	// Reset receive descriptor ring
//  108 	for (i = 0; i < NUM_RXBDS; i++)
        MOVS     R0,#+0
        B.N      ??nbuf_flush_0
//  109 	{
//  110 		RxNBUF[i].status = RX_BD_E;
??nbuf_flush_1:
        LSLS     R1,R0,#+5
        LDR.N    R2,??DataTable6_4
        LDR      R2,[R2, #+0]
        MOVS     R3,#+128
        STRH     R3,[R1, R2]
//  111 		RxNBUF[i].length = 0;
        LDR.N    R1,??DataTable6_4
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0, LSL #+5
        MOVS     R2,#+0
        STRH     R2,[R1, #+2]
//  112 	        #ifdef NBUF_LITTLE_ENDIAN	
//  113 		RxNBUF[i].data = (uint8_t *)__REV((uint32_t)&RxBuffer[i * RX_BUFFER_SIZE]);
        MOV      R1,#+256
        LDR.N    R2,??DataTable6_6
        LDR      R2,[R2, #+0]
        MLA      R1,R1,R0,R2
        REV      R1,R1
        LDR.N    R2,??DataTable6_4
        LDR      R2,[R2, #+0]
        ADDS     R2,R2,R0, LSL #+5
        STR      R1,[R2, #+4]
//  114 	        #else
//  115 	        RxNBUF[i].data = (uint8_t *)(uint32_t)&RxBuffer[i * RX_BUFFER_SIZE];
//  116 	        #endif	
//  117 	}
        ADDS     R0,R0,#+1
??nbuf_flush_0:
        CMP      R0,#+20
        BLT.N    ??nbuf_flush_1
//  118 
//  119 	// Reset transmit descriptor ring
//  120 	for (i = 0; i < NUM_TXBDS; i++)
        MOVS     R0,#+0
        B.N      ??nbuf_flush_2
//  121 	{
//  122 		TxNBUF[i].status = 0x0000;
??nbuf_flush_3:
        LSLS     R1,R0,#+5
        LDR.N    R2,??DataTable6_2
        LDR      R2,[R2, #+0]
        MOVS     R3,#+0
        STRH     R3,[R1, R2]
//  123 		TxNBUF[i].length = 0;
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0, LSL #+5
        MOVS     R2,#+0
        STRH     R2,[R1, #+2]
//  124 	}
        ADDS     R0,R0,#+1
??nbuf_flush_2:
        CMP      R0,#+20
        BLT.N    ??nbuf_flush_3
//  125 
//  126 	// Set the Wrap bit on the last one in the ring
//  127 	RxNBUF[NUM_RXBDS - 1].status |= RX_BD_W;
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        LDRH     R0,[R0, #+608]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable6_4
        LDR      R1,[R1, #+0]
        STRH     R0,[R1, #+608]
//  128 	TxNBUF[NUM_TXBDS - 1].status |= TX_BD_W;
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDRH     R0,[R0, #+608]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRH     R0,[R1, #+608]
//  129 }
        BX       LR               ;; return
//  130 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  131 void 
//  132 nbuf_init(int ch)
//  133 {
//  134 	// Set Receive Buffer Size
//  135 	ENET_MRBR/*(ch)*/ = (uint16_t)RX_BUFFER_SIZE;  
nbuf_init:
        LDR.N    R0,??DataTable6_8  ;; 0x400c0188
        MOV      R1,#+256
        STR      R1,[R0, #+0]
//  136   
//  137  	// Point to the start of the Tx buffer descriptor queue
//  138 	ENET_TDSR/*(ch)*/ = (uint32_t)TxNBUF;
        LDR.N    R0,??DataTable6_9  ;; 0x400c0184
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  139 	// Point to the start of the circular Rx buffer descriptor queue
//  140 	ENET_RDSR/*(ch)*/ = (uint32_t)RxNBUF;
        LDR.N    R0,??DataTable6_10  ;; 0x400c0180
        LDR.N    R1,??DataTable6_4
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  141 }
        BX       LR               ;; return
//  142 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  143 void 
//  144 nbuf_start_rx(int ch)
//  145 {
//  146         // Indicate Empty buffers have been produced
//  147 	ENET_RDAR/*(ch)*/ = ENET_RDAR_RDAR_MASK;
nbuf_start_rx:
        LDR.N    R0,??DataTable6_11  ;; 0x400c0010
        MOVS     R1,#+16777216
        STR      R1,[R0, #+0]
//  148 
//  149         while( !ENET_RDAR )
??nbuf_start_rx_0:
        LDR.N    R0,??DataTable6_11  ;; 0x400c0010
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??nbuf_start_rx_0
//  150         {
//  151           //If RDAR cannot be test,  
//  152           //printf("Error with internal ENET DMA engine\n");
//  153         }
//  154 }
        BX       LR               ;; return
//  155 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  156 void 
//  157 enet_get_received_packet(int ch, NBUF * rx_packet)
//  158 {
enet_get_received_packet:
        PUSH     {R4-R6,LR}
//  159 	int last_buffer;
//  160 	uint16_t status;
//  161 	int index_rxbd;
//  162 
//  163 	last_buffer = 0;
        MOVS     R0,#+0
//  164 	rx_packet->length = 0;
        MOVS     R3,#+0
        STRH     R3,[R1, #+2]
//  165 	
//  166 	index_rxbd = next_rxbd;
        LDR.N    R3,??DataTable6_1
        LDR      R3,[R3, #+0]
//  167     
//  168 	if(RxNBUF[index_rxbd].status & RX_BD_E)
        LSLS     R4,R3,#+5
        LDR.N    R5,??DataTable6_4
        LDR      R5,[R5, #+0]
        LDRB     R4,[R4, R5]
        LSLS     R4,R4,#+24
        BPL.N    ??enet_get_received_packet_0
//  169 	{
//  170 		printf("Under processing. SHouldnt be here\n");
        LDR.N    R0,??DataTable6_12
        BL       printf
//  171 		return;	
        B.N      ??enet_get_received_packet_1
//  172 	}
//  173         #ifdef NBUF_LITTLE_ENDIAN
//  174         rx_packet->data = (uint8_t *)__REV((uint32_t)RxNBUF[index_rxbd].data);
??enet_get_received_packet_0:
        LDR.N    R4,??DataTable6_4
        LDR      R4,[R4, #+0]
        ADDS     R4,R4,R3, LSL #+5
        LDR      R4,[R4, #+4]
        REV      R4,R4
        STR      R4,[R1, #+4]
        B.N      ??enet_get_received_packet_2
//  175         #else
//  176         rx_packet->data = (uint8_t *)(uint32_t)RxNBUF[index_rxbd].data;
//  177         #endif
//  178 	// Update next_rxbd pointer and mark buffers as empty again
//  179 	while(!last_buffer)
//  180 	{
//  181 		status = RxNBUF[index_rxbd].status;
//  182 	        #ifdef NBUF_LITTLE_ENDIAN	
//  183 		rx_packet->length = __REVSH(RxNBUF[index_rxbd].length);
//  184                 #else
//  185                 rx_packet->length = RxNBUF[index_rxbd].length;
//  186                 #endif
//  187                 #ifdef ENHANCED_BD
//  188 		rx_packet->ebd_status = RxNBUF[index_rxbd].ebd_status;
//  189 	            #ifdef NBUF_LITTLE_ENDIAN	
//  190 		    rx_packet->timestamp = __REV(RxNBUF[index_rxbd].timestamp);
//  191 		    rx_packet->length_proto_type = __REVSH(RxNBUF[index_rxbd].length_proto_type);
//  192 		    rx_packet->payload_checksum = __REVSH(RxNBUF[index_rxbd].payload_checksum);
//  193                     #else
//  194 		    rx_packet->timestamp = RxNBUF[index_rxbd].timestamp;
//  195 		    rx_packet->length_proto_type = RxNBUF[index_rxbd].length_proto_type;
//  196 		    rx_packet->payload_checksum = RxNBUF[index_rxbd].payload_checksum;
//  197                     #endif
//  198                 #endif
//  199 
//  200 		last_buffer = (status & RX_BD_L);
//  201 		if(status & RX_BD_W)
//  202 		{
//  203 			RxNBUF[index_rxbd].status = (RX_BD_W | RX_BD_E);
??enet_get_received_packet_3:
        LSLS     R3,R3,#+5
        LDR.N    R4,??DataTable6_4
        LDR      R4,[R4, #+0]
        MOVS     R5,#+160
        STRH     R5,[R3, R4]
//  204 			index_rxbd = 0;
        MOVS     R3,#+0
//  205 		}
??enet_get_received_packet_2:
        CMP      R0,#+0
        BNE.N    ??enet_get_received_packet_4
        LSLS     R0,R3,#+5
        LDR.N    R2,??DataTable6_4
        LDR      R2,[R2, #+0]
        LDRH     R2,[R0, R2]
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R3, LSL #+5
        LDRSH    R0,[R0, #+2]
        REVSH    R0,R0
        STRH     R0,[R1, #+2]
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R3, LSL #+5
        LDR      R0,[R0, #+8]
        STR      R0,[R1, #+8]
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R3, LSL #+5
        LDR      R0,[R0, #+20]
        REV      R0,R0
        STR      R0,[R1, #+20]
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R3, LSL #+5
        LDRSH    R0,[R0, #+12]
        REVSH    R0,R0
        STRH     R0,[R1, #+12]
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R3, LSL #+5
        LDRSH    R0,[R0, #+14]
        REVSH    R0,R0
        STRH     R0,[R1, #+14]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ANDS     R0,R2,#0x8
        LSLS     R4,R2,#+26
        BMI.N    ??enet_get_received_packet_3
//  206 		else
//  207 		{
//  208 			RxNBUF[index_rxbd].status = RX_BD_E;
        LSLS     R4,R3,#+5
        LDR.N    R5,??DataTable6_4
        LDR      R5,[R5, #+0]
        MOVS     R6,#+128
        STRH     R6,[R4, R5]
//  209 			index_rxbd++;
        ADDS     R3,R3,#+1
        B.N      ??enet_get_received_packet_2
//  210 		}
//  211 	}
//  212 	
//  213 	// Update the global rxbd index
//  214 	next_rxbd = index_rxbd;
??enet_get_received_packet_4:
        LDR.N    R0,??DataTable6_1
        STR      R3,[R0, #+0]
//  215 	
//  216 	// Put the last BD status in rx_packet->status as MISS flags and more 
//  217 	// are updated in last BD
//  218 	rx_packet->status = status;
        STRH     R2,[R1, #+0]
//  219 }
??enet_get_received_packet_1:
        POP      {R4-R6,PC}       ;; return
//  220 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  221 void enet_fill_txbds(int ch, NBUF * tx_packet)
//  222 {
enet_fill_txbds:
        PUSH     {R4-R6}
//  223 	int num_txbds, i;
//  224 	int index_txbd;
//  225 
//  226 	num_txbds = (tx_packet->length/TX_BUFFER_SIZE);
        LDRH     R0,[R1, #+2]
        MOV      R2,#+256
        SDIV     R0,R0,R2
//  227 	
//  228 	index_txbd = next_txbd;
        LDR.N    R2,??DataTable6
        LDR      R2,[R2, #+0]
//  229 	
//  230 	if((num_txbds * TX_BUFFER_SIZE) < tx_packet->length)
        MOV      R3,#+256
        MUL      R3,R3,R0
        LDRH     R4,[R1, #+2]
        CMP      R3,R4
        BGE.N    ??enet_fill_txbds_0
//  231 	{
//  232 		num_txbds = num_txbds + 1;
        ADDS     R0,R0,#+1
//  233 	}
//  234     
//  235 	// Fill Descriptors
//  236 	for (i = 0; i < num_txbds; i++)
??enet_fill_txbds_0:
        MOVS     R3,#+0
        B.N      ??enet_fill_txbds_1
//  237 	{
//  238 		
//  239 		TxNBUF[index_txbd].status = TX_BD_TC | TX_BD_R;
//  240                 #ifdef ENHANCED_BD
//  241 		TxNBUF[index_txbd].bdu = 0x00000000;
//  242 		TxNBUF[index_txbd].ebd_status = TX_BD_INT | TX_BD_TS;// | TX_BD_IINS | TX_BD_PINS;
//  243                 #endif
//  244 
//  245 		if(i == num_txbds - 1)
//  246 		{
//  247 		    #ifdef NBUF_LITTLE_ENDIAN 
//  248 		    TxNBUF[index_txbd].length = __REVSH((tx_packet->length - (i*TX_BUFFER_SIZE)));
//  249                     #else
//  250                     TxNBUF[index_txbd].length = (tx_packet->length - (i*TX_BUFFER_SIZE));
//  251                     #endif
//  252 		    // Set the Last bit on the last BD
//  253 		    TxNBUF[index_txbd].status |= TX_BD_L;		 
//  254 		}
//  255 		else
//  256 		{
//  257 		    #ifdef NBUF_LITTLE_ENDIAN 
//  258 		    TxNBUF[index_txbd].length = __REVSH(TX_BUFFER_SIZE);
??enet_fill_txbds_2:
        LDR.N    R4,??DataTable6_2
        LDR      R4,[R4, #+0]
        ADDS     R4,R4,R2, LSL #+5
        MOVS     R5,#+1
        STRH     R5,[R4, #+2]
//  259 		    #else
//  260 		    TxNBUF[index_txbd].length = TX_BUFFER_SIZE;
//  261 		    #endif
//  262 		}
//  263 		
//  264 		#ifdef USE_DEDICATED_TX_BUFFERS
//  265 		  #ifdef NBUF_LITTLE_ENDIAN
//  266 		  //Copy data to Tx buffers
//  267                    memcpy((void *)__REV((uint32_t)TxNBUF[index_txbd].data), (void *)(((uint32_t)(tx_packet->data)) + (i*TX_BUFFER_SIZE)),
//  268                           __REVSH(TxNBUF[index_txbd].length));  
//  269                   #else
//  270 		  // Copy data to Tx buffers
//  271                   memcpy((void *)(uint32_t)TxNBUF[index_txbd].data, (void *)(((uint32_t)(tx_packet->data)) + (i*TX_BUFFER_SIZE)),
//  272                           TxNBUF[index_txbd].length);         
//  273                   #endif
//  274                 #else
//  275                   // Just update data pointer as data is aready there
//  276                   #ifdef NBUF_LITTLE_ENDIAN 
//  277                   TxNBUF[index_txbd].data = (uint8_t *)__REV((((uint32_t)(tx_packet->data)) + (i*TX_BUFFER_SIZE)));
??enet_fill_txbds_3:
        LDR      R4,[R1, #+4]
        MOV      R5,#+256
        MLA      R4,R5,R3,R4
        REV      R4,R4
        LDR.N    R5,??DataTable6_2
        LDR      R5,[R5, #+0]
        ADDS     R5,R5,R2, LSL #+5
        STR      R4,[R5, #+4]
//  278                   #else
//  279                   TxNBUF[index_txbd].data = (uint8_t *)(((uint32_t)(tx_packet->data)) + (i*TX_BUFFER_SIZE));
//  280                   #endif 
//  281                 #endif
//  282 
//  283 		// Wrap if this was last TxBD
//  284 		if(++index_txbd == NUM_TXBDS)
        ADDS     R2,R2,#+1
        CMP      R2,#+20
        BNE.N    ??enet_fill_txbds_4
//  285 		{
//  286 			TxNBUF[NUM_TXBDS - 1].status |= TX_BD_W;
        LDR.N    R2,??DataTable6_2
        LDR      R2,[R2, #+0]
        LDRH     R2,[R2, #+608]
        ORRS     R2,R2,#0x20
        LDR.N    R4,??DataTable6_2
        LDR      R4,[R4, #+0]
        STRH     R2,[R4, #+608]
//  287 			index_txbd = 0;
        MOVS     R2,#+0
//  288 		}
??enet_fill_txbds_4:
        ADDS     R3,R3,#+1
??enet_fill_txbds_1:
        CMP      R3,R0
        BGE.N    ??enet_fill_txbds_5
        LSLS     R4,R2,#+5
        LDR.N    R5,??DataTable6_2
        LDR      R5,[R5, #+0]
        MOVS     R6,#+132
        STRH     R6,[R4, R5]
        LDR.N    R4,??DataTable6_2
        LDR      R4,[R4, #+0]
        ADDS     R4,R4,R2, LSL #+5
        MOVS     R5,#+0
        STR      R5,[R4, #+16]
        LDR.N    R4,??DataTable6_2
        LDR      R4,[R4, #+0]
        ADDS     R4,R4,R2, LSL #+5
        MOVS     R5,#+96
        STR      R5,[R4, #+8]
        SUBS     R4,R0,#+1
        CMP      R3,R4
        BNE.N    ??enet_fill_txbds_2
        LDRH     R4,[R1, #+2]
        MOV      R5,#+256
        MLS      R4,R5,R3,R4
        REVSH    R4,R4
        LDR.N    R5,??DataTable6_2
        LDR      R5,[R5, #+0]
        ADDS     R5,R5,R2, LSL #+5
        STRH     R4,[R5, #+2]
        LSLS     R4,R2,#+5
        LDR.N    R5,??DataTable6_2
        LDR      R5,[R5, #+0]
        LDRH     R4,[R4, R5]
        ORRS     R4,R4,#0x8
        LSLS     R5,R2,#+5
        LDR.N    R6,??DataTable6_2
        LDR      R6,[R6, #+0]
        STRH     R4,[R5, R6]
        B.N      ??enet_fill_txbds_3
//  289 	}
//  290 	
//  291 	// Update the global txbd index
//  292 	next_txbd = index_txbd;
??enet_fill_txbds_5:
        LDR.N    R0,??DataTable6
        STR      R2,[R0, #+0]
//  293 }
        POP      {R4-R6}
        BX       LR               ;; return
//  294 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  295 void 
//  296 enet_transmit_packet(int ch, NBUF * tx_packet)
//  297 {
enet_transmit_packet:
        PUSH     {R7,LR}
//  298 	enet_fill_txbds(ch,tx_packet);
        BL       enet_fill_txbds
//  299 	
//  300 	// Indicate that Descriptors are ready to transmit 
//  301 	ENET_TDAR/*(ch)*/ = ENET_TDAR_TDAR_MASK;
        LDR.N    R0,??DataTable6_13  ;; 0x400c0014
        MOVS     R1,#+16777216
        STR      R1,[R0, #+0]
//  302 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     next_txbd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     next_rxbd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     TxNBUF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     unaligned_txbd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     RxNBUF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     unaligned_rxbd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     RxBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     unaligned_rxbuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0x400c0188

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     0x400c0184

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     0x400c0180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     0x400c0010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     `?<Constant "Under processing. SHo...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     0x400c0014

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Under processing. SHo...">`:
        DATA
        DC8 "Under processing. SHouldnt be here\012"

        END
//  303 /********************************************************************/
// 
// 6 468 bytes in section .bss
//    36 bytes in section .rodata
//   842 bytes in section .text
// 
//   842 bytes of CODE  memory
//    36 bytes of CONST memory
// 6 468 bytes of DATA  memory
//
//Errors: none
//Warnings: none
