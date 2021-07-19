///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:43 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\driv /
//                    ers\mcg\mcg.c                                           /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\dri /
//                    vers\mcg\mcg.c" -D IAR -D TWR_K60N512 -lCN              /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\mcg.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME mcg

        #define SHT_PROGBITS 0x1
        #define SHF_WRITE 0x1
        #define SHF_EXECINSTR 0x4

        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_i2f
        EXTERN core_clk_khz
        EXTERN core_clk_mhz
        EXTERN dmx32_val
        EXTERN drs_val
        EXTERN periph_clk_khz
        EXTERN printf
        EXTERN time_delay_ms

        PUBLIC atc
        PUBLIC fast_irc_freq
        PUBLIC fbe_fbi_fast
        PUBLIC fbe_fbi_slow
        PUBLIC fbe_pbe
        PUBLIC fbi_blpi
        PUBLIC fee_fei
        PUBLIC fei_fbe
        PUBLIC fll_freq
        PUBLIC fll_rtc_init
        PUBLIC mcg_blpi_2_pee
        PUBLIC mcg_pbe_2_pee
        PUBLIC mcg_pee_2_blpi
        PUBLIC pbe_fbe
        PUBLIC pbe_pee
        PUBLIC pee_pbe
        PUBLIC pll_init
        PUBLIC rtc_as_refclk
        PUBLIC set_sys_dividers
        PUBLIC slow_irc_freq

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\drivers\mcg\mcg.c
//    1 /*
//    2  * File:    mcg.c
//    3  * Purpose: Driver for enabling the PLL in 1 of 4 options
//    4  *
//    5  * Notes:
//    6  * Assumes the MCG mode is in the default FEI mode out of reset
//    7  * One of 4 clocking oprions can be selected.
//    8  * One of 16 crystal values can be used
//    9  */
//   10 
//   11 #include "common.h"
//   12 #include "mcg.h"
//   13 #include "lptmr.h"
//   14 
//   15 // global variables
//   16 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   17 extern int slow_irc_freq = 32768; // default slow irc frequency is 32768Hz
slow_irc_freq:
        DATA
        DC32 32768

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 extern int fast_irc_freq = 4000000; // default fast irc frequency is 4MHz
fast_irc_freq:
        DATA
        DC32 4000000
//   19 
//   20 extern int core_clk_khz;
//   21 extern int core_clk_mhz;
//   22 extern int periph_clk_khz;
//   23 extern char drs_val, dmx32_val;
//   24 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   25 unsigned char fll_rtc_init(unsigned char clk_option, unsigned char crystal_val)
//   26 {
fll_rtc_init:
        PUSH     {R7,LR}
//   27   unsigned char pll_freq;
//   28 
//   29   rtc_as_refclk();
        BL       rtc_as_refclk
//   30   pll_freq = 24;
        MOVS     R0,#+24
//   31   return pll_freq;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return
//   32 }
//   33 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   34 unsigned char pll_init(unsigned char clk_option, unsigned char crystal_val)
//   35 {
pll_init:
        PUSH     {R7,LR}
        MOVS     R2,R1
//   36   unsigned char pll_freq;
//   37 
//   38   if (clk_option > 3) {return 0;} //return 0 if one of the available options is not selected
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BCC.N    ??pll_init_0
        MOVS     R0,#+0
        B.N      ??pll_init_1
//   39   if (crystal_val > 15) {return 1;} // return 1 if one of the available crystal options is not available
??pll_init_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BCC.N    ??pll_init_2
        MOVS     R0,#+1
        B.N      ??pll_init_1
//   40 //This assumes that the MCG is in default FEI mode out of reset.
//   41 
//   42 // First move to FBE mode
//   43 #if (defined(K60_CLK) || defined(ASB817)||defined(K53_CLK))
//   44      MCG_C2 = 0;
??pll_init_2:
        LDR.W    R2,??DataTable15_1  ;; 0x40064001
        MOVS     R3,#+0
        STRB     R3,[R2, #+0]
//   45 #else
//   46 // Enable external oscillator, RANGE=2, HGO=1, EREFS=1, LP=0, IRCS=0
//   47     MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//   48 #endif
//   49 
//   50 // after initialization of oscillator release latched state of oscillator and GPIO
//   51     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.W    R2,??DataTable15_2  ;; 0x40048034
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x10000000
        LDR.W    R3,??DataTable15_2  ;; 0x40048034
        STR      R2,[R3, #+0]
//   52     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.W    R2,??DataTable15_3  ;; 0x4007c008
        LDRB     R2,[R2, #+0]
        ORRS     R2,R2,#0x80
        LDR.W    R3,??DataTable15_3  ;; 0x4007c008
        STRB     R2,[R3, #+0]
//   53   
//   54 // Select external oscilator and Reference Divider and clear IREFS to start ext osc
//   55 // CLKS=2, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//   56   MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R2,??DataTable15_4  ;; 0x40064000
        MOVS     R3,#+152
        STRB     R3,[R2, #+0]
//   57 
//   58   /* if we aren't using an osc input we don't need to wait for the osc to init */
//   59 #if (!defined(K60_CLK) && !defined(ASB817)&& !defined(K53_CLK))
//   60     while (!(MCG_S & MCG_S_OSCINIT_MASK)){};  // wait for oscillator to initialize
//   61 #endif
//   62 
//   63   while (MCG_S & MCG_S_IREFST_MASK){}; // wait for Reference clock Status bit to clear
??pll_init_3:
        LDR.W    R2,??DataTable15_5  ;; 0x40064006
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+27
        BMI.N    ??pll_init_3
//   64 
//   65   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}; // Wait for clock status bits to show clock source is ext ref clk
??pll_init_4:
        LDR.W    R2,??DataTable15_5  ;; 0x40064006
        LDRB     R2,[R2, #+0]
        UBFX     R2,R2,#+2,#+2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+2
        BNE.N    ??pll_init_4
//   66 
//   67 // Now in FBE
//   68 
//   69 #if (defined(K60_CLK)||defined(K53_CLK))
//   70    MCG_C5 = MCG_C5_PRDIV(0x18);
        LDR.W    R2,??DataTable15_6  ;; 0x40064004
        MOVS     R3,#+24
        STRB     R3,[R2, #+0]
//   71 #else
//   72 // Configure PLL Ref Divider, PLLCLKEN=0, PLLSTEN=0, PRDIV=5
//   73 // The crystal frequency is used to select the PRDIV value. Only even frequency crystals are supported
//   74 // that will produce a 2MHz reference clock to the PLL.
//   75   MCG_C5 = MCG_C5_PRDIV(crystal_val); // Set PLL ref divider to match the crystal used
//   76 #endif
//   77 
//   78   // Ensure MCG_C6 is at the reset default of 0. LOLIE disabled, PLL disabled, clk monitor disabled, PLL VCO divider is clear
//   79   MCG_C6 = 0x0;
        LDR.W    R2,??DataTable15_7  ;; 0x40064005
        MOVS     R3,#+0
        STRB     R3,[R2, #+0]
//   80 // Select the PLL VCO divider and system clock dividers depending on clocking option
//   81   switch (clk_option) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??pll_init_5
        CMP      R0,#+2
        BEQ.N    ??pll_init_6
        BCC.N    ??pll_init_7
        CMP      R0,#+3
        BEQ.N    ??pll_init_8
        B.N      ??pll_init_9
//   82     case 0:
//   83       // Set system options dividers
//   84       //MCG=PLL, core = MCG, bus = MCG, FlexBus = MCG, Flash clock= MCG/2
//   85       set_sys_dividers(0,0,0,1);
??pll_init_5:
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       set_sys_dividers
//   86       // Set the VCO divider and enable the PLL for 50MHz, LOLIE=0, PLLS=1, CME=0, VDIV=1
//   87       MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(1); //VDIV = 1 (x25)
        LDR.W    R0,??DataTable15_7  ;; 0x40064005
        MOVS     R1,#+65
        STRB     R1,[R0, #+0]
//   88       pll_freq = 50;
        MOVS     R1,#+50
//   89       break;
        B.N      ??pll_init_9
//   90    case 1:
//   91       // Set system options dividers
//   92       //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//   93      set_sys_dividers(0,1,1,3);
??pll_init_7:
        MOVS     R3,#+3
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       set_sys_dividers
//   94       // Set the VCO divider and enable the PLL for 100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//   95       MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(26); //VDIV = 26 (x50)
        LDR.W    R0,??DataTable15_7  ;; 0x40064005
        MOVS     R1,#+90
        STRB     R1,[R0, #+0]
//   96       pll_freq = 100;
        MOVS     R1,#+100
//   97       break;
        B.N      ??pll_init_9
//   98     case 2:
//   99       // Set system options dividers
//  100       //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  101       set_sys_dividers(0,1,1,3);
??pll_init_6:
        MOVS     R3,#+3
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       set_sys_dividers
//  102       // Set the VCO divider and enable the PLL for 96MHz, LOLIE=0, PLLS=1, CME=0, VDIV=24
//  103       MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(24); //VDIV = 24 (x48)
        LDR.W    R0,??DataTable15_7  ;; 0x40064005
        MOVS     R1,#+88
        STRB     R1,[R0, #+0]
//  104       pll_freq = 96;
        MOVS     R1,#+96
//  105       break;
        B.N      ??pll_init_9
//  106    case 3:
//  107       // Set system options dividers
//  108       //MCG=PLL, core = MCG, bus = MCG, FlexBus = MCG, Flash clock= MCG/2
//  109       set_sys_dividers(0,0,0,1);
??pll_init_8:
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       set_sys_dividers
//  110       // Set the VCO divider and enable the PLL for 48MHz, LOLIE=0, PLLS=1, CME=0, VDIV=0
//  111       MCG_C6 = MCG_C6_PLLS_MASK; //VDIV = 0 (x24)
        LDR.W    R0,??DataTable15_7  ;; 0x40064005
        MOVS     R1,#+64
        STRB     R1,[R0, #+0]
//  112       pll_freq = 48;
        MOVS     R1,#+48
//  113       break;
//  114   }
//  115   while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set
??pll_init_9:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pll_init_9
//  116 
//  117   while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set
??pll_init_10:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pll_init_10
//  118 
//  119 // Now running PBE Mode
//  120 
//  121 // Transition into PEE by setting CLKS to 0
//  122 // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  123   MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R2,??DataTable15_4  ;; 0x40064000
        STRB     R0,[R2, #+0]
//  124 
//  125 // Wait for clock status bits to update
//  126   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pll_init_11:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pll_init_11
//  127 
//  128 // Now running PEE Mode
//  129 
//  130 return pll_freq;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??pll_init_1:
        POP      {R1,PC}          ;; return
//  131 } //pll_init
//  132 
//  133 
//  134  /*
//  135   * This routine must be placed in RAM. It is a workaround for errata e2448.
//  136   * Flash prefetch must be disabled when the flash clock divider is changed.
//  137   * This cannot be performed while executing out of flash.
//  138   * There must be a short delay after the clock dividers are changed before prefetch
//  139   * can be re-enabled.
//  140   */
//  141 #if (defined(IAR))

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
//  142 	__ramfunc void set_sys_dividers(uint32 outdiv1, uint32 outdiv2, uint32 outdiv3, uint32 outdiv4)
//  143 #elif (defined(CW))
//  144 __relocate_code__ 
//  145 void set_sys_dividers(uint32 outdiv1, uint32 outdiv2, uint32 outdiv3, uint32 outdiv4)
//  146 #endif
//  147 {
set_sys_dividers:
        PUSH     {R4-R6}
//  148   uint32 temp_reg;
//  149   uint8 i;
//  150   
//  151   temp_reg = FMC_PFAPR; // store present value of FMC_PFAPR
        LDR.N    R4,??set_sys_dividers_0  ;; 0x4001f000
        LDR      R4,[R4, #+0]
//  152   
//  153   // set M0PFD through M7PFD to 1 to disable prefetch
//  154   FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  155              | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  156              | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;
        LDR.N    R5,??set_sys_dividers_0  ;; 0x4001f000
        LDR      R5,[R5, #+0]
        ORRS     R5,R5,#0xFF0000
        LDR.N    R6,??set_sys_dividers_0  ;; 0x4001f000
        STR      R5,[R6, #+0]
//  157   
//  158   // set clock dividers to desired value  
//  159   SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(outdiv1) | SIM_CLKDIV1_OUTDIV2(outdiv2) 
//  160               | SIM_CLKDIV1_OUTDIV3(outdiv3) | SIM_CLKDIV1_OUTDIV4(outdiv4);
        LSLS     R1,R1,#+24
        ANDS     R1,R1,#0xF000000
        ORRS     R0,R1,R0, LSL #+28
        LSLS     R1,R2,#+20
        ANDS     R1,R1,#0xF00000
        ORRS     R0,R1,R0
        LSLS     R1,R3,#+16
        ANDS     R1,R1,#0xF0000
        ORRS     R0,R1,R0
        LDR.N    R1,??set_sys_dividers_0+0x4  ;; 0x40048044
        STR      R0,[R1, #+0]
//  161 
//  162   // wait for dividers to change
//  163   for (i = 0 ; i < outdiv4 ; i++)
        MOVS     R0,#+0
        B.N      ??set_sys_dividers_1
??set_sys_dividers_2:
        ADDS     R0,R0,#+1
??set_sys_dividers_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R3
        BCC.N    ??set_sys_dividers_2
//  164   {}
//  165   
//  166   FMC_PFAPR = temp_reg; // re-store original value of FMC_PFAPR
        LDR.N    R0,??set_sys_dividers_0  ;; 0x4001f000
        STR      R4,[R0, #+0]
//  167   
//  168   return;
        POP      {R4-R6}
        BX       LR               ;; return
        DATA
??set_sys_dividers_0:
        DC32     0x4001f000
        DC32     0x40048044
//  169 } // set_sys_dividers
//  170 
//  171 
//  172 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  173 void mcg_pee_2_blpi(void)
//  174 {
//  175     uint8 temp_reg;
//  176     // Transition from PEE to BLPI: PEE -> PBE -> FBE -> FBI -> BLPI
//  177   
//  178     // Step 1: PEE -> PBE
//  179     MCG_C1 |= MCG_C1_CLKS(2);  // System clock from external reference OSC, not PLL.
mcg_pee_2_blpi:
        LDR.W    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable15_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  180     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){};  // Wait for clock status to update.
??mcg_pee_2_blpi_0:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??mcg_pee_2_blpi_0
//  181     
//  182     // Step 2: PBE -> FBE
//  183     MCG_C6 &= ~MCG_C6_PLLS_MASK;  // Clear PLLS to select FLL, still running system from ext OSC.
        LDR.W    R0,??DataTable15_7  ;; 0x40064005
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xBF
        LDR.W    R1,??DataTable15_7  ;; 0x40064005
        STRB     R0,[R1, #+0]
//  184     while (MCG_S & MCG_S_PLLST_MASK){};  // Wait for PLL status flag to reflect FLL selected.
??mcg_pee_2_blpi_1:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BMI.N    ??mcg_pee_2_blpi_1
//  185     
//  186     // Step 3: FBE -> FBI
//  187     MCG_C2 &= ~MCG_C2_LP_MASK;  // FLL remains active in bypassed modes.
        LDR.W    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFD
        LDR.W    R1,??DataTable15_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  188     MCG_C2 |= MCG_C2_IRCS_MASK;  // Select fast (1MHz) internal reference
        LDR.W    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable15_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  189     temp_reg = MCG_C1;
        LDR.W    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
//  190     temp_reg &= ~(MCG_C1_CLKS_MASK | MCG_C1_IREFS_MASK);
        ANDS     R0,R0,#0x3B
//  191     temp_reg |= (MCG_C1_CLKS(1) | MCG_C1_IREFS_MASK);  // Select internal reference (fast IREF clock @ 1MHz) as MCG clock source.
        ORRS     R0,R0,#0x44
//  192     MCG_C1 = temp_reg;
        LDR.W    R1,??DataTable15_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  193   
//  194     while (MCG_S & MCG_S_IREFST_MASK){};  // Wait for Reference Status bit to update.
??mcg_pee_2_blpi_2:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??mcg_pee_2_blpi_2
//  195     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x1){};  // Wait for clock status bits to update
??mcg_pee_2_blpi_3:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??mcg_pee_2_blpi_3
//  196     
//  197     // Step 4: FBI -> BLPI
//  198     MCG_C1 |= MCG_C1_IREFSTEN_MASK;  // Keep internal reference clock running in STOP modes.
        LDR.W    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable15_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  199     MCG_C2 |= MCG_C2_LP_MASK;  // FLL remains disabled in bypassed modes.
        LDR.W    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable15_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  200     while (!(MCG_S & MCG_S_IREFST_MASK)){};  // Wait for Reference Status bit to update.
??mcg_pee_2_blpi_4:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??mcg_pee_2_blpi_4
//  201     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x1){};  // Wait for clock status bits to update.
??mcg_pee_2_blpi_5:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??mcg_pee_2_blpi_5
//  202   
//  203 } // end MCG PEE to BLPI
        BX       LR               ;; return
//  204 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  205 void mcg_blpi_2_pee(void)
//  206 {
mcg_blpi_2_pee:
        PUSH     {R7,LR}
//  207     uint8 temp_reg;
//  208     // Transition from BLPI to PEE: BLPI -> FBI -> FEI -> FBE -> PBE -> PEE
//  209   
//  210     // Step 1: BLPI -> FBI
//  211     MCG_C2 &= ~MCG_C2_LP_MASK;  // FLL remains active in bypassed modes.
        LDR.W    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFD
        LDR.W    R1,??DataTable15_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  212     while (!(MCG_S & MCG_S_IREFST_MASK)){};  // Wait for Reference Status bit to update.
??mcg_blpi_2_pee_0:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??mcg_blpi_2_pee_0
//  213     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x1){};  // Wait for clock status bits to update
??mcg_blpi_2_pee_1:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??mcg_blpi_2_pee_1
//  214     
//  215     // Step 2: FBI -> FEI
//  216     MCG_C2 &= ~MCG_C2_LP_MASK;  // FLL remains active in bypassed modes.
        LDR.W    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFD
        LDR.W    R1,??DataTable15_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  217     temp_reg = MCG_C2;  // assign temporary variable of MCG_C2 contents
        LDR.W    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R0,[R0, #+0]
//  218     temp_reg &= ~MCG_C2_RANGE_MASK;  // set RANGE field location to zero
        ANDS     R0,R0,#0xCF
//  219     temp_reg |= (0x2 << 0x4);  // OR in new values
        ORRS     R0,R0,#0x20
//  220     MCG_C2 = temp_reg;  // store new value in MCG_C2
        LDR.W    R1,??DataTable15_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  221     MCG_C4 = 0x0E;  // Low-range DCO output (~10MHz bus).  FCTRIM=%0111.
        LDR.W    R0,??DataTable15_8  ;; 0x40064003
        MOVS     R1,#+14
        STRB     R1,[R0, #+0]
//  222     MCG_C1 = 0x04;  // Select internal clock as MCG source, FRDIV=%000, internal reference selected.
        LDR.W    R0,??DataTable15_4  ;; 0x40064000
        MOVS     R1,#+4
        STRB     R1,[R0, #+0]
//  223  
//  224     while (!(MCG_S & MCG_S_IREFST_MASK)){};   // Wait for Reference Status bit to update 
??mcg_blpi_2_pee_2:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??mcg_blpi_2_pee_2
//  225     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x0){}; // Wait for clock status bits to update
??mcg_blpi_2_pee_3:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??mcg_blpi_2_pee_3
//  226     
//  227     // Handle FEI to PEE transitions using standard clock initialization routine.
//  228     core_clk_mhz = pll_init(CORE_CLK_MHZ, REF_CLK); 
        MOVS     R1,#+3
        MOVS     R0,#+2
        BL       pll_init
        LDR.W    R1,??DataTable15_9
        STR      R0,[R1, #+0]
//  229 
//  230     /* Use the value obtained from the pll_init function to define variables
//  231     * for the core clock in kHz and also the peripheral clock. These
//  232     * variables can be used by other functions that need awareness of the
//  233     * system frequency.
//  234     */
//  235     core_clk_khz = core_clk_mhz * 1000;
        LDR.W    R0,??DataTable15_9
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        LDR.W    R1,??DataTable15_10
        STR      R0,[R1, #+0]
//  236     periph_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> 24)+ 1);        
        LDR.W    R0,??DataTable15_10
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable15_11  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+24,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.W    R1,??DataTable15_12
        STR      R0,[R1, #+0]
//  237 } // end MCG BLPI to PEE
        POP      {R0,PC}          ;; return
//  238 /********************************************************************/
//  239 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  240 void mcg_pbe_2_pee(void)
//  241 {  
//  242   MCG_C1 &= ~MCG_C1_CLKS_MASK; // select PLL as MCG_OUT
mcg_pbe_2_pee:
        LDR.W    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable15_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  243   // Wait for clock status bits to update 
//  244   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){}; 
??mcg_pbe_2_pee_0:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??mcg_pbe_2_pee_0
//  245 
//  246   switch (CORE_CLK_MHZ) {
//  247     case PLL50:
//  248       core_clk_khz = 50000;
//  249       break;
//  250     case PLL100:
//  251       core_clk_khz = 100000;
//  252       break;
//  253     case PLL96:
//  254       core_clk_khz = 96000;
        LDR.W    R0,??DataTable15_10
        LDR.W    R1,??DataTable15_13  ;; 0x17700
        STR      R1,[R0, #+0]
//  255       break;  
//  256     case PLL48:
//  257       core_clk_khz = 48000;
//  258       break;  
//  259   }
//  260 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  261 void rtc_as_refclk(void)
//  262 {
rtc_as_refclk:
        PUSH     {R7,LR}
//  263   unsigned char temp_reg;
//  264   
//  265 // Using the RTC OSC as FLL Ref Clk
//  266 // enable RTC clock gating
//  267   SIM_SCGC6 |= SIM_SCGC6_RTC_MASK;  
        LDR.W    R0,??DataTable15_14  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.W    R1,??DataTable15_14  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  268 // set RTC in default state using software reset
//  269   RTC_CR |= RTC_CR_SWR_MASK; // set SWR
        LDR.W    R0,??DataTable15_15  ;; 0x4003d010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable15_15  ;; 0x4003d010
        STR      R0,[R1, #+0]
//  270   RTC_CR &= ~RTC_CR_SWR_MASK; // clear SWR
        LDR.W    R0,??DataTable15_15  ;; 0x4003d010
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable15_15  ;; 0x4003d010
        STR      R0,[R1, #+0]
//  271 // Configure and enable the RTC OSC
//  272 // select the load caps (application dependent) and the oscillator enable bit
//  273 // note that other bits in this register may need to be set depending on the intended use of the RTC
//  274   
//  275   RTC_CR |= RTC_CR_OSCE_MASK;
        LDR.W    R0,??DataTable15_15  ;; 0x4003d010
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable15_15  ;; 0x4003d010
        STR      R0,[R1, #+0]
//  276 
//  277   time_delay_ms(1000); // wait for the RTC oscillator to intialize
        MOV      R0,#+1000
        BL       time_delay_ms
//  278 // select the RTC oscillator as the MCG reference clock
//  279   SIM_SOPT2 |= SIM_SOPT2_MCGCLKSEL_MASK;
        LDR.W    R0,??DataTable15_16  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable15_16  ;; 0x40048004
        STR      R0,[R1, #+0]
//  280   
//  281 // ensure MCG_C2 is in the reset state, key items are RANGE = 0 to select the correct FRDIV factor
//  282 // and LP = 0 to keep FLL enabled. HGO and EREFS do not affect RTC oscillator  
//  283   MCG_C2 = 0x0;
        LDR.W    R0,??DataTable15_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  284   
//  285 // Select the Reference Divider and clear IREFS to select the osc
//  286 // CLKS=0, select the FLL as the clock source for MCGOUTCLK
//  287 // FRDIV=0, set the FLL ref divider to divide by 1 
//  288 // IREFS=0, select the external clock 
//  289 // IRCLKEN=0, disable IRCLK (can enable if desired)
//  290 // IREFSTEN=0, disable IRC in stop mode (can keep it enabled in stop if desired)
//  291   MCG_C1 = 0x0;
        LDR.W    R0,??DataTable15_4  ;; 0x40064000
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  292 
//  293   while (MCG_S & MCG_S_IREFST_MASK){}; // wait for Reference clock to switch to external reference
??rtc_as_refclk_0:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??rtc_as_refclk_0
//  294     
//  295   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x0){}; // Wait for clock status bits to update
??rtc_as_refclk_1:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??rtc_as_refclk_1
//  296   
//  297 // Can select the FLL operating range/freq by means of the DRS and DMX32 bits
//  298 // Must first ensure the system clock dividers are set to keep the core and bus clocks
//  299 // within spec.
//  300 //  SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(0) 
//  301 //              | SIM_CLKDIV1_OUTDIV3(0) | SIM_CLKDIV1_OUTDIV4(1);
//  302 
//  303   temp_reg = MCG_C4;
        LDR.W    R0,??DataTable15_8  ;; 0x40064003
        LDRB     R0,[R0, #+0]
//  304   temp_reg &= ~(MCG_C4_DMX32_MASK | MCG_C4_DRST_DRS_MASK); // clear the DMX32 bit and DRS field
        ANDS     R0,R0,#0x1F
//  305   temp_reg |= (MCG_C4_DRST_DRS(drs_val) | (dmx32_val << MCG_C4_DMX32_SHIFT)); // select DRS range and dmx32 setting
        LDR.W    R1,??DataTable15_17
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+5
        ANDS     R1,R1,#0x60
        LDR.W    R2,??DataTable15_18
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+7
        ORRS     R1,R2,R1
        ORRS     R0,R1,R0
//  306   MCG_C4 = temp_reg;
        LDR.W    R1,??DataTable15_8  ;; 0x40064003
        STRB     R0,[R1, #+0]
//  307   
//  308 // should enable clock monitor now that external reference is being used
//  309 //  MCG_C6 |= MCG_C6_CME_MASK;
//  310   
//  311   core_clk_khz = fll_freq(32768); // calculate core clock based on 32768 crystal reference
        MOV      R0,#+32768
        BL       fll_freq
        LDR.W    R1,??DataTable15_10
        STR      R0,[R1, #+0]
//  312   periph_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> 24)+ 1);
        LDR.W    R0,??DataTable15_10
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable15_11  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+24,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.W    R1,??DataTable15_12
        STR      R0,[R1, #+0]
//  313 } //end cmd_rtc_as_refclk
        POP      {R0,PC}          ;; return
//  314 
//  315 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  316 void fee_fei(void)
//  317 {
fee_fei:
        PUSH     {R7,LR}
//  318   unsigned char temp_reg;
//  319   
//  320   // first ensure clock monitor is disabled otherwise a loss of clock reset will occur
//  321   MCG_C6 &= ~MCG_C6_CME_MASK;
        LDR.W    R0,??DataTable15_7  ;; 0x40064005
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xDF
        LDR.W    R1,??DataTable15_7  ;; 0x40064005
        STRB     R0,[R1, #+0]
//  322   
//  323   MCG_C1 |= MCG_C1_IREFS_MASK; // select internal reference
        LDR.W    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable15_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  324   
//  325   // wait for Reference clock to switch to internal reference 
//  326   while (!(MCG_S & MCG_S_IREFST_MASK)){}
??fee_fei_0:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??fee_fei_0
//  327   
//  328   // Select the system oscillator as the MCG reference clock.
//  329   // Not typically requred to set this as default is system oscillator.
//  330   // This is not required as part of moving to FEI but is performed here to ensure the system
//  331   // oscillator is used in future mode changes.
//  332   SIM_SOPT2 &= ~SIM_SOPT2_MCGCLKSEL_MASK;
        LDR.W    R0,??DataTable15_16  ;; 0x40048004
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable15_16  ;; 0x40048004
        STR      R0,[R1, #+0]
//  333   
//  334   temp_reg = MCG_C4;
        LDR.W    R0,??DataTable15_8  ;; 0x40064003
        LDRB     R0,[R0, #+0]
//  335   temp_reg &= ~(MCG_C4_DMX32_MASK | MCG_C4_DRST_DRS_MASK); // clear the DMX32 bit and DRS field
        ANDS     R0,R0,#0x1F
//  336   temp_reg |= (MCG_C4_DRST_DRS(drs_val) | (dmx32_val << MCG_C4_DMX32_SHIFT)); // select DRS range and dmx32 setting
        LDR.W    R1,??DataTable15_17
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+5
        ANDS     R1,R1,#0x60
        LDR.W    R2,??DataTable15_18
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+7
        ORRS     R1,R2,R1
        ORRS     R0,R1,R0
//  337   MCG_C4 = temp_reg;
        LDR.W    R1,??DataTable15_8  ;; 0x40064003
        STRB     R0,[R1, #+0]
//  338   
//  339   core_clk_khz = fll_freq(slow_irc_freq);
        LDR.W    R0,??DataTable15_19
        LDR      R0,[R0, #+0]
        BL       fll_freq
        LDR.W    R1,??DataTable15_10
        STR      R0,[R1, #+0]
//  340   periph_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> 24)+ 1);
        LDR.W    R0,??DataTable15_10
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable15_11  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+24,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.W    R1,??DataTable15_12
        STR      R0,[R1, #+0]
//  341     
//  342 } // fee_fei
        POP      {R0,PC}          ;; return
//  343 
//  344 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  345 int fll_freq(int fll_ref)
//  346 {
//  347   int fll_freq_khz;
//  348   
//  349   if (MCG_C4 & MCG_C4_DMX32_MASK) // if DMX32 set
fll_freq:
        LDR.W    R2,??DataTable15_8  ;; 0x40064003
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+24
        BPL.N    ??fll_freq_0
//  350   {
//  351     switch ((MCG_C4 & MCG_C4_DRST_DRS_MASK) >> MCG_C4_DRST_DRS_SHIFT) // determine multiplier based on DRS
        LDR.W    R2,??DataTable15_8  ;; 0x40064003
        LDRB     R2,[R2, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSRS     R2,R2,#+5
        ANDS     R2,R2,#0x3
        CMP      R2,#+0
        BEQ.N    ??fll_freq_1
        CMP      R2,#+2
        BEQ.N    ??fll_freq_2
        BCC.N    ??fll_freq_3
        CMP      R2,#+3
        BEQ.N    ??fll_freq_4
        B.N      ??fll_freq_5
//  352     {
//  353     case 0:
//  354       fll_freq_khz = ((fll_ref * 732) / 1000);
??fll_freq_1:
        MOV      R1,#+732
        MULS     R0,R1,R0
        MOV      R1,#+1000
        SDIV     R1,R0,R1
//  355       break;
        B.N      ??fll_freq_5
//  356     case 1:
//  357       fll_freq_khz = ((fll_ref * 1464) / 1000);
??fll_freq_3:
        MOV      R1,#+1464
        MULS     R0,R1,R0
        MOV      R1,#+1000
        SDIV     R1,R0,R1
//  358       break;
        B.N      ??fll_freq_5
//  359     case 2:
//  360       fll_freq_khz = ((fll_ref * 2197) / 1000);
??fll_freq_2:
        MOVW     R1,#+2197
        MULS     R0,R1,R0
        MOV      R1,#+1000
        SDIV     R1,R0,R1
//  361       break;
        B.N      ??fll_freq_5
//  362     case 3:
//  363       fll_freq_khz = ((fll_ref * 2929) / 1000);
??fll_freq_4:
        MOVW     R1,#+2929
        MULS     R0,R1,R0
        MOV      R1,#+1000
        SDIV     R1,R0,R1
//  364       break;
        B.N      ??fll_freq_5
//  365     }
//  366   }
//  367   else // if DMX32 = 0
//  368   {
//  369     switch ((MCG_C4 & MCG_C4_DRST_DRS_MASK) >> MCG_C4_DRST_DRS_SHIFT) // determine multiplier based on DRS
??fll_freq_0:
        LDR.W    R2,??DataTable15_8  ;; 0x40064003
        LDRB     R2,[R2, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSRS     R2,R2,#+5
        ANDS     R2,R2,#0x3
        CMP      R2,#+0
        BEQ.N    ??fll_freq_6
        CMP      R2,#+2
        BEQ.N    ??fll_freq_7
        BCC.N    ??fll_freq_8
        CMP      R2,#+3
        BEQ.N    ??fll_freq_9
        B.N      ??fll_freq_5
//  370     {
//  371     case 0:
//  372       fll_freq_khz = ((fll_ref * 640) / 1000);
??fll_freq_6:
        MOV      R1,#+640
        MULS     R0,R1,R0
        MOV      R1,#+1000
        SDIV     R1,R0,R1
//  373       break;
        B.N      ??fll_freq_5
//  374     case 1:
//  375       fll_freq_khz = ((fll_ref * 1280) / 1000);
??fll_freq_8:
        MOV      R1,#+1280
        MULS     R0,R1,R0
        MOV      R1,#+1000
        SDIV     R1,R0,R1
//  376       break;
        B.N      ??fll_freq_5
//  377     case 2:
//  378       fll_freq_khz = ((fll_ref * 1920) / 1000);
??fll_freq_7:
        MOV      R1,#+1920
        MULS     R0,R1,R0
        MOV      R1,#+1000
        SDIV     R1,R0,R1
//  379       break;
        B.N      ??fll_freq_5
//  380     case 3:
//  381       fll_freq_khz = ((fll_ref * 2560) / 1000);
??fll_freq_9:
        MOV      R1,#+2560
        MULS     R0,R1,R0
        MOV      R1,#+1000
        SDIV     R1,R0,R1
//  382       break;
//  383     }
//  384   }    
//  385   return fll_freq_khz;
??fll_freq_5:
        MOVS     R0,R1
        BX       LR               ;; return
//  386 } // fll_freq
//  387 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  388 int fei_fbe(unsigned char crystal_val, unsigned char hgo_val)
//  389 {
//  390   unsigned char frdiv_val;
//  391   int i;
//  392   
//  393   if ((crystal_val > 15) && (crystal_val != 24)) {return 1;} // return 1 if one of the available crystal options is not available
fei_fbe:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BCC.N    ??fei_fbe_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+24
        BEQ.N    ??fei_fbe_0
        MOVS     R0,#+1
        B.N      ??fei_fbe_1
//  394   
//  395   if (hgo_val > 0)
??fei_fbe_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BCC.N    ??fei_fbe_2
//  396   {
//  397     hgo_val = 1; // force hgo_val to 1 if > 0
        MOVS     R1,#+1
//  398   }
//  399 
//  400 #if (defined(K60_CLK))
//  401      MCG_C2 = MCG_C2_RANGE(1); // select external clock and set range to provide correct FRDIV range
??fei_fbe_2:
        LDR.W    R1,??DataTable15_1  ;; 0x40064001
        MOVS     R2,#+16
        STRB     R2,[R1, #+0]
//  402 #else
//  403 // Enable external oscillator, select range based on crystal frequency
//  404   if (crystal_val < 4)
//  405   {
//  406     MCG_C2 = MCG_C2_RANGE(1) | (MCG_C2_HGO_MASK << MCG_C2_HGO_SHIFT) | MCG_C2_EREFS_MASK;
//  407   }
//  408   else
//  409   {
//  410     MCG_C2 = MCG_C2_RANGE(2) | (MCG_C2_HGO_MASK << MCG_C2_HGO_SHIFT) | MCG_C2_EREFS_MASK;
//  411   }
//  412 #endif
//  413 
//  414   switch (crystal_val) // determine FRDIV based on reference clock frequency
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+0
        BEQ.N    ??fei_fbe_3
        SUBS     R1,R1,#+1
        BEQ.N    ??fei_fbe_4
        SUBS     R1,R1,#+1
        CMP      R1,#+2
        BLS.N    ??fei_fbe_5
        SUBS     R1,R1,#+3
        CMP      R1,#+4
        BLS.N    ??fei_fbe_6
        B.N      ??fei_fbe_7
//  415     {
//  416     case 0:
//  417       frdiv_val = 1;
??fei_fbe_3:
        MOVS     R1,#+1
//  418       break;
        B.N      ??fei_fbe_8
//  419     case 1:
//  420       frdiv_val = 2;
??fei_fbe_4:
        MOVS     R1,#+2
//  421       break;
        B.N      ??fei_fbe_8
//  422     case 2:
//  423     case 3:
//  424     case 4:
//  425       frdiv_val = 3;
??fei_fbe_5:
        MOVS     R1,#+3
//  426       break;
        B.N      ??fei_fbe_8
//  427     case 5:
//  428     case 6:
//  429     case 7:
//  430     case 8:
//  431     case 9:
//  432       frdiv_val = 4;
??fei_fbe_6:
        MOVS     R1,#+4
//  433       break;
        B.N      ??fei_fbe_8
//  434     default:
//  435       frdiv_val = 5;        
??fei_fbe_7:
        MOVS     R1,#+5
//  436       break;
//  437     }
//  438 // Select external oscilator and Reference Divider and clear IREFS to start ext osc
//  439 // CLKS=2, FRDIV=frdiv_val, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  440   MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(frdiv_val);
??fei_fbe_8:
        LSLS     R1,R1,#+3
        ANDS     R1,R1,#0x38
        ORRS     R1,R1,#0x80
        LDR.W    R2,??DataTable15_4  ;; 0x40064000
        STRB     R1,[R2, #+0]
//  441 
//  442   /* if we aren't using an osc input we don't need to wait for the osc to init */
//  443 #if (!defined(K60_CLK))
//  444 //  while (!(MCG_S & MCG_S_OSCINIT_MASK)){};  // wait for oscillator to initialize
//  445   for (i = 0 ; i < 10000 ; i++)
//  446   {
//  447     if (MCG_S & MCG_S_OSCINIT_MASK) break; // jump out early if OSCINIT sets before loop finishes
//  448   }
//  449   if (!(MCG_S & MCG_S_OSCINIT_MASK)) return 2; // check bit is really set and return with error if not set
//  450 #endif
//  451 
//  452 //  while (MCG_S & MCG_S_IREFST_MASK){}; // wait for Reference clock Status bit to clear
//  453   for (i = 0 ; i < 2000 ; i++)
        MOVS     R1,#+0
        B.N      ??fei_fbe_9
??fei_fbe_10:
        ADDS     R1,R1,#+1
??fei_fbe_9:
        CMP      R1,#+2000
        BGE.N    ??fei_fbe_11
//  454   {
//  455     if (!(MCG_S & MCG_S_IREFST_MASK)) break; // jump out early if IREFST clears before loop finishes
        LDR.W    R2,??DataTable15_5  ;; 0x40064006
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+27
        BMI.N    ??fei_fbe_10
//  456   }
//  457   if (MCG_S & MCG_S_IREFST_MASK) return 3; // check bit is really clear and return with error if not set
??fei_fbe_11:
        LDR.W    R1,??DataTable15_5  ;; 0x40064006
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+27
        BPL.N    ??fei_fbe_12
        MOVS     R0,#+3
        B.N      ??fei_fbe_1
//  458   
//  459 //  while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}; // Wait for clock status bits to show clock source is ext ref clk
//  460   for (i = 0 ; i < 2000 ; i++)
??fei_fbe_12:
        MOVS     R1,#+0
        B.N      ??fei_fbe_13
??fei_fbe_14:
        ADDS     R1,R1,#+1
??fei_fbe_13:
        CMP      R1,#+2000
        BGE.N    ??fei_fbe_15
//  461   {
//  462     if (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) == 0x2) break; // jump out early if CLKST shows EXT CLK slected before loop finishes
        LDR.W    R2,??DataTable15_5  ;; 0x40064006
        LDRB     R2,[R2, #+0]
        UBFX     R2,R2,#+2,#+2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+2
        BNE.N    ??fei_fbe_14
//  463   }
//  464   if (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2) return 4; // check EXT CLK is really selected and return with error if not
??fei_fbe_15:
        LDR.W    R1,??DataTable15_5  ;; 0x40064006
        LDRB     R1,[R1, #+0]
        UBFX     R1,R1,#+2,#+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+2
        BEQ.N    ??fei_fbe_16
        MOVS     R0,#+4
        B.N      ??fei_fbe_1
//  465   
//  466   return ((crystal_val + 1) * 2 * 1000); // MCGOUT frequency in kHz = crystal value * 2 * 1000
??fei_fbe_16:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R0,R0,#+1
        MOV      R1,#+2000
        MULS     R0,R1,R0
??fei_fbe_1:
        BX       LR               ;; return
//  467 
//  468 // Now in FBE
//  469 }
//  470 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  471 void fbe_pbe(unsigned char prdiv_val, unsigned char vdiv_val)
//  472 {  
//  473   MCG_C5 = MCG_C5_PRDIV(prdiv_val);    //set PLL ref divider
fbe_pbe:
        ANDS     R0,R0,#0x1F
        LDR.W    R1,??DataTable15_6  ;; 0x40064004
        STRB     R0,[R1, #+0]
//  474 
//  475 // the PLLS bit is set to enable the PLL, MCGOUT still sourced from ext ref clk  
//  476   MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(24);
        LDR.W    R0,??DataTable15_7  ;; 0x40064005
        MOVS     R1,#+88
        STRB     R1,[R0, #+0]
//  477   
//  478   while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set
??fbe_pbe_0:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??fbe_pbe_0
//  479 
//  480   while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set
??fbe_pbe_1:
        LDR.W    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??fbe_pbe_1
//  481 // now in PBE 
//  482 // PBE frequency = FBE frequency, no need to change frequency
//  483 }
        BX       LR               ;; return
//  484 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  485 int pbe_pee(unsigned char crystal_val)
//  486 {
//  487   unsigned char prdiv, vdiv;  
//  488   MCG_C1 &= ~MCG_C1_CLKS_MASK; // switch CLKS mux to select PLL as MCG_OUT
pbe_pee:
        LDR.W    R1,??DataTable15_4  ;; 0x40064000
        LDRB     R1,[R1, #+0]
        ANDS     R1,R1,#0x3F
        LDR.W    R2,??DataTable15_4  ;; 0x40064000
        STRB     R1,[R2, #+0]
//  489   // Wait for clock status bits to update 
//  490   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){} 
??pbe_pee_0:
        LDR.W    R1,??DataTable15_5  ;; 0x40064006
        LDRB     R1,[R1, #+0]
        UBFX     R1,R1,#+2,#+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+3
        BNE.N    ??pbe_pee_0
//  491 
//  492   prdiv = ((MCG_C5 & MCG_C5_PRDIV_MASK) + 1);
        LDR.W    R1,??DataTable15_6  ;; 0x40064004
        LDRB     R1,[R1, #+0]
        ANDS     R1,R1,#0x1F
        ADDS     R1,R1,#+1
//  493   vdiv = ((MCG_C6 & MCG_C6_VDIV_MASK) + 24);
        LDR.W    R2,??DataTable15_7  ;; 0x40064005
        LDRB     R2,[R2, #+0]
        ANDS     R2,R2,#0x1F
        ADDS     R2,R2,#+24
//  494   
//  495   return (((((crystal_val + 1) * 2)/prdiv) * vdiv) * 1000); //calculate PLL output frequency
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R0,R0,#+1
        LSLS     R0,R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SDIV     R0,R0,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MULS     R0,R2,R0
        MOV      R1,#+1000
        MULS     R0,R1,R0
        BX       LR               ;; return
//  496 }
//  497 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  498 int pee_pbe(unsigned char crystal_val)
//  499 {  
//  500   MCG_C1 |= MCG_C1_CLKS(2); // switch CLKS mux to select external reference clock as MCG_OUT
pee_pbe:
        LDR.W    R1,??DataTable15_4  ;; 0x40064000
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0x80
        LDR.W    R2,??DataTable15_4  ;; 0x40064000
        STRB     R1,[R2, #+0]
//  501   // Wait for clock status bits to update 
//  502   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}; 
??pee_pbe_0:
        LDR.W    R1,??DataTable15_5  ;; 0x40064006
        LDRB     R1,[R1, #+0]
        UBFX     R1,R1,#+2,#+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+2
        BNE.N    ??pee_pbe_0
//  503 
//  504 return ((crystal_val + 1) * 2000); // MCGOUT frequency in kHz
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R0,R0,#+1
        MOV      R1,#+2000
        MULS     R0,R1,R0
        BX       LR               ;; return
//  505 
//  506 } // pee_pbe, freq = REF_CLK
//  507 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  508 void pbe_fbe(void)
//  509 {
//  510   MCG_C6 &= ~MCG_C6_PLLS_MASK; // clear PLLs to disable PLL, still clocked from ext ref clk
pbe_fbe:
        LDR.W    R0,??DataTable15_7  ;; 0x40064005
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xBF
        LDR.W    R1,??DataTable15_7  ;; 0x40064005
        STRB     R0,[R1, #+0]
//  511   
//  512   while (MCG_S & MCG_S_PLLST_MASK){}; // wait for PLLS status bit to set
??pbe_fbe_0:
        LDR.N    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BMI.N    ??pbe_fbe_0
//  513 // FBE frequency = PBE frequency, no need to change frequency  
//  514 } 
        BX       LR               ;; return
//  515 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  516 void fbe_fbi_fast(void)
//  517 {
//  518   unsigned char temp_reg;
//  519   
//  520   MCG_C2 |= MCG_C2_IRCS_MASK; // select fast IRC by setting IRCS
fbe_fbi_fast:
        LDR.N    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable15_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  521   
//  522   temp_reg = MCG_C1;
        LDR.N    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
//  523   temp_reg &= ~MCG_C1_CLKS_MASK;
        ANDS     R0,R0,#0x3F
//  524   temp_reg |= MCG_C1_CLKS(1); // select IRC as MCGOUT
        ORRS     R0,R0,#0x40
//  525   MCG_C1 = temp_reg; // update MCG_C1
        LDR.N    R1,??DataTable15_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  526   
//  527   while (!(MCG_S & MCG_S_IRCST_MASK)){}; // wait until internal reference switches to fast clock.
??fbe_fbi_fast_0:
        LDR.N    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??fbe_fbi_fast_0
//  528   
//  529   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x1){}; // Wait for clock status bits to update
??fbe_fbi_fast_1:
        LDR.N    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??fbe_fbi_fast_1
//  530 // fast IRC clock speed is determined by FCTRIM value and must be trimmed to a known frequency
//  531 } //fbe_fbi_fast
        BX       LR               ;; return
//  532 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  533 void fbe_fbi_slow(void)
//  534 {
//  535   unsigned char temp_reg;
//  536   
//  537   MCG_C2 &= ~MCG_C2_IRCS_MASK; // select slow IRC by clearing IRCS
fbe_fbi_slow:
        LDR.N    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFE
        LDR.N    R1,??DataTable15_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  538   
//  539   temp_reg = MCG_C1;
        LDR.N    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
//  540   temp_reg &= ~MCG_C1_CLKS_MASK;
        ANDS     R0,R0,#0x3F
//  541   temp_reg |= MCG_C1_CLKS(1); // select IRC as MCGOUT
        ORRS     R0,R0,#0x40
//  542   MCG_C1 = temp_reg; // update MCG_C1
        LDR.N    R1,??DataTable15_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  543   
//  544   while (!(MCG_S & MCG_S_IRCST_MASK)){}; // wait until internal reference switches to fast clock.
??fbe_fbi_slow_0:
        LDR.N    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??fbe_fbi_slow_0
//  545   
//  546   while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x1){}; // Wait for clock status bits to update
??fbe_fbi_slow_1:
        LDR.N    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??fbe_fbi_slow_1
//  547 // fast IRC clock speed is determined by FCTRIM value and must be trimmed to a known frequency
//  548 } //fbe_fbi_slow
        BX       LR               ;; return
//  549 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  550 void fbi_blpi(void)
//  551 { 
//  552   MCG_C2 |= MCG_C2_LP_MASK; //set LP bit to disable the FLL 
fbi_blpi:
        LDR.N    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable15_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  553 // no change in MCGOUT frequency  
//  554 } 
        BX       LR               ;; return
//  555 
//  556 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  557 int atc (unsigned char irc, int irc_freq)
//  558 {
atc:
        PUSH     {R4-R8,LR}
        MOVS     R6,R0
        MOVS     R4,R1
//  559     uint32 temp_reg = 0;
        MOVS     R8,#+0
//  560     unsigned char temp_reg8 = 0;
        MOVS     R5,#+0
//  561     uint32 orig_SIM_CLKDIV1;
//  562     unsigned short atcv;
//  563     unsigned char clks_val;
//  564     unsigned int i;
//  565              
//  566     printf("\n-------------------------------------------\n");
        LDR.N    R0,??DataTable15_20
        BL       printf
//  567     printf("  MCG AutoTrim Utility\n");
        LDR.N    R0,??DataTable15_21
        BL       printf
//  568     printf("-------------------------------------------\n");
        LDR.N    R0,??DataTable15_22
        BL       printf
//  569     printf("\n");
        ADR.N    R0,??DataTable15  ;; "\n"
        BL       printf
//  570     {
//  571         if (irc > 0) // force irc to 1 if greater than 0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BCC.N    ??atc_0
//  572         {
//  573           irc = 1;
        MOVS     R6,#+1
//  574         }
//  575         
//  576         clks_val = ((MCG_C1 & MCG_C1_CLKS_MASK) >> 6);
??atc_0:
        LDR.N    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+6
//  577         
//  578         if (((clks_val == 1) || (clks_val ==3)))
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??atc_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??atc_2
//  579         {
//  580           printf("\nAuto trim error - cannot use the internal clock source.\r\n\n");
??atc_1:
        LDR.N    R0,??DataTable15_23
        BL       printf
//  581           return 1; //error using IRC as system clock
        MOVS     R0,#+1
        B.N      ??atc_3
//  582         }
//  583               
//  584         if ((clks_val == 0) && (!(MCG_C6 & MCG_C6_PLLS_MASK)) && (MCG_C1 & MCG_C1_IREFS_MASK))
??atc_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??atc_4
        LDR.N    R0,??DataTable15_7  ;; 0x40064005
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BMI.N    ??atc_4
        LDR.N    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??atc_4
//  585         {
//  586           printf("\nAuto trim error - cannot use the FLL with internal clock source.\r\n\n");
        LDR.N    R0,??DataTable15_24
        BL       printf
//  587           return 2; // error using FLL with IRC
        MOVS     R0,#+2
        B.N      ??atc_3
//  588         }
//  589         if (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 3)
??atc_4:
        LDR.N    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BEQ.N    ??atc_5
//  590         {
//  591           printf("\nWARNING - PLL is not the internal clock source. Auto trim value will not be correct\r\n\n");
        LDR.N    R0,??DataTable15_25
        BL       printf
//  592         }
//  593                 
//  594         if(!irc) //determine if slow or fast IRC to be trimmed
??atc_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??atc_6
//  595         {
//  596           if (irc_freq < 31250) // check frequency is above min spec.
        MOVW     R0,#+31250
        CMP      R4,R0
        BGE.N    ??atc_7
//  597           {
//  598             printf("\nAuto trim error - target frequency is below 31250 Hz.\r\n\n");
        LDR.N    R0,??DataTable15_26
        BL       printf
//  599             return 3;
        MOVS     R0,#+3
        B.N      ??atc_3
//  600           }
//  601           if (irc_freq > 39062) // check frequency is below max spec.
??atc_7:
        MOVW     R0,#+39063
        CMP      R4,R0
        BLT.N    ??atc_8
//  602           {
//  603             printf("\nAuto trim error - target frequency is above 39062 Hz.\r\n\n");
        LDR.N    R0,??DataTable15_27
        BL       printf
//  604             return 4;
        MOVS     R0,#+4
        B.N      ??atc_3
//  605           }         
//  606         }
//  607         else
//  608         {
//  609           if (irc_freq < 3000000) // check frequency is above min spec.
??atc_6:
        LDR.N    R0,??DataTable15_28  ;; 0x2dc6c0
        CMP      R4,R0
        BGE.N    ??atc_9
//  610           {
//  611             printf("\nAuto trim error - target frequency is below 3 MHz.\r\n\n");
        LDR.N    R0,??DataTable15_29
        BL       printf
//  612             return 5;
        MOVS     R0,#+5
        B.N      ??atc_3
//  613           }
//  614           if (irc_freq > 5000000) // check frequency is below max spec.
??atc_9:
        LDR.N    R0,??DataTable15_30  ;; 0x4c4b41
        CMP      R4,R0
        BLT.N    ??atc_8
//  615           {
//  616             printf("\nAuto trim error - target frequency is above 5 MHz.\r\n\n");
        LDR.N    R0,??DataTable15_31
        BL       printf
//  617             return 6;
        MOVS     R0,#+6
        B.N      ??atc_3
//  618           }            
//  619         } // if
//  620         for (i=0;i<0xffff;i++);
??atc_8:
        MOVS     R0,#+0
        B.N      ??atc_10
??atc_11:
        ADDS     R0,R0,#+1
??atc_10:
        MOVW     R1,#+65535
        CMP      R0,R1
        BCC.N    ??atc_11
//  621         orig_SIM_CLKDIV1 = SIM_CLKDIV1;        // backup current divider value
        LDR.N    R0,??DataTable15_11  ;; 0x40048044
        LDR      R7,[R0, #+0]
//  622         temp_reg = SIM_CLKDIV1;                // bus clock needs to be between 8 and 16 MHz
        LDR.N    R0,??DataTable15_11  ;; 0x40048044
        LDR      R8,[R0, #+0]
//  623         temp_reg &= ~SIM_CLKDIV1_OUTDIV2_MASK; // clear bus divider field
        BICS     R8,R8,#0xF000000
//  624         temp_reg |= SIM_CLKDIV1_OUTDIV2(5);    //divide 96MHz PLL by 6 = 16MHz bus clock
        ORRS     R8,R8,#0x5000000
//  625         SIM_CLKDIV1 = temp_reg; 
        LDR.N    R0,??DataTable15_11  ;; 0x40048044
        STR      R8,[R0, #+0]
//  626 // Set up autocal registers, must use floating point calculation
//  627         if (irc)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??atc_12
//  628           atcv = (unsigned short)(128.0f * (21.0f * (16000000.0f / (float)irc_freq))); 
        MOVS     R0,R4
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR.N    R0,??DataTable15_32  ;; 0x4b742400
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable15_33  ;; 0x41a80000
        BL       __aeabi_fmul
        MOVS     R1,#+1124073472
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        B.N      ??atc_13
//  629         else
//  630           atcv = (unsigned short)(21.0f * (16000000.0f / (float)irc_freq));
??atc_12:
        MOVS     R0,R4
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR.N    R0,??DataTable15_32  ;; 0x4b742400
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable15_33  ;; 0x41a80000
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
//  631         
//  632         MCG_ATCVL = (atcv & 0xFF); //Set ATCVL to lower 8 bits of count value
??atc_13:
        LDR.N    R1,??DataTable15_34  ;; 0x4006400b
        STRB     R0,[R1, #+0]
//  633         MCG_ATCVH = ((atcv & 0xFF00) >> 8); // Set ATCVH to upper 8 bits of count value
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        LDR.N    R1,??DataTable15_35  ;; 0x4006400a
        STRB     R0,[R1, #+0]
//  634 
//  635 // Enable autocal
//  636         MCG_ATC = 0x0; // clear auto trim control register
        LDR.N    R0,??DataTable15_36  ;; 0x40064008
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  637         temp_reg8 |= (MCG_ATC_ATME_MASK | (irc << MCG_ATC_ATMS_SHIFT)); //Select IRC to trim and enable trim machine
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R0,R6,#+6
        ORRS     R0,R0,#0x80
        ORRS     R5,R0,R5
//  638         MCG_ATC = temp_reg8;
        LDR.N    R0,??DataTable15_36  ;; 0x40064008
        STRB     R5,[R0, #+0]
//  639         
//  640         while (MCG_ATC & MCG_ATC_ATME_MASK) {}; //poll for ATME bit to clear
??atc_14:
        LDR.N    R0,??DataTable15_36  ;; 0x40064008
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BMI.N    ??atc_14
//  641         
//  642         SIM_CLKDIV1 = orig_SIM_CLKDIV1; //restore the divider value
        LDR.N    R0,??DataTable15_11  ;; 0x40048044
        STR      R7,[R0, #+0]
//  643         
//  644         if (MCG_ATC & MCG_ATC_ATMF_MASK) // check if error flag set
        LDR.N    R0,??DataTable15_36  ;; 0x40064008
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??atc_15
//  645         {
//  646           printf("Autotrim error.\r\n\n");
        LDR.N    R0,??DataTable15_37
        BL       printf
//  647           printf("\n");
        ADR.N    R0,??DataTable15  ;; "\n"
        BL       printf
//  648           printf("MCG_C1   = %#02X \r\n", (MCG_C1));
        LDR.N    R0,??DataTable15_4  ;; 0x40064000
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_38
        BL       printf
//  649           printf("MCG_C2   = %#02X \r\n", (MCG_C2));
        LDR.N    R0,??DataTable15_1  ;; 0x40064001
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_39
        BL       printf
//  650           printf("MCG_C3   = %#02X \r\n", (MCG_C3));
        LDR.N    R0,??DataTable15_40  ;; 0x40064002
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_41
        BL       printf
//  651           printf("MCG_C4   = %#02X \r\n", (MCG_C4)) ;
        LDR.N    R0,??DataTable15_8  ;; 0x40064003
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_42
        BL       printf
//  652           printf("MCG_C5   = %#02X \r\n", (MCG_C5));
        LDR.N    R0,??DataTable15_6  ;; 0x40064004
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_43
        BL       printf
//  653           printf("MCG_C6   = %#02X \r\n\n", (MCG_C6));
        LDR.N    R0,??DataTable15_7  ;; 0x40064005
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_44
        BL       printf
//  654           printf("MCG_S    = %#02X \r\n\n", (MCG_S)) ;
        LDR.N    R0,??DataTable15_5  ;; 0x40064006
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_45
        BL       printf
//  655           printf("MCG_ATC   = %#02X \r\n",   (MCG_ATC)) ;
        LDR.N    R0,??DataTable15_36  ;; 0x40064008
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_46
        BL       printf
//  656           printf("MCG_ATCVL = %#02X \r\n",   (MCG_ATCVL)) ;
        LDR.N    R0,??DataTable15_34  ;; 0x4006400b
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_47
        BL       printf
//  657           printf("MCG_ATVCH = %#02X \r\n",   (MCG_ATCVH));
        LDR.N    R0,??DataTable15_35  ;; 0x4006400a
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_48
        BL       printf
//  658           MCG_ATC |= MCG_ATC_ATMF_MASK; // clear fail flag
        LDR.N    R0,??DataTable15_36  ;; 0x40064008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable15_36  ;; 0x40064008
        STRB     R0,[R1, #+0]
//  659           return 7;
        MOVS     R0,#+7
        B.N      ??atc_3
//  660         } 
//  661         else 
//  662         {      
//  663           printf("Autotrim Passed.\r\n\n");
??atc_15:
        LDR.N    R0,??DataTable15_49
        BL       printf
//  664           printf("MCG_C3   = %#02X \r\n", (MCG_C3));
        LDR.N    R0,??DataTable15_40  ;; 0x40064002
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_41
        BL       printf
//  665           printf("MCG_C4   = %#02X \r\n", (MCG_C4));
        LDR.N    R0,??DataTable15_8  ;; 0x40064003
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable15_42
        BL       printf
//  666           // Check trim value is not at either extreme of the range
//  667           if (!irc)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??atc_16
//  668           {
//  669             if ((MCG_C3 == 0xFF) || (MCG_C3 == 0))
        LDR.N    R0,??DataTable15_40  ;; 0x40064002
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BEQ.N    ??atc_17
        LDR.N    R0,??DataTable15_40  ;; 0x40064002
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??atc_18
//  670             {
//  671               printf("\nAutotrim result is not valid.\r\n\n");
??atc_17:
        LDR.N    R0,??DataTable15_50
        BL       printf
//  672               return 8;
        MOVS     R0,#+8
        B.N      ??atc_3
//  673             }
//  674           }
//  675           else
//  676           {
//  677             if ((((MCG_C4 & MCG_C4_FCTRIM_MASK) >> MCG_C4_FCTRIM_SHIFT) == 0xF) ||
//  678               (((MCG_C4 & MCG_C4_FCTRIM_MASK) >> MCG_C4_FCTRIM_SHIFT) == 0))
??atc_16:
        LDR.N    R0,??DataTable15_8  ;; 0x40064003
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+1,#+4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+15
        BEQ.N    ??atc_19
        LDR.N    R0,??DataTable15_8  ;; 0x40064003
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+1,#+4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??atc_18
//  679             {
//  680               printf("\nAutotrim result is not valid.\r\n\n");
??atc_19:
        LDR.N    R0,??DataTable15_50
        BL       printf
//  681               return 8;
        MOVS     R0,#+8
        B.N      ??atc_3
//  682             }
//  683           }
//  684         }
//  685           
//  686     }// end else
//  687     return irc;
??atc_18:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,R6
??atc_3:
        POP      {R4-R8,PC}       ;; return
//  688 }// end atc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC8      "\n",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     0x4007c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_4:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_5:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_6:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_7:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_8:
        DC32     0x40064003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_9:
        DC32     core_clk_mhz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_10:
        DC32     core_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_11:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_12:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_13:
        DC32     0x17700

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_14:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_15:
        DC32     0x4003d010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_16:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_17:
        DC32     drs_val

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_18:
        DC32     dmx32_val

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_19:
        DC32     slow_irc_freq

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_20:
        DC32     `?<Constant "\\n--------------------...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_21:
        DC32     `?<Constant "  MCG AutoTrim Utility\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_22:
        DC32     `?<Constant "---------------------...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_23:
        DC32     `?<Constant "\\nAuto trim error - ca...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_24:
        DC32     `?<Constant "\\nAuto trim error - ca...">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_25:
        DC32     `?<Constant "\\nWARNING - PLL is not...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_26:
        DC32     `?<Constant "\\nAuto trim error - ta...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_27:
        DC32     `?<Constant "\\nAuto trim error - ta...">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_28:
        DC32     0x2dc6c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_29:
        DC32     `?<Constant "\\nAuto trim error - ta...">_2`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_30:
        DC32     0x4c4b41

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_31:
        DC32     `?<Constant "\\nAuto trim error - ta...">_3`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_32:
        DC32     0x4b742400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_33:
        DC32     0x41a80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_34:
        DC32     0x4006400b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_35:
        DC32     0x4006400a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_36:
        DC32     0x40064008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_37:
        DC32     `?<Constant "Autotrim error.\\r\\n\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_38:
        DC32     `?<Constant "MCG_C1   = %#02X \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_39:
        DC32     `?<Constant "MCG_C2   = %#02X \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_40:
        DC32     0x40064002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_41:
        DC32     `?<Constant "MCG_C3   = %#02X \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_42:
        DC32     `?<Constant "MCG_C4   = %#02X \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_43:
        DC32     `?<Constant "MCG_C5   = %#02X \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_44:
        DC32     `?<Constant "MCG_C6   = %#02X \\r\\n\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_45:
        DC32     `?<Constant "MCG_S    = %#02X \\r\\n\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_46:
        DC32     `?<Constant "MCG_ATC   = %#02X \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_47:
        DC32     `?<Constant "MCG_ATCVL = %#02X \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_48:
        DC32     `?<Constant "MCG_ATVCH = %#02X \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_49:
        DC32     `?<Constant "Autotrim Passed.\\r\\n\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_50:
        DC32     `?<Constant "\\nAutotrim result is n...">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n--------------------...">`:
        DATA
        DC8 "\012-------------------------------------------\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  MCG AutoTrim Utility\\n">`:
        DATA
        DC8 "  MCG AutoTrim Utility\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "---------------------...">`:
        DATA
        DC8 "-------------------------------------------\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nAuto trim error - ca...">`:
        DATA
        DC8 0AH, 41H, 75H, 74H, 6FH, 20H, 74H, 72H
        DC8 69H, 6DH, 20H, 65H, 72H, 72H, 6FH, 72H
        DC8 20H, 2DH, 20H, 63H, 61H, 6EH, 6EH, 6FH
        DC8 74H, 20H, 75H, 73H, 65H, 20H, 74H, 68H
        DC8 65H, 20H, 69H, 6EH, 74H, 65H, 72H, 6EH
        DC8 61H, 6CH, 20H, 63H, 6CH, 6FH, 63H, 6BH
        DC8 20H, 73H, 6FH, 75H, 72H, 63H, 65H, 2EH
        DC8 0DH, 0AH, 0AH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nAuto trim error - ca...">_1`:
        DATA
        DC8 0AH, 41H, 75H, 74H, 6FH, 20H, 74H, 72H
        DC8 69H, 6DH, 20H, 65H, 72H, 72H, 6FH, 72H
        DC8 20H, 2DH, 20H, 63H, 61H, 6EH, 6EH, 6FH
        DC8 74H, 20H, 75H, 73H, 65H, 20H, 74H, 68H
        DC8 65H, 20H, 46H, 4CH, 4CH, 20H, 77H, 69H
        DC8 74H, 68H, 20H, 69H, 6EH, 74H, 65H, 72H
        DC8 6EH, 61H, 6CH, 20H, 63H, 6CH, 6FH, 63H
        DC8 6BH, 20H, 73H, 6FH, 75H, 72H, 63H, 65H
        DC8 2EH, 0DH, 0AH, 0AH, 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nWARNING - PLL is not...">`:
        DATA
        DC8 0AH, 57H, 41H, 52H, 4EH, 49H, 4EH, 47H
        DC8 20H, 2DH, 20H, 50H, 4CH, 4CH, 20H, 69H
        DC8 73H, 20H, 6EH, 6FH, 74H, 20H, 74H, 68H
        DC8 65H, 20H, 69H, 6EH, 74H, 65H, 72H, 6EH
        DC8 61H, 6CH, 20H, 63H, 6CH, 6FH, 63H, 6BH
        DC8 20H, 73H, 6FH, 75H, 72H, 63H, 65H, 2EH
        DC8 20H, 41H, 75H, 74H, 6FH, 20H, 74H, 72H
        DC8 69H, 6DH, 20H, 76H, 61H, 6CH, 75H, 65H
        DC8 20H, 77H, 69H, 6CH, 6CH, 20H, 6EH, 6FH
        DC8 74H, 20H, 62H, 65H, 20H, 63H, 6FH, 72H
        DC8 72H, 65H, 63H, 74H, 0DH, 0AH, 0AH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nAuto trim error - ta...">`:
        DATA
        DC8 0AH, 41H, 75H, 74H, 6FH, 20H, 74H, 72H
        DC8 69H, 6DH, 20H, 65H, 72H, 72H, 6FH, 72H
        DC8 20H, 2DH, 20H, 74H, 61H, 72H, 67H, 65H
        DC8 74H, 20H, 66H, 72H, 65H, 71H, 75H, 65H
        DC8 6EH, 63H, 79H, 20H, 69H, 73H, 20H, 62H
        DC8 65H, 6CH, 6FH, 77H, 20H, 33H, 31H, 32H
        DC8 35H, 30H, 20H, 48H, 7AH, 2EH, 0DH, 0AH
        DC8 0AH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nAuto trim error - ta...">_1`:
        DATA
        DC8 0AH, 41H, 75H, 74H, 6FH, 20H, 74H, 72H
        DC8 69H, 6DH, 20H, 65H, 72H, 72H, 6FH, 72H
        DC8 20H, 2DH, 20H, 74H, 61H, 72H, 67H, 65H
        DC8 74H, 20H, 66H, 72H, 65H, 71H, 75H, 65H
        DC8 6EH, 63H, 79H, 20H, 69H, 73H, 20H, 61H
        DC8 62H, 6FH, 76H, 65H, 20H, 33H, 39H, 30H
        DC8 36H, 32H, 20H, 48H, 7AH, 2EH, 0DH, 0AH
        DC8 0AH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nAuto trim error - ta...">_2`:
        DATA
        DC8 0AH, 41H, 75H, 74H, 6FH, 20H, 74H, 72H
        DC8 69H, 6DH, 20H, 65H, 72H, 72H, 6FH, 72H
        DC8 20H, 2DH, 20H, 74H, 61H, 72H, 67H, 65H
        DC8 74H, 20H, 66H, 72H, 65H, 71H, 75H, 65H
        DC8 6EH, 63H, 79H, 20H, 69H, 73H, 20H, 62H
        DC8 65H, 6CH, 6FH, 77H, 20H, 33H, 20H, 4DH
        DC8 48H, 7AH, 2EH, 0DH, 0AH, 0AH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nAuto trim error - ta...">_3`:
        DATA
        DC8 0AH, 41H, 75H, 74H, 6FH, 20H, 74H, 72H
        DC8 69H, 6DH, 20H, 65H, 72H, 72H, 6FH, 72H
        DC8 20H, 2DH, 20H, 74H, 61H, 72H, 67H, 65H
        DC8 74H, 20H, 66H, 72H, 65H, 71H, 75H, 65H
        DC8 6EH, 63H, 79H, 20H, 69H, 73H, 20H, 61H
        DC8 62H, 6FH, 76H, 65H, 20H, 35H, 20H, 4DH
        DC8 48H, 7AH, 2EH, 0DH, 0AH, 0AH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Autotrim error.\\r\\n\\n">`:
        DATA
        DC8 "Autotrim error.\015\012\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_C1   = %#02X \\r\\n">`:
        DATA
        DC8 "MCG_C1   = %#02X \015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_C2   = %#02X \\r\\n">`:
        DATA
        DC8 "MCG_C2   = %#02X \015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_C3   = %#02X \\r\\n">`:
        DATA
        DC8 "MCG_C3   = %#02X \015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_C4   = %#02X \\r\\n">`:
        DATA
        DC8 "MCG_C4   = %#02X \015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_C5   = %#02X \\r\\n">`:
        DATA
        DC8 "MCG_C5   = %#02X \015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_C6   = %#02X \\r\\n\\n">`:
        DATA
        DC8 "MCG_C6   = %#02X \015\012\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_S    = %#02X \\r\\n\\n">`:
        DATA
        DC8 "MCG_S    = %#02X \015\012\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_ATC   = %#02X \\r\\n">`:
        DATA
        DC8 "MCG_ATC   = %#02X \015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_ATCVL = %#02X \\r\\n">`:
        DATA
        DC8 "MCG_ATCVL = %#02X \015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MCG_ATVCH = %#02X \\r\\n">`:
        DATA
        DC8 "MCG_ATVCH = %#02X \015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Autotrim Passed.\\r\\n\\n">`:
        DATA
        DC8 "Autotrim Passed.\015\012\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nAutotrim result is n...">`:
        DATA
        DC8 "\012Autotrim result is not valid.\015\012\012"
        DC8 0, 0

        END
// 
//     8 bytes in section .data
//   870 bytes in section .rodata
// 2 600 bytes in section .text
//    76 bytes in section .textrw
// 
// 2 676 bytes of CODE  memory
//   870 bytes of CONST memory
//     8 bytes of DATA  memory
//
//Errors: none
//Warnings: none
