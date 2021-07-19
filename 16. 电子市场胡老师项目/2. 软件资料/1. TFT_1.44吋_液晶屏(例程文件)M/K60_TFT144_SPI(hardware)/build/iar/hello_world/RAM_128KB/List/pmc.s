///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:42 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\pmc\pm /
//                    c.c                                                     /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\pmc\pm /
//                    c.c -D IAR -D TWR_K60N512 -lCN                          /
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
//                    rld\RAM_128KB\List\pmc.s                                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME pmc

        #define SHT_PROGBITS 0x1

        EXTERN core_clk_khz
        EXTERN core_clk_mhz
        EXTERN in_char
        EXTERN mcg_blpi_2_pee
        EXTERN mcg_pee_2_blpi
        EXTERN periph_clk_khz
        EXTERN printf
        EXTERN stop
        EXTERN uart_init
        EXTERN wait

        PUBLIC disable_lpwui
        PUBLIC disable_ports
        PUBLIC disable_ports_partial
        PUBLIC enable_lpwui
        PUBLIC enter_lls
        PUBLIC enter_stop
        PUBLIC enter_stop_mode
        PUBLIC enter_vlls1
        PUBLIC enter_vlls2
        PUBLIC enter_vlls3
        PUBLIC enter_vlpr
        PUBLIC enter_vlps
        PUBLIC enter_wait
        PUBLIC exit_vlpr
        PUBLIC i
        PUBLIC outSRS

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\pmc\pmc.c
//    1 /*
//    2  * File:        pmc.c
//    3  * Purpose:     Provides routines for entering low power modes.
//    4  *
//    5  * Notes:	Since the wakeup mechanism for low power modes
//    6  *              will be application specific, these routines
//    7  *              do not include code to setup interrupts to exit
//    8  *              from the low power modes. The desired means of
//    9  *              low power mode exit should be configured before
//   10  *              calling any of these functions.
//   11  *
//   12  *              These routines do not include protection to
//   13  *              prevent illegal state transitions in the mode
//   14  *              controller, and all routines that write to the
//   15  *              PMPROT register write a value to allow all
//   16  *              possible low power modes (it is write once, so
//   17  *              if only the currently requested mode is enabled
//   18  *              a different mode couldn't be enabled later on).
//   19  *              
//   20  */
//   21 
//   22 #include "common.h"
//   23 #include "pmc.h"
//   24 #include "mcg.h"
//   25 #include "uart.h"
//   26 extern int core_clk_khz;
//   27 extern int core_clk_mhz;
//   28 extern int periph_clk_khz;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 int i;
i:
        DS8 4
//   30        
//   31 /********************************************************************/
//   32 /* WAIT mode entry routine. Puts the processor into wait mode.
//   33  * In this mode the core clock is disabled (no code executing), but 
//   34  * bus clocks are enabled (peripheral modules are operational). 
//   35  *
//   36  * Mode transitions:
//   37  * RUN -> WAIT
//   38  * VLPR -> VLPW
//   39  *
//   40  * This function can be used to enter normal wait mode or VLPW
//   41  * mode. If you are executing in normal run mode when calling this
//   42  * function, then you will enter normal wait mode. If you are in VLPR
//   43  * mode when calling this function, then you will enter VLPW mode instead.
//   44  *
//   45  * NOTE: Some modules include a programmable option to disable them in 
//   46  * wait mode. If those modules are programmed to disable in wait mode, 
//   47  * they will not be able to generate interrupts to wake up the core.
//   48  *
//   49  * WAIT mode is exited using any enabled interrupt or RESET, so no
//   50  * exit_wait routine is needed. 
//   51  *
//   52  * If in VLPW mode, the statue of the MC_PMCTRL[LPWUI] bit determines if 
//   53  * the processor exits to VLPR (LPWUI cleared) or normal run mode (LPWUI 
//   54  * set). The enable_lpwui() and disable_lpwui()functions can be used to set
//   55  * this bit to the desired option prior to calling enter_wait().
//   56  * 
//   57  * 
//   58  * Parameters:
//   59  * none
//   60  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   61 void enter_wait(void)
//   62 {
enter_wait:
        PUSH     {R7,LR}
//   63     wait();
        BL       wait
//   64 }
        POP      {R0,PC}          ;; return
//   65 /********************************************************************/
//   66 /* STOP mode entry routine. Puts the processor into normal stop mode.
//   67  * In this mode core, bus and peripheral clocks are disabled.
//   68  *
//   69  * Mode transitions:
//   70  * RUN -> STOP
//   71  * VLPR -> VLPS
//   72  *
//   73  * This function can be used to enter normal stop mode or VLPS
//   74  * mode. If you are executing in normal run mode when calling this
//   75  * function, then you will enter normal stop mode. If you are in VLPR
//   76  * mode when calling this function, then you will enter VLPS mode instead.
//   77  *
//   78  * STOP mode is exited using any enabled interrupt or RESET, so no
//   79  * exit_stop routine is needed.
//   80  *
//   81  * Parameters:
//   82  * none
//   83  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 void enter_stop(void)
//   85 {
enter_stop:
        PUSH     {R7,LR}
//   86     /* Set the LPLLSM field to 0b000 for normal STOP mode - Need to retain state of LPWUI bit 8 */
//   87     MC_PMCTRL =  MC_PMCTRL_LPLLSM(0);           // set LPLLSM = 0b000
        LDR.W    R0,??DataTable13  ;; 0x4007e003
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   88     stop();
        BL       stop
//   89 }
        POP      {R0,PC}          ;; return
//   90 /********************************************************************/
//   91 /* VLPR mode entry routine. Puts the processor into very low power
//   92  * run mode. In this mode all clocks are enabled, but the core, bus,
//   93  * and peripheral clocks are limited to 2MHz or less. The flash 
//   94  * clock is limited to 1MHz or less. 
//   95  *
//   96  * Mode transitions:
//   97  * RUN -> VLPR
//   98  *
//   99  * exit_vlpr() function or an interrupt with LPWUI set can be used 
//  100  * to switch from VLPR back to RUN. The enable_lpwui() and disable_lpwui()
//  101  * functions can be used to set LPWUI to the desired option prior to 
//  102  * calling enter_vlpr().
//  103  *
//  104  * Parameters:
//  105  * none
//  106  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  107 void enter_vlpr(char lpwui_value)
//  108 {
enter_vlpr:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  109      MC_PMPROT = MC_PMPROT_AVLP_MASK;  // write oneif not all set make sure all enabled
        LDR.W    R0,??DataTable13_1  ;; 0x4007e002
        MOVS     R1,#+32
        STRB     R1,[R0, #+0]
//  110                                        //this write-once bit allows the MCU to enter the
//  111                                        //very low power modes: VLPR, VLPW, and VLPS.
//  112     
//  113    /* Reduce system clock to < 2MHz */
//  114     printf("\n\n\n To communicate in VLPR - Auto-Trim must have been done, Change to 19200 baud after key hit !!!! \n\r");
        LDR.W    R0,??DataTable13_2
        BL       printf
//  115     printf("\r\n Send any character to go into lower divide mode \r\n");
        LDR.W    R0,??DataTable13_3
        BL       printf
//  116     in_char();
        BL       in_char
//  117 
//  118     mcg_pee_2_blpi();
        BL       mcg_pee_2_blpi
//  119     SIM_CLKDIV1  =  0x03330000;    //(SIM_CLKDIV1_OUTDIV1(1) | SIM_CLKDIV1_OUTDIV2(3) \ 
        LDR.W    R0,??DataTable13_4  ;; 0x40048044
        LDR.W    R1,??DataTable13_5  ;; 0x3330000
        STR      R1,[R0, #+0]
//  120                                        // SIM_CLKDIV1_OUTDIV3(3) | SIM_CLKDIV1_OUTDIV4(3));
//  121                                        //core = 1 bus = /1 flexbus = /1 flash clk =/4
//  122  
//  123     //change the UART serial baud  rate to 19200 baud
//  124     core_clk_khz = 1786;
        LDR.W    R0,??DataTable13_6
        MOVW     R1,#+1786
        STR      R1,[R0, #+0]
//  125     periph_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> 24)+ 1);
        LDR.W    R0,??DataTable13_6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable13_4  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+24,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.W    R1,??DataTable13_7
        STR      R0,[R1, #+0]
//  126     if ((TERM_PORT == UART0_BASE_PTR) | (TERM_PORT == UART1_BASE_PTR))
//  127         uart_init (TERM_PORT, core_clk_khz, TERMINAL_BAUD);
//  128     else
//  129         uart_init (TERM_PORT, periph_clk_khz, TERMINAL_BAUD);
        MOV      R2,#+38400
        LDR.W    R0,??DataTable13_7
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable13_8  ;; 0x4006d000
        BL       uart_init
//  130     // ~1.78MHz
//  131 
//  132     printf("\r\n Send any character to go into low power mode \r\n");
        LDR.W    R0,??DataTable13_9
        BL       printf
//  133     in_char();
        BL       in_char
//  134 
//  135      /* Set the RUNM field to 0b10 for VLPR mode - Need to retain state of LPWUI bit 8 */
//  136     /* Set the LPLLSM field to 0b010 for VLPS mode - Need to set state of LPWUI bit 8 */
//  137     if(lpwui_value){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??enter_vlpr_0
//  138        MC_PMCTRL = (MC_PMCTRL_LPWUI_MASK       // set LPWUI
//  139                     | MC_PMCTRL_RUNM(2));       // set RUNM = 0b10     
        LDR.W    R0,??DataTable13  ;; 0x4007e003
        MOVS     R1,#+192
        STRB     R1,[R0, #+0]
        B.N      ??enter_vlpr_1
//  140    
//  141      } else {
//  142        MC_PMCTRL = (!MC_PMCTRL_LPWUI_MASK            // clear LPWUI
//  143                    | MC_PMCTRL_RUNM(2));             // set RUNM = 0b10 
??enter_vlpr_0:
        LDR.W    R0,??DataTable13  ;; 0x4007e003
        MOVS     R1,#+64
        STRB     R1,[R0, #+0]
//  144      }       
//  145         
//  146     
//  147       /* Wait for VLPS regulator mode to be confirmed */
//  148 
//  149      while((PMC_REGSC & PMC_REGSC_VLPRS_MASK)==0);    // 0 MCU is not in VLPR mode
??enter_vlpr_1:
        LDR.W    R0,??DataTable13_10  ;; 0x4007d002
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??enter_vlpr_1
//  150                                                    // 1 MCU is in VLPR mode
//  151      for (i= 0;i<0xffff;i++){
        LDR.W    R0,??DataTable13_11
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
??enter_vlpr_2:
        LDR.W    R0,??DataTable13_11
        LDR      R0,[R0, #+0]
        MOVW     R1,#+65535
        CMP      R0,R1
        BGE.N    ??enter_vlpr_3
//  152  //          printf(" Now in VLPR at 19200 baud  \r\n");
//  153            printf("U");
        ADR.N    R0,??DataTable11  ;; "U"
        BL       printf
//  154               if ((UART_S1_REG(TERM_PORT) & UART_S1_RDRF_MASK)) {
        LDR.W    R0,??DataTable13_12  ;; 0x4006d004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BMI.N    ??enter_vlpr_3
//  155                  break;
//  156               }//if char received  */
//  157      }//for
??enter_vlpr_4:
        LDR.W    R0,??DataTable13_11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable13_11
        STR      R0,[R1, #+0]
        B.N      ??enter_vlpr_2
//  158 
//  159 }
??enter_vlpr_3:
        POP      {R4,PC}          ;; return
//  160 /********************************************************************/
//  161 /* VLPR mode exit routine. Puts the processor into normal run mode
//  162  * from VLPR mode. You can transition from VLPR to normal run using
//  163  * this function or an interrupt with LPWUI set. The enable_lpwui() 
//  164  * and disable_lpwui() functions can be used to set LPWUI to the 
//  165  * desired option prior to calling enter_vlpr().
//  166  *
//  167  * Mode transitions:
//  168  * VLPR -> RUN
//  169  *
//  170  * Parameters:
//  171  * none
//  172  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  173 void exit_vlpr(void)
//  174 {
exit_vlpr:
        PUSH     {R7,LR}
//  175     /* Clear RUNM */
//  176     MC_PMCTRL &= ~(MC_PMCTRL_RUNM(0x3));
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x9F
        LDR.N    R1,??DataTable13  ;; 0x4007e003
        STRB     R0,[R1, #+0]
//  177                    
//  178     /* Wait for normal RUN regulation mode to be confirmed */                   
//  179     while (PMC_REGSC & PMC_REGSC_VLPRS_MASK); // 0 MCU is not in VLPR mode
??exit_vlpr_0:
        LDR.W    R0,??DataTable13_10  ;; 0x4007d002
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BMI.N    ??exit_vlpr_0
//  180                                               // 1 MCU is in VLPR mode
//  181     while(!(PMC_REGSC & PMC_REGSC_REGONS_MASK)); 
??exit_vlpr_1:
        LDR.W    R0,??DataTable13_10  ;; 0x4007d002
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??exit_vlpr_1
//  182     
//  183     /* Transition MCG back to the PLL enabled state */
//  184     mcg_blpi_2_pee();
        BL       mcg_blpi_2_pee
//  185     //sim_clkdivided back to default
//  186     SIM_CLKDIV1 = 0x00010000;   //(SIM_CLKDIV1_OUTDIV1(1) | SIM_CLKDIV1_OUTDIV2(3) \ 
        LDR.N    R0,??DataTable13_4  ;; 0x40048044
        MOVS     R1,#+65536
        STR      R1,[R0, #+0]
//  187                                 // SIM_CLKDIV1_OUTDIV3(3) | SIM_CLKDIV1_OUTDIV4(3));
//  188                                 //core = /1 bus = /1 =flex bus /2 flash clk /2
//  189     core_clk_khz = core_clk_mhz * 1000;
        LDR.N    R0,??DataTable13_13
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable13_6
        STR      R0,[R1, #+0]
//  190     periph_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> 24)+ 1);
        LDR.N    R0,??DataTable13_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable13_4  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+24,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.N    R1,??DataTable13_7
        STR      R0,[R1, #+0]
//  191     if ((TERM_PORT == UART3_BASE_PTR) | (TERM_PORT == UART1_BASE_PTR))
//  192          uart_init (TERM_PORT, core_clk_khz, TERMINAL_BAUD);
        MOV      R2,#+38400
        LDR.N    R0,??DataTable13_6
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable13_8  ;; 0x4006d000
        BL       uart_init
//  193     else
//  194          uart_init (TERM_PORT, periph_clk_khz, TERMINAL_BAUD);
//  195     
//  196     printf("               Now in Run Mode at 115200 baud \r");
        LDR.N    R0,??DataTable13_14
        BL       printf
//  197 
//  198 }
        POP      {R0,PC}          ;; return
//  199 /********************************************************************/
//  200 /* VLPS mode entry routine. Puts the processor into VLPS mode directly
//  201  * from normal run mode. 
//  202  *
//  203  * Mode transitions:
//  204  * RUN -> VLPS
//  205  *
//  206  * If VLPS mode is entered directly from normal RUN mode, then the 
//  207  * LPWUI bit is forced to 1 by hardware. This means that when an
//  208  * interrupt occurs you will exit to normal run mode instead of VLPR.
//  209  *
//  210  * If however VLPS mode is entered from VLPR the state of the LPWUI bit
//  211  * determines the state the MCU will return to upon exit from VLPS.If LPWUI is set
//  212  * and an interrupt occurs you will exit to normal run mode instead of VLPR. 
//  213  * If LPWUI is clear and an interrupt occurs you will exit to VLPR.
//  214  *
//  215  * Parameters:  value of LPWUI
//  216  * none
//  217  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  218 void enter_vlps(char lpwui_value)
//  219 {
enter_vlps:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  220     /* Write to PMPROT to allow VLPS power modes */
//  221     MC_PMPROT = MC_PMPROT_AVLP_MASK;   // write oneif not all set make sure all enabled
        LDR.N    R0,??DataTable13_1  ;; 0x4007e002
        MOVS     R1,#+32
        STRB     R1,[R0, #+0]
//  222                                        //this write-once bit allows the MCU to enter the
//  223                                        //very low power modes: VLPR, VLPW, and VLPS.
//  224  
//  225     /* Reduce system clock to < 2MHz */
//  226  //   mcg_pee_2_blpi();    // you don't need to chage to lower frequency for VLPS
//  227        
//  228     /* Set the LPLLSM field to 0b010 for VLPS mode - Need to set state of LPWUI bit 8 */
//  229     if(lpwui_value){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??enter_vlps_0
//  230        MC_PMCTRL = (MC_PMCTRL_LPWUI_MASK            // set LPWUI
//  231                   | MC_PMCTRL_LPLLSM(2));           // set LPLLSM = 0b10
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        MOVS     R1,#+130
        STRB     R1,[R0, #+0]
        B.N      ??enter_vlps_1
//  232      } else {
//  233        MC_PMCTRL = (!MC_PMCTRL_LPWUI_MASK           // set LPWUI
//  234                   | MC_PMCTRL_LPLLSM(2));           // set LPLLSM = 0b10
??enter_vlps_0:
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  235      }       
//  236     /* Now execute the stop instruction to go into VLPS */
//  237     stop();
??enter_vlps_1:
        BL       stop
//  238 }
        POP      {R4,PC}          ;; return
//  239 /********************************************************************/
//  240 /* LLS mode entry routine. Puts the processor into LLS mode from
//  241  * normal run mode or VLPR. 
//  242  *
//  243  * Mode transitions:
//  244  * RUN -> LLS
//  245  * VLPR -> LLS
//  246  *
//  247  * NOTE: LLS mode will always exit to RUN mode even if you were 
//  248  * in VLPR mode before entering LLS.
//  249  *
//  250  * Wakeup from LLS mode is controlled by the LLWU module. Most
//  251  * modules cannot issue a wakeup interrupt in LLS mode, so make
//  252  * sure to setup the desired wakeup sources in the LLWU before 
//  253  * calling this function.
//  254  *
//  255  * Parameters:
//  256  * none
//  257  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  258 void enter_lls(void)
//  259 {
enter_lls:
        PUSH     {R7,LR}
//  260     /* Write to PMPROT to allow LLS power modes */
//  261     MC_PMPROT = MC_PMPROT_ALLS_MASK;   //this write-once bit allows the MCU to enter the
        LDR.N    R0,??DataTable13_1  ;; 0x4007e002
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  262                                        //LLS low power mode
//  263 
//  264         
//  265     /* Set the LPLLSM field to 0b011 for LLS mode  */
//  266     MC_PMCTRL  =  MC_PMCTRL_LPLLSM(3);           // set LPLLSM = 0b11
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  267         
//  268     /* Now execute the stop instruction to go into LLS */
//  269     stop();
        BL       stop
//  270 }
        POP      {R0,PC}          ;; return
//  271 /********************************************************************/
//  272 /* VLLS3 mode entry routine. Puts the processor into VLLS3 mode from
//  273  * normal run mode or VLPR. 
//  274  *
//  275  * Mode transitions:
//  276  * RUN -> VLLS3
//  277  * VLPR -> VLLS3
//  278  *
//  279  * NOTE: VLLSx modes will always exit to RUN mode even if you were 
//  280  * in VLPR mode before entering VLLSx.
//  281  *
//  282  * Wakeup from VLLSx mode is controlled by the LLWU module. Most
//  283  * modules cannot issue a wakeup interrupt in VLLSx mode, so make
//  284  * sure to setup the desired wakeup sources in the LLWU before 
//  285  * calling this function.
//  286  *
//  287  * Parameters:
//  288  * none  
//  289  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  290 void enter_vlls3(void)
//  291 {
enter_vlls3:
        PUSH     {R7,LR}
//  292     /* Write to PMPROT to allow VLLS3 power modes */
//  293     MC_PMPROT = MC_PMPROT_AVLLS3_MASK;
        LDR.N    R0,??DataTable13_1  ;; 0x4007e002
        MOVS     R1,#+4
        STRB     R1,[R0, #+0]
//  294         
//  295     /* Set the LPLLSM field to 0b101 for VLLS3 mode  */
//  296     MC_PMCTRL =  MC_PMCTRL_LPLLSM(5);           // set LPLLSM = 0b101
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        MOVS     R1,#+5
        STRB     R1,[R0, #+0]
//  297     disable_ports();    
        BL       disable_ports
//  298     /* Now execute the stop instruction to go into VLLS3 */
//  299     stop();
        BL       stop
//  300 }
        POP      {R0,PC}          ;; return
//  301 /********************************************************************/
//  302 /* VLLS2 mode entry routine. Puts the processor into VLLS2 mode from
//  303  * normal run mode or VLPR. 
//  304  *
//  305  * Mode transitions:
//  306  * RUN -> VLLS2
//  307  * VLPR -> VLLS2
//  308  *
//  309  * NOTE: VLLSx modes will always exit to RUN mode even if you were 
//  310  * in VLPR mode before entering VLLSx.
//  311  *
//  312  * Wakeup from VLLSx mode is controlled by the LLWU module. Most
//  313  * modules cannot issue a wakeup interrupt in VLLSx mode, so make
//  314  * sure to setup the desired wakeup sources in the LLWU before 
//  315  * calling this function.
//  316  *
//  317  * Parameters:
//  318  * none  
//  319  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  320 void enter_vlls2(void)
//  321 {
enter_vlls2:
        PUSH     {R7,LR}
//  322     /* Write to PMPROT to allow VLLS2 power modes */
//  323     MC_PMPROT = MC_PMPROT_AVLLS2_MASK;
        LDR.N    R0,??DataTable13_1  ;; 0x4007e002
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  324         
//  325     /* Set the LPLLSM field to 0b110 for VLLS2 mode */
//  326     MC_PMCTRL =  MC_PMCTRL_LPLLSM(6);           // set LPLLSM = 0b110
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        MOVS     R1,#+6
        STRB     R1,[R0, #+0]
//  327     disable_ports();    
        BL       disable_ports
//  328         
//  329     /* Now execute the stop instruction to go into VLLS2 */
//  330     stop();
        BL       stop
//  331 }
        POP      {R0,PC}          ;; return
//  332 /********************************************************************/
//  333 /* VLLS1 mode entry routine. Puts the processor into VLLS1 mode from
//  334  * normal run mode or VLPR. 
//  335  *
//  336  * Mode transitions:
//  337  * RUN -> VLLS1
//  338  * VLPR -> VLLS1
//  339  *
//  340  * NOTE: VLLSx modes will always exit to RUN mode even if you were 
//  341  * in VLPR mode before entering VLLSx.
//  342  *
//  343  * Wakeup from VLLSx mode is controlled by the LLWU module. Most
//  344  * modules cannot issue a wakeup interrupt in VLLSx mode, so make
//  345  * sure to setup the desired wakeup sources in the LLWU before 
//  346  * calling this function.
//  347  *
//  348  * Parameters:
//  349  * none  
//  350  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  351 void enter_vlls1(void)
//  352 {
enter_vlls1:
        PUSH     {R7,LR}
//  353     /* Write to PMPROT to allow all possible power modes */
//  354     MC_PMPROT = MC_PMPROT_AVLLS1_MASK;
        LDR.N    R0,??DataTable13_1  ;; 0x4007e002
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  355         
//  356     /* Set the LPLLSM field to 0b111 for VLLS1 mode  */
//  357     MC_PMCTRL =  MC_PMCTRL_LPLLSM(7);           // set LPLLSM = 0b111
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        MOVS     R1,#+7
        STRB     R1,[R0, #+0]
//  358     disable_ports();    
        BL       disable_ports
//  359         
//  360     /* Now execute the stop instruction to go into VLLS1 */
//  361     stop();
        BL       stop
//  362 }
        POP      {R0,PC}          ;; return
//  363 /********************************************************************/
//  364 /* Enable low power wake up on interrupt. This function can be used
//  365  * to set the LPWUI bit. When this bit is set VLPx modes will exit
//  366  * to normal run mode. When this bit is cleared VLPx modes will exit
//  367  * to VLPR mode.
//  368  *
//  369  * The disable_lpwui() function can be used to clear the LPWUI bit.
//  370  *
//  371  * Parameters:
//  372  * none
//  373  */
//  374 
//  375    
//  376 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  377 void enable_lpwui(void)
//  378 {
//  379     MC_PMCTRL |= MC_PMCTRL_LPWUI_MASK;
enable_lpwui:
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable13  ;; 0x4007e003
        STRB     R0,[R1, #+0]
//  380 }
        BX       LR               ;; return
//  381 /********************************************************************/
//  382 /* Disable low power wake up on interrupt. This function can be used
//  383  * to clear the LPWUI bit. When this bit is set VLPx modes will exit
//  384  * to normal run mode. When this bit is cleared VLPx modes will exit
//  385  * to VLPR mode.
//  386  *
//  387  * The enable_lpwui() function can be used to set the LPWUI bit.
//  388  *
//  389  * Parameters:
//  390  * none
//  391  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  392 void disable_lpwui(void)
//  393 {
//  394     MC_PMCTRL &= ~MC_PMCTRL_LPWUI_MASK;
disable_lpwui:
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x7F
        LDR.N    R1,??DataTable13  ;; 0x4007e003
        STRB     R0,[R1, #+0]
//  395 }
        BX       LR               ;; return
//  396 /********************************************************************/
//  397    /* entry mode variable is set to one of the valid settings following
//  398     000 Normal stop
//  399     001 Reserved
//  400     010 Very low power stop (VLPS)
//  401     011 Low leakage stop (LLS)
//  402     100 Reserved
//  403     101 Very low leakage stop 3 (VLLS3)
//  404     110 Very low leakage stop 2 (VLLS2)
//  405     111 Very low leakage stop 1 (VLLS1)
//  406    */
//  407 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  408 void enter_stop_mode(char mode)
//  409 {
enter_stop_mode:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  410     printf("\n-------------------------------------\n");
        LDR.N    R0,??DataTable13_15
        BL       printf
//  411     printf("  MC_Enter Low Power Modes Utility    \n");
        LDR.N    R0,??DataTable13_16
        BL       printf
//  412     printf("--------------------------------------\n");
        LDR.N    R0,??DataTable13_17
        BL       printf
//  413     
//  414     MC_PMPROT = 0x37;               //This value enables all possible power modes.
        LDR.N    R0,??DataTable13_1  ;; 0x4007e002
        MOVS     R1,#+55
        STRB     R1,[R0, #+0]
//  415  
//  416     MC_PMCTRL = MC_PMCTRL_LPWUI_MASK | MC_PMCTRL_LPLLSM(mode) ;  
        ANDS     R0,R4,#0x7
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable13  ;; 0x4007e003
        STRB     R0,[R1, #+0]
//  417     stop();         
        BL       stop
//  418 }
        POP      {R4,PC}          ;; return
//  419 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  420 void     disable_ports(void){
//  421 #if (defined(TWR_K60N512))
//  422    PORTE_PCR26 = PORT_PCR_IRQC(00);;
disable_ports:
        LDR.N    R0,??DataTable13_18  ;; 0x4004d068
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  423    PORTA_PCR19 = PORT_PCR_IRQC(00);
        LDR.N    R0,??DataTable13_19  ;; 0x4004904c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  424    #endif
//  425   
//  426 #if (defined(TWR_K40X256))
//  427    //  SW6 and SW7
//  428      PORTC_PCR5  = PORT_PCR_IRQC(00);
//  429      PORTC_PCR13  = PORT_PCR_IRQC(00);
//  430 #endif
//  431      
//  432    // disable trace clock output
//  433      PORTA_PCR6 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_20  ;; 0x40049018
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  434    // disable JTAG i/o PTA0-3 5
//  435      PORTA_PCR0 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_21  ;; 0x40049000
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  436      PORTA_PCR1 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_22  ;; 0x40049004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  437      PORTA_PCR2 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_23  ;; 0x40049008
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  438      PORTA_PCR3 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_24  ;; 0x4004900c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  439      PORTA_PCR5 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_25  ;; 0x40049014
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  440 
//  441    // disable fb_clk output
//  442      PORTC_PCR3 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_26  ;; 0x4004b00c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  443  	/* Disable the pins for the selected UART */
//  444      if (TERM_PORT == UART0_BASE_PTR)
//  445          {
//  446             /* Disable the UART0_TXD function on PTD6 */
//  447             PORTD_PCR6 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  448 
//  449             /* Disable the UART0_RXD function on PTD7 */
//  450             PORTD_PCR7 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  451          }
//  452 
//  453      if (TERM_PORT == UART1_BASE_PTR)
//  454   	 {
//  455                  /* Disable the UART1_TXD function on PTC4 */
//  456   		PORTC_PCR4 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  457 
//  458   		/* Enable the UART1_RXD function on PTC3 */
//  459   		PORTC_PCR3 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  460   	}
//  461 
//  462     if (TERM_PORT == UART2_BASE_PTR)
//  463   	{
//  464                  /* Disable the UART2_TXD function on PTD3 */
//  465   		PORTD_PCR3 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  466 
//  467   		/* Disable the UART2_RXD function on PTD2 */
//  468   		PORTD_PCR2 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  469   	}
//  470 
//  471     if (TERM_PORT == UART3_BASE_PTR)
//  472   	{
//  473                  /* Disable the UART3_TXD function on PTC17 */
//  474   		PORTC_PCR17 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
        LDR.N    R0,??DataTable13_27  ;; 0x4004b044
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  475 
//  476   		/* Enable the UART3_RXD function on PTC16 */
//  477   		PORTC_PCR16 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
        LDR.N    R0,??DataTable13_28  ;; 0x4004b040
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  478   	}
//  479     if (TERM_PORT == UART4_BASE_PTR)
//  480   	{
//  481                  /* Disable the UART3_TXD function on PTC17 */
//  482   		PORTE_PCR24 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  483 
//  484   		/* Disable the UART3_RXD function on PTC16 */
//  485   		PORTE_PCR25 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  486   	}
//  487     if (TERM_PORT == UART5_BASE_PTR)
//  488   	{
//  489                  /* Disable the UART3_TXD function on PTC17 */
//  490   		PORTE_PCR8 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  491 
//  492   		/* Disable the UART3_RXD function on PTC16 */
//  493   		PORTE_PCR9 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  494   	}
//  495   // disable clock gating
//  496   SIM_SCGC1 = 0;
        LDR.N    R0,??DataTable13_29  ;; 0x40048028
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  497   SIM_SCGC2 = 0;
        LDR.N    R0,??DataTable13_30  ;; 0x4004802c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  498   SIM_SCGC3 = 0;
        LDR.N    R0,??DataTable13_31  ;; 0x40048030
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  499   SIM_SCGC4 = 0;
        LDR.N    R0,??DataTable13_32  ;; 0x40048034
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  500   SIM_SCGC5 = 0;
        LDR.N    R0,??DataTable13_33  ;; 0x40048038
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  501   SIM_SCGC6 = 0;
        LDR.N    R0,??DataTable13_34  ;; 0x4004803c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  502   SIM_SCGC7 = 0;
        LDR.N    R0,??DataTable13_35  ;; 0x40048040
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  503 
//  504 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC8      "U",0x0,0x0
//  505 
//  506 //AJJ

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  507 void     disable_ports_partial(void){
//  508 /*
//  509 #if (defined(TWR_K60N512))
//  510    PORTE_PCR26 = PORT_PCR_IRQC(00);;
//  511    PORTA_PCR19 = PORT_PCR_IRQC(00);
//  512    #endif
//  513   
//  514 #if (defined(TWR_K40X256))
//  515    //  SW6 and SW7
//  516      PORTC_PCR5  = PORT_PCR_IRQC(00);
//  517      PORTC_PCR13  = PORT_PCR_IRQC(00);
//  518 #endif
//  519 */    
//  520    // disable trace clock output
//  521      PORTA_PCR6 = ( PORT_PCR_MUX(0x0));
disable_ports_partial:
        LDR.N    R0,??DataTable13_20  ;; 0x40049018
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  522    // disable JTAG i/o PTA0-3 5
//  523      PORTA_PCR0 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_21  ;; 0x40049000
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  524      PORTA_PCR1 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_22  ;; 0x40049004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  525      PORTA_PCR2 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_23  ;; 0x40049008
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  526      PORTA_PCR3 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_24  ;; 0x4004900c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  527      PORTA_PCR5 = ( PORT_PCR_MUX(0x0));
        LDR.N    R0,??DataTable13_25  ;; 0x40049014
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  528 /*
//  529    // disable fb_clk output
//  530      PORTC_PCR3 = ( PORT_PCR_MUX(0x0));
//  531  	// Disable the pins for the selected UART 
//  532      if (TERM_PORT == UART0_BASE_PTR)
//  533          {
//  534             // Disable the UART0_TXD function on PTD6 
//  535             PORTD_PCR6 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  536 
//  537             // Disable the UART0_RXD function on PTD7 
//  538             PORTD_PCR7 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  539          }
//  540 
//  541      if (TERM_PORT == UART1_BASE_PTR)
//  542   	 {
//  543                  // Disable the UART1_TXD function on PTC4 
//  544   		PORTC_PCR4 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  545 
//  546   		// Enable the UART1_RXD function on PTC3 
//  547   		PORTC_PCR3 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  548   	}
//  549 
//  550     if (TERM_PORT == UART2_BASE_PTR)
//  551   	{
//  552                  // Disable the UART2_TXD function on PTD3 
//  553   		PORTD_PCR3 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  554 
//  555   		// Disable the UART2_RXD function on PTD2 
//  556   		PORTD_PCR2 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  557   	}
//  558 
//  559     if (TERM_PORT == UART3_BASE_PTR)
//  560   	{
//  561                  // Disable the UART3_TXD function on PTC17 
//  562   		PORTC_PCR17 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  563 
//  564   		// Enable the UART3_RXD function on PTC16 
//  565   		PORTC_PCR16 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  566   	}
//  567     if (TERM_PORT == UART4_BASE_PTR)
//  568   	{
//  569                  // Disable the UART3_TXD function on PTC17 
//  570   		PORTE_PCR24 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  571 
//  572   		// Disable the UART3_RXD function on PTC16 
//  573   		PORTE_PCR25 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  574   	}
//  575     if (TERM_PORT == UART5_BASE_PTR)
//  576   	{
//  577                  // Disable the UART3_TXD function on PTC17 
//  578   		PORTE_PCR8 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  579 
//  580   		// Disable the UART3_RXD function on PTC16 
//  581   		PORTE_PCR9 = PORT_PCR_MUX(0x0); // UART is alt3 function for this pin
//  582   	}
//  583 */
//  584 
//  585      // disable clock gating
//  586   //SIM_SCGC1 = 0;  //uart 4 & 5
//  587   //SIM_SCGC2 = 0;  //DAC 0 & 1, ENET
//  588 //  SIM_SCGC3 = 0;  //ADC1(27), FTM2(24), SDHC(17), SPI2(12), FLEXCAN1(4), RNGB(0)
//  589 
//  590 //  printf("SIM_SCGC4 is %08x \n\r\n", SIM_SCGC4);
//  591 //  printf("SIM_SCGC4 is %08x \n\r\n", SIM_SCGC4);
//  592 
//  593   SIM_SCGC4 = SIM_SCGC4 & 0x70102030;  //LLWU(28), VREF(20), CMP(19), USBOTG(18), UART3 - 0(13-10), 
        LDR.N    R0,??DataTable13_32  ;; 0x40048034
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable13_36  ;; 0x70102030
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable13_32  ;; 0x40048034
        STR      R0,[R1, #+0]
//  594                   //I2C1(7), I2C0(6), CMT(2), EWM(1)   VREF defaults to 1
//  595 //  printf("SIM_SCGC4 is %08x \n\r\n", SIM_SCGC4);
//  596 //  while(!(UART3_S1&UART_S1_TC_MASK));  //make sure uart buffer is empty before exiting
//  597 
//  598 
//  599   //SIM_SCGC5 = 0;  //PortE - A(13-9), TSI(5), REGFILE(1), LPTIMER(0)
//  600   //SIM_SCGC6 = 0;  //RTC(29), ADC0(27), FTM1(25), FTM0(24), PIT(23), PDB(22), USBDCD(21), CRC(18), 
//  601                   //I2S(15), SPI1(13), DSPI0(12), FLEXCAN0(4), DMAMUX(1), FTFL(0)
//  602   SIM_SCGC7 = 0x00000000;  //MPU(2), DMA(1), FLEXBUS(0)
        LDR.N    R0,??DataTable13_35  ;; 0x40048040
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  603 
//  604 
//  605 }
        BX       LR               ;; return
//  606 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  607 void outSRS(void){                         //[outSRS]
outSRS:
        PUSH     {R7,LR}
//  608   if (MC_SRSH & MC_SRSH_SW_MASK)
        LDR.N    R0,??DataTable13_37  ;; 0x4007e000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??outSRS_0
//  609 		printf("[outSRS]Software Reset\n");
        LDR.N    R0,??DataTable13_38
        BL       printf
//  610 	if (MC_SRSH & MC_SRSH_LOCKUP_MASK)
??outSRS_0:
        LDR.N    R0,??DataTable13_37  ;; 0x4007e000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??outSRS_1
//  611 		printf("[outSRS]Core Lockup Event Reset\n");
        LDR.N    R0,??DataTable13_39
        BL       printf
//  612 	if (MC_SRSH & MC_SRSH_JTAG_MASK)
??outSRS_1:
        LDR.N    R0,??DataTable13_37  ;; 0x4007e000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??outSRS_2
//  613 		printf("[outSRS]JTAG Reset\n");
        LDR.N    R0,??DataTable13_40
        BL       printf
//  614 	
//  615 	if (MC_SRSL & MC_SRSL_POR_MASK)
??outSRS_2:
        LDR.N    R0,??DataTable13_41  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??outSRS_3
//  616 		printf("[outSRS]Power-on Reset\n");
        LDR.N    R0,??DataTable13_42
        BL       printf
//  617 	if (MC_SRSL & MC_SRSL_PIN_MASK){
??outSRS_3:
        LDR.N    R0,??DataTable13_41  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??outSRS_4
//  618 	    // find out which mode we are wakeing up from
//  619           printf("External Pin Reset\n");
        LDR.N    R0,??DataTable13_43
        BL       printf
//  620 	}
//  621 	if (MC_SRSL & MC_SRSL_WAKEUP_MASK){
??outSRS_4:
        LDR.N    R0,??DataTable13_41  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??outSRS_5
//  622 	     printf("[outSRS]Pin Reset wakeup from low power modes\n");
        LDR.N    R0,??DataTable13_44
        BL       printf
//  623        //The state of PMCTRL[LPLLSM] prior to clearing due to update 
//  624        // of PMPROT indicates which power mode was exited and should be 
//  625        // used by initialization software for proper power mode recovery.
//  626           if ((MC_PMCTRL & MC_PMCTRL_LPLLSM_MASK) == 0)
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+7
        TST      R0,R1
        BNE.N    ??outSRS_6
//  627              printf("[outSRS]Pin Reset wakeup from Normal Stop\n");
        LDR.N    R0,??DataTable13_45
        BL       printf
//  628 	        if ((MC_PMCTRL & MC_PMCTRL_LPLLSM_MASK) == 2)
??outSRS_6:
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0x7
        CMP      R0,#+2
        BNE.N    ??outSRS_7
//  629 		         printf("[outSRS]Pin Reset wakeup from Very Low Power Stop(VLPS)\n");
        LDR.N    R0,??DataTable13_46
        BL       printf
//  630 		      if ((MC_PMCTRL & MC_PMCTRL_LPLLSM_MASK) == 3)
??outSRS_7:
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0x7
        CMP      R0,#+3
        BNE.N    ??outSRS_8
//  631 		         printf("[outSRS]Pin Reset wakeup from Low Leakage Stop (LLS)\n");
        LDR.N    R0,??DataTable13_47
        BL       printf
//  632 		      if ((MC_PMCTRL & MC_PMCTRL_LPLLSM_MASK) == 5 )
??outSRS_8:
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0x7
        CMP      R0,#+5
        BNE.N    ??outSRS_9
//  633 		         printf("[outSRS]Pin Reset wakeup from Very low leakage stop (VLLS3)\n");
        LDR.N    R0,??DataTable13_48
        BL       printf
//  634 		      if ((MC_PMCTRL & MC_PMCTRL_LPLLSM_MASK) == 6)
??outSRS_9:
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0x7
        CMP      R0,#+6
        BNE.N    ??outSRS_10
//  635 		         printf("[outSRS]Pin Reset wakeup from Very low leakage stop (VLLS2)\n");
        LDR.N    R0,??DataTable13_49
        BL       printf
//  636 		      if ((MC_PMCTRL & MC_PMCTRL_LPLLSM_MASK) == 7)		       
??outSRS_10:
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0x7
        CMP      R0,#+7
        BNE.N    ??outSRS_11
//  637 		         printf("Pin Reset wakeup from Very low leakage stop 1(VLLS1)\n");
        LDR.N    R0,??DataTable13_50
        BL       printf
//  638           printf("[outSRS]MC PMPROT= %#02X \r\n",   (MC_PMPROT)  );
??outSRS_11:
        LDR.N    R0,??DataTable13_1  ;; 0x4007e002
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable13_51
        BL       printf
//  639           printf("[outSRS]MC PMCTRL= %#02X \r\n\n", (MC_PMCTRL) ) ;
        LDR.N    R0,??DataTable13  ;; 0x4007e003
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable13_52
        BL       printf
//  640 	}
//  641 	if (MC_SRSL & MC_SRSL_COP_MASK)
??outSRS_5:
        LDR.N    R0,??DataTable13_41  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??outSRS_12
//  642 	 	printf("[outSRS]Watchdog(COP) Reset\n");
        LDR.N    R0,??DataTable13_53
        BL       printf
//  643   if (MC_SRSL & MC_SRSL_LOC_MASK)
??outSRS_12:
        LDR.N    R0,??DataTable13_41  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??outSRS_13
//  644 		printf("[outSRS]Loss of Clock Reset\n");
        LDR.N    R0,??DataTable13_54
        BL       printf
//  645 	if (MC_SRSL & MC_SRSL_LVD_MASK)
??outSRS_13:
        LDR.N    R0,??DataTable13_41  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??outSRS_14
//  646 	  printf("[outSRS]Low-voltage Detect Reset\n");
        LDR.N    R0,??DataTable13_55
        BL       printf
//  647   if (MC_SRSL & MC_SRSL_WAKEUP_MASK)
??outSRS_14:
        LDR.N    R0,??DataTable13_41  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??outSRS_15
//  648 		printf("[outSRS]LLWU Reset\n");	
        LDR.N    R0,??DataTable13_56
        BL       printf
//  649 }
??outSRS_15:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x4007e003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0x4007e002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     `?<Constant "\\n\\n\\n To communicate in...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     `?<Constant "\\r\\n Send any character...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     0x3330000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     core_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     `?<Constant "\\r\\n Send any character...">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     0x4007d002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_11:
        DC32     i

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_12:
        DC32     0x4006d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_13:
        DC32     core_clk_mhz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_14:
        DC32     `?<Constant "               Now in...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_15:
        DC32     `?<Constant "\\n--------------------...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_16:
        DC32     `?<Constant "  MC_Enter Low Power ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_17:
        DC32     `?<Constant "---------------------...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_18:
        DC32     0x4004d068

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_19:
        DC32     0x4004904c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_20:
        DC32     0x40049018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_21:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_22:
        DC32     0x40049004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_23:
        DC32     0x40049008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_24:
        DC32     0x4004900c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_25:
        DC32     0x40049014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_26:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_27:
        DC32     0x4004b044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_28:
        DC32     0x4004b040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_29:
        DC32     0x40048028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_30:
        DC32     0x4004802c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_31:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_32:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_33:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_34:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_35:
        DC32     0x40048040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_36:
        DC32     0x70102030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_37:
        DC32     0x4007e000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_38:
        DC32     `?<Constant "[outSRS]Software Reset\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_39:
        DC32     `?<Constant "[outSRS]Core Lockup E...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_40:
        DC32     `?<Constant "[outSRS]JTAG Reset\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_41:
        DC32     0x4007e001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_42:
        DC32     `?<Constant "[outSRS]Power-on Reset\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_43:
        DC32     `?<Constant "External Pin Reset\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_44:
        DC32     `?<Constant "[outSRS]Pin Reset wak...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_45:
        DC32     `?<Constant "[outSRS]Pin Reset wak...">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_46:
        DC32     `?<Constant "[outSRS]Pin Reset wak...">_2`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_47:
        DC32     `?<Constant "[outSRS]Pin Reset wak...">_3`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_48:
        DC32     `?<Constant "[outSRS]Pin Reset wak...">_4`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_49:
        DC32     `?<Constant "[outSRS]Pin Reset wak...">_5`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_50:
        DC32     `?<Constant "Pin Reset wakeup from...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_51:
        DC32     `?<Constant "[outSRS]MC PMPROT= %#...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_52:
        DC32     `?<Constant "[outSRS]MC PMCTRL= %#...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_53:
        DC32     `?<Constant "[outSRS]Watchdog(COP)...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_54:
        DC32     `?<Constant "[outSRS]Loss of Clock...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_55:
        DC32     `?<Constant "[outSRS]Low-voltage D...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_56:
        DC32     `?<Constant "[outSRS]LLWU Reset\\n">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\n\\n To communicate in...">`:
        DATA
        DC8 0AH, 0AH, 0AH, 20H, 54H, 6FH, 20H, 63H
        DC8 6FH, 6DH, 6DH, 75H, 6EH, 69H, 63H, 61H
        DC8 74H, 65H, 20H, 69H, 6EH, 20H, 56H, 4CH
        DC8 50H, 52H, 20H, 2DH, 20H, 41H, 75H, 74H
        DC8 6FH, 2DH, 54H, 72H, 69H, 6DH, 20H, 6DH
        DC8 75H, 73H, 74H, 20H, 68H, 61H, 76H, 65H
        DC8 20H, 62H, 65H, 65H, 6EH, 20H, 64H, 6FH
        DC8 6EH, 65H, 2CH, 20H, 43H, 68H, 61H, 6EH
        DC8 67H, 65H, 20H, 74H, 6FH, 20H, 31H, 39H
        DC8 32H, 30H, 30H, 20H, 62H, 61H, 75H, 64H
        DC8 20H, 61H, 66H, 74H, 65H, 72H, 20H, 6BH
        DC8 65H, 79H, 20H, 68H, 69H, 74H, 20H, 21H
        DC8 21H, 21H, 21H, 20H, 0AH, 0DH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\r\\n Send any character...">`:
        DATA
        DC8 0DH, 0AH, 20H, 53H, 65H, 6EH, 64H, 20H
        DC8 61H, 6EH, 79H, 20H, 63H, 68H, 61H, 72H
        DC8 61H, 63H, 74H, 65H, 72H, 20H, 74H, 6FH
        DC8 20H, 67H, 6FH, 20H, 69H, 6EH, 74H, 6FH
        DC8 20H, 6CH, 6FH, 77H, 65H, 72H, 20H, 64H
        DC8 69H, 76H, 69H, 64H, 65H, 20H, 6DH, 6FH
        DC8 64H, 65H, 20H, 0DH, 0AH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\r\\n Send any character...">_1`:
        DATA
        DC8 0DH, 0AH, 20H, 53H, 65H, 6EH, 64H, 20H
        DC8 61H, 6EH, 79H, 20H, 63H, 68H, 61H, 72H
        DC8 61H, 63H, 74H, 65H, 72H, 20H, 74H, 6FH
        DC8 20H, 67H, 6FH, 20H, 69H, 6EH, 74H, 6FH
        DC8 20H, 6CH, 6FH, 77H, 20H, 70H, 6FH, 77H
        DC8 65H, 72H, 20H, 6DH, 6FH, 64H, 65H, 20H
        DC8 0DH, 0AH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "U"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "               Now in...">`:
        DATA
        DC8 "               Now in Run Mode at 115200 baud \015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n--------------------...">`:
        DATA
        DC8 "\012-------------------------------------\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  MC_Enter Low Power ...">`:
        DATA
        DC8 "  MC_Enter Low Power Modes Utility    \012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "---------------------...">`:
        DATA
        DC8 "--------------------------------------\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Software Reset\\n">`:
        DATA
        DC8 "[outSRS]Software Reset\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Core Lockup E...">`:
        DATA
        DC8 "[outSRS]Core Lockup Event Reset\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]JTAG Reset\\n">`:
        DATA
        DC8 "[outSRS]JTAG Reset\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Power-on Reset\\n">`:
        DATA
        DC8 "[outSRS]Power-on Reset\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "External Pin Reset\\n">`:
        DATA
        DC8 "External Pin Reset\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Pin Reset wak...">`:
        DATA
        DC8 "[outSRS]Pin Reset wakeup from low power modes\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Pin Reset wak...">_1`:
        DATA
        DC8 "[outSRS]Pin Reset wakeup from Normal Stop\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Pin Reset wak...">_2`:
        DATA
        DC8 5BH, 6FH, 75H, 74H, 53H, 52H, 53H, 5DH
        DC8 50H, 69H, 6EH, 20H, 52H, 65H, 73H, 65H
        DC8 74H, 20H, 77H, 61H, 6BH, 65H, 75H, 70H
        DC8 20H, 66H, 72H, 6FH, 6DH, 20H, 56H, 65H
        DC8 72H, 79H, 20H, 4CH, 6FH, 77H, 20H, 50H
        DC8 6FH, 77H, 65H, 72H, 20H, 53H, 74H, 6FH
        DC8 70H, 28H, 56H, 4CH, 50H, 53H, 29H, 0AH
        DC8 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Pin Reset wak...">_3`:
        DATA
        DC8 5BH, 6FH, 75H, 74H, 53H, 52H, 53H, 5DH
        DC8 50H, 69H, 6EH, 20H, 52H, 65H, 73H, 65H
        DC8 74H, 20H, 77H, 61H, 6BH, 65H, 75H, 70H
        DC8 20H, 66H, 72H, 6FH, 6DH, 20H, 4CH, 6FH
        DC8 77H, 20H, 4CH, 65H, 61H, 6BH, 61H, 67H
        DC8 65H, 20H, 53H, 74H, 6FH, 70H, 20H, 28H
        DC8 4CH, 4CH, 53H, 29H, 0AH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Pin Reset wak...">_4`:
        DATA
        DC8 5BH, 6FH, 75H, 74H, 53H, 52H, 53H, 5DH
        DC8 50H, 69H, 6EH, 20H, 52H, 65H, 73H, 65H
        DC8 74H, 20H, 77H, 61H, 6BH, 65H, 75H, 70H
        DC8 20H, 66H, 72H, 6FH, 6DH, 20H, 56H, 65H
        DC8 72H, 79H, 20H, 6CH, 6FH, 77H, 20H, 6CH
        DC8 65H, 61H, 6BH, 61H, 67H, 65H, 20H, 73H
        DC8 74H, 6FH, 70H, 20H, 28H, 56H, 4CH, 4CH
        DC8 53H, 33H, 29H, 0AH, 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Pin Reset wak...">_5`:
        DATA
        DC8 5BH, 6FH, 75H, 74H, 53H, 52H, 53H, 5DH
        DC8 50H, 69H, 6EH, 20H, 52H, 65H, 73H, 65H
        DC8 74H, 20H, 77H, 61H, 6BH, 65H, 75H, 70H
        DC8 20H, 66H, 72H, 6FH, 6DH, 20H, 56H, 65H
        DC8 72H, 79H, 20H, 6CH, 6FH, 77H, 20H, 6CH
        DC8 65H, 61H, 6BH, 61H, 67H, 65H, 20H, 73H
        DC8 74H, 6FH, 70H, 20H, 28H, 56H, 4CH, 4CH
        DC8 53H, 32H, 29H, 0AH, 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Pin Reset wakeup from...">`:
        DATA
        DC8 50H, 69H, 6EH, 20H, 52H, 65H, 73H, 65H
        DC8 74H, 20H, 77H, 61H, 6BH, 65H, 75H, 70H
        DC8 20H, 66H, 72H, 6FH, 6DH, 20H, 56H, 65H
        DC8 72H, 79H, 20H, 6CH, 6FH, 77H, 20H, 6CH
        DC8 65H, 61H, 6BH, 61H, 67H, 65H, 20H, 73H
        DC8 74H, 6FH, 70H, 20H, 31H, 28H, 56H, 4CH
        DC8 4CH, 53H, 31H, 29H, 0AH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]MC PMPROT= %#...">`:
        DATA
        DC8 "[outSRS]MC PMPROT= %#02X \015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]MC PMCTRL= %#...">`:
        DATA
        DC8 "[outSRS]MC PMCTRL= %#02X \015\012\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Watchdog(COP)...">`:
        DATA
        DC8 "[outSRS]Watchdog(COP) Reset\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Loss of Clock...">`:
        DATA
        DC8 "[outSRS]Loss of Clock Reset\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]Low-voltage D...">`:
        DATA
        DC8 "[outSRS]Low-voltage Detect Reset\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[outSRS]LLWU Reset\\n">`:
        DATA
        DC8 "[outSRS]LLWU Reset\012"

        END
//  650 
//  651 
//  652 
//  653 
// 
//     4 bytes in section .bss
// 1 078 bytes in section .rodata
// 1 216 bytes in section .text
// 
// 1 216 bytes of CODE  memory
// 1 078 bytes of CONST memory
//     4 bytes of DATA  memory
//
//Errors: none
//Warnings: none
