///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:42 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\adc16\ /
//                    adc16.c                                                 /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\adc16\ /
//                    adc16.c -D IAR -D TWR_K60N512 -lCN                      /
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
//                    rld\RAM_128KB\List\adc16.s                              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME adc16

        #define SHT_PROGBITS 0x1

        PUBLIC ADC_Cal
        PUBLIC ADC_Config_Alt
        PUBLIC ADC_Read_Cal

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\adc16\adc16.c
//    1 /*
//    2  * File:		a16dc.c
//    3  * Purpose:		Simple Driver or API for AdC16/PGA
//    4  * This file contains the following two functions:
//    5  *  1. ADC_Cal: calibrates the ADC
//    6  *  2. ADC_Config_Alt: Simply configures an ADC per a structure
//    7  *
//    8  * Typical usage: Fill the structure with the ADC and PGA register contents 
//    9  * needed for the ADC usage.
//   10 
//   11  * a) Call the ADC_Config_Alt function to configure an ADC, (ADC0 or ADC1)
//   12  * b) Call the ADC_Cal function to calibrate that ADC
//   13  * c) Call the ADC_Config_Alt function again to restore desired configuation
//   14  *    after a calibration
//   15  *
//   16  *
//   17  */
//   18 
//   19 #include "common.h"
//   20 #include "adc16.h"
//   21 
//   22 
//   23 
//   24 
//   25 /******************************************************************************
//   26 Function 1. Name	AUTO CAL ROUTINE   
//   27 
//   28 Parameters		ADC module pointer points to adc0 or adc1 register map 
//   29                          base address.
//   30 Returns			Zero indicates success.
//   31 Notes         		Calibrates the ADC16. Required to meet specifications 
//   32                         after reset and before a conversion is initiated.
//   33 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   34 uint8 ADC_Cal(ADC_MemMapPtr adcmap)
//   35 {
ADC_Cal:
        MOVS     R1,R0
//   36 
//   37   unsigned short cal_var;
//   38   
//   39   ADC_SC2_REG(adcmap) &=  ~ADC_SC2_ADTRG_MASK ; // Enable Software Conversion Trigger for Calibration Process    - ADC0_SC2 = ADC0_SC2 | ADC_SC2_ADTRGW(0);   
        LDR      R0,[R1, #+32]
        BICS     R0,R0,#0x40
        STR      R0,[R1, #+32]
//   40   ADC_SC3_REG(adcmap) &= ( ~ADC_SC3_ADCO_MASK & ~ADC_SC3_AVGS_MASK ); // set single conversion, clear avgs bitfield for next writing
        LDR      R0,[R1, #+36]
        BICS     R0,R0,#0xB
        STR      R0,[R1, #+36]
//   41   ADC_SC3_REG(adcmap) |= ( ADC_SC3_AVGE_MASK | ADC_SC3_AVGS(AVGS_32) );  // Turn averaging ON and set at max value ( 32 )
        LDR      R0,[R1, #+36]
        ORRS     R0,R0,#0x7
        STR      R0,[R1, #+36]
//   42   
//   43   
//   44   ADC_SC3_REG(adcmap) |= ADC_SC3_CAL_MASK ;      // Start CAL
        LDR      R0,[R1, #+36]
        ORRS     R0,R0,#0x80
        STR      R0,[R1, #+36]
//   45   while ( (ADC_SC1_REG(adcmap,A) & ADC_SC1_COCO_MASK ) == COCO_NOT ); // Wait calibration end
??ADC_Cal_0:
        LDR      R0,[R1, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??ADC_Cal_0
//   46   	
//   47   if ((ADC_SC3_REG(adcmap)& ADC_SC3_CALF_MASK) == CALF_FAIL )
        LDR      R0,[R1, #+36]
        LSLS     R0,R0,#+25
        BPL.N    ??ADC_Cal_1
//   48   {  
//   49    return(1);    // Check for Calibration fail error and return 
        MOVS     R0,#+1
        B.N      ??ADC_Cal_2
//   50   }
//   51   // Calculate plus-side calibration
//   52   cal_var = 0x00;
??ADC_Cal_1:
        MOVS     R0,#+0
        MOVS     R2,R0
//   53   
//   54   cal_var =  ADC_CLP0_REG(adcmap); 
        LDR      R0,[R1, #+76]
        MOVS     R2,R0
//   55   cal_var += ADC_CLP1_REG(adcmap);
        LDR      R0,[R1, #+72]
        ADDS     R2,R0,R2
//   56   cal_var += ADC_CLP2_REG(adcmap);
        LDR      R0,[R1, #+68]
        ADDS     R2,R0,R2
//   57   cal_var += ADC_CLP3_REG(adcmap);
        LDR      R0,[R1, #+64]
        ADDS     R2,R0,R2
//   58   cal_var += ADC_CLP4_REG(adcmap);
        LDR      R0,[R1, #+60]
        ADDS     R2,R0,R2
//   59   cal_var += ADC_CLPS_REG(adcmap);
        LDR      R0,[R1, #+56]
        ADDS     R2,R0,R2
//   60 
//   61   cal_var = cal_var/2;
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R0,#+2
        SDIV     R2,R2,R0
//   62   cal_var |= 0x8000; // Set MSB
        ORRS     R2,R2,#0x8000
//   63 
//   64   ADC_PG_REG(adcmap) = ADC_PG_PG(cal_var);
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[R1, #+44]
//   65  
//   66 
//   67   // Calculate minus-side calibration
//   68   cal_var = 0x00;
        MOVS     R0,#+0
        MOVS     R2,R0
//   69 
//   70   cal_var =  ADC_CLM0_REG(adcmap); 
        LDR      R0,[R1, #+108]
        MOVS     R2,R0
//   71   cal_var += ADC_CLM1_REG(adcmap);
        LDR      R0,[R1, #+104]
        ADDS     R2,R0,R2
//   72   cal_var += ADC_CLM2_REG(adcmap);
        LDR      R0,[R1, #+100]
        ADDS     R2,R0,R2
//   73   cal_var += ADC_CLM3_REG(adcmap);
        LDR      R0,[R1, #+96]
        ADDS     R2,R0,R2
//   74   cal_var += ADC_CLM4_REG(adcmap);
        LDR      R0,[R1, #+92]
        ADDS     R2,R0,R2
//   75   cal_var += ADC_CLMS_REG(adcmap);
        LDR      R0,[R1, #+88]
        ADDS     R2,R0,R2
//   76 
//   77   cal_var = cal_var/2;
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R0,#+2
        SDIV     R2,R2,R0
//   78 
//   79   cal_var |= 0x8000; // Set MSB
        ORRS     R2,R2,#0x8000
//   80 
//   81   ADC_MG_REG(adcmap) = ADC_MG_MG(cal_var); 
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[R1, #+48]
//   82   
//   83   ADC_SC3_REG(adcmap) &= ~ADC_SC3_CAL_MASK ; /* Clear CAL bit */
        LDR      R0,[R1, #+36]
        BICS     R0,R0,#0x80
        STR      R0,[R1, #+36]
//   84 
//   85   return(0);
        MOVS     R0,#+0
??ADC_Cal_2:
        BX       LR               ;; return
//   86 }
//   87 
//   88 
//   89 
//   90 
//   91 /******************************************************************************
//   92 Function 2 Name 	ADC_Config_Alt 
//   93 Parameters		the register values to be set in the adc in a structure
//   94 Returns			NONE
//   95 Notes         		Configures ADC0 or ADC1 depending on adcmap
//   96                         Prior to calling this function populate the structure
//   97                         elements with the desired ADC configuration.
//   98 ******************************************************************************/
//   99 
//  100 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  101 void ADC_Config_Alt(ADC_MemMapPtr adcmap, tADC_ConfigPtr ADC_CfgPtr)
//  102 {
//  103  ADC_CFG1_REG(adcmap) = ADC_CfgPtr->CONFIG1;
ADC_Config_Alt:
        LDRB     R2,[R1, #+0]
        STR      R2,[R0, #+8]
//  104  ADC_CFG2_REG(adcmap) = ADC_CfgPtr->CONFIG2;
        LDRB     R2,[R1, #+1]
        STR      R2,[R0, #+12]
//  105  ADC_CV1_REG(adcmap)  = ADC_CfgPtr->COMPARE1; 
        LDRH     R2,[R1, #+2]
        STR      R2,[R0, #+24]
//  106  ADC_CV2_REG(adcmap)  = ADC_CfgPtr->COMPARE2;
        LDRH     R2,[R1, #+4]
        STR      R2,[R0, #+28]
//  107  ADC_SC2_REG(adcmap)  = ADC_CfgPtr->STATUS2;
        LDRB     R2,[R1, #+6]
        STR      R2,[R0, #+32]
//  108  ADC_SC3_REG(adcmap)  = ADC_CfgPtr->STATUS3;
        LDRB     R2,[R1, #+7]
        STR      R2,[R0, #+36]
//  109  ADC_PGA_REG(adcmap)  = ADC_CfgPtr->PGA;
        LDR      R2,[R1, #+12]
        STR      R2,[R0, #+80]
//  110  ADC_SC1_REG(adcmap,A)= ADC_CfgPtr->STATUS1A;       
        LDRB     R2,[R1, #+8]
        STR      R2,[R0, #+0]
//  111  ADC_SC1_REG(adcmap,B)= ADC_CfgPtr->STATUS1B;
        LDRB     R2,[R1, #+9]
        STR      R2,[R0, #+4]
//  112 }
        BX       LR               ;; return
//  113 
//  114 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  115 void ADC_Read_Cal(ADC_MemMapPtr adcmap, tADC_Cal_Blk *blk)
//  116 {
//  117   blk->OFS  = ADC_OFS_REG(adcmap);
ADC_Read_Cal:
        LDR      R2,[R0, #+40]
        STRH     R2,[R1, #+0]
//  118   blk->PG   = ADC_PG_REG(adcmap); 
        LDR      R2,[R0, #+44]
        STRH     R2,[R1, #+2]
//  119   blk->MG   = ADC_MG_REG(adcmap); 
        LDR      R2,[R0, #+48]
        STRH     R2,[R1, #+4]
//  120   blk->CLPD = ADC_CLPD_REG(adcmap); 
        LDR      R2,[R0, #+52]
        STRB     R2,[R1, #+6]
//  121   blk->CLPS = ADC_CLPS_REG(adcmap); 
        LDR      R2,[R0, #+56]
        STRB     R2,[R1, #+7]
//  122   blk->CLP4 = ADC_CLP4_REG(adcmap);
        LDR      R2,[R0, #+60]
        STRH     R2,[R1, #+8]
//  123   blk->CLP3 = ADC_CLP3_REG(adcmap); 
        LDR      R2,[R0, #+64]
        STRH     R2,[R1, #+10]
//  124   blk->CLP2 = ADC_CLP2_REG(adcmap); 
        LDR      R2,[R0, #+68]
        STRB     R2,[R1, #+12]
//  125   blk->CLP1 = ADC_CLP1_REG(adcmap);
        LDR      R2,[R0, #+72]
        STRB     R2,[R1, #+13]
//  126   blk->CLP0 = ADC_CLP0_REG(adcmap);
        LDR      R2,[R0, #+76]
        STRB     R2,[R1, #+14]
//  127   blk->CLMD = ADC_CLMD_REG(adcmap); 
        LDR      R2,[R0, #+84]
        STRB     R2,[R1, #+16]
//  128   blk->CLMS = ADC_CLMS_REG(adcmap); 
        LDR      R2,[R0, #+88]
        STRB     R2,[R1, #+17]
//  129   blk->CLM4 = ADC_CLM4_REG(adcmap);
        LDR      R2,[R0, #+92]
        STRH     R2,[R1, #+18]
//  130   blk->CLM3 = ADC_CLM3_REG(adcmap); 
        LDR      R2,[R0, #+96]
        STRH     R2,[R1, #+20]
//  131   blk->CLM2 = ADC_CLM2_REG(adcmap); 
        LDR      R2,[R0, #+100]
        STRB     R2,[R1, #+22]
//  132   blk->CLM1 = ADC_CLM1_REG(adcmap);
        LDR      R2,[R0, #+104]
        STRB     R2,[R1, #+23]
//  133   blk->CLM0 = ADC_CLM0_REG(adcmap);
        LDR      R2,[R0, #+108]
        STRB     R2,[R1, #+24]
//  134   
//  135 }
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  136 
//  137 
// 
// 258 bytes in section .text
// 
// 258 bytes of CODE memory
//
//Errors: none
//Warnings: none
