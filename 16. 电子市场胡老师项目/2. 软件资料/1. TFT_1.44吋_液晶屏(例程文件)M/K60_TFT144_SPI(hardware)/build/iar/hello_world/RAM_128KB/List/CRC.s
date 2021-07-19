///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\uart\C /
//                    RC.c                                                    /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\uart\C /
//                    RC.c -D IAR -D TWR_K60N512 -lCN                         /
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
//                    rld\RAM_128KB\List\CRC.s                                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME CRC

        #define SHT_PROGBITS 0x1

        PUBLIC AH_CRC_Verify
        PUBLIC AH_Full_0F_Verify
        PUBLIC BE4StrToInt
        PUBLIC CRC_CHECK
        PUBLIC CRC_Tab
        PUBLIC CalCrc16
        PUBLIC `XOR`

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\uart\CRC.c
//    1 #include  "CRC.H"
//    2 
//    3 
//    4 //CRC使用
//    5  typedef struct                
//    6    {                             
//    7 	 unsigned char	 L;             
//    8 	 unsigned char	 H;              
//    9    } INT_08BIT_2;  
//   10 
//   11  typedef union                  
//   12   {	                            
//   13     unsigned short     int  Int16Bit;       
//   14 	INT_08BIT_2  Int08Bit;       
//   15   } INT_16BIT_08BIT; 
//   16 
//   17 
//   18 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   19 unsigned short     int const CRC_Tab[] =  {
CRC_Tab:
        DATA
        DC16 0, 4129, 8258, 12387, 16516, 20645, 24774, 28903, 33032, 37161
        DC16 41290, 45419, 49548, 53677, 57806, 61935, 4657, 528, 12915, 8786
        DC16 21173, 17044, 29431, 25302, 37689, 33560, 45947, 41818, 54205
        DC16 50076, 62463, 58334, 9314, 13379, 1056, 5121, 25830, 29895, 17572
        DC16 21637, 42346, 46411, 34088, 38153, 58862, 62927, 50604, 54669
        DC16 13907, 9842, 5649, 1584, 30423, 26358, 22165, 18100, 46939, 42874
        DC16 38681, 34616, 63455, 59390, 55197, 51132, 18628, 22757, 26758
        DC16 30887, 2112, 6241, 10242, 14371, 51660, 55789, 59790, 63919, 35144
        DC16 39273, 43274, 47403, 23285, 19156, 31415, 27286, 6769, 2640, 14899
        DC16 10770, 56317, 52188, 64447, 60318, 39801, 35672, 47931, 43802
        DC16 27814, 31879, 19684, 23749, 11298, 15363, 3168, 7233, 60846, 64911
        DC16 52716, 56781, 44330, 48395, 36200, 40265, 32407, 28342, 24277
        DC16 20212, 15891, 11826, 7761, 3696, 65439, 61374, 57309, 53244, 48923
        DC16 44858, 40793, 36728, 37256, 33193, 45514, 41451, 53516, 49453
        DC16 61774, 57711, 4224, 161, 12482, 8419, 20484, 16421, 28742, 24679
        DC16 33721, 37784, 41979, 46042, 49981, 54044, 58239, 62302, 689, 4752
        DC16 8947, 13010, 16949, 21012, 25207, 29270, 46570, 42443, 38312
        DC16 34185, 62830, 58703, 54572, 50445, 13538, 9411, 5280, 1153, 29798
        DC16 25671, 21540, 17413, 42971, 47098, 34713, 38840, 59231, 63358
        DC16 50973, 55100, 9939, 14066, 1681, 5808, 26199, 30326, 17941, 22068
        DC16 55628, 51565, 63758, 59695, 39368, 35305, 47498, 43435, 22596
        DC16 18533, 30726, 26663, 6336, 2273, 14466, 10403, 52093, 56156, 60223
        DC16 64286, 35833, 39896, 43963, 48026, 19061, 23124, 27191, 31254
        DC16 2801, 6864, 10931, 14994, 64814, 60687, 56684, 52557, 48554, 44427
        DC16 40424, 36297, 31782, 27655, 23652, 19525, 15522, 11395, 7392, 3265
        DC16 61215, 65342, 53085, 57212, 44955, 49082, 36825, 40952, 28183
        DC16 32310, 20053, 24180, 11923, 16050, 3793, 7920
//   20 //CRCTB1: ;?256??
//   21 	0x00000,0x01021,0x02042,0x03063,
//   22 	0x04084,0x050a5,0x060c6,0x070e7,
//   23 	0x08108,0x09129,0x0a14a,0x0b16b,
//   24 	0x0c18c,0x0d1ad,0x0e1ce,0x0f1ef,
//   25 	0x01231,0x00210,0x03273,0x02252,
//   26 	0x052b5,0x04294,0x072f7,0x062d6,
//   27 	0x09339,0x08318,0x0b37b,0x0a35a,
//   28 	0x0d3bd,0x0c39c,0x0f3ff,0x0e3de,
//   29 	0x02462,0x03443,0x00420,0x01401,
//   30 	0x064e6,0x074c7,0x044a4,0x05485,
//   31 	0x0a56a,0x0b54b,0x08528,0x09509,
//   32 	0x0e5ee,0x0f5cf,0x0c5ac,0x0d58d,
//   33 	0x03653,0x02672,0x01611,0x00630,
//   34 	0x076d7,0x066f6,0x05695,0x046b4,
//   35 	0x0b75b,0x0a77a,0x09719,0x08738,
//   36 	0x0f7df,0x0e7fe,0x0d79d,0x0c7bc,
//   37 	0x048c4,0x058e5,0x06886,0x078a7,
//   38 	0x00840,0x01861,0x02802,0x03823,
//   39 	0x0c9cc,0x0d9ed,0x0e98e,0x0f9af,
//   40 	0x08948,0x09969,0x0a90a,0x0b92b,
//   41 	0x05af5,0x04ad4,0x07ab7,0x06a96,
//   42 	0x01a71,0x00a50,0x03a33,0x02a12,
//   43 	0x0dbfd,0x0cbdc,0x0fbbf,0x0eb9e,
//   44 	0x09b79,0x08b58,0x0bb3b,0x0ab1a,
//   45 	0x06ca6,0x07c87,0x04ce4,0x05cc5,
//   46 	0x02c22,0x03c03,0x00c60,0x01c41,
//   47 	0x0edae,0x0fd8f,0x0cdec,0x0ddcd,
//   48 	0x0ad2a,0x0bd0b,0x08d68,0x09d49,
//   49 	0x07e97,0x06eb6,0x05ed5,0x04ef4,
//   50 	0x03e13,0x02e32,0x01e51,0x00e70,
//   51 	0x0ff9f,0x0efbe,0x0dfdd,0x0cffc,
//   52 	0x0bf1b,0x0af3a,0x09f59,0x08f78,
//   53 //CRCTB2: ;?256??
//   54 	0x09188,0x081a9,0x0b1ca,0x0a1eb,
//   55 	0x0d10c,0x0c12d,0x0f14e,0x0e16f,
//   56 	0x01080,0x000a1,0x030c2,0x020e3,
//   57 	0x05004,0x04025,0x07046,0x06067,
//   58 	0x083b9,0x09398,0x0a3fb,0x0b3da,
//   59 	0x0c33d,0x0d31c,0x0e37f,0x0f35e,
//   60 	0x002b1,0x01290,0x022f3,0x032d2,
//   61 	0x04235,0x05214,0x06277,0x07256,
//   62 	0x0b5ea,0x0a5cb,0x095a8,0x08589,
//   63 	0x0f56e,0x0e54f,0x0d52c,0x0c50d,
//   64 	0x034e2,0x024c3,0x014a0,0x00481,
//   65 	0x07466,0x06447,0x05424,0x04405,
//   66 	0x0a7db,0x0b7fa,0x08799,0x097b8,
//   67 	0x0e75f,0x0f77e,0x0c71d,0x0d73c,
//   68 	0x026d3,0x036f2,0x00691,0x016b0,
//   69 	0x06657,0x07676,0x04615,0x05634,
//   70 	0x0d94c,0x0c96d,0x0f90e,0x0e92f,
//   71 	0x099c8,0x089e9,0x0b98a,0x0a9ab,
//   72 	0x05844,0x04865,0x07806,0x06827,
//   73 	0x018c0,0x008e1,0x03882,0x028a3,
//   74 	0x0cb7d,0x0db5c,0x0eb3f,0x0fb1e,
//   75 	0x08bf9,0x09bd8,0x0abbb,0x0bb9a,
//   76 	0x04a75,0x05a54,0x06a37,0x07a16,
//   77 	0x00af1,0x01ad0,0x02ab3,0x03a92,
//   78 	0x0fd2e,0x0ed0f,0x0dd6c,0x0cd4d,
//   79 	0x0bdaa,0x0ad8b,0x09de8,0x08dc9,
//   80 	0x07c26,0x06c07,0x05c64,0x04c45,
//   81 	0x03ca2,0x02c83,0x01ce0,0x00cc1,
//   82 	0x0ef1f,0x0ff3e,0x0cf5d,0x0df7c,
//   83 	0x0af9b,0x0bfba,0x08fd9,0x09ff8,
//   84 	0x06e17,0x07e36,0x04e55,0x05e74,
//   85 	0x02e93,0x03eb2,0x00ed1,0x01ef0
//   86                                };
//   87 
//   88 
//   89 /*
//   90 **************************************************************************************************************
//   91 *										      CRC 校 验
//   92 * 描 述:  校验一串char数据的CRC
//   93 *
//   94 * 输 入:  CPU_CHAR   *str  		- 要校验数据的指针
//   95 *         CPU_INT16U size		- 要校验数据的长度
//   96 *		  CPU_INT08U mode		- 校验的模式
//   97 *						         1:  为该串数据增加CRC校验  同时返回校验的CRC值
//   98 *							     0:  该串数据是否通过校验	返回校验的CRC值
//   99 * 返 回:
//  100 *
//  101 * 注 意:
//  102 *
//  103 **************************************************************************************************************
//  104 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  105  unsigned short     int AH_CRC_Verify( unsigned char *str, unsigned short     int size, unsigned char mode )
//  106   {          
AH_CRC_Verify:
        PUSH     {R2-R5}
        MOVS     R3,R0
//  107     unsigned int       i;
//  108 	INT_16BIT_08BIT	 crc;
//  109 	INT_16BIT_08BIT	 y;
//  110 
//  111 	crc.Int16Bit = 0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
//  112 
//  113 	for( i = 0 ; i < size ; i++ )
        MOVS     R0,#+0
        MOVS     R4,R0
??AH_CRC_Verify_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R4,R1
        BCS.N    ??AH_CRC_Verify_1
//  114 	 {
//  115 		y.Int16Bit    = CRC_Tab[ str[ i ] ^ crc.Int08Bit.H ];
        LDRB     R0,[R4, R3]
        LDRB     R5,[SP, #+5]
        EORS     R0,R5,R0
        LDR.N    R5,??DataTable1
        LDRH     R0,[R5, R0, LSL #+1]
        STRH     R0,[SP, #+0]
//  116 		y.Int08Bit.H ^= crc.Int08Bit.L;
        LDRB     R0,[SP, #+1]
        LDRB     R5,[SP, #+4]
        EORS     R0,R5,R0
        STRB     R0,[SP, #+1]
//  117 		crc.Int16Bit  = y.Int16Bit;
        LDRH     R0,[SP, #+0]
        STRH     R0,[SP, #+4]
//  118 	 }
        ADDS     R4,R4,#+1
        B.N      ??AH_CRC_Verify_0
//  119 	if( mode == 1 )
??AH_CRC_Verify_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??AH_CRC_Verify_2
//  120 	 {
//  121 		str[ i++ ] = y.Int08Bit.H ;
        LDRB     R0,[SP, #+1]
        STRB     R0,[R4, R3]
        ADDS     R4,R4,#+1
//  122 		str[ i ]   = y.Int08Bit.L ;
        LDRB     R0,[SP, #+0]
        STRB     R0,[R4, R3]
//  123 	 }
//  124 
//  125 	return( crc.Int16Bit );
??AH_CRC_Verify_2:
        LDRH     R0,[SP, #+4]
        POP      {R1,R2,R4,R5}
        BX       LR               ;; return
//  126   } 
//  127 
//  128 
//  129 
//  130 
//  131 /*
//  132 ****************************************************
//  133 *		数 据 全0 全F 判 断
//  134 *
//  135 * 描 述:  对一串数据进行全0全F判断，主要是进行FLASH校验使用。
//  136 *
//  137 * 输 入:  CPU_CHAR   *str  		- 要校验数据的指针
//  138 *         CPU_INT32U size		- 要校验数据的长度
//  139 *
//  140 * 返 回:  0x00  数据为全0
//  141 *         0xFF  数据为全F
//  142 *         0x01  数据非0
//  143 *
//  144 ****************************************************
//  145 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  146 unsigned int AH_Full_0F_Verify( unsigned char *str, unsigned int size )
//  147   {
AH_Full_0F_Verify:
        MOVS     R2,R0
//  148     unsigned int i;
//  149 
//  150     for( i = 0; i < size; i++ )
        MOVS     R0,#+0
        MOVS     R3,R0
??AH_Full_0F_Verify_0:
        CMP      R3,R1
        BCS.N    ??AH_Full_0F_Verify_1
//  151      {                                                 /* 全0判断          (1)                               */
//  152        if( str[i] != 0x00 )                       
        LDRB     R0,[R3, R2]
        CMP      R0,#+0
        BNE.N    ??AH_Full_0F_Verify_1
//  153         { break; }
//  154      }
??AH_Full_0F_Verify_2:
        ADDS     R3,R3,#+1
        B.N      ??AH_Full_0F_Verify_0
//  155     if( i == size )                                    /* 数据为全0                                          */
??AH_Full_0F_Verify_1:
        CMP      R3,R1
        BNE.N    ??AH_Full_0F_Verify_3
//  156      { return 0x00; } 
        MOVS     R0,#+0
        B.N      ??AH_Full_0F_Verify_4
//  157     for( i = 0; i < size; i++ )
??AH_Full_0F_Verify_3:
        MOVS     R0,#+0
        MOVS     R3,R0
??AH_Full_0F_Verify_5:
        CMP      R3,R1
        BCS.N    ??AH_Full_0F_Verify_6
//  158      {                                                 /* 全F判断          (2)                               */
//  159        if( str[i] != 0xFF )                       
        LDRB     R0,[R3, R2]
        CMP      R0,#+255
        BNE.N    ??AH_Full_0F_Verify_6
//  160         { break; }
//  161      }
??AH_Full_0F_Verify_7:
        ADDS     R3,R3,#+1
        B.N      ??AH_Full_0F_Verify_5
//  162     if( i == size )                                    /* 数据为全F                                          */
??AH_Full_0F_Verify_6:
        CMP      R3,R1
        BNE.N    ??AH_Full_0F_Verify_8
//  163      { return 0xFF; } 
        MOVS     R0,#+255
        B.N      ??AH_Full_0F_Verify_4
//  164 
//  165     return 0x01;
??AH_Full_0F_Verify_8:
        MOVS     R0,#+1
??AH_Full_0F_Verify_4:
        BX       LR               ;; return
//  166   }
//  167 
//  168 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  169  unsigned char CRC_CHECK ( unsigned char *strFrame, unsigned char crc_longth )
//  170   {
CRC_CHECK:
        PUSH     {R2-R4}
        MOVS     R2,R0
//  171     unsigned int i;
//  172 	INT_16BIT_08BIT crc ;
//  173 	INT_16BIT_08BIT y ;
//  174 	crc.Int16Bit = 0 ;
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
//  175 	for( i = 0 ; i < crc_longth ; i++ )
        MOVS     R0,#+0
        MOVS     R3,R0
??CRC_CHECK_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R3,R1
        BCS.N    ??CRC_CHECK_1
//  176 	 {
//  177 		y.Int16Bit    = CRC_Tab[ *strFrame ^ crc.Int08Bit.H ] ;
        LDRB     R0,[R2, #+0]
        LDRB     R4,[SP, #+1]
        EORS     R0,R4,R0
        LDR.N    R4,??DataTable1
        LDRH     R0,[R4, R0, LSL #+1]
        STRH     R0,[SP, #+4]
//  178 		y.Int08Bit.H ^= crc.Int08Bit.L ;
        LDRB     R0,[SP, #+5]
        LDRB     R4,[SP, #+0]
        EORS     R0,R4,R0
        STRB     R0,[SP, #+5]
//  179 		crc.Int16Bit  = y.Int16Bit ;
        LDRH     R0,[SP, #+4]
        STRH     R0,[SP, #+0]
//  180         strFrame++;
        ADDS     R2,R2,#+1
//  181 	 }
        ADDS     R3,R3,#+1
        B.N      ??CRC_CHECK_0
//  182     crc.Int08Bit.H ^= crc.Int08Bit.L ;
??CRC_CHECK_1:
        LDRB     R0,[SP, #+1]
        LDRB     R4,[SP, #+0]
        EORS     R0,R4,R0
        STRB     R0,[SP, #+1]
//  183 	return ( crc.Int08Bit.H ) ;
        LDRB     R0,[SP, #+1]
        POP      {R1,R2,R4}
        BX       LR               ;; return
//  184   }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     CRC_Tab
//  185 
//  186 /***********************************************
//  187 函数功能：对数组中的元素进行异或
//  188 入口参数：buffer,数组首地址；length,数组长度
//  189 ***********************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  190 unsigned char XOR(unsigned char *buffer,unsigned char length)
//  191 {
`XOR`:
        PUSH     {R4}
        MOVS     R2,R0
//  192 	unsigned char result;
//  193 	unsigned char i;
//  194 	result =0;
        MOVS     R4,#+0
        MOVS     R0,R4
//  195 	for(i =0;i< length;i++)
        MOVS     R4,#+0
        MOVS     R3,R4
??XOR_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R3,R1
        BCS.N    ??XOR_1
//  196 	{
//  197 		result ^=buffer[i];
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R2]
        EORS     R0,R4,R0
//  198 	}
        ADDS     R3,R3,#+1
        B.N      ??XOR_0
//  199   return(result);
??XOR_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return
//  200 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  201 void CalCrc16(unsigned char* input, unsigned char* Crc16, unsigned int len)   
//  202 {
CalCrc16:
        PUSH     {R4-R6}
//  203 	unsigned int temp=0x6363;
        MOVW     R3,#+25443
//  204     unsigned int i;
//  205     unsigned char j;
//  206 
//  207 	for( i=0; i<len; i++ )
        MOVS     R6,#+0
        MOVS     R4,R6
??CalCrc16_0:
        CMP      R4,R2
        BCS.N    ??CalCrc16_1
//  208 	{	
//  209 	  temp = temp ^((unsigned int)input[i]);
        LDRB     R6,[R4, R0]
        EORS     R3,R6,R3
//  210 	  for (j = 0; j < 8; j++)
        MOVS     R6,#+0
        MOVS     R5,R6
??CalCrc16_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BCS.N    ??CalCrc16_3
//  211 	  {
//  212 		if (temp & 0x0001)
        MOVS     R6,R3
        LSLS     R6,R6,#+31
        BPL.N    ??CalCrc16_4
//  213 		{
//  214 		  temp = (temp >> 1) ^ 0x8408;
        LSRS     R3,R3,#+1
        EOR      R3,R3,#0x8400
        EORS     R3,R3,#0x8
        B.N      ??CalCrc16_5
//  215 	        }
//  216 		else
//  217 		{
//  218 		  temp = (temp >> 1);
??CalCrc16_4:
        LSRS     R3,R3,#+1
//  219 		}
//  220 	  }
??CalCrc16_5:
        ADDS     R5,R5,#+1
        B.N      ??CalCrc16_2
//  221 	}
??CalCrc16_3:
        ADDS     R4,R4,#+1
        B.N      ??CalCrc16_0
//  222 	Crc16[0] = (unsigned char)(temp);
??CalCrc16_1:
        STRB     R3,[R1, #+0]
//  223   	Crc16[1] = (unsigned char)(temp>>8);
        LSRS     R6,R3,#+8
        STRB     R6,[R1, #+1]
//  224 } 
        POP      {R4-R6}
        BX       LR               ;; return
//  225 //*----------------------------------------------------------------------------
//  226 //* Function Name       : BE4StrToInt
//  227 //* Object              : 4字节HEX字符串变化INT
//  228 //* Input Parameters    : none
//  229 //* Output Parameters   : none
//  230 //* Functions called    : none
//  231 //*----------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  232 unsigned int BE4StrToInt(unsigned char *str)
//  233 {	
BE4StrToInt:
        SUB      SP,SP,#+4
        MOVS     R1,R0
//  234 	int i;
//  235 	char * p;
//  236 	p = (char*)&i;
        ADD      R0,SP,#+0
        MOVS     R2,R0
//  237 	*(p+0)=*(str+3);	
        LDRB     R0,[R1, #+3]
        STRB     R0,[R2, #+0]
//  238 	*(p+1)=*(str+2);	
        LDRB     R0,[R1, #+2]
        STRB     R0,[R2, #+1]
//  239 	*(p+2)=*(str+1);	
        LDRB     R0,[R1, #+1]
        STRB     R0,[R2, #+2]
//  240 	*(p+3)=*(str+0);	
        LDRB     R0,[R1, #+0]
        STRB     R0,[R2, #+3]
//  241 	return i;
        LDR      R0,[SP, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return
//  242 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 512 bytes in section .rodata
// 374 bytes in section .text
// 
// 374 bytes of CODE  memory
// 512 bytes of CONST memory
//
//Errors: none
//Warnings: none
