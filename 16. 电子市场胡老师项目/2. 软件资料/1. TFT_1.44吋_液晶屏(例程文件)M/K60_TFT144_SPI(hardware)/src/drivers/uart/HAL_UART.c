/*

 *
 * 文件名: HAL_UART.c
 * 用途: UART底层模块相关函数
 
*/
/*
 *******需用到UART中断，请在isr.h中粘贴一下代码:*********

//UART模块中断服务定义
#undef  VECTOR_061
#define VECTOR_061 LPLD_UART_Isr
#undef  VECTOR_063
#define VECTOR_063 LPLD_UART_Isr
#undef  VECTOR_065
#define VECTOR_065 LPLD_UART_Isr
#undef  VECTOR_067
#define VECTOR_067 LPLD_UART_Isr
#undef  VECTOR_069
#define VECTOR_069 LPLD_UART_Isr
#undef  VECTOR_071
#define VECTOR_071 LPLD_UART_Isr
//以下函数在LPLD_Kinetis底层包，不必修改
extern void LPLD_UART_Isr(void);

 ***********************代码结束*************************
*/

#include "common.h"
#include "HAL_UART.h"


extern int core_clk_khz;          //系统主频时钟频率
extern int periph_clk_khz;        //总线时钟频率


UART_ISR_CALLBACK UART_R_ISR[6];  //用户接收中断函数入口地址数组
UART_ISR_CALLBACK UART_T_ISR[6];  //用户发送中断函数入口地址数组

//UART映射地址数组
volatile UART_MemMapPtr UARTx_Ptr[5] = {UART0_BASE_PTR, 
                                        UART1_BASE_PTR, 
                                        UART2_BASE_PTR, 
                                        UART3_BASE_PTR, 
                                        UART4_BASE_PTR};

/*
 * UART_Init
 * 初始化UART通道及其波特率
 * 
 * 参数:
 *    uartx--UART模块号
 *      |__UART0          --UART0  -Txd:PTB17 -Rxd:PTB16
 *      |__UART1          --UART1  -Txd:PTC4  -Rxd:PTC3
 *      |__UART2          --UART2  -Txd:PTD3  -Rxd:PTD2
 *      |__UART3          --UART3  -Txd:PTC17 -Rxd:PTC16
 *      |__UART4          --UART4  -Txd:PTC15 -Rxd:PTC14
 *      |__UART5          --UART5  -Txd:PTE8  -Rxd:PTE9
 *    baud--波特率，推荐设置以下常用波特率
 *      |__4800
 *      |__9600
 *      |__19200
 *      |__38400
 *      |__57600
 *      |__115200
 *
 * 输出:
 *    无
 *
 */
void UART_Init(UARTx uartx, int baud)
{
  UART_MemMapPtr uartptr = UARTx_Ptr[uartx];
  register uint16 sbr, brfa;
  int sysclk;
  uint8 temp;
  
  if ((uartptr == UART0_BASE_PTR) | (uartptr == UART1_BASE_PTR))
    sysclk = core_clk_khz;
  else
    sysclk = periph_clk_khz;
  
  //使能选中的UART串口通道时钟   
  if(uartptr == UART0_BASE_PTR)
  {
    SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;
    //使能 PTB17 引脚的 UART0_TXD 功能 
    PORTB_PCR17 = PORT_PCR_MUX(0x3); 
    //使能 PTB16 引脚的 UART0_RXD 功能 
    PORTB_PCR16 = PORT_PCR_MUX(0x3);
  }
  else
  {
    if (uartptr == UART1_BASE_PTR)
    {
      SIM_SCGC4 |= SIM_SCGC4_UART1_MASK;
      SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;
      //使能 PTC4 引脚的 UART1_TXD 功能 
      PORTC_PCR4 = PORT_PCR_MUX(0x3); 
      //使能 PTC3 引脚的 UART1_RXD 功能 
      PORTC_PCR3 = PORT_PCR_MUX(0x3);
    }
    else
    {
      if (uartptr == UART2_BASE_PTR)
      {
        SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;
        //使能 PTD3 引脚的 UART2_TXD 功能 
        PORTD_PCR3 = PORT_PCR_MUX(0x3); 
        //使能 PTD2 引脚的 UART2_RXD 功能 
        PORTD_PCR2 = PORT_PCR_MUX(0x3);
      }
      else
      {
        if(uartptr == UART3_BASE_PTR)
        {
          SIM_SCGC4 |= SIM_SCGC4_UART3_MASK;
          //使能 PTC17 引脚的 UART3_TXD 功能 
          PORTC_PCR15 = PORT_PCR_MUX(0x3); 
          //使能 PTC16 引脚的 UART3_RXD 功能 
          PORTC_PCR14 = PORT_PCR_MUX(0x3);
        }
        else
        {
          if(uartptr == UART4_BASE_PTR)
          {
            SIM_SCGC1 |= SIM_SCGC1_UART4_MASK;
            //使能 PTC15 引脚的 UART4_TXD 功能 
            PORTC_PCR15 = PORT_PCR_MUX(0x3); 
            //使能 PTC14 引脚的 UART4_RXD 功能 
            PORTC_PCR14 = PORT_PCR_MUX(0x3);
          }
          else
          {
            SIM_SCGC1 |= SIM_SCGC1_UART5_MASK;
            //使能 PTE8 引脚的 UART3_TXD 功能 
            PORTE_PCR8 = PORT_PCR_MUX(0x3); 
            //使能 PTE9 引脚的 UART3_RXD 功能 
            PORTE_PCR9 = PORT_PCR_MUX(0x3); 
          }
        }
      }
    }
  }
  
  //在配置好其他寄存器前，先关闭发送器和接收器
  UART_C2_REG(uartptr) &= ~(UART_C2_TE_MASK | UART_C2_RE_MASK );
  
  //配置UART为 8位, 无奇偶校验 */
  UART_C1_REG(uartptr) = 0;	
  
  //计算波特率
  sbr = (uint16)((sysclk*1000)/(baud * 16));
  
  //保存UARTx_BDH寄存器中除了SBR的值
  temp = UART_BDH_REG(uartptr) & ~(UART_BDH_SBR(0x1F));
  
  UART_BDH_REG(uartptr) = temp |  UART_BDH_SBR(((sbr & 0x1F00) >> 8));
  UART_BDL_REG(uartptr) = (uint8)(sbr & UART_BDL_SBR_MASK);
  
  //配置波特率的微调分数
  brfa = (((sysclk*32000)/(baud * 16)) - (sbr * 32));
  
  //保存UARTx_C4寄存器中除了BRFA的值
  temp = UART_C4_REG(uartptr) & ~(UART_C4_BRFA(0x1F));
  
  UART_C4_REG(uartptr) = temp |  UART_C4_BRFA(brfa);    
  
  //使能发送器和接收器
  UART_C2_REG(uartptr) |= (UART_C2_TE_MASK | UART_C2_RE_MASK );
}

/*
 * UART_GetChar
 * 串口查询方式读取一个字节
 * 
 * 参数:
 *    uartx--UART模块号
 *      |__UART0          --UART0  -Txd:PTB17 -Rxd:PTB16
 *      |__UART1          --UART1  -Txd:PTC4  -Rxd:PTC3
 *      |__UART2          --UART2  -Txd:PTD3  -Rxd:PTD2
 *      |__UART3          --UART3  -Txd:PTC17 -Rxd:PTC16
 *      |__UART4          --UART4  -Txd:PTC15 -Rxd:PTC14
 *      |__UART5          --UART5  -Txd:PTE8  -Rxd:PTE9
 *
 * 输出:
 *    串口接收的1个字节
 *
 */
char UART_GetChar(UARTx uartx)
{
  UART_MemMapPtr uartptr = UARTx_Ptr[uartx];
  
  //等待数据接收
  while (!(UART_S1_REG(uartptr) & UART_S1_RDRF_MASK));
  
  //返回接收的1个字节数据
  return UART_D_REG(uartptr);
}

/*
 * LPLD_UART_PutChar
 * 串口查询方式发送一个字节
 * 
 * 参数:
 *    uartx--UART模块号
 *      |__UART0          --UART0  -Txd:PTB17 -Rxd:PTB16
 *      |__UART1          --UART1  -Txd:PTC4  -Rxd:PTC3
 *      |__UART2          --UART2  -Txd:PTD3  -Rxd:PTD2
 *      |__UART3          --UART3  -Txd:PTC17 -Rxd:PTC16
 *      |__UART4          --UART4  -Txd:PTC15 -Rxd:PTC14
 *      |__UART5          --UART5  -Txd:PTE8  -Rxd:PTE9
 *    ch--待发送的1个字节
 *
 * 输出:
 *    无
 *
 */
void LPLD_UART_PutChar(UARTx uartx, char ch)
{
  UART_MemMapPtr uartptr = UARTx_Ptr[uartx];
  
  //等待FIFO准备就绪
  while(!(UART_S1_REG(uartptr) & UART_S1_TDRE_MASK));
  
  //将要发送的1个字节发给UART数据寄存器
  UART_D_REG(uartptr) = (uint8)ch;
}


/*
 * LPLD_UART_PutCharArr
 * 串口查询方式发送字节型数组
 * 
 * 参数:
 *    uartx--UART模块号
 *      |__UART0          --UART0  -Txd:PTB17 -Rxd:PTB16
 *      |__UART1          --UART1  -Txd:PTC4  -Rxd:PTC3
 *      |__UART2          --UART2  -Txd:PTD3  -Rxd:PTD2
 *      |__UART3          --UART3  -Txd:PTC17 -Rxd:PTC16
 *      |__UART4          --UART4  -Txd:PTC15 -Rxd:PTC14
 *      |__UART5          --UART5  -Txd:PTE8  -Rxd:PTE9
 *    *ch--待发送的字节数组头地址
 *    len--字节数组长度
 *
 * 输出:
 *    无
 *
 */
void LPLD_UART_PutCharArr(UARTx uartx, char *ch, int len)
{
  while(len--)
  {
    LPLD_UART_PutChar(uartx, *(ch++));
  }
}

/*
 * LPLD_UART_RIE_Enable
 * 使能串口数据接收中断，设置中断函数入口
 * 
 * 参数:
 *    uartx--UART模块号
 *      |__UART0          --UART0  -Txd:PTB17 -Rxd:PTB16
 *      |__UART1          --UART1  -Txd:PTC4  -Rxd:PTC3
 *      |__UART2          --UART2  -Txd:PTD3  -Rxd:PTD2
 *      |__UART3          --UART3  -Txd:PTC17 -Rxd:PTC16
 *      |__UART4          --UART4  -Txd:PTC15 -Rxd:PTC14
 *      |__UART5          --UART5  -Txd:PTE8  -Rxd:PTE9
 *    isr_func--数据接收中断程序入口地址
 *      |__用户在工程文件下定义的中断函数名，函数必须为:无返回值,无参数(eg. void isr(void);)
 *
 * 输出:
 *    无
 *
 */
void LPLD_UART_RIE_Enable(UARTx uartx, UART_ISR_CALLBACK isr_func)
{
  UART_MemMapPtr uartptr = UARTx_Ptr[uartx];
  
  UART_R_ISR[uartx] = isr_func;
 
  //使能UART接收中断
  UART_C2_REG(uartptr) |= UART_C2_RIE_MASK; 
  
  //根据中断请求号使能相应中断
  enable_irq( 45 + uartx*2);
}

/*
 * LPLD_UART_RIE_Disable
 * 禁用串口数据接收中断
 * 
 * 参数:
 *    uartx--UART模块号
 *      |__UART0          --UART0  -Txd:PTB17 -Rxd:PTB16
 *      |__UART1          --UART1  -Txd:PTC4  -Rxd:PTC3
 *      |__UART2          --UART2  -Txd:PTD3  -Rxd:PTD2
 *      |__UART3          --UART3  -Txd:PTC17 -Rxd:PTC16
 *      |__UART4          --UART4  -Txd:PTC15 -Rxd:PTC14
 *      |__UART5          --UART5  -Txd:PTE8  -Rxd:PTE9
 *
 * 输出:
 *    无
 *
 */
void LPLD_UART_RIE_Disable(UARTx uartx)
{
  UART_MemMapPtr uartptr = UARTx_Ptr[uartx];
 
  //禁用UART接收中断
  UART_C2_REG(uartptr) &= ~UART_C2_RIE_MASK;  
  
  disable_irq( 45 + uartx*2);
}

/*
 * LPLD_UART_Isr
 * UART通用中断底层入口函数
 * 
 * 用户无需修改，程序自动进入对应通道中断函数
 */
void UART_Isr(void)
{
  #define UART_VECTORNUM   (*(volatile uint8_t*)(0xE000ED04))
  
  uint8_t uart_ch = (UART_VECTORNUM - 61)/2;
  
  UART_MemMapPtr uartch = (UART_MemMapPtr)((0x4006A+uart_ch)<<12);
  
  if(uart_ch>3){
    
    uartch = (UART_MemMapPtr)((0x400E6+uart_ch)<<12);  
  }
  
  //进入接收中断函数
  if(UART_S1_REG(uartch) & UART_S1_RDRF_MASK)
  {
    UART_R_ISR[uart_ch]();
  }
}