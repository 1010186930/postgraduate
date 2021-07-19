///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:40 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\enet\m /
//                    ii.c                                                    /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\enet\m /
//                    ii.c -D IAR -D TWR_K60N512 -lCN                         /
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
//                    rld\RAM_128KB\List\mii.s                                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME mii

        #define SHT_PROGBITS 0x1

        PUBLIC mii_init
        PUBLIC mii_read
        PUBLIC mii_write

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\enet\mii.c
//    1 /*!
//    2  * \file    mii.c
//    3  * \brief   Media Independent Interface (MII) driver
//    4  * \version $Revision: 1.2 $
//    5  * \author  Michael Norman
//    6  * 
//    7  * \warning This driver assumes that FEC0 is used for all MII management
//    8  *          communications. For dual PHYs, etc. Insure that FEC0_MDC and
//    9  *          FEC0_MDIO are connected to the PHY's MDC and MDIO.
//   10  */
//   11 
//   12 #include "common.h"
//   13 #include "mii.h"
//   14 
//   15 /********************************************************************/
//   16 /*
//   17  * \brief   Initialize the MII interface controller
//   18  * \param   System Clock Frequency (in MHz)
//   19  * \warning The system clock in this case is the clock that drives
//   20  *          the FEC logic.  This may be different from the speed at which 
//   21  *          the CPU is operating.
//   22  * 
//   23  * Initialize the MII clock (EMDC) frequency. The desired MII clock is 2.5MHz:
//   24  *
//   25  * MII Speed Setting = System_Clock / (2.5MHz * 2)
//   26  * (plus 1 to round up)
//   27  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 void
//   29 mii_init(int ch, int sys_clk_mhz)
//   30 {
//   31     ENET_MSCR/*(ch)*/ = 0
//   32 #ifdef TSIEVB/*TSI EVB requires a longer hold time than default 10 ns*/
//   33                       | ENET_MSCR_HOLDTIME(2) 
//   34 #endif                      
//   35                       | ENET_MSCR_MII_SPEED((2*sys_clk_mhz/5)+1)
//   36                       ;
mii_init:
        LSLS     R2,R1,#+1
        MOVS     R3,#+5
        SDIV     R2,R2,R3
        ADDS     R2,R2,#+1
        LSLS     R2,R2,#+1
        ANDS     R2,R2,#0x7E
        LDR.N    R3,??DataTable2  ;; 0x400c0044
        STR      R2,[R3, #+0]
//   37 }
        BX       LR               ;; return
//   38 /********************************************************************/
//   39 /*!
//   40  * \brief Write a value to a PHY's MII register.
//   41  * 
//   42  * \param   phy_addr    Address of the PHY
//   43  * \param   reg_addr    Address of the register in the PHY
//   44  * \param   data        Data to be written to the PHY register
//   45  * \return  0 if write is successful; 1 if write times out
//   46  *
//   47  * mii_write() polls for the FEC's MII interrupt event (which should
//   48  * be masked from the interrupt handler) and clears it. If after a
//   49  * suitable amount of time the event isn't triggered, a non-zero value 
//   50  * is returned.
//   51  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   52 int 
//   53 mii_write(int ch, int phy_addr, int reg_addr, int data)
//   54 {
mii_write:
        PUSH     {R4-R6}
        MOVS     R4,R0
//   55 	int timeout;
//   56 
//   57 	/* Clear the MII interrupt bit */
//   58 	ENET_EIR/*(ch)*/ = ENET_EIR_MII_MASK;
        LDR.N    R0,??DataTable2_1  ;; 0x400c0004
        MOVS     R6,#+8388608
        STR      R6,[R0, #+0]
//   59 
//   60 	/* Initiatate the MII Management write */
//   61 	ENET_MMFR/*(ch)*/ = 0
//   62 		| ENET_MMFR_ST(0x01)
//   63 		| ENET_MMFR_OP(0x01)
//   64 		| ENET_MMFR_PA(phy_addr)
//   65 		| ENET_MMFR_RA(reg_addr)
//   66 		| ENET_MMFR_TA(0x02)
//   67 		| ENET_MMFR_DATA(data);
        LSLS     R0,R1,#+23
        ANDS     R0,R0,#0xF800000
        LSLS     R6,R2,#+18
        ANDS     R6,R6,#0x7C0000
        ORRS     R0,R6,R0
        UXTH     R6,R3            ;; ZeroExt  R6,R3,#+16,#+16
        ORRS     R0,R6,R0
        LDR.N    R6,??DataTable2_2  ;; 0x50020000
        ORRS     R0,R6,R0
        LDR.N    R6,??DataTable2_3  ;; 0x400c0040
        STR      R0,[R6, #+0]
//   68 
//   69 	/* Poll for the MII interrupt (interrupt should be masked) */
//   70         for (timeout = 0; timeout < MII_TIMEOUT; timeout++)
        MOVS     R0,#+0
        MOVS     R5,R0
??mii_write_0:
        LDR.N    R0,??DataTable2_4  ;; 0x1ffff
        CMP      R5,R0
        BGE.N    ??mii_write_1
//   71 	{
//   72 		if (ENET_EIR/*(ch)*/ & ENET_EIR_MII_MASK)
        LDR.N    R0,??DataTable2_1  ;; 0x400c0004
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+8
        BMI.N    ??mii_write_1
//   73 			break;
//   74 	}
??mii_write_2:
        ADDS     R5,R5,#+1
        B.N      ??mii_write_0
//   75 
//   76 	if(timeout == MII_TIMEOUT) 
??mii_write_1:
        LDR.N    R0,??DataTable2_4  ;; 0x1ffff
        CMP      R5,R0
        BNE.N    ??mii_write_3
//   77 		return 1;
        MOVS     R0,#+1
        B.N      ??mii_write_4
//   78 
//   79 	/* Clear the MII interrupt bit */
//   80 	ENET_EIR/*(ch)*/ = ENET_EIR_MII_MASK;
??mii_write_3:
        LDR.N    R0,??DataTable2_1  ;; 0x400c0004
        MOVS     R6,#+8388608
        STR      R6,[R0, #+0]
//   81 
//   82 	return 0;
        MOVS     R0,#+0
??mii_write_4:
        POP      {R4-R6}
        BX       LR               ;; return
//   83 }
//   84 /********************************************************************/
//   85 /*!
//   86  * \brief   Read a value from a PHY's MII register.
//   87  * \param   phy_addr    Address of the PHY
//   88  * \param   reg_addr    Address of the register in the PHY
//   89  * \param   data        Pointer to location were read data will be stored
//   90  * \return  0 if write is successful; 1 if write times out
//   91  *
//   92  * mii_read() polls for the FEC's MII interrupt event (which should
//   93  * be masked from the interrupt handler) and clears it. If after a
//   94  * suitable amount of time the event isn't triggered, a non-zero value 
//   95  * is returned.
//   96  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   97 int 
//   98 mii_read(int ch, int phy_addr, int reg_addr, int *data)
//   99 {
mii_read:
        PUSH     {R4-R6}
        MOVS     R4,R0
//  100 	int timeout;
//  101 
//  102 	/* Clear the MII interrupt bit */
//  103 	ENET_EIR/*(ch)*/ = ENET_EIR_MII_MASK;
        LDR.N    R0,??DataTable2_1  ;; 0x400c0004
        MOVS     R6,#+8388608
        STR      R6,[R0, #+0]
//  104 
//  105 	/* Initiatate the MII Management read */
//  106 	ENET_MMFR/*(ch)*/ = 0
//  107 		| ENET_MMFR_ST(0x01)
//  108 		| ENET_MMFR_OP(0x2)
//  109 		| ENET_MMFR_PA(phy_addr)
//  110 		| ENET_MMFR_RA(reg_addr)
//  111 		| ENET_MMFR_TA(0x02);
        LSLS     R0,R1,#+23
        ANDS     R0,R0,#0xF800000
        LSLS     R6,R2,#+18
        ANDS     R6,R6,#0x7C0000
        ORRS     R0,R6,R0
        LDR.N    R6,??DataTable2_5  ;; 0x60020000
        ORRS     R0,R6,R0
        LDR.N    R6,??DataTable2_3  ;; 0x400c0040
        STR      R0,[R6, #+0]
//  112 
//  113 	/* Poll for the MII interrupt (interrupt should be masked) */
//  114 	for (timeout = 0; timeout < MII_TIMEOUT; timeout++)
        MOVS     R0,#+0
        MOVS     R5,R0
??mii_read_0:
        LDR.N    R0,??DataTable2_4  ;; 0x1ffff
        CMP      R5,R0
        BGE.N    ??mii_read_1
//  115 	{
//  116 		if (ENET_EIR/*(ch)*/ & ENET_EIR_MII_MASK)
        LDR.N    R0,??DataTable2_1  ;; 0x400c0004
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+8
        BMI.N    ??mii_read_1
//  117 			break;
//  118 	}
??mii_read_2:
        ADDS     R5,R5,#+1
        B.N      ??mii_read_0
//  119     
//  120 	if(timeout == MII_TIMEOUT) 
??mii_read_1:
        LDR.N    R0,??DataTable2_4  ;; 0x1ffff
        CMP      R5,R0
        BNE.N    ??mii_read_3
//  121 		return 1;
        MOVS     R0,#+1
        B.N      ??mii_read_4
//  122 
//  123 	/* Clear the MII interrupt bit */
//  124 	ENET_EIR/*(ch)*/ = ENET_EIR_MII_MASK;
??mii_read_3:
        LDR.N    R0,??DataTable2_1  ;; 0x400c0004
        MOVS     R6,#+8388608
        STR      R6,[R0, #+0]
//  125 
//  126 	*data = ENET_MMFR/*(ch)*/ & 0x0000FFFF;
        LDR.N    R0,??DataTable2_3  ;; 0x400c0040
        LDR      R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[R3, #+0]
//  127 
//  128 	return 0;
        MOVS     R0,#+0
??mii_read_4:
        POP      {R4-R6}
        BX       LR               ;; return
//  129 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x400c0044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x400c0004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x50020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x400c0040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x1ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x60020000

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  130 /********************************************************************/
// 
// 218 bytes in section .text
// 
// 218 bytes of CODE memory
//
//Errors: none
//Warnings: none
