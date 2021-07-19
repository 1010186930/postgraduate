///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\cpu\start.c    /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\cpu\start.c    /
//                    -D IAR -D TWR_K60N512 -lCN                              /
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
//                    rld\RAM_128KB\List\start.s                              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME start

        #define SHT_PROGBITS 0x1

        EXTERN common_startup
        EXTERN main
        EXTERN printf
        EXTERN sysinit
        EXTERN wdog_disable

        PUBLIC cpu_identify
        PUBLIC flash_identify
        PUBLIC start

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\cpu\start.c
//    1 /*
//    2  * File:	start.c
//    3  * Purpose:	Kinetis start up routines. 
//    4  *
//    5  * Notes:		
//    6  */
//    7 
//    8 #include "start.h"
//    9 #include "common.h"
//   10 #include "wdog.h"
//   11 #include "sysinit.h"
//   12 
//   13 /********************************************************************/
//   14 /*!
//   15  * \brief   Kinetis Start
//   16  * \return  None
//   17  *
//   18  * This function calls all of the needed starup routines and then 
//   19  * branches to the main process.
//   20  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void start(void)
//   22 {
start:
        PUSH     {R7,LR}
//   23 	/* Disable the watchdog timer */
//   24         /* 关闭看门狗 */
//   25 	wdog_disable();
        BL       wdog_disable
//   26 
//   27 	/* Copy any vector or data sections that need to be in RAM */
//   28         /* 复制中断向量表、初始化数据、以__ramfunc声明的子函数复制到RAM区 */
//   29         
//   30 	common_startup();
        BL       common_startup
//   31 
//   32 	/* Perform processor initialization */
//   33         /* CPU初始化，设置频率 */
//   34         
//   35 	sysinit();
        BL       sysinit
//   36         
//   37 
//   38 	/* Jump to main process */
//   39 	main();
        BL       main
//   40 
//   41 	/* No actions to perform after this so wait forever */
//   42 	while(1);
??start_0:
        B.N      ??start_0
//   43 }
//   44 /********************************************************************/
//   45 /*!
//   46  * \brief   Kinetis Identify
//   47  * \return  None
//   48  *
//   49  * This is primarly a reporting function that displays information
//   50  * about the specific CPU to the default terminal including:
//   51  * - Kinetis family
//   52  * - package
//   53  * - die revision
//   54  * - P-flash size
//   55  * - Ram size
//   56  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   57 void cpu_identify (void)
//   58 {
cpu_identify:
        PUSH     {R7,LR}
//   59     /* Determine the Kinetis family */
//   60     switch((SIM_SDID & SIM_SDID_FAMID(0x7))>>SIM_SDID_FAMID_SHIFT) 
        LDR.N    R0,??DataTable1  ;; 0x40048024
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+4
        ANDS     R0,R0,#0x7
        CMP      R0,#+0
        BEQ.N    ??cpu_identify_0
        CMP      R0,#+2
        BEQ.N    ??cpu_identify_1
        BCC.N    ??cpu_identify_2
        CMP      R0,#+4
        BEQ.N    ??cpu_identify_3
        BCC.N    ??cpu_identify_4
        CMP      R0,#+6
        BEQ.N    ??cpu_identify_5
        BCC.N    ??cpu_identify_6
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_7
        B.N      ??cpu_identify_8
//   61     {  
//   62     	case 0x0:
//   63     		printf("\nK10-");
??cpu_identify_0:
        LDR.N    R0,??DataTable1_1
        BL       printf
//   64     		break;
        B.N      ??cpu_identify_9
//   65     	case 0x1:
//   66     		printf("\nK20-");
??cpu_identify_2:
        LDR.N    R0,??DataTable1_2
        BL       printf
//   67     		break;
        B.N      ??cpu_identify_9
//   68     	case 0x2:
//   69     		printf("\nK30-");
??cpu_identify_1:
        LDR.N    R0,??DataTable1_3
        BL       printf
//   70     		break;
        B.N      ??cpu_identify_9
//   71     	case 0x3:
//   72     		printf("\nK40-");
??cpu_identify_4:
        LDR.N    R0,??DataTable1_4
        BL       printf
//   73     		break;
        B.N      ??cpu_identify_9
//   74     	case 0x4:
//   75     		printf("\nK60-");
??cpu_identify_3:
        LDR.N    R0,??DataTable1_5
        BL       printf
//   76     		break;
        B.N      ??cpu_identify_9
//   77     	case 0x5:
//   78     		printf("\nK70-");
??cpu_identify_6:
        LDR.N    R0,??DataTable1_6
        BL       printf
//   79     		break;
        B.N      ??cpu_identify_9
//   80     	case 0x6:
//   81     		printf("\nK50-");
??cpu_identify_5:
        LDR.N    R0,??DataTable1_7
        BL       printf
//   82     		break;
        B.N      ??cpu_identify_9
//   83     	case 0x7:
//   84     		printf("\nK53-");
??cpu_identify_7:
        LDR.N    R0,??DataTable1_8
        BL       printf
//   85     		break;
        B.N      ??cpu_identify_9
//   86 	default:
//   87 		printf("\nUnrecognized Kinetis family device.\n");  
??cpu_identify_8:
        LDR.N    R0,??DataTable1_9
        BL       printf
//   88 		break;  	
//   89     }
//   90 
//   91     /* Determine the package size */
//   92     switch((SIM_SDID & SIM_SDID_PINID(0xF))>>SIM_SDID_PINID_SHIFT) 
??cpu_identify_9:
        LDR.N    R0,??DataTable1  ;; 0x40048024
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xF
        CMP      R0,#+2
        BEQ.N    ??cpu_identify_10
        CMP      R0,#+4
        BEQ.N    ??cpu_identify_11
        CMP      R0,#+5
        BEQ.N    ??cpu_identify_12
        CMP      R0,#+6
        BEQ.N    ??cpu_identify_13
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_14
        CMP      R0,#+8
        BEQ.N    ??cpu_identify_15
        CMP      R0,#+9
        BEQ.N    ??cpu_identify_16
        CMP      R0,#+10
        BEQ.N    ??cpu_identify_17
        CMP      R0,#+12
        BEQ.N    ??cpu_identify_18
        CMP      R0,#+14
        BEQ.N    ??cpu_identify_19
        B.N      ??cpu_identify_20
//   93     {  
//   94     	case 0x2:
//   95     		printf("32pin       ");
??cpu_identify_10:
        LDR.N    R0,??DataTable1_10
        BL       printf
//   96     		break;
        B.N      ??cpu_identify_21
//   97     	case 0x4:
//   98     		printf("48pin       ");
??cpu_identify_11:
        LDR.N    R0,??DataTable1_11
        BL       printf
//   99     		break;
        B.N      ??cpu_identify_21
//  100     	case 0x5:
//  101     		printf("64pin       ");
??cpu_identify_12:
        LDR.N    R0,??DataTable1_12
        BL       printf
//  102     		break;
        B.N      ??cpu_identify_21
//  103     	case 0x6:
//  104     		printf("80pin       ");
??cpu_identify_13:
        LDR.N    R0,??DataTable1_13
        BL       printf
//  105     		break;
        B.N      ??cpu_identify_21
//  106     	case 0x7:
//  107     		printf("81pin       ");
??cpu_identify_14:
        LDR.N    R0,??DataTable1_14
        BL       printf
//  108     		break;
        B.N      ??cpu_identify_21
//  109     	case 0x8:
//  110     		printf("100pin      ");
??cpu_identify_15:
        LDR.N    R0,??DataTable1_15
        BL       printf
//  111     		break;
        B.N      ??cpu_identify_21
//  112     	case 0x9:
//  113     		printf("104pin      ");
??cpu_identify_16:
        LDR.N    R0,??DataTable1_16
        BL       printf
//  114     		break;
        B.N      ??cpu_identify_21
//  115     	case 0xA:
//  116     		printf("144pin      ");
??cpu_identify_17:
        LDR.N    R0,??DataTable1_17
        BL       printf
//  117     		break;
        B.N      ??cpu_identify_21
//  118     	case 0xC:
//  119     		printf("196pin      ");
??cpu_identify_18:
        LDR.N    R0,??DataTable1_18
        BL       printf
//  120     		break;
        B.N      ??cpu_identify_21
//  121     	case 0xE:
//  122     		printf("256pin      ");
??cpu_identify_19:
        LDR.N    R0,??DataTable1_19
        BL       printf
//  123     		break;
        B.N      ??cpu_identify_21
//  124 	default:
//  125 		printf("\nUnrecognized Kinetis package code.      ");  
??cpu_identify_20:
        LDR.N    R0,??DataTable1_20
        BL       printf
//  126 		break;  	
//  127     }                
//  128 
//  129     /* Determine the revision ID */
//  130     
//  131     switch((SIM_SDID & SIM_SDID_REVID(0xF))>>SIM_SDID_REVID_SHIFT) 
??cpu_identify_21:
        LDR.N    R0,??DataTable1  ;; 0x40048024
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+12
        ANDS     R0,R0,#0xF
        CMP      R0,#+0
        BEQ.N    ??cpu_identify_22
        CMP      R0,#+2
        BEQ.N    ??cpu_identify_23
        BCC.N    ??cpu_identify_24
        B.N      ??cpu_identify_25
//  132     { 
//  133    
//  134     case 0x0:
//  135     		printf("Silicon rev 1.0   \n ");
??cpu_identify_22:
        LDR.N    R0,??DataTable1_21
        BL       printf
//  136     		break;
        B.N      ??cpu_identify_26
//  137     case 0x1:
//  138     		printf("Silicon rev 1.1  \n ");
??cpu_identify_24:
        LDR.N    R0,??DataTable1_22
        BL       printf
//  139     		break;
        B.N      ??cpu_identify_26
//  140     case 0x2:
//  141     		printf("Silicon rev 1.2  \n ");
??cpu_identify_23:
        LDR.N    R0,??DataTable1_23
        BL       printf
//  142     		break;
        B.N      ??cpu_identify_26
//  143     default:
//  144 		printf("\nThis version of software doesn't recognize the revision code.");  
??cpu_identify_25:
        LDR.N    R0,??DataTable1_24
        BL       printf
//  145 		break;  
//  146     }
//  147     
//  148     /* Determine the flash revision */
//  149     flash_identify();  
??cpu_identify_26:
        BL       flash_identify
//  150     
//  151     
//  152     /* Determine the P-flash size */
//  153     switch((SIM_FCFG1 & SIM_FCFG1_PFSIZE(0xF))>>SIM_FCFG1_PFSIZE_SHIFT)
        LDR.N    R0,??DataTable1_25  ;; 0x4004804c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+24
        ANDS     R0,R0,#0xF
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_27
        CMP      R0,#+9
        BEQ.N    ??cpu_identify_28
        CMP      R0,#+11
        BEQ.N    ??cpu_identify_29
        CMP      R0,#+15
        BEQ.N    ??cpu_identify_30
        B.N      ??cpu_identify_31
//  154     {
//  155     	case 0x7:
//  156     		printf("128 kBytes of P-flash	");
??cpu_identify_27:
        LDR.N    R0,??DataTable1_26
        BL       printf
//  157     		break;
        B.N      ??cpu_identify_32
//  158     	case 0x9:
//  159     		printf("256 kBytes of P-flash	");
??cpu_identify_28:
        LDR.N    R0,??DataTable1_27
        BL       printf
//  160     		break;
        B.N      ??cpu_identify_32
//  161         case 0xB:
//  162     		printf("512 kBytes of P-flash	");
??cpu_identify_29:
        LDR.N    R0,??DataTable1_28
        BL       printf
//  163     		break;
        B.N      ??cpu_identify_32
//  164     	case 0xF:
//  165     		printf("512 kBytes of P-flash	");
??cpu_identify_30:
        LDR.N    R0,??DataTable1_28
        BL       printf
//  166     		break;
        B.N      ??cpu_identify_32
//  167 	default:
//  168 		printf("ERR!! Undefined P-flash size\n");  
??cpu_identify_31:
        LDR.N    R0,??DataTable1_29
        BL       printf
//  169 		break;  		
//  170     }
//  171     
//  172     /* Determine if the part has P-flash only or P-flash and FlexNVM */
//  173     if (SIM_FCFG2 & SIM_FCFG2_PFLSH_MASK)  
??cpu_identify_32:
        LDR.N    R0,??DataTable1_30  ;; 0x40048050
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+8
        BPL.N    ??cpu_identify_33
//  174       printf("P-flash only\n");
        LDR.N    R0,??DataTable1_31
        BL       printf
        B.N      ??cpu_identify_34
//  175     else
//  176       /* if part has FlexNVM determine the FlexNVM size*/
//  177       switch((SIM_FCFG1 & SIM_FCFG1_NVMSIZE(0xF))>>SIM_FCFG1_NVMSIZE_SHIFT)
??cpu_identify_33:
        LDR.N    R0,??DataTable1_25  ;; 0x4004804c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+28
        CMP      R0,#+0
        BEQ.N    ??cpu_identify_35
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_36
        CMP      R0,#+9
        BEQ.N    ??cpu_identify_37
        CMP      R0,#+15
        BEQ.N    ??cpu_identify_38
        B.N      ??cpu_identify_39
//  178       {
//  179       	case 0x0:
//  180       		printf("0 kBytes of FlexNVM\n");
??cpu_identify_35:
        LDR.N    R0,??DataTable1_32
        BL       printf
//  181       		break;
        B.N      ??cpu_identify_34
//  182     	case 0x7:
//  183       		printf("128 kBytes of FlexNVM\n");
??cpu_identify_36:
        LDR.N    R0,??DataTable1_33
        BL       printf
//  184     		break;
        B.N      ??cpu_identify_34
//  185         case 0x9:
//  186       		printf("256 kBytes of FlexNVM\n");
??cpu_identify_37:
        LDR.N    R0,??DataTable1_34
        BL       printf
//  187     		break;
        B.N      ??cpu_identify_34
//  188     	case 0xF:
//  189       		printf("256 kBytes of FlexNVM\n");
??cpu_identify_38:
        LDR.N    R0,??DataTable1_34
        BL       printf
//  190     		break;
        B.N      ??cpu_identify_34
//  191 	default:
//  192 		printf("ERR!! Undefined FlexNVM size\n");  
??cpu_identify_39:
        LDR.N    R0,??DataTable1_35
        BL       printf
//  193 		break;  		
//  194       }
//  195       
//  196 
//  197     /* Determine the RAM size */
//  198     switch((SIM_SOPT1 & SIM_SOPT1_RAMSIZE(0xF))>>SIM_SOPT1_RAMSIZE_SHIFT)
??cpu_identify_34:
        LDR.N    R0,??DataTable1_36  ;; 0x40047000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+12
        ANDS     R0,R0,#0xF
        CMP      R0,#+5
        BEQ.N    ??cpu_identify_40
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_41
        CMP      R0,#+8
        BEQ.N    ??cpu_identify_42
        CMP      R0,#+9
        BEQ.N    ??cpu_identify_43
        B.N      ??cpu_identify_44
//  199     {
//  200     	case 0x5:
//  201     		printf("32 kBytes of RAM\n\n");
??cpu_identify_40:
        LDR.N    R0,??DataTable1_37
        BL       printf
//  202     		break;
        B.N      ??cpu_identify_45
//  203     	case 0x7:
//  204     		printf("64 kBytes of RAM\n\n");
??cpu_identify_41:
        LDR.N    R0,??DataTable1_38
        BL       printf
//  205     		break;
        B.N      ??cpu_identify_45
//  206     	case 0x8:
//  207     		printf("96 kBytes of RAM\n\n");
??cpu_identify_42:
        LDR.N    R0,??DataTable1_39
        BL       printf
//  208     		break;
        B.N      ??cpu_identify_45
//  209     	case 0x9:
//  210     		printf("128 kBytes of RAM\n\n");
??cpu_identify_43:
        LDR.N    R0,??DataTable1_40
        BL       printf
//  211     		break;
        B.N      ??cpu_identify_45
//  212 		default:
//  213 			printf("ERR!! Undefined RAM size\n\n");  
??cpu_identify_44:
        LDR.N    R0,??DataTable1_41
        BL       printf
//  214 			break;  		
//  215     }
//  216 
//  217 }
??cpu_identify_45:
        POP      {R0,PC}          ;; return
//  218 /********************************************************************/
//  219 /*!
//  220  * \brief   flash Identify
//  221  * \return  None
//  222  *
//  223  * This is primarly a reporting function that displays information
//  224  * about the specific flash parameters and flash version ID for 
//  225  * the current device. These parameters are obtained using a special
//  226  * flash command call "read resource." The first four bytes returned
//  227  * are the flash parameter revision, and the second four bytes are
//  228  * the flash version ID.
//  229  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  230 void flash_identify (void)
//  231 {
flash_identify:
        PUSH     {R7,LR}
//  232     /* Get the flash parameter version */
//  233 
//  234     /* Write the flash FCCOB registers with the values for a read resource command */
//  235     FTFL_FCCOB0 = 0x03;
        LDR.N    R0,??DataTable1_42  ;; 0x40020007
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  236     FTFL_FCCOB1 = 0x00;
        LDR.N    R0,??DataTable1_43  ;; 0x40020006
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  237     FTFL_FCCOB2 = 0x00;
        LDR.N    R0,??DataTable1_44  ;; 0x40020005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  238     FTFL_FCCOB3 = 0x00;
        LDR.N    R0,??DataTable1_45  ;; 0x40020004
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  239     FTFL_FCCOB8 = 0x01;
        LDR.N    R0,??DataTable1_46  ;; 0x4002000f
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  240 
//  241     /* All required FCCOBx registers are written, so launch the command */
//  242     FTFL_FSTAT = FTFL_FSTAT_CCIF_MASK;
        LDR.N    R0,??DataTable1_47  ;; 0x40020000
        MOVS     R1,#+128
        STRB     R1,[R0, #+0]
//  243 
//  244     /* Wait for the command to complete */
//  245     while(!(FTFL_FSTAT & FTFL_FSTAT_CCIF_MASK));
??flash_identify_0:
        LDR.N    R0,??DataTable1_47  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??flash_identify_0
//  246     
//  247     printf("Flash parameter version %d.%d.%d.%d\n",FTFL_FCCOB4,FTFL_FCCOB5,FTFL_FCCOB6,FTFL_FCCOB7);
        LDR.N    R0,??DataTable1_48  ;; 0x40020008
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable1_49  ;; 0x40020009
        LDRB     R3,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDR.N    R0,??DataTable1_50  ;; 0x4002000a
        LDRB     R2,[R0, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R0,??DataTable1_51  ;; 0x4002000b
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable1_52
        BL       printf
//  248 
//  249     /* Get the flash version ID */   
//  250 
//  251     /* Write the flash FCCOB registers with the values for a read resource command */
//  252     FTFL_FCCOB0 = 0x03;
        LDR.N    R0,??DataTable1_42  ;; 0x40020007
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  253     FTFL_FCCOB1 = 0x00;
        LDR.N    R0,??DataTable1_43  ;; 0x40020006
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  254     FTFL_FCCOB2 = 0x00;
        LDR.N    R0,??DataTable1_44  ;; 0x40020005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  255     FTFL_FCCOB3 = 0x04;
        LDR.N    R0,??DataTable1_45  ;; 0x40020004
        MOVS     R1,#+4
        STRB     R1,[R0, #+0]
//  256     FTFL_FCCOB8 = 0x01;
        LDR.N    R0,??DataTable1_46  ;; 0x4002000f
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  257 
//  258     /* All required FCCOBx registers are written, so launch the command */
//  259     FTFL_FSTAT = FTFL_FSTAT_CCIF_MASK;
        LDR.N    R0,??DataTable1_47  ;; 0x40020000
        MOVS     R1,#+128
        STRB     R1,[R0, #+0]
//  260 
//  261     /* Wait for the command to complete */
//  262     while(!(FTFL_FSTAT & FTFL_FSTAT_CCIF_MASK));
??flash_identify_1:
        LDR.N    R0,??DataTable1_47  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??flash_identify_1
//  263 
//  264     printf("Flash version ID %d.%d.%d.%d\n",FTFL_FCCOB4,FTFL_FCCOB5,FTFL_FCCOB6,FTFL_FCCOB7);  
        LDR.N    R0,??DataTable1_48  ;; 0x40020008
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable1_49  ;; 0x40020009
        LDRB     R3,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDR.N    R0,??DataTable1_50  ;; 0x4002000a
        LDRB     R2,[R0, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R0,??DataTable1_51  ;; 0x4002000b
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable1_53
        BL       printf
//  265     
//  266     /* Clear all of the flags in the flash status register */
//  267     FTFL_FSTAT = 0xFF;
        LDR.N    R0,??DataTable1_47  ;; 0x40020000
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  268 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40048024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     `?<Constant "\\nK10-">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     `?<Constant "\\nK20-">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     `?<Constant "\\nK30-">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     `?<Constant "\\nK40-">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     `?<Constant "\\nK60-">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     `?<Constant "\\nK70-">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     `?<Constant "\\nK50-">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     `?<Constant "\\nK53-">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     `?<Constant "\\nUnrecognized Kinetis...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     `?<Constant "32pin       ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     `?<Constant "48pin       ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     `?<Constant "64pin       ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     `?<Constant "80pin       ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     `?<Constant "81pin       ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     `?<Constant "100pin      ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     `?<Constant "104pin      ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     `?<Constant "144pin      ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     `?<Constant "196pin      ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     `?<Constant "256pin      ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     `?<Constant "\\nUnrecognized Kinetis...">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     `?<Constant "Silicon rev 1.0   \\n ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_22:
        DC32     `?<Constant "Silicon rev 1.1  \\n ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_23:
        DC32     `?<Constant "Silicon rev 1.2  \\n ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_24:
        DC32     `?<Constant "\\nThis version of soft...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_25:
        DC32     0x4004804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_26:
        DC32     `?<Constant "128 kBytes of P-flash\\t">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_27:
        DC32     `?<Constant "256 kBytes of P-flash\\t">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_28:
        DC32     `?<Constant "512 kBytes of P-flash\\t">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_29:
        DC32     `?<Constant "ERR!! Undefined P-fla...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_30:
        DC32     0x40048050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_31:
        DC32     `?<Constant "P-flash only\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_32:
        DC32     `?<Constant "0 kBytes of FlexNVM\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_33:
        DC32     `?<Constant "128 kBytes of FlexNVM\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_34:
        DC32     `?<Constant "256 kBytes of FlexNVM\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_35:
        DC32     `?<Constant "ERR!! Undefined FlexN...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_36:
        DC32     0x40047000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_37:
        DC32     `?<Constant "32 kBytes of RAM\\n\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_38:
        DC32     `?<Constant "64 kBytes of RAM\\n\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_39:
        DC32     `?<Constant "96 kBytes of RAM\\n\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_40:
        DC32     `?<Constant "128 kBytes of RAM\\n\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_41:
        DC32     `?<Constant "ERR!! Undefined RAM s...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_42:
        DC32     0x40020007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_43:
        DC32     0x40020006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_44:
        DC32     0x40020005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_45:
        DC32     0x40020004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_46:
        DC32     0x4002000f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_47:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_48:
        DC32     0x40020008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_49:
        DC32     0x40020009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_50:
        DC32     0x4002000a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_51:
        DC32     0x4002000b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_52:
        DC32     `?<Constant "Flash parameter versi...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_53:
        DC32     `?<Constant "Flash version ID %d.%...">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nK10-">`:
        DATA
        DC8 "\012K10-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nK20-">`:
        DATA
        DC8 "\012K20-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nK30-">`:
        DATA
        DC8 "\012K30-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nK40-">`:
        DATA
        DC8 "\012K40-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nK60-">`:
        DATA
        DC8 "\012K60-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nK70-">`:
        DATA
        DC8 "\012K70-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nK50-">`:
        DATA
        DC8 "\012K50-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nK53-">`:
        DATA
        DC8 "\012K53-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nUnrecognized Kinetis...">`:
        DATA
        DC8 "\012Unrecognized Kinetis family device.\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "32pin       ">`:
        DATA
        DC8 "32pin       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "48pin       ">`:
        DATA
        DC8 "48pin       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "64pin       ">`:
        DATA
        DC8 "64pin       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "80pin       ">`:
        DATA
        DC8 "80pin       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "81pin       ">`:
        DATA
        DC8 "81pin       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "100pin      ">`:
        DATA
        DC8 "100pin      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "104pin      ">`:
        DATA
        DC8 "104pin      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "144pin      ">`:
        DATA
        DC8 "144pin      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "196pin      ">`:
        DATA
        DC8 "196pin      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "256pin      ">`:
        DATA
        DC8 "256pin      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nUnrecognized Kinetis...">_1`:
        DATA
        DC8 "\012Unrecognized Kinetis package code.      "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Silicon rev 1.0   \\n ">`:
        DATA
        DC8 "Silicon rev 1.0   \012 "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Silicon rev 1.1  \\n ">`:
        DATA
        DC8 "Silicon rev 1.1  \012 "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Silicon rev 1.2  \\n ">`:
        DATA
        DC8 "Silicon rev 1.2  \012 "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nThis version of soft...">`:
        DATA
        DC8 0AH, 54H, 68H, 69H, 73H, 20H, 76H, 65H
        DC8 72H, 73H, 69H, 6FH, 6EH, 20H, 6FH, 66H
        DC8 20H, 73H, 6FH, 66H, 74H, 77H, 61H, 72H
        DC8 65H, 20H, 64H, 6FH, 65H, 73H, 6EH, 27H
        DC8 74H, 20H, 72H, 65H, 63H, 6FH, 67H, 6EH
        DC8 69H, 7AH, 65H, 20H, 74H, 68H, 65H, 20H
        DC8 72H, 65H, 76H, 69H, 73H, 69H, 6FH, 6EH
        DC8 20H, 63H, 6FH, 64H, 65H, 2EH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "128 kBytes of P-flash\\t">`:
        DATA
        DC8 "128 kBytes of P-flash\t"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "256 kBytes of P-flash\\t">`:
        DATA
        DC8 "256 kBytes of P-flash\t"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "512 kBytes of P-flash\\t">`:
        DATA
        DC8 "512 kBytes of P-flash\t"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ERR!! Undefined P-fla...">`:
        DATA
        DC8 "ERR!! Undefined P-flash size\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "P-flash only\\n">`:
        DATA
        DC8 "P-flash only\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "0 kBytes of FlexNVM\\n">`:
        DATA
        DC8 "0 kBytes of FlexNVM\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "128 kBytes of FlexNVM\\n">`:
        DATA
        DC8 "128 kBytes of FlexNVM\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "256 kBytes of FlexNVM\\n">`:
        DATA
        DC8 "256 kBytes of FlexNVM\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ERR!! Undefined FlexN...">`:
        DATA
        DC8 "ERR!! Undefined FlexNVM size\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "32 kBytes of RAM\\n\\n">`:
        DATA
        DC8 "32 kBytes of RAM\012\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "64 kBytes of RAM\\n\\n">`:
        DATA
        DC8 "64 kBytes of RAM\012\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "96 kBytes of RAM\\n\\n">`:
        DATA
        DC8 "96 kBytes of RAM\012\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "128 kBytes of RAM\\n\\n">`:
        DATA
        DC8 "128 kBytes of RAM\012\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ERR!! Undefined RAM s...">`:
        DATA
        DC8 "ERR!! Undefined RAM size\012\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Flash parameter versi...">`:
        DATA
        DC8 "Flash parameter version %d.%d.%d.%d\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Flash version ID %d.%...">`:
        DATA
        DC8 "Flash version ID %d.%d.%d.%d\012"
        DC8 0, 0

        END
//  269 /********************************************************************/
//  270 
// 
// 840 bytes in section .rodata
// 912 bytes in section .text
// 
// 912 bytes of CODE  memory
// 840 bytes of CONST memory
//
//Errors: none
//Warnings: 2
