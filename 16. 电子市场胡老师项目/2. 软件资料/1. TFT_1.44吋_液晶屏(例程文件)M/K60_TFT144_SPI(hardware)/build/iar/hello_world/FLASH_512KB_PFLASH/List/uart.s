///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\driv /
//                    ers\uart\uart.c                                         /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\dri /
//                    vers\uart\uart.c" -D IAR -D TWR_K60N512 -lCN            /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\uart.s            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME uart

        #define SHT_PROGBITS 0x1

        EXTERN disable_irq
        EXTERN enable_irq
        EXTERN printf

        PUBLIC UART_R_ISR
        PUBLIC UART_T_ISR
        PUBLIC UARTx_Ptr
        PUBLIC USART3_IRQHandler
        PUBLIC uart_getchar
        PUBLIC uart_getchar_present
        PUBLIC uart_init
        PUBLIC uart_irq_DIS
        PUBLIC uart_irq_EN
        PUBLIC uart_putchar

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\drivers\uart\uart.c
//    1 /*
//    2  * File:        uart.c
//    3  * Purpose:     Provide common UART routines for serial IO
//    4  *
//    5  * Notes:       
//    6  *              
//    7  */
//    8 
//    9 #include "common.h"
//   10 #include "uart.h"
//   11 
//   12 
//   13 
//   14 
//   15 //volatile struct UART_MemMap *UARTx[6]={UART0_BASE_PTR,UART1_BASE_PTR,UART2_BASE_PTR,UART3_BASE_PTR,UART4_BASE_PTR,UART5_BASE_PTR}; //定义五个指针数组保存 UARTx 的地址
//   16 
//   17 
//   18 /********************************************************************/
//   19 /*
//   20  * Initialize the UART for 8N1 operation, interrupts disabled, and
//   21  * no hardware flow-control
//   22  *
//   23  * NOTE: Since the UARTs are pinned out in multiple locations on most
//   24  *       Kinetis devices, this driver does not enable UART pin functions.
//   25  *       The desired pins should be enabled before calling this init function.
//   26  *
//   27  * Parameters:
//   28  *  uartch      UART channel to initialize
//   29  *  sysclk      UART module Clock in kHz(used to calculate baud)
//   30  *  baud        UART baud rate
//   31  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void uart_init (UART_MemMapPtr uartch, int sysclk, int baud)
//   33 {
uart_init:
        PUSH     {R4,R5}
//   34     register uint16 sbr, brfa;
//   35     uint8 temp;
//   36     
//   37 	/* Enable the clock to the selected UART */    
//   38     if(uartch == UART0_BASE_PTR)
        LDR.N    R3,??DataTable1  ;; 0x4006a000
        CMP      R0,R3
        BNE.N    ??uart_init_0
//   39 		SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;
        LDR.N    R3,??DataTable1_1  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x400
        LDR.N    R4,??DataTable1_1  ;; 0x40048034
        STR      R3,[R4, #+0]
        B.N      ??uart_init_1
//   40     else
//   41     	if (uartch == UART1_BASE_PTR)
??uart_init_0:
        LDR.N    R3,??DataTable1_2  ;; 0x4006b000
        CMP      R0,R3
        BNE.N    ??uart_init_2
//   42 			SIM_SCGC4 |= SIM_SCGC4_UART1_MASK;
        LDR.N    R3,??DataTable1_1  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.N    R4,??DataTable1_1  ;; 0x40048034
        STR      R3,[R4, #+0]
        B.N      ??uart_init_1
//   43     	else
//   44     		if (uartch == UART2_BASE_PTR)
??uart_init_2:
        LDR.N    R3,??DataTable1_3  ;; 0x4006c000
        CMP      R0,R3
        BNE.N    ??uart_init_3
//   45     			SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;
        LDR.N    R3,??DataTable1_1  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000
        LDR.N    R4,??DataTable1_1  ;; 0x40048034
        STR      R3,[R4, #+0]
        B.N      ??uart_init_1
//   46     		else
//   47     			if(uartch == UART3_BASE_PTR)
??uart_init_3:
        LDR.N    R3,??DataTable1_4  ;; 0x4006d000
        CMP      R0,R3
        BNE.N    ??uart_init_4
//   48     				SIM_SCGC4 |= SIM_SCGC4_UART3_MASK;
        LDR.N    R3,??DataTable1_1  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x2000
        LDR.N    R4,??DataTable1_1  ;; 0x40048034
        STR      R3,[R4, #+0]
        B.N      ??uart_init_1
//   49     			else
//   50     				if(uartch == UART4_BASE_PTR)
??uart_init_4:
        LDR.N    R3,??DataTable1_5  ;; 0x400ea000
        CMP      R0,R3
        BNE.N    ??uart_init_5
//   51     					SIM_SCGC1 |= SIM_SCGC1_UART4_MASK;
        LDR.N    R3,??DataTable1_6  ;; 0x40048028
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x400
        LDR.N    R4,??DataTable1_6  ;; 0x40048028
        STR      R3,[R4, #+0]
        B.N      ??uart_init_1
//   52     				else
//   53     					SIM_SCGC1 |= SIM_SCGC1_UART5_MASK;
??uart_init_5:
        LDR.N    R3,??DataTable1_6  ;; 0x40048028
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.N    R4,??DataTable1_6  ;; 0x40048028
        STR      R3,[R4, #+0]
//   54                                 
//   55     /* Make sure that the transmitter and receiver are disabled while we 
//   56      * change settings.
//   57      */
//   58     UART_C2_REG(uartch) &= ~(UART_C2_TE_MASK
//   59 				| UART_C2_RE_MASK );
??uart_init_1:
        LDRB     R3,[R0, #+3]
        ANDS     R3,R3,#0xF3
        STRB     R3,[R0, #+3]
//   60 
//   61     /* Configure the UART for 8-bit mode, no parity */
//   62     UART_C1_REG(uartch) = 0;	/* We need all default settings, so entire register is cleared */
        MOVS     R3,#+0
        STRB     R3,[R0, #+2]
//   63     
//   64     /* Calculate baud settings */
//   65     sbr = (uint16)((sysclk*1000)/(baud * 16));
        MOV      R3,#+1000
        MUL      R3,R3,R1
        LSLS     R4,R2,#+4
        SDIV     R3,R3,R4
//   66         
//   67     /* Save off the current value of the UARTx_BDH except for the SBR field */
//   68     temp = UART_BDH_REG(uartch) & ~(UART_BDH_SBR(0x1F));
        LDRB     R4,[R0, #+0]
        ANDS     R4,R4,#0xE0
//   69     
//   70     UART_BDH_REG(uartch) = temp |  UART_BDH_SBR(((sbr & 0x1F00) >> 8));
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LSRS     R5,R3,#+8
        ANDS     R5,R5,#0x1F
        ORRS     R4,R5,R4
        STRB     R4,[R0, #+0]
//   71     UART_BDL_REG(uartch) = (uint8)(sbr & UART_BDL_SBR_MASK);
        STRB     R3,[R0, #+1]
//   72     
//   73     /* Determine if a fractional divider is needed to get closer to the baud rate */
//   74     brfa = (((sysclk*32000)/(baud * 16)) - (sbr * 32));
        MOV      R4,#+32000
        MULS     R1,R4,R1
        LSLS     R2,R2,#+4
        SDIV     R1,R1,R2
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        SUBS     R1,R1,R3, LSL #+5
//   75     
//   76     /* Save off the current value of the UARTx_C4 register except for the BRFA field */
//   77     temp = UART_C4_REG(uartch) & ~(UART_C4_BRFA(0x1F));
        LDRB     R2,[R0, #+10]
        ANDS     R4,R2,#0xE0
//   78     
//   79     UART_C4_REG(uartch) = temp |  UART_C4_BRFA(brfa);    
        ANDS     R1,R1,#0x1F
        ORRS     R1,R1,R4
        STRB     R1,[R0, #+10]
//   80 
//   81     /* Enable receiver and transmitter */
//   82 	UART_C2_REG(uartch) |= (UART_C2_TE_MASK
//   83 				| UART_C2_RE_MASK );
        LDRB     R1,[R0, #+3]
        ORRS     R1,R1,#0xC
        STRB     R1,[R0, #+3]
//   84 }
        POP      {R4,R5}
        BX       LR               ;; return
//   85 /********************************************************************/
//   86 /*
//   87  * Wait for a character to be received on the specified UART
//   88  *
//   89  * Parameters:
//   90  *  channel      UART channel to read from
//   91  *
//   92  * Return Values:
//   93  *  the received character
//   94  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   95 char uart_getchar (UART_MemMapPtr channel)
//   96 {
//   97     /* Wait until character has been received */
//   98     while (!(UART_S1_REG(channel) & UART_S1_RDRF_MASK));
uart_getchar:
??uart_getchar_0:
        LDRB     R1,[R0, #+4]
        LSLS     R1,R1,#+26
        BPL.N    ??uart_getchar_0
//   99     
//  100     /* Return the 8-bit data from the receiver */
//  101     return UART_D_REG(channel);
        LDRB     R0,[R0, #+7]
        BX       LR               ;; return
//  102 }
//  103 /********************************************************************/
//  104 /*
//  105  * Wait for space in the UART Tx FIFO and then send a character
//  106  *
//  107  * Parameters:
//  108  *  channel      UART channel to send to
//  109  *  ch			 character to send
//  110  */ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  111 void uart_putchar (UART_MemMapPtr channel, char ch)
//  112 {
//  113     /* Wait until space is available in the FIFO */
//  114     while(!(UART_S1_REG(channel) & UART_S1_TDRE_MASK));
uart_putchar:
??uart_putchar_0:
        LDRB     R2,[R0, #+4]
        LSLS     R2,R2,#+24
        BPL.N    ??uart_putchar_0
//  115     
//  116     /* Send the character */
//  117     UART_D_REG(channel) = (uint8)ch;
        STRB     R1,[R0, #+7]
//  118  }
        BX       LR               ;; return
//  119 /********************************************************************/
//  120 /*
//  121  * Check to see if a character has been received
//  122  *
//  123  * Parameters:
//  124  *  channel      UART channel to check for a character
//  125  *
//  126  * Return values:
//  127  *  0       No character received
//  128  *  1       Character has been received
//  129  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  130 int uart_getchar_present (UART_MemMapPtr channel)
//  131 {
//  132     return (UART_S1_REG(channel) & UART_S1_RDRF_MASK);
uart_getchar_present:
        LDRB     R0,[R0, #+4]
        ANDS     R0,R0,#0x20
        BX       LR               ;; return
//  133 }
//  134 /********************************************************************/
//  135  
//  136 
//  137 
//  138 /*******需用到UART中断，请在isr.h中粘贴一下代码:*********
//  139 
//  140 //UART模块中断服务定义
//  141 #undef  VECTOR_061
//  142 #define VECTOR_061 LPLD_UART_Isr
//  143 #undef  VECTOR_063
//  144 #define VECTOR_063 LPLD_UART_Isr
//  145 #undef  VECTOR_065
//  146 #define VECTOR_065 LPLD_UART_Isr
//  147 #undef  VECTOR_067
//  148 #define VECTOR_067 LPLD_UART_Isr
//  149 #undef  VECTOR_069
//  150 #define VECTOR_069 LPLD_UART_Isr
//  151 #undef  VECTOR_071
//  152 #define VECTOR_071 LPLD_UART_Isr
//  153 //以下函数在LPLD_Kinetis底层包，不必修改
//  154 extern void LPLD_UART_Isr(void);
//  155 
//  156 ***********************************************************/
//  157 
//  158 
//  159 
//  160 
//  161 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  162 UART_ISR_CALLBACK UART_R_ISR[6];  //用户接收中断函数入口地址数组
UART_R_ISR:
        DS8 24

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  163 UART_ISR_CALLBACK UART_T_ISR[6];  //用户发送中断函数入口地址数组
UART_T_ISR:
        DS8 24
//  164 
//  165 //UART映射地址数组

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  166 volatile UART_MemMapPtr UARTx_Ptr[5] = {UART0_BASE_PTR, 
UARTx_Ptr:
        DATA
        DC32 4006A000H, 4006B000H, 4006C000H, 4006D000H, 400EA000H
//  167                                         UART1_BASE_PTR, 
//  168                                         UART2_BASE_PTR, 
//  169                                         UART3_BASE_PTR, 
//  170                                         UART4_BASE_PTR};
//  171 
//  172 
//  173 
//  174 /******************************一下为自己添加的程序************************************************/
//  175 /*************************************************************************
//  176 
//  177 *
//  178 *  函数名称：uart_irq_EN
//  179 *  功能说明：开串口接收中断
//  180 *  参数说明：UARTn       模块号（UART0~UART5）;UART_NUM,串口序号，0到5
//  181 *  函数返回：无
//  182 *  修改时间：2012-1-20
//  183 *  备    注：
//  184 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  185 void uart_irq_EN(UART_MemMapPtr channel,uint8 UART_NUM)
//  186 {
uart_irq_EN:
        PUSH     {R7,LR}
//  187     UART_C2_REG(channel)|=UART_C2_RIE_MASK;      //开放UART接收中断
        LDRB     R2,[R0, #+3]
        ORRS     R2,R2,#0x20
        STRB     R2,[R0, #+3]
//  188     enable_irq((UART_NUM<<1)+45);			            //开接收引脚的IRQ中断
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R0,R1,#+1
        ADDS     R0,R0,#+45
        BL       enable_irq
//  189 }
        POP      {R0,PC}          ;; return
//  190 
//  191 
//  192 /*************************************************************************
//  193 
//  194 *
//  195 *  函数名称：uart_irq_DIS
//  196 *  功能说明：关串口接收中断
//  197 *  参数说明：UARTn       模块号（UART0~UART5）;UART_NUM,串口序号，0到5
//  198 *  函数返回：无
//  199 *  修改时间：2012-1-20
//  200 *  备    注：
//  201 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  202 void uart_irq_DIS(UART_MemMapPtr channel,uint8 UART_NUM)
//  203 {
uart_irq_DIS:
        PUSH     {R7,LR}
//  204     UART_C2_REG(channel)&=~UART_C2_RIE_MASK;     //禁止UART接收中断
        LDRB     R2,[R0, #+3]
        ANDS     R2,R2,#0xDF
        STRB     R2,[R0, #+3]
//  205     disable_irq((UART_NUM<<1)+45);			            //关接收引脚的IRQ中断
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R0,R1,#+1
        ADDS     R0,R0,#+45
        BL       disable_irq
//  206 }
        POP      {R0,PC}          ;; return
//  207 
//  208 
//  209 
//  210 /*************************************************************************
//  211 *  
//  212 *  函数名称：USART3_IRQHandler
//  213 *  功能说明：串口1 中断 接收 服务函数
//  214 *  参数说明：无   
//  215 *  函数返回：无
//  216 *  修改时间：2012-2-14    已测试
//  217 *  备    注：
//  218 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  219 void USART3_IRQHandler(void)
//  220 {
USART3_IRQHandler:
        PUSH     {R4,LR}
//  221     uint8 data=0;
        MOVS     R4,#+0
//  222     
//  223     DisableInterrupts;		    //关总中断
        CPSID i         
//  224     
//  225     //接收一个字节数据并回发
//  226     data=uart_getchar (UART3_BASE_PTR);                //接收到一个数据
        LDR.N    R0,??DataTable1_4  ;; 0x4006d000
        BL       uart_getchar
        MOVS     R4,R0
//  227     printf("\n你发送的数据为：%c",data);      //发送出去
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        LDR.N    R0,??DataTable1_7
        BL       printf
//  228  
//  229     
//  230     EnableInterrupts;		    //开总中断
        CPSIE i         
//  231 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x4006b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x4006c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x400ea000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x40048028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     `?<Constant "\\n\\304\\343\\267\\242\\313\\315\\265\\304`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\304\\343\\267\\242\\313\\315\\265\\304`:
        DATA
        DC8 "\012\304\343\267\242\313\315\265\304\312\375\276\335\316\252\243\272%c"

        END
// 
//  48 bytes in section .bss
//  20 bytes in section .data
//  20 bytes in section .rodata
// 336 bytes in section .text
// 
// 336 bytes of CODE  memory
//  20 bytes of CONST memory
//  68 bytes of DATA  memory
//
//Errors: none
//Warnings: none
