///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:42 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\driv /
//                    ers\enet\eth_phy.c                                      /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\dri /
//                    vers\enet\eth_phy.c" -D IAR -D TWR_K60N512 -lCN         /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\eth_phy.s         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME eth_phy

        #define SHT_PROGBITS 0x1

        EXTERN mii_read
        EXTERN mii_write
        EXTERN printf

        PUBLIC eth_phy_anar
        PUBLIC eth_phy_autoneg
        PUBLIC eth_phy_get_duplex
        PUBLIC eth_phy_get_manual_duplex
        PUBLIC eth_phy_get_manual_speed
        PUBLIC eth_phy_get_speed
        PUBLIC eth_phy_manual
        PUBLIC eth_phy_reg_dump
        PUBLIC eth_phy_reset
        PUBLIC eth_phy_set_remote_loopback

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\drivers\enet\eth_phy.c
//    1 /*!
//    2  * \file    eth_phy.c
//    3  * \brief   Ethernet Physical Layer Interface Driver
//    4  * \version $Revision: 1.3 $
//    5  * \author  Michael Norman
//    6  * 
//    7  * This is a generic driver for all Ethernet PHYs with the basic MII registers
//    8  */
//    9 
//   10 #include "common.h"
//   11 #include "eth_phy.h"
//   12 #include "mii.h"
//   13 
//   14 /* Variable to save off auto-negotiate settings */

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   15 int eth_phy_anar = 0
eth_phy_anar:
        DATA
        DC32 481
//   16     | PHY_ANAR_100BTX_FDX
//   17     | PHY_ANAR_100BTX
//   18     | PHY_ANAR_10BT_FDX
//   19     | PHY_ANAR_10BT;
//   20 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 int
//   22 eth_phy_reset(int ch, int phy_addr)
//   23 {
eth_phy_reset:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   24 #if MII_CHECK_TIMEOUT
//   25     int timeout; 
//   26 #endif
//   27     int settings;
//   28 
//   29     /* Reset the PHY */
//   30     if (mii_write(ch, phy_addr, PHY_BMCR, PHY_BMCR_RESET)) 
        MOV      R3,#+32768
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_write
        CMP      R0,#+0
        BEQ.N    ??eth_phy_reset_0
//   31         return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_reset_1
//   32     /* Wait for reset to complete */
//   33 #if MII_CHECK_TIMEOUT
//   34     for (timeout = 0; timeout < MII_LINK_TIMEOUT; ++timeout)
//   35 #endif
//   36     while(1)
//   37     {
//   38       /* Read back the contents of the CTRL register and verify
//   39        * that RESET is not set - this is a sanity check to ensure
//   40        * that we are talking to the PHY correctly. RESET should
//   41        * always be cleared. */
//   42       if (!(mii_read(ch, phy_addr, PHY_BMCR, &settings)) && !(settings & PHY_BMCR_RESET))
??eth_phy_reset_0:
        ADD      R3,SP,#+0
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_read
        CMP      R0,#+0
        BNE.N    ??eth_phy_reset_0
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+16
        BMI.N    ??eth_phy_reset_0
//   43         break;/*FSL: ready*/
//   44     }
//   45 #if MII_CHECK_TIMEOUT
//   46     if (timeout == MII_LINK_TIMEOUT || (settings & PHY_BMCR_RESET))
//   47         return 1;
//   48     else
//   49 #endif      
//   50         return 0;
        MOVS     R0,#+0
??eth_phy_reset_1:
        POP      {R1,R4,R5,PC}    ;; return
//   51 }
//   52 
//   53 /********************************************************************/
//   54 /*!
//   55  * \brief   Enable the Ethernet PHY in auto-negotiate mode
//   56  * \param   phy_addr    Address of the PHY
//   57  * \param   speed       Desired speed (MII_10BASE_T or MII_100BASE_TX)
//   58  * \param   duplex      Desired duplex (MII_FDX or MII_HDX)
//   59  * \return  0 if successful; non-zero otherwise
//   60  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   61 int
//   62 eth_phy_autoneg(int ch, int phy_addr, ENET_SPEED speed, ENET_DUPLEX duplex)
//   63 {
eth_phy_autoneg:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//   64     int timeout, settings;
//   65 
//   66     /* Reset the PHY */
//   67     eth_phy_reset(ch, phy_addr);
        MOVS     R1,R5
        MOVS     R0,R4
        BL       eth_phy_reset
//   68 
//   69     /* Set the Auto-Negotiation Advertisement Register */
//   70     if (speed == MII_10BASET)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??eth_phy_autoneg_0
//   71     {
//   72         settings = (duplex == MII_FDX) 
//   73             ? PHY_ANAR_10BT_FDX | PHY_ANAR_10BT 
//   74             : PHY_ANAR_10BT;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??eth_phy_autoneg_1
        MOVS     R0,#+97
        STR      R0,[SP, #+0]
        B.N      ??eth_phy_autoneg_2
??eth_phy_autoneg_1:
        MOVS     R0,#+33
        STR      R0,[SP, #+0]
        B.N      ??eth_phy_autoneg_2
//   75     }
//   76     else /* (speed == MII_100BASET) */
//   77     {
//   78         settings = (duplex == MII_FDX)  
//   79             ? PHY_ANAR_100BTX_FDX   | 
//   80               PHY_ANAR_100BTX       | 
//   81               PHY_ANAR_10BT_FDX     | 
//   82               PHY_ANAR_10BT
//   83             : PHY_ANAR_10BT_FDX     | 
//   84               PHY_ANAR_10BT;
??eth_phy_autoneg_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??eth_phy_autoneg_3
        MOVW     R0,#+481
        STR      R0,[SP, #+0]
        B.N      ??eth_phy_autoneg_2
??eth_phy_autoneg_3:
        MOVS     R0,#+97
        STR      R0,[SP, #+0]
//   85     }
//   86     
//   87     /* Save off the settings we just advertised */
//   88     eth_phy_anar = settings;
??eth_phy_autoneg_2:
        LDR.N    R0,??DataTable4_1
        LDR      R1,[SP, #+0]
        STR      R1,[R0, #+0]
//   89     
//   90     if (mii_write(ch, phy_addr, PHY_ANAR, settings))
        LDR      R3,[SP, #+0]
        MOVS     R2,#+4
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_write
        CMP      R0,#+0
        BEQ.N    ??eth_phy_autoneg_4
//   91         return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_autoneg_5
//   92         
//   93     /* Enable Auto-Negotiation */
//   94     if (mii_write(ch, phy_addr, PHY_BMCR, PHY_BMCR_AN_ENABLE | PHY_BMCR_AN_RESTART))
??eth_phy_autoneg_4:
        MOV      R3,#+4608
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_write
        CMP      R0,#+0
        BEQ.N    ??eth_phy_autoneg_6
//   95         return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_autoneg_5
//   96 
//   97     /* Wait for auto-negotiation to complete */
//   98     for (timeout = 0; timeout < MII_LINK_TIMEOUT; ++timeout)
??eth_phy_autoneg_6:
        MOVS     R6,#+0
        B.N      ??eth_phy_autoneg_7
??eth_phy_autoneg_8:
        ADDS     R6,R6,#+1
??eth_phy_autoneg_7:
        LDR.N    R0,??DataTable4_2  ;; 0x1ffff
        CMP      R6,R0
        BGE.N    ??eth_phy_autoneg_9
//   99     {
//  100         if (mii_read(ch, phy_addr, PHY_BMSR, &settings))
        ADD      R3,SP,#+0
        MOVS     R2,#+1
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_read
        CMP      R0,#+0
        BEQ.N    ??eth_phy_autoneg_10
//  101             return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_autoneg_5
//  102         if (settings & PHY_BMSR_AN_COMPLETE)
??eth_phy_autoneg_10:
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??eth_phy_autoneg_8
//  103             break;
//  104     }
//  105     /* Read the BMSR one last time */
//  106     if (mii_read(ch, phy_addr, PHY_BMSR, &settings))
??eth_phy_autoneg_9:
        ADD      R3,SP,#+0
        MOVS     R2,#+1
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_read
        CMP      R0,#+0
        BEQ.N    ??eth_phy_autoneg_11
//  107         return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_autoneg_5
//  108     if (timeout == MII_LINK_TIMEOUT || !(settings & PHY_BMSR_LINK))
??eth_phy_autoneg_11:
        LDR.N    R0,??DataTable4_2  ;; 0x1ffff
        CMP      R6,R0
        BEQ.N    ??eth_phy_autoneg_12
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+29
        BMI.N    ??eth_phy_autoneg_13
//  109         return 1;
??eth_phy_autoneg_12:
        MOVS     R0,#+1
        B.N      ??eth_phy_autoneg_5
//  110     else
//  111         return 0;
??eth_phy_autoneg_13:
        MOVS     R0,#+0
??eth_phy_autoneg_5:
        POP      {R1,R4-R7,PC}    ;; return
//  112 }
//  113 /********************************************************************/
//  114 /*!
//  115  * \brief   Enable the Ethernet PHY in manual mode
//  116  * \param   phy_addr    Address of the PHY
//  117  * \param   speed       Desired speed (MII_10BASE_T or MII_100BASE_TX)
//  118  * \param   duplex      Desired duplex (MII_FDX or MII_HDX)
//  119  * \param   loop        Put PHY in loopback mode?
//  120  * \return  0 if successful; non-zero otherwise
//  121  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  122 int 
//  123 eth_phy_manual(int ch, int phy_addr, ENET_SPEED speed, ENET_DUPLEX duplex, int loop)
//  124 {
eth_phy_manual:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+32]
//  125     int timeout; 
//  126     int settings = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  127   
//  128     /* Reset the PHY */
//  129         /* Reset the PHY */
//  130     eth_phy_reset(ch, phy_addr);
        MOVS     R1,R5
        MOVS     R0,R4
        BL       eth_phy_reset
//  131     
//  132     if (loop)
        CMP      R8,#+0
        BEQ.N    ??eth_phy_manual_0
//  133         settings |= PHY_BMCR_LOOP;
        LDR      R0,[SP, #+0]
        ORRS     R0,R0,#0x4000
        STR      R0,[SP, #+0]
//  134     if (duplex == MII_FDX)
??eth_phy_manual_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??eth_phy_manual_1
//  135         settings |= PHY_BMCR_FDX;
        LDR      R0,[SP, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        STR      R0,[SP, #+0]
//  136     if (speed == MII_100BASET)
??eth_phy_manual_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??eth_phy_manual_2
//  137         settings |= PHY_BMCR_SPEED;
        LDR      R0,[SP, #+0]
        ORRS     R0,R0,#0x2000
        STR      R0,[SP, #+0]
//  138 
//  139     if (mii_write(ch, phy_addr, PHY_BMCR, settings))
??eth_phy_manual_2:
        LDR      R3,[SP, #+0]
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_write
        CMP      R0,#+0
        BEQ.N    ??eth_phy_manual_3
//  140         return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_manual_4
//  141     
//  142     /* Wait for link */
//  143     for (timeout = 0; timeout < MII_LINK_TIMEOUT; ++timeout)
??eth_phy_manual_3:
        MOVS     R6,#+0
        B.N      ??eth_phy_manual_5
??eth_phy_manual_6:
        ADDS     R6,R6,#+1
??eth_phy_manual_5:
        LDR.N    R0,??DataTable4_2  ;; 0x1ffff
        CMP      R6,R0
        BGE.N    ??eth_phy_manual_7
//  144     {
//  145         if (mii_read(ch, phy_addr, PHY_BMSR, &settings))
        ADD      R3,SP,#+0
        MOVS     R2,#+1
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_read
        CMP      R0,#+0
        BEQ.N    ??eth_phy_manual_8
//  146             return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_manual_4
//  147         if (settings & PHY_BMSR_LINK)
??eth_phy_manual_8:
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??eth_phy_manual_6
//  148             break;
//  149     }
//  150 
//  151 #if MII_CHECK_TIMEOUT    
//  152     if (timeout == MII_LINK_TIMEOUT || !(settings & PHY_BMSR_LINK))
//  153         return 1;
//  154     else
//  155 #endif      
//  156         return 0;
??eth_phy_manual_7:
        MOVS     R0,#+0
??eth_phy_manual_4:
        POP      {R1,R2,R4-R8,PC}  ;; return
//  157 }
//  158 /********************************************************************/
//  159 /*!
//  160  * \brief   Get the auto-negotiated speed
//  161  * \param   phy_addr    Address of the PHY
//  162  * \param   speed       Pointer where speed data is stored
//  163  * \return  0 if successful; non-zero otherwise
//  164  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  165 int 
//  166 eth_phy_get_speed(int ch, int phy_addr, int *speed)
//  167 {
eth_phy_get_speed:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R2
//  168 #if MII_CHECK_TIMEOUT
//  169     int timeout;
//  170 #endif
//  171     int settings = 0;
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
//  172 
//  173     /* Get Link Partner settings */
//  174 #if MII_CHECK_TIMEOUT
//  175     for (timeout = 0; timeout < MII_TIMEOUT; ++timeout)
//  176 #endif
//  177     while(1)
//  178     {      
//  179         if (mii_read(ch, phy_addr, PHY_ANLPAR, &settings))
        ADD      R3,SP,#+0
        MOVS     R2,#+5
        BL       mii_read
        CMP      R0,#+0
        BEQ.N    ??eth_phy_get_speed_0
//  180             return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_get_speed_1
//  181         else
//  182             break;
//  183     }
//  184 #if MII_CHECK_TIMEOUT
//  185     if (timeout == MII_TIMEOUT)
//  186         return 1;
//  187 #endif
//  188     
//  189     settings &= eth_phy_anar;
??eth_phy_get_speed_0:
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        ANDS     R0,R1,R0
        STR      R0,[SP, #+0]
//  190     if (settings & PHY_ANLPAR_100BT4     ||
//  191         settings & PHY_ANLPAR_100BTX_FDX ||
//  192         settings & PHY_ANLPAR_100BTX)
        LDR      R0,[SP, #+0]
        MOV      R1,#+896
        TST      R0,R1
        BEQ.N    ??eth_phy_get_speed_2
//  193         *speed = MII_100BASET;
        MOVS     R0,#+1
        STR      R0,[R4, #+0]
        B.N      ??eth_phy_get_speed_3
//  194     else
//  195         *speed = MII_10BASET;
??eth_phy_get_speed_2:
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
//  196 
//  197     return 0;
??eth_phy_get_speed_3:
        MOVS     R0,#+0
??eth_phy_get_speed_1:
        POP      {R1,R2,R4,PC}    ;; return
//  198 }
//  199 /********************************************************************/
//  200 /*!
//  201  * \brief   Get the auto-negotiated duplex
//  202  * \param   phy_addr    Address of the PHY
//  203  * \param   speed       Pointer where speed data is stored
//  204  * \return  0 if successful; non-zero otherwise
//  205  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  206 int 
//  207 eth_phy_get_duplex(int ch, int phy_addr, int *speed)
//  208 {
eth_phy_get_duplex:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R2
//  209 #if MII_CHECK_TIMEOUT  
//  210     int timeout;
//  211 #endif    
//  212     int settings = 0;
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
//  213 
//  214     /* Get Link Partner settings */
//  215 #if MII_CHECK_TIMEOUT
//  216     for (timeout = 0; timeout < MII_TIMEOUT; ++timeout)
//  217 #endif
//  218     while(1)
//  219     {
//  220         if (mii_read(ch, phy_addr, PHY_ANLPAR, &settings))
        ADD      R3,SP,#+0
        MOVS     R2,#+5
        BL       mii_read
        CMP      R0,#+0
        BEQ.N    ??eth_phy_get_duplex_0
//  221             return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_get_duplex_1
//  222         else
//  223             break;
//  224     }
//  225 #if MII_CHECK_TIMEOUT
//  226     if (timeout == MII_TIMEOUT)
//  227         return 1;
//  228 #endif
//  229     
//  230     settings &= eth_phy_anar;
??eth_phy_get_duplex_0:
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        ANDS     R0,R1,R0
        STR      R0,[SP, #+0]
//  231     if (settings & PHY_ANLPAR_100BTX_FDX ||
//  232         settings & PHY_ANLPAR_10BTX_FDX)
        LDR      R0,[SP, #+0]
        MOV      R1,#+320
        TST      R0,R1
        BEQ.N    ??eth_phy_get_duplex_2
//  233         *speed = MII_FDX;
        MOVS     R0,#+1
        STR      R0,[R4, #+0]
        B.N      ??eth_phy_get_duplex_3
//  234     else
//  235         *speed = MII_HDX;
??eth_phy_get_duplex_2:
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
//  236 
//  237     return 0;
??eth_phy_get_duplex_3:
        MOVS     R0,#+0
??eth_phy_get_duplex_1:
        POP      {R1,R2,R4,PC}    ;; return
//  238 }
//  239 
//  240 
//  241 /********************************************************************/
//  242 /*!
//  243  * \brief   Get the manual speed
//  244  * \param   phy_addr    Address of the PHY
//  245  * \param   speed       Pointer where speed data is stored
//  246  * \return  0 if successful; non-zero otherwise
//  247  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  248 int 
//  249 eth_phy_get_manual_speed(int ch, int phy_addr, int *speed)
//  250 {
eth_phy_get_manual_speed:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R2
//  251 #if MII_CHECK_TIMEOUT
//  252     int timeout;
//  253 #endif
//  254     int settings = 0;
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
//  255 
//  256     /* Get Link Partner settings */
//  257 #if MII_CHECK_TIMEOUT
//  258     for (timeout = 0; timeout < MII_TIMEOUT; ++timeout)
//  259 #endif
//  260     while(1)
//  261     {      
//  262 #ifdef TWR_K60N512 
//  263         if (mii_read(ch, phy_addr, PHY_PHYCTRL2, &settings))//Micrel
        ADD      R3,SP,#+0
        MOVS     R2,#+31
        BL       mii_read
        CMP      R0,#+0
        BEQ.N    ??eth_phy_get_manual_speed_0
//  264 #else
//  265         if (mii_read(ch, phy_addr, PHY_PHYSTS, &settings))//National Semiconductors
//  266 #endif
//  267             return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_get_manual_speed_1
//  268         else
//  269             break;
//  270     }
//  271 #if MII_CHECK_TIMEOUT
//  272     if (timeout == MII_TIMEOUT)
//  273         return 1;
//  274 #endif
//  275 
//  276 #ifdef TWR_K60N512
//  277     /*FSL: obtain speed/duplex*/
//  278     settings = (settings & PHY_PHYCTRL2_OP_MOD_MASK)>>PHY_PHYCTRL2_OP_MOD_SHIFT;
??eth_phy_get_manual_speed_0:
        LDR      R0,[SP, #+0]
        UBFX     R0,R0,#+2,#+3
        STR      R0,[SP, #+0]
//  279     
//  280     if (settings == PHY_PHYCTRL2_MODE_OP_MOD_10MBPS_HD     ||
//  281         settings == PHY_PHYCTRL2_MODE_OP_MOD_10MBPS_FD)
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BEQ.N    ??eth_phy_get_manual_speed_2
        LDR      R0,[SP, #+0]
        CMP      R0,#+5
        BNE.N    ??eth_phy_get_manual_speed_3
//  282         *speed = MII_10BASET;
??eth_phy_get_manual_speed_2:
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
        B.N      ??eth_phy_get_manual_speed_4
//  283     else
//  284         *speed = MII_100BASET;
??eth_phy_get_manual_speed_3:
        MOVS     R0,#+1
        STR      R0,[R4, #+0]
//  285 #else
//  286     if (settings & PHY_PHYSTS_SPEEDSTATUS)
//  287         *speed = MII_10BASET;
//  288     else
//  289         *speed = MII_100BASET;    
//  290 #endif
//  291     
//  292     return 0;
??eth_phy_get_manual_speed_4:
        MOVS     R0,#+0
??eth_phy_get_manual_speed_1:
        POP      {R1,R2,R4,PC}    ;; return
//  293 }
//  294 /********************************************************************/
//  295 /*!
//  296  * \brief   Get the manual duplex
//  297  * \param   phy_addr    Address of the PHY
//  298  * \param   duplex       Pointer where duplex data is stored
//  299  * \return  0 if successful; non-zero otherwise
//  300  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  301 int 
//  302 eth_phy_get_manual_duplex(int ch, int phy_addr, int *duplex)
//  303 {
eth_phy_get_manual_duplex:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R2
//  304 #if MII_CHECK_TIMEOUT  
//  305     int timeout;
//  306 #endif    
//  307     int settings = 0;
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
//  308 
//  309     /* Get Link Partner settings */
//  310 #if MII_CHECK_TIMEOUT
//  311     for (timeout = 0; timeout < MII_TIMEOUT; ++timeout)
//  312 #endif
//  313     while(1)
//  314     {
//  315 #ifdef TWR_K60N512 
//  316         if (mii_read(ch, phy_addr, PHY_PHYCTRL2, &settings))//Micrel
        ADD      R3,SP,#+0
        MOVS     R2,#+31
        BL       mii_read
        CMP      R0,#+0
        BEQ.N    ??eth_phy_get_manual_duplex_0
//  317 #else
//  318         if (mii_read(ch, phy_addr, PHY_PHYSTS, &settings))//National Semiconductors
//  319 #endif
//  320             return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_get_manual_duplex_1
//  321         else
//  322             break;
//  323     }
//  324 #if MII_CHECK_TIMEOUT
//  325     if (timeout == MII_TIMEOUT)
//  326         return 1;
//  327 #endif
//  328 
//  329 #ifdef TWR_K60N512    
//  330     /*FSL: obtain speed/duplex*/
//  331     settings = (settings & PHY_PHYCTRL2_OP_MOD_MASK)>>PHY_PHYCTRL2_OP_MOD_SHIFT;
??eth_phy_get_manual_duplex_0:
        LDR      R0,[SP, #+0]
        UBFX     R0,R0,#+2,#+3
        STR      R0,[SP, #+0]
//  332     
//  333     if (settings == PHY_PHYCTRL2_MODE_OP_MOD_10MBPS_HD     ||
//  334         settings == PHY_PHYCTRL2_MODE_OP_MOD_100MBPS_HD)
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BEQ.N    ??eth_phy_get_manual_duplex_2
        LDR      R0,[SP, #+0]
        CMP      R0,#+2
        BNE.N    ??eth_phy_get_manual_duplex_3
//  335         *duplex = MII_HDX;
??eth_phy_get_manual_duplex_2:
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
        B.N      ??eth_phy_get_manual_duplex_4
//  336     else
//  337         *duplex = MII_FDX;
??eth_phy_get_manual_duplex_3:
        MOVS     R0,#+1
        STR      R0,[R4, #+0]
//  338 #else
//  339     if (settings & PHY_PHYSTS_DUPLEXSTATUS)
//  340         *duplex = MII_FDX;
//  341     else
//  342         *duplex = MII_HDX;
//  343 #endif
//  344 
//  345     return 0;
??eth_phy_get_manual_duplex_4:
        MOVS     R0,#+0
??eth_phy_get_manual_duplex_1:
        POP      {R1,R2,R4,PC}    ;; return
//  346 }
//  347 
//  348 /********************************************************************/
//  349 /*!
//  350  * \brief   Get the manual speed
//  351  * \param   phy_addr    Address of the PHY
//  352  * \param   loop        set if loopback is needed
//  353  * \return  0 if successful; non-zero otherwise
//  354  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  355 int 
//  356 eth_phy_set_remote_loopback(int ch, int phy_addr, int loop)
//  357 {
eth_phy_set_remote_loopback:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  358 #if MII_CHECK_TIMEOUT
//  359     int timeout;
//  360 #endif
//  361     int settings = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  362 
//  363     /* Get Link Partner settings */
//  364 #if MII_CHECK_TIMEOUT
//  365     for (timeout = 0; timeout < MII_TIMEOUT; ++timeout)
//  366 #endif
//  367     while(1)
//  368     {      
//  369         if (mii_read(ch, phy_addr, PHY_PHYCTRL1, &settings))
        ADD      R3,SP,#+0
        MOVS     R2,#+30
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_read
        CMP      R0,#+0
        BEQ.N    ??eth_phy_set_remote_loopback_0
//  370             return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_set_remote_loopback_1
//  371         else
//  372             break;
//  373     }
//  374 #if MII_CHECK_TIMEOUT
//  375     if (timeout == MII_TIMEOUT)
//  376         return 1;
//  377 #endif
//  378     /*set remote loopback flag*/
//  379     if(loop)
??eth_phy_set_remote_loopback_0:
        CMP      R6,#+0
        BEQ.N    ??eth_phy_set_remote_loopback_2
//  380       settings |= PHY_PHYCTRL1_REMOTE_LOOP; /*set bit*/
        LDR      R0,[SP, #+0]
        ORRS     R0,R0,#0x80
        STR      R0,[SP, #+0]
        B.N      ??eth_phy_set_remote_loopback_3
//  381     else      
//  382       settings &= ~PHY_PHYCTRL1_REMOTE_LOOP; /*clear bit*/
??eth_phy_set_remote_loopback_2:
        LDR      R0,[SP, #+0]
        BICS     R0,R0,#0x80
        STR      R0,[SP, #+0]
//  383     
//  384     if (mii_write(ch, phy_addr, PHY_PHYCTRL1, settings))
??eth_phy_set_remote_loopback_3:
        LDR      R3,[SP, #+0]
        MOVS     R2,#+30
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_write
        CMP      R0,#+0
        BEQ.N    ??eth_phy_set_remote_loopback_4
//  385         return 1;
        MOVS     R0,#+1
        B.N      ??eth_phy_set_remote_loopback_1
//  386 
//  387     return 0;
??eth_phy_set_remote_loopback_4:
        MOVS     R0,#+0
??eth_phy_set_remote_loopback_1:
        POP      {R1,R2,R4-R6,PC}  ;; return
//  388 }
//  389 
//  390 /********************************************************************/
//  391 /*!
//  392  * \brief   Print all the MII registers (0x00-0x1F)
//  393  * \param   phy_addr    Address of the PHY
//  394  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  395 int 
//  396 eth_phy_reg_dump(int ch, int phy_addr)
//  397 {
eth_phy_reg_dump:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
//  398     int j, settings;
//  399     
//  400     printf("\n    MII Register Block\n");
        LDR.N    R0,??DataTable4_3
        BL       printf
//  401     printf("--------------------------------");
        LDR.N    R0,??DataTable4_4
        BL       printf
//  402     for (j = 0; j < 32; j++)
        MOVS     R6,#+0
        B.N      ??eth_phy_reg_dump_0
//  403     {
//  404         mii_read(ch, phy_addr, j, &settings);
//  405         if (!(j % 4))
//  406             printf("\n0x%02X-0x%02X : %04X ", j, j + 3, settings);
//  407         else
//  408             printf("%04X ", settings);
??eth_phy_reg_dump_1:
        LDR      R1,[SP, #+0]
        LDR.N    R0,??DataTable4_5
        BL       printf
??eth_phy_reg_dump_2:
        ADDS     R6,R6,#+1
??eth_phy_reg_dump_0:
        CMP      R6,#+32
        BGE.N    ??eth_phy_reg_dump_3
        ADD      R3,SP,#+0
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R4
        BL       mii_read
        MOVS     R0,#+4
        SDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        CMP      R1,#+0
        BNE.N    ??eth_phy_reg_dump_1
        LDR      R3,[SP, #+0]
        ADDS     R2,R6,#+3
        MOVS     R1,R6
        LDR.N    R0,??DataTable4_6
        BL       printf
        B.N      ??eth_phy_reg_dump_2
//  409     }
//  410     printf("\n");
??eth_phy_reg_dump_3:
        ADR.N    R0,??DataTable4  ;; "\n"
        BL       printf
//  411     
//  412     return 0;
        MOVS     R0,#+0
        POP      {R1,R2,R4-R6,PC}  ;; return
//  413 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC8      "\n",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     eth_phy_anar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x1ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     `?<Constant "\\n    MII Register Block\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     `?<Constant "---------------------...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     `?<Constant "%04X ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     `?<Constant "\\n0x%02X-0x%02X : %04X ">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n    MII Register Block\\n">`:
        DATA
        DC8 "\012    MII Register Block\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "---------------------...">`:
        DATA
        DC8 "--------------------------------"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n0x%02X-0x%02X : %04X ">`:
        DATA
        DC8 "\0120x%02X-0x%02X : %04X "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%04X ">`:
        DATA
        DC8 "%04X "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "\012"

        END
// 
//   4 bytes in section .data
//  98 bytes in section .rodata
// 814 bytes in section .text
// 
// 814 bytes of CODE  memory
//  98 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: none
