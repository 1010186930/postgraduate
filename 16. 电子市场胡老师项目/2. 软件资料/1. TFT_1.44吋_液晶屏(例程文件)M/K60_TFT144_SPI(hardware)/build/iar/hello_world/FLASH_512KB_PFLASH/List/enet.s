///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:42 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\driv /
//                    ers\enet\enet.c                                         /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\dri /
//                    vers\enet\enet.c" -D IAR -D TWR_K60N512 -lCN            /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\enet.s            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME enet

        #define SHT_PROGBITS 0x1

        PUBLIC enet_duplex
        PUBLIC enet_hash_address
        PUBLIC enet_init
        PUBLIC enet_mib_dump
        PUBLIC enet_mib_init
        PUBLIC enet_reset
        PUBLIC enet_set_address
        PUBLIC enet_start
        PUBLIC enet_wait_for_frame_receive

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\drivers\enet\enet.c
//    1 /*
//    2  * File:    enet.c
//    3  * Purpose: Driver for the ENET controller
//    4  *
//    5  * Notes:
//    6  */
//    7 
//    8 #include "common.h"
//    9 #include "enet.h"
//   10 #include "nbuf.h"
//   11 #include "eth.h"
//   12 
//   13 
//   14 /********************************************************************/
//   15 /* Initialize the MIB counters
//   16  *
//   17  * Parameters:
//   18  *  ch      FEC channel
//   19  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   20 void
//   21 enet_mib_init(int ch)
//   22 {
//   23 //To do
//   24 }
enet_mib_init:
        BX       LR               ;; return
//   25 /********************************************************************/
//   26 /* Display the MIB counters
//   27  *
//   28  * Parameters:
//   29  *  ch      FEC channel
//   30  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   31 void
//   32 enet_mib_dump(int ch)
//   33 {
//   34 //To do
//   35 }
enet_mib_dump:
        BX       LR               ;; return
//   36 /********************************************************************/
//   37 /*
//   38  * Set the duplex on the selected FEC controller
//   39  *
//   40  * Parameters:
//   41  *  ch      FEC channel
//   42  *  duplex  enet_MII_FULL_DUPLEX or enet_MII_HALF_DUPLEX
//   43  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void
//   45 enet_duplex (int ch, ENET_DUPLEX duplex)
//   46 {
//   47     switch (duplex)
enet_duplex:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??enet_duplex_0
//   48     {
//   49         case MII_HDX:
//   50             ENET_RCR/*(ch)*/ |= ENET_RCR_DRT_MASK;
        LDR.N    R0,??DataTable6  ;; 0x400c0084
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable6  ;; 0x400c0084
        STR      R0,[R1, #+0]
//   51             ENET_TCR/*(ch)*/ &= (uint32_t)~ENET_TCR_FDEN_MASK;
        LDR.N    R0,??DataTable6_1  ;; 0x400c00c4
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_1  ;; 0x400c00c4
        STR      R0,[R1, #+0]
//   52             break;
        B.N      ??enet_duplex_1
//   53         case MII_FDX:
//   54         default:
//   55             ENET_RCR/*(ch)*/ &= ~ENET_RCR_DRT_MASK;
??enet_duplex_0:
        LDR.N    R0,??DataTable6  ;; 0x400c0084
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.N    R1,??DataTable6  ;; 0x400c0084
        STR      R0,[R1, #+0]
//   56             ENET_TCR/*(ch)*/ |= ENET_TCR_FDEN_MASK;
        LDR.N    R0,??DataTable6_1  ;; 0x400c00c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_1  ;; 0x400c00c4
        STR      R0,[R1, #+0]
//   57             break;
//   58     }
//   59 }
??enet_duplex_1:
        BX       LR               ;; return
//   60 
//   61 /********************************************************************/
//   62 /*
//   63  * Generate the hash table settings for the given address
//   64  *
//   65  * Parameters:
//   66  *  addr    48-bit (6 byte) Address to generate the hash for
//   67  *
//   68  * Return Value:
//   69  *  The 6 most significant bits of the 32-bit CRC result
//   70  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   71 uint8_t
//   72 enet_hash_address(const uint8_t* addr)
//   73 {
enet_hash_address:
        PUSH     {R4-R6}
//   74     uint32_t crc;
//   75     uint8_t byte;
//   76     int i, j;
//   77 
//   78     crc = 0xFFFFFFFF;
        MOVS     R1,#-1
//   79     for(i=0; i<6; ++i)
        MOVS     R3,#+0
        B.N      ??enet_hash_address_0
??enet_hash_address_1:
        ADDS     R3,R3,#+1
??enet_hash_address_0:
        CMP      R3,#+6
        BGE.N    ??enet_hash_address_2
//   80     {
//   81         byte = addr[i];
        LDRB     R2,[R3, R0]
//   82         for(j=0; j<8; ++j)
        MOVS     R4,#+0
        B.N      ??enet_hash_address_3
//   83         {
//   84             if((byte & 0x01)^(crc & 0x01))
//   85             {
//   86                 crc >>= 1;
//   87                 crc = crc ^ 0xEDB88320;
//   88             }
//   89             else
//   90                 crc >>= 1;
??enet_hash_address_4:
        LSRS     R1,R1,#+1
//   91             byte >>= 1;
??enet_hash_address_5:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSRS     R2,R2,#+1
        ADDS     R4,R4,#+1
??enet_hash_address_3:
        CMP      R4,#+8
        BGE.N    ??enet_hash_address_1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ANDS     R5,R2,#0x1
        ANDS     R6,R1,#0x1
        EORS     R5,R6,R5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??enet_hash_address_4
        LSRS     R1,R1,#+1
        LDR.N    R5,??DataTable6_2  ;; 0xedb88320
        EORS     R1,R5,R1
        B.N      ??enet_hash_address_5
//   92         }
//   93     }
//   94     return (uint8_t)(crc >> 26);
??enet_hash_address_2:
        LSRS     R0,R1,#+26
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6}
        BX       LR               ;; return
//   95 }
//   96 /********************************************************************/
//   97 /*
//   98  * Set the Physical (Hardware) Address and the Individual Address
//   99  * Hash in the selected FEC
//  100  *
//  101  * Parameters:
//  102  *  ch  FEC channel
//  103  *  pa  Physical (Hardware) Address for the selected FEC
//  104  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  105 void
//  106 enet_set_address (int ch, const uint8_t *pa)
//  107 {
enet_set_address:
        PUSH     {R7,LR}
//  108     uint8_t crc;
//  109 
//  110     /*
//  111      * Set the Physical Address
//  112      */
//  113     ENET_PALR/*(ch)*/ = (uint32_t)((pa[0]<<24) | (pa[1]<<16) | (pa[2]<<8) | pa[3]);
        LDRB     R0,[R1, #+0]
        LDRB     R2,[R1, #+1]
        LSLS     R2,R2,#+16
        ORRS     R0,R2,R0, LSL #+24
        LDRB     R2,[R1, #+2]
        ORRS     R0,R0,R2, LSL #+8
        LDRB     R2,[R1, #+3]
        ORRS     R0,R2,R0
        LDR.N    R2,??DataTable6_3  ;; 0x400c00e4
        STR      R0,[R2, #+0]
//  114     ENET_PAUR/*(ch)*/ = (uint32_t)((pa[4]<<24) | (pa[5]<<16));
        LDRB     R0,[R1, #+4]
        LDRB     R2,[R1, #+5]
        LSLS     R2,R2,#+16
        ORRS     R0,R2,R0, LSL #+24
        LDR.N    R2,??DataTable6_4  ;; 0x400c00e8
        STR      R0,[R2, #+0]
//  115 
//  116     /*
//  117      * Calculate and set the hash for given Physical Address
//  118      * in the  Individual Address Hash registers
//  119      */
//  120     crc = enet_hash_address(pa);
        MOVS     R0,R1
        BL       enet_hash_address
//  121     if(crc >= 32)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+32
        BCC.N    ??enet_set_address_0
//  122         ENET_IAUR/*(ch)*/ |= (uint32_t)(1 << (crc - 32));
        LDR.N    R1,??DataTable6_5  ;; 0x400c0118
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        SUBS     R0,R0,#+32
        LSLS     R0,R2,R0
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable6_5  ;; 0x400c0118
        STR      R0,[R1, #+0]
        B.N      ??enet_set_address_1
//  123     else
//  124         ENET_IALR/*(ch)*/ |= (uint32_t)(1 << crc);
??enet_set_address_0:
        LDR.N    R1,??DataTable6_6  ;; 0x400c011c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R0,R2,R0
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable6_6  ;; 0x400c011c
        STR      R0,[R1, #+0]
//  125 }
??enet_set_address_1:
        POP      {R0,PC}          ;; return
//  126 /********************************************************************/
//  127 /*
//  128  * Reset the selected FEC controller
//  129  *
//  130  * Parameters:
//  131  *  ch      FEC channel
//  132  */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  133 void
//  134 enet_reset (int ch)
//  135 {
//  136     int i;
//  137 
//  138     /* Set the Reset bit and clear the Enable bit */
//  139     ENET_ECR/*(ch)*/ = ENET_ECR_RESET_MASK;
enet_reset:
        LDR.N    R0,??DataTable6_7  ;; 0x400c0024
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  140 
//  141     /* Wait at least 8 clock cycles */
//  142     for (i=0; i<10; ++i)
        MOVS     R0,#+0
        B.N      ??enet_reset_0
//  143         asm( "NOP" );
??enet_reset_1:
        NOP              
        ADDS     R0,R0,#+1
??enet_reset_0:
        CMP      R0,#+10
        BLT.N    ??enet_reset_1
//  144 }
        BX       LR               ;; return
//  145 /********************************************************************/
//  146 /*
//  147  * Initialize the selected FEC
//  148  *
//  149  * Parameters:
//  150  *  config: ENET parameters
//  151  *
//  152  *
//  153  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  154 void
//  155 enet_init (ENET_CONFIG *config)
//  156 {
enet_init:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  157     /* Clear the Individual and Group Address Hash registers */
//  158     ENET_IALR/*(ch)*/ = 0;
        LDR.N    R0,??DataTable6_6  ;; 0x400c011c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  159     ENET_IAUR/*(ch)*/ = 0;
        LDR.N    R0,??DataTable6_5  ;; 0x400c0118
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  160     ENET_GALR/*(ch)*/ = 0;
        LDR.N    R0,??DataTable6_8  ;; 0x400c0124
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  161     ENET_GAUR/*(ch)*/ = 0;
        LDR.N    R0,??DataTable6_9  ;; 0x400c0120
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  162 
//  163     /* Set the Physical Address for the selected FEC */
//  164     enet_set_address(config->ch, config->mac);
        ADDS     R1,R4,#+8
        LDRB     R0,[R4, #+0]
        BL       enet_set_address
//  165 
//  166     /* Mask all FEC interrupts */
//  167     ENET_EIMR/*(ch)*/ = 0;//FSL:ENET_EIMR_MASK_ALL_MASK;
        LDR.N    R0,??DataTable6_10  ;; 0x400c0008
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  168 
//  169     /* Clear all FEC interrupt events */
//  170     ENET_EIR/*(ch)*/ = 0xFFFFFFFF;//FSL:ENET_EIR_CLEAR_ALL_MASK;
        LDR.N    R0,??DataTable6_11  ;; 0x400c0004
        MOVS     R1,#-1
        STR      R1,[R0, #+0]
//  171     
//  172     /* Initialize the Receive Control Register */
//  173     ENET_RCR/*(ch)*/ = 0
//  174         | ENET_RCR_MAX_FL(ETH_MAX_FRM)
//  175         | ENET_RCR_MII_MODE_MASK /*always*/
//  176         | ENET_RCR_CRCFWD_MASK;  /*no CRC pad required*/
        LDR.N    R0,??DataTable6  ;; 0x400c0084
        LDR.N    R1,??DataTable6_12  ;; 0x5ee4004
        STR      R1,[R0, #+0]
//  177 
//  178     if ( config->interface == mac_rmii )
        LDRB     R0,[R4, #+1]
        CMP      R0,#+1
        BNE.N    ??enet_init_0
//  179     {
//  180       ENET_RCR/*(ch)*/ |= ENET_RCR_RMII_MODE_MASK;
        LDR.N    R0,??DataTable6  ;; 0x400c0084
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable6  ;; 0x400c0084
        STR      R0,[R1, #+0]
//  181       
//  182       /*only set speed in RMII mode*/
//  183       if( config->speed == MII_10BASET )
        LDRB     R0,[R4, #+3]
        CMP      R0,#+0
        BNE.N    ??enet_init_0
//  184       {
//  185          ENET_RCR/*(ch)*/ |= ENET_RCR_RMII_10T_MASK;
        LDR.N    R0,??DataTable6  ;; 0x400c0084
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable6  ;; 0x400c0084
        STR      R0,[R1, #+0]
//  186       }
//  187     }/*no need to configure MAC MII interface*/ 
//  188     
//  189     ENET_TCR/*(ch)*/ = 0;    
??enet_init_0:
        LDR.N    R0,??DataTable6_1  ;; 0x400c00c4
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  190     
//  191     /* Set the duplex */
//  192     enet_duplex(config->ch, config->duplex);        
        LDRB     R1,[R4, #+4]
        LDRB     R0,[R4, #+0]
        BL       enet_duplex
//  193         
//  194     if (config->prom)
        LDRB     R0,[R4, #+7]
        CMP      R0,#+0
        BEQ.N    ??enet_init_1
//  195     {
//  196         ENET_RCR/*(ch)*/ |= ENET_RCR_PROM_MASK; 
        LDR.N    R0,??DataTable6  ;; 0x400c0084
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable6  ;; 0x400c0084
        STR      R0,[R1, #+0]
//  197     } 
//  198     
//  199 #ifdef ENHANCED_BD
//  200     ENET_ECR/*(ch)*/ = ENET_ECR_EN1588_MASK;
??enet_init_1:
        LDR.N    R0,??DataTable6_7  ;; 0x400c0024
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
//  201 #else
//  202     ENET_ECR/*(ch)*/ = 0;//clear register
//  203 #endif
//  204 
//  205     if(config->loopback == INTERNAL_LOOPBACK)
        LDRB     R0,[R4, #+5]
        CMP      R0,#+0
        BNE.N    ??enet_init_2
//  206     {
//  207         /*seems like RMII internal loopback works, even if it's not supported*/
//  208         ENET_RCR/*(0)*/ |= ENET_RCR_LOOP_MASK;
        LDR.N    R0,??DataTable6  ;; 0x400c0084
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable6  ;; 0x400c0084
        STR      R0,[R1, #+0]
//  209     }
//  210 }
??enet_init_2:
        POP      {R4,PC}          ;; return
//  211 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  212 void
//  213 enet_start (int ch)
//  214 {
//  215   // Enable FEC
//  216   ENET_ECR/*(ch)*/ |= ENET_ECR_ETHEREN_MASK;
enet_start:
        LDR.N    R0,??DataTable6_7  ;; 0x400c0024
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable6_7  ;; 0x400c0024
        STR      R0,[R1, #+0]
//  217 }
        BX       LR               ;; return
//  218 
//  219 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  220 int 
//  221 enet_wait_for_frame_receive(int ch, int timeout)
//  222 {
enet_wait_for_frame_receive:
        PUSH     {R4}
//  223 	int i, return_val = 1;
        MOVS     R0,#+1
//  224         
//  225 	for (i=0; i < timeout; i++)
        MOVS     R2,#+0
        B.N      ??enet_wait_for_frame_receive_0
??enet_wait_for_frame_receive_1:
        ADDS     R2,R2,#+1
??enet_wait_for_frame_receive_0:
        CMP      R2,R1
        BGE.N    ??enet_wait_for_frame_receive_2
//  226 	{
//  227 		if (ENET_EIR/*(ch)*/ & ENET_EIR_RXF_MASK)
        LDR.N    R3,??DataTable6_11  ;; 0x400c0004
        LDR      R3,[R3, #+0]
        LSLS     R3,R3,#+6
        BPL.N    ??enet_wait_for_frame_receive_1
//  228 		{
//  229 			ENET_EIR/*(ch)*/ = ENET_EIR_RXF_MASK;
        LDR.N    R3,??DataTable6_11  ;; 0x400c0004
        MOVS     R4,#+33554432
        STR      R4,[R3, #+0]
//  230 			break;		
//  231 		}
//  232 	}
//  233 
//  234 	if(i == timeout)
??enet_wait_for_frame_receive_2:
        CMP      R2,R1
        BNE.N    ??enet_wait_for_frame_receive_3
//  235 	{
//  236 		return_val = 0;
        MOVS     R0,#+0
//  237 	}
//  238 	return return_val;
??enet_wait_for_frame_receive_3:
        POP      {R4}
        BX       LR               ;; return
//  239 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x400c0084

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x400c00c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0xedb88320

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x400c00e4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x400c00e8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x400c0118

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x400c011c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0x400c0024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0x400c0124

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     0x400c0120

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     0x400c0008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     0x400c0004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     0x5ee4004

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  240 /********************************************************************/
//  241 
//  242 
//  243 
// 
// 502 bytes in section .text
// 
// 502 bytes of CODE memory
//
//Errors: none
//Warnings: none
