///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\SPI\HA /
//                    L_SPI.c                                                 /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\SPI\HA /
//                    L_SPI.c -D IAR -D TWR_K60N512 -lCN                      /
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
//                    rld\RAM_128KB\List\HAL_SPI.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME HAL_SPI

        #define SHT_PROGBITS 0x1

        EXTERN gpio_init

        PUBLIC SPI_Init
        PUBLIC SPI_Master_Read
        PUBLIC SPI_Master_Write
        PUBLIC SPI_Master_WriteRead
        PUBLIC SPIx_Ptr

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\SPI\HAL_SPI.c
//    1 /*
//    2 
//    3  *
//    4  * ??????: HAL_SPI.c
//    5  * ????: SPI????????????????
//    6  * ????????????: 20120321
//    7  *
//    8  */
//    9 #include"HAL_SPI.h"
//   10 
//   11 /*
//   12 //SPI????????????????
//   13 #undef  VECTOR_042
//   14 #define VECTOR_042 LPLD_SPI_Isr
//   15 #undef  VECTOR_043
//   16 #define VECTOR_043 LPLD_SPI_Isr
//   17 #undef  VECTOR_044
//   18 #define VECTOR_044 LPLD_SPI_Isr
//   19 //??????????LPLD_Kinetis????????????????
//   20 extern void LPLD_SPI_Isr(void);
//   21 */
//   22 
//   23 //SPI????????????

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   24 volatile SPI_MemMapPtr SPIx_Ptr[3] = {SPI0_BASE_PTR, 
SPIx_Ptr:
        DATA
        DC32 4002C000H, 4002D000H, 400AC000H
//   25                                       SPI1_BASE_PTR, 
//   26                                       SPI2_BASE_PTR};
//   27 
//   28 /*
//   29  * SPI_Init
//   30  * SPI??????????
//   31  * 
//   32  * ????:
//   33  *    spix--????SPI????
//   34  *      |__SPI0     PORTA15 SCK 
//   35  *                  PORTA16 SOUT (serial OUT)
//   36  *                  PORTA17 SIN  (serial IN)
//   37  *      |__SPI1     PORTB11 SCK 
//   38  *                  PORTB16 SOUT (serial OUT)
//   39  *                  PORTB17 SIN  (serial IN)
//   40  *      |__SPI2     PORTD12 SCK      
//   41  *                  PORTD13 SOUT (serial OUT)
//   42  *                  PORTD14 SIN  (serial IN)
//   43  *    sck_div--SCK SCK????????
//   44  *      ??SCK??????????????????fSYS 
//   45  *      SCK??????F_SCK = (fSYS/PBR) x [(1+DBR)/BR]
//   46  *      ????????????????DBR = 1??PBR = 2 
//   47  *      ???????? F_SCK = fSYS/BR
//   48  *      BR = SPI_SCK_DIV_x
//   49  *      |__SPI_SCK_DIV_2      -2????
//   50  *      |__SPI_SCK_DIV_4      -4????
//   51  *      |__SPI_SCK_DIV_6      -6????
//   52  *      |__SPI_SCK_DIV_8      -8????
//   53  *      |__SPI_SCK_DIV_16     -16????
//   54  *      |__SPI_SCK_DIV_32     -32????
//   55  *      ......
//   56  *      |__SPI_SCK_DIV_8192   -8192????
//   57  *      |__SPI_SCK_DIV_16384  -16384????
//   58  *      |__SPI_SCK_DIV_32768  -32768????
//   59  *
//   60  *    pcs_num--PCS??????????
//   61  *      ???? spix = SPI0
//   62  *      |__1--PCS0 PORTA14
//   63  *      |__2--PCS0 PORTA14
//   64  *            PCS1 PORTC3
//   65  *      |__3--PCS0 PORTA14
//   66  *            PCS1 PORTC3
//   67  *            PCS2 PORTC2
//   68  *      |__4--PCS0 PORTA14
//   69  *            PCS1 PORTC3
//   70  *            PCS2 PORTC2
//   71  *            PCS3 PORTC1
//   72  *      |__5--PCS0 PORTA14
//   73  *            PCS1 PORTC3
//   74  *            PCS2 PORTC2
//   75  *            PCS3 PORTC1
//   76  *            PCS4 PORTC0
//   77  *      |__6--PCS0 PORTA14
//   78  *            PCS1 PORTC3
//   79  *            PCS2 PORTC2
//   80  *            PCS3 PORTC1
//   81  *            PCS4 PORTC0
//   82  *            PCS5 PORTB23
//   83  *      ???? spix = SPI1
//   84  *      |__1--PCS0 PORTB10
//   85  *      |__2--PCS0 PORTB10
//   86  *            PCS1 PORTB9
//   87  *      |__3--PCS0 PORTB10
//   88  *            PCS1 PORTB9
//   89  *            PCS2 PORTE5
//   90  *      |__4--PCS0 PORTB10
//   91  *            PCS1 PORTB9
//   92  *            PCS2 PORTE5
//   93  *            PCS3 PORTE6
//   94  *      ???? spix = SPI2
//   95  *      |__1--PCS0 PORTD11
//   96  *      |__2--PCS0 PORTD11
//   97  *            PCS1 PORTD15
//   98  * ????:
//   99  *    0????????????
//  100  *    1????????????
//  101  */
//  102 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  103 uint8 SPI_Init(SPIx spix,uint8 sck_div,uint8 pcs_num)
//  104 {
SPI_Init:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  105       
//  106      
//  107   
//  108   //??????SPI????OLED????????????????SPI??????????????????????CS??RST??DC????
//  109   
//  110       gpio_init  (PORTC,8,GPO,HIGH); //??????OLED-CS????
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+8
        MOVS     R0,#+2
        BL       gpio_init
//  111   
//  112       gpio_init  (PORTC,9,GPO,HIGH); //??????OLED-RST????
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+9
        MOVS     R0,#+2
        BL       gpio_init
//  113       
//  114       gpio_init  (PORTC,10,GPO,HIGH); //??????OLED-D/C????
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+10
        MOVS     R0,#+2
        BL       gpio_init
//  115   
//  116       SPI_MemMapPtr spi = SPIx_Ptr[spix];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable3
        LDR      R1,[R0, R4, LSL #+2]
//  117    
//  118       //????SPI????????
//  119       
//  120       SIM_SCGC6 |= SIM_SCGC6_DSPI0_MASK;  
        LDR.N    R0,??DataTable3_1  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R2,??DataTable3_1  ;; 0x4004803c
        STR      R0,[R2, #+0]
//  121       //????SPI0????
//  122        
//  123       PORTC_PCR5 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SCK
        LDR.N    R0,??DataTable3_2  ;; 0x4004b014
        MOV      R2,#+576
        STR      R2,[R0, #+0]
//  124       PORTC_PCR6 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
        LDR.N    R0,??DataTable3_3  ;; 0x4004b018
        MOV      R2,#+576
        STR      R2,[R0, #+0]
//  125       PORTC_PCR7 = 0 | PORT_PCR_MUX(2);                    //SIN
        LDR.N    R0,??DataTable3_4  ;; 0x4004b01c
        MOV      R2,#+512
        STR      R2,[R0, #+0]
//  126      
//  127      //??????????????PCS??????  
//  128       
//  129       
//  130   //????SPI MCR??????
//  131   SPI_MCR_REG(spi) = 0 & (~SPI_MCR_MDIS_MASK) //????SPI????
//  132                     |SPI_MCR_HALT_MASK        //??SPI????????????
//  133                     |SPI_MCR_MSTR_MASK        //????SPI??????????
//  134                     
//  135                     //|SPI_MCR_PCSIS_MASK       //PCS????????????SPI????????????
//  136                     |SPI_MCR_CLR_TXF_MASK     //??????????MDIS??????TXF_MASK??RXF_MASK
//  137                     |SPI_MCR_CLR_RXF_MASK  
//  138                     |SPI_MCR_DIS_TXF_MASK     //??????????TXD??RXD FIFO ???? ????SPI??????????????
//  139                     |SPI_MCR_DIS_RXF_MASK; 
        LDR.N    R0,??DataTable3_5  ;; 0x80003c01
        STR      R0,[R1, #+0]
//  140   
//  141   //????SPI CTAR??????
//  142   SPI_CTAR_REG(spi,0) = 0 | SPI_CTAR_DBR_MASK  //????DBR = 1
//  143                     |SPI_CTAR_PBR(0)           //????PBR = 2,????????????????????50%
//  144                     |SPI_CTAR_FMSZ(7)          //??????????8????????????????
//  145                     &~(SPI_CTAR_LSBFE_MASK);   //????????????
        MOVS     R0,#-1207959552
        STR      R0,[R1, #+12]
//  146                                                //????????SCK????
//  147   //==================???? Spi ????======================
//  148   //????SCK??????
//  149   //F_SCK = (fSYS/PBR) x [(1+DBR)/BR]
//  150   //????DBR = 1??PBR = 2 ???????? F_SCK = fSYS/BR
//  151   
//  152   SPI_CTAR_REG(spi,0) |=SPI_CTAR_BR(sck_div);
        LDR      R0,[R1, #+12]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ANDS     R2,R5,#0xF
        ORRS     R0,R2,R0
        STR      R0,[R1, #+12]
//  153   
//  154   //????PCS to SCK??????
//  155   //tCSC = (1/fSYS) x PCSSCK x CSSCK
//  156   //tCSC = 1/150,000,000 x PCSSCK x CSSCK
//  157   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_PCSSCK(1); // Prescaler value is 3.
//  158   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_CSSCK(1);  // Delay Scaler Value is 4.
//  159   
//  160   //???? PCS ???? to ????????????????
//  161   //tDT = (1/fSYS) x PDT x DT
//  162   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_DT(1);
//  163   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_PDT(1);
//  164   
//  165   //Config the Delay of the last edge of SCK and the negation of PCS
//  166   //tASC = (1/fSYS) x PASC x ASC
//  167   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_PASC(1);
//  168   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_ASC(1);
//  169   //===============???? Spi ????????====================== 
//  170   
//  171   SPI_SR_REG(spi) =  SPI_SR_RFDF_MASK   //????????????
//  172                     |SPI_SR_RFOF_MASK
//  173                     |SPI_SR_TFFF_MASK
//  174                     |SPI_SR_TFUF_MASK
//  175                     |SPI_SR_TCF_MASK
//  176                     |SPI_SR_EOQF_MASK;
        LDR.N    R0,??DataTable3_6  ;; 0x9a0a0000
        STR      R0,[R1, #+44]
//  177   
//  178   SPI_MCR_REG(spi) &=~SPI_MCR_HALT_MASK; //????????????,SPI????????
        LDR      R0,[R1, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        STR      R0,[R1, #+0]
//  179   
//  180   return 1;
        MOVS     R0,#+1
        POP      {R4-R6,PC}       ;; return
//  181 }
//  182 
//  183 
//  184 
//  185 /*
//  186  * SPI_Master_WriteRead
//  187  * K60????SPI????????????????????????????
//  188  * 
//  189  * ????:
//  190  *    spix--SPI????
//  191  *      |__SPI0       -????SPI0????
//  192  *      |__SPI1       -????SPI1????
//  193  *      |__SPI2       -????SPI2????
//  194  *    data--??????????
//  195  *      |__????????????????8??
//  196  *    pcsx--CS??????????
//  197  *      |__SPI_PCS0       -0??????(SPI0??SPI1??SPI2????)
//  198  *      |__SPI_PCS1       -1??????(SPI0??SPI1??SPI2????)
//  199  *      |__SPI_PCS2       -2??????(SPI0??SPI1????)
//  200  *      |__SPI_PCS3       -3??????(SPI0??SPI1????)
//  201  *      |__SPI_PCS4       -4??????(SPI0????)
//  202  *      |__SPI_PCS5       -5??????(SPI0????)
//  203  *    pcs_state--??????????????????CS??????
//  204  *      |__SPI_PCS_ASSERTED -????????????
//  205  *      |__SPI_PCS_INACTIVE -????????
//  206  * ????:
//  207  *    8??????????????????
//  208  */
//  209 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  210 uint8 SPI_Master_WriteRead(SPIx spix,uint8 data,uint8 pcsx,uint8 pcs_state)
//  211 {
SPI_Master_WriteRead:
        PUSH     {R4-R6}
        MOVS     R4,R0
//  212   uint8 temp;
//  213   SPI_MemMapPtr spi = SPIx_Ptr[spix];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R5,??DataTable3
        LDR      R5,[R5, R4, LSL #+2]
//  214   
//  215   //????pcs_state????????????????
//  216   SPI_PUSHR_REG(spi) = (((uint32_t)(((uint32_t)(pcs_state))<<SPI_PUSHR_CONT_SHIFT))&SPI_PUSHR_CONT_MASK)
//  217                |SPI_PUSHR_CTAS(0)
//  218                |SPI_PUSHR_PCS(pcsx)
//  219                |data;                 
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R6,R2,#+16
        ANDS     R6,R6,#0x3F0000
        ORRS     R6,R6,R3, LSL #+31
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R6,R1,R6
        STR      R6,[R5, #+52]
//  220   
//  221   while(!(SPI_SR_REG(spi) & SPI_SR_TCF_MASK));
??SPI_Master_WriteRead_0:
        LDR      R6,[R5, #+44]
        CMP      R6,#+0
        BPL.N    ??SPI_Master_WriteRead_0
//  222   SPI_SR_REG(spi) |= SPI_SR_TCF_MASK ;               //??????????????????
        LDR      R6,[R5, #+44]
        ORRS     R6,R6,#0x80000000
        STR      R6,[R5, #+44]
//  223   
//  224   //????????????????
//  225   while((SPI_SR_REG(spi) & SPI_SR_RFDF_MASK) == 0){}; //RX FIFO ??????????????????????
??SPI_Master_WriteRead_1:
        LDR      R6,[R5, #+44]
        LSLS     R6,R6,#+14
        BPL.N    ??SPI_Master_WriteRead_1
//  226   temp = (uint8)(SPI_POPR_REG(spi) & 0xff);           //??????32??????????POPR???????????? 
        LDR      R6,[R5, #+56]
        MOVS     R0,R6
//  227   SPI_SR_REG(spi) |= SPI_SR_RFDF_MASK;                //??????????
        LDR      R6,[R5, #+44]
        ORRS     R6,R6,#0x20000
        STR      R6,[R5, #+44]
//  228   return temp;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6}
        BX       LR               ;; return
//  229   
//  230 }
//  231 
//  232 
//  233 /*
//  234  * SPI_Master_Read
//  235  * K60????????????????
//  236  * 
//  237  * ????:
//  238  *    spix--SPI????
//  239  *      |__SPI0       -????SPI0????
//  240  *      |__SPI1       -????SPI1????
//  241  *      |__SPI2       -????SPI2????
//  242  * ????:
//  243  *    8??????????????????
//  244  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  245 uint8 SPI_Master_Read(SPIx spix)
//  246 {
SPI_Master_Read:
        MOVS     R1,R0
//  247   uint8 temp;
//  248   SPI_MemMapPtr spi = SPIx_Ptr[spix];
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable3
        LDR      R2,[R2, R1, LSL #+2]
//  249 
//  250   while(!(SPI_SR_REG(spi) & SPI_SR_RFDF_MASK)); //=1 RIFO is not empty
??SPI_Master_Read_0:
        LDR      R3,[R2, #+44]
        LSLS     R3,R3,#+14
        BPL.N    ??SPI_Master_Read_0
//  251   temp=(uint8)SPI_POPR_REG(spi);
        LDR      R3,[R2, #+56]
        MOVS     R0,R3
//  252   SPI_SR_REG(spi) |=SPI_SR_RFDF_MASK;
        LDR      R3,[R2, #+44]
        ORRS     R3,R3,#0x20000
        STR      R3,[R2, #+44]
//  253 
//  254   return temp;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  255 }
//  256 /*
//  257  * SPI_Master_Write
//  258  * K60????SPI????????????
//  259  * 
//  260  * ????:
//  261  *    spix--SPI????
//  262  *      |__SPI0       -????SPI0????
//  263  *      |__SPI1       -????SPI1????
//  264  *      |__SPI2       -????SPI2????
//  265  *    data--??????????
//  266  *      |__????????????????8??
//  267  *    pcsx--CS??????????
//  268  *      |__SPI_PCS0       -0??????(SPI0??SPI1??SPI2????)
//  269  *      |__SPI_PCS1       -1??????(SPI0??SPI1??SPI2????)
//  270  *      |__SPI_PCS2       -2??????(SPI0??SPI1????)
//  271  *      |__SPI_PCS3       -3??????(SPI0??SPI1????)
//  272  *      |__SPI_PCS4       -4??????(SPI0????)
//  273  *      |__SPI_PCS5       -5??????(SPI0????)
//  274  *    pcs_state--??????????????????CS??????
//  275  *      |__SPI_PCS_ASSERTED -????????????
//  276  *      |__SPI_PCS_INACTIVE -????????
//  277  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  278 void SPI_Master_Write(SPIx spix,uint8 data,uint8 pcsx,uint8 pcs_state)
//  279 {  
SPI_Master_Write:
        PUSH     {R4,R5}
//  280   SPI_MemMapPtr spi = SPIx_Ptr[spix];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R4,??DataTable3
        LDR      R4,[R4, R0, LSL #+2]
//  281 
//  282   //????pcs_state????????????????
//  283   SPI_PUSHR_REG(spi) = (((uint32_t)(((uint32_t)(pcs_state))<<SPI_PUSHR_CONT_SHIFT))&SPI_PUSHR_CONT_MASK)
//  284                |SPI_PUSHR_CTAS(0)
//  285                |SPI_PUSHR_PCS(pcsx)
//  286                |data; 
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R5,R2,#+16
        ANDS     R5,R5,#0x3F0000
        ORRS     R5,R5,R3, LSL #+31
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R5,R1,R5
        STR      R5,[R4, #+52]
//  287 
//  288   while(!(SPI_SR_REG(spi) & SPI_SR_TCF_MASK));
??SPI_Master_Write_0:
        LDR      R5,[R4, #+44]
        CMP      R5,#+0
        BPL.N    ??SPI_Master_Write_0
//  289   SPI_SR_REG(spi) |= SPI_SR_TCF_MASK ;            //??????????????????
        LDR      R5,[R4, #+44]
        ORRS     R5,R5,#0x80000000
        STR      R5,[R4, #+44]
//  290 }
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     SPIx_Ptr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x4004b014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x4004b018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x4004b01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x80003c01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x9a0a0000

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  291 
//  292 
//  293 
//  294 
// 
//  12 bytes in section .data
// 304 bytes in section .text
// 
// 304 bytes of CODE memory
//  12 bytes of DATA memory
//
//Errors: none
//Warnings: none
