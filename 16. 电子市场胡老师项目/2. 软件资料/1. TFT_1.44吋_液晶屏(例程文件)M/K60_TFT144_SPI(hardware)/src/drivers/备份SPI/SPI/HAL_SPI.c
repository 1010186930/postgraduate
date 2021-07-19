/*
 * --------------"拉普兰德K60底层库"-----------------
 *
 *
 * 文件名: HAL_SPI.c
 * 用途: SPI底层模块相关函数
 */
#include"HAL_SPI.h"

/*
//SPI模块中断服务定义
#undef  VECTOR_042
#define VECTOR_042 LPLD_SPI_Isr
#undef  VECTOR_043
#define VECTOR_043 LPLD_SPI_Isr
#undef  VECTOR_044
#define VECTOR_044 LPLD_SPI_Isr
//以下函数在LPLD_Kinetis底层包，不必修改
extern void LPLD_SPI_Isr(void);
*/

//SPI映射地址数组
volatile SPI_MemMapPtr SPIx_Ptr[3] = {SPI0_BASE_PTR, 
                                      SPI1_BASE_PTR, 
                                      SPI2_BASE_PTR};

/*
 * SPI_Init
 * SPI初始化函数
 * 
 * 参数:
 *    spix--选择SPI通道
 *      |__SPI0     PORTA15 SCK 
 *                  PORTA16 SOUT (serial OUT)
 *                  PORTA17 SIN  (serial IN)
 *      |__SPI1     PORTB11 SCK 
 *                  PORTB16 SOUT (serial OUT)
 *                  PORTB17 SIN  (serial IN)
 *      |__SPI2     PORTD12 SCK      
 *                  PORTD13 SOUT (serial OUT)
 *                  PORTD14 SIN  (serial IN)
 *    sck_div--SCK SCK分频系数
 *      由SCK的时钟源为系统时钟fSYS 
 *      SCK频率：F_SCK = (fSYS/PBR) x [(1+DBR)/BR]
 *      在初始化函数中将DBR = 1、PBR = 2 
 *      经计算得 F_SCK = fSYS/BR
 *      BR = SPI_SCK_DIV_x
 *      |__SPI_SCK_DIV_2      -2分频
 *      |__SPI_SCK_DIV_4      -4分频
 *      |__SPI_SCK_DIV_6      -6分频
 *      |__SPI_SCK_DIV_8      -8分频
 *      |__SPI_SCK_DIV_16     -16分频
 *      |__SPI_SCK_DIV_32     -32分频
 *      ......
 *      |__SPI_SCK_DIV_8192   -8192分频
 *      |__SPI_SCK_DIV_16384  -16384分频
 *      |__SPI_SCK_DIV_32768  -32768分频
 *
 *    pcs_num--PCS端口的数量
 *      如果 spix = SPI0
 *      |__1--PCS0 PORTA14
 *      |__2--PCS0 PORTA14
 *            PCS1 PORTC3
 *      |__3--PCS0 PORTA14
 *            PCS1 PORTC3
 *            PCS2 PORTC2
 *      |__4--PCS0 PORTA14
 *            PCS1 PORTC3
 *            PCS2 PORTC2
 *            PCS3 PORTC1
 *      |__5--PCS0 PORTA14
 *            PCS1 PORTC3
 *            PCS2 PORTC2
 *            PCS3 PORTC1
 *            PCS4 PORTC0
 *      |__6--PCS0 PORTA14
 *            PCS1 PORTC3
 *            PCS2 PORTC2
 *            PCS3 PORTC1
 *            PCS4 PORTC0
 *            PCS5 PORTB23
 *      如果 spix = SPI1
 *      |__1--PCS0 PORTB10
 *      |__2--PCS0 PORTB10
 *            PCS1 PORTB9
 *      |__3--PCS0 PORTB10
 *            PCS1 PORTB9
 *            PCS2 PORTE5
 *      |__4--PCS0 PORTB10
 *            PCS1 PORTB9
 *            PCS2 PORTE5
 *            PCS3 PORTE6
 *      如果 spix = SPI2
 *      |__1--PCS0 PORTD11
 *      |__2--PCS0 PORTD11
 *            PCS1 PORTD15
 * 输出:
 *    0：初始化错误
 *    1：初始化成功
 */

uint8 SPI_Init(SPIx spix,uint8 sck_div,uint8 pcs_num)
{
  SPI_MemMapPtr spi = SPIx_Ptr[spix];
  
  switch(spix)
  {
    case SPI0:
      //选择SPI模块时钟
      SIM_SCGC6 |= SIM_SCGC6_DSPI0_MASK;  
      //配置SPI0接口
      if(pcs_num > 6)
        return 0;
      //判断当前使用的PCS的个数
      switch(pcs_num)
      {
        case 1: PORTC_PCR0  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;  break;//PCS4 //片选使用PTC0引脚作为FLASH的片选
        
        case 2: PORTA_PCR14 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS0 
                PORTC_PCR3  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK; break;//PCS1
                
        case 3: PORTA_PCR14 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS0
                PORTC_PCR3  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS1
                PORTC_PCR2  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK; break;//PCS2
                
        case 4: PORTA_PCR14 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS0
                PORTC_PCR3  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS1
                PORTC_PCR2  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS2
                PORTC_PCR1  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK; break;//PCS3
                
        case 5: PORTA_PCR14 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS0
                PORTC_PCR3  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS1
                PORTC_PCR2  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS2
                PORTC_PCR1  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS3
                PORTC_PCR0  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK; break;//PCS4
                
        case 6: PORTA_PCR14 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS0
                PORTC_PCR3  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS1
                PORTC_PCR2  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS2
                PORTC_PCR1  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS3
                PORTC_PCR0  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS4
                PORTB_PCR23 = 0 | PORT_PCR_MUX(3) | PORT_PCR_DSE_MASK; break;//PCS5
        default:break;
      }
      
      PORTC_PCR5 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SCK
      PORTC_PCR6 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
      PORTC_PCR7 = 0 | PORT_PCR_MUX(2);                    //SIN
     
      break;
    case SPI1:
      //选择SPI模块时钟
      SIM_SCGC6 |= SIM_SCGC6_SPI1_MASK;
      if(pcs_num > 4)
        return 0;
      //判断当前使用的PCS的个数
      switch(pcs_num)
      {
        case 1: PORTB_PCR10 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK; break;//PCS0 
        
        case 2: PORTB_PCR10 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS0 
                PORTB_PCR9  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK; break;//PCS1
                
        case 3: PORTB_PCR10 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS0 
                PORTB_PCR9  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS1
                PORTE_PCR5  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK; break;//PCS2
                
        case 4: PORTB_PCR10 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS0 
                PORTB_PCR9  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS1
                PORTE_PCR5  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS2   
                PORTE_PCR6  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;break; //PCS3
        default:break;
      }
      //配置SPI1接口
      PORTB_PCR11 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SCK
      PORTB_PCR16 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
      PORTB_PCR17 = 0 | PORT_PCR_MUX(2);                    //SIN
      break;
    case SPI2:
      //选择SPI模块时钟
      SIM_SCGC3 |= SIM_SCGC3_SPI2_MASK;
      if(pcs_num > 2)
        return 0;
      //判断当前使用的PCS的个数
      switch(pcs_num)
      {
        case 1: PORTD_PCR11 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK; break;//PCS0 
        
        case 2: PORTD_PCR11 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;       //PCS0 
                PORTD_PCR15 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK; break;//PCS1
        default:break;
      }
      //配置SPI2接口
      
      PORTD_PCR12 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SCK
      PORTD_PCR13 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
      PORTD_PCR14 = 0 | PORT_PCR_MUX(2);                    //SIN
      break;
    default: return 0; 
  }
  //配置SPI MCR寄存器
  SPI_MCR_REG(spi) = 0 & (~SPI_MCR_MDIS_MASK) //使能SPI时钟
                    |SPI_MCR_HALT_MASK        //让SPI进入停止模式
                    |SPI_MCR_MSTR_MASK        //配置SPI为主机模式
                    |SPI_MCR_PCSIS_MASK       //PCS为高电平当在SPI不工作的时候
                    |SPI_MCR_CLR_TXF_MASK     //首先要清除MDIS，清除TXF_MASK和RXF_MASK
                    |SPI_MCR_CLR_RXF_MASK  
                    |SPI_MCR_DIS_TXF_MASK     //然后再禁止TXD和RXD FIFO 模式 ，将SPI配置成正常模式
                    |SPI_MCR_DIS_RXF_MASK; 
  
  //配置SPI CTAR寄存器
  SPI_CTAR_REG(spi,0) = 0 | SPI_CTAR_DBR_MASK  //设置DBR = 1
                    |SPI_CTAR_PBR(0)           //设置PBR = 2,上述两步配置占空比为50%
                    |SPI_CTAR_FMSZ(7)          //设置一帧为8位，一个字节数据
                    &~(SPI_CTAR_LSBFE_MASK);   //高位在前传输
                                               //不活动时SCK为高
  //==================配置 Spi 时序======================
  //配置SCK的频率
  //F_SCK = (fSYS/PBR) x [(1+DBR)/BR]
  //现在DBR = 1、PBR = 2 经计算得 F_SCK = fSYS/BR
  SPI_CTAR_REG(spi,0) |=SPI_CTAR_BR(sck_div);
  //配置PCS to SCK的延时
  //tCSC = (1/fSYS) x PCSSCK x CSSCK
  //tCSC = 1/150,000,000 x PCSSCK x CSSCK
  SPI_CTAR_REG(spi,0) |=SPI_CTAR_PCSSCK(1); // Prescaler value is 3.
  
  SPI_CTAR_REG(spi,0) |=SPI_CTAR_CSSCK(1);  // Delay Scaler Value is 4.
  
  //配置 PCS 结束 to 系一个帧开始延时
  //tDT = (1/fSYS) x PDT x DT
  SPI_CTAR_REG(spi,0) |=SPI_CTAR_DT(1);
  SPI_CTAR_REG(spi,0) |=SPI_CTAR_PDT(1);
  
  //Config the Delay of the last edge of SCK and the negation of PCS
  //tASC = (1/fSYS) x PASC x ASC
  SPI_CTAR_REG(spi,0) |=SPI_CTAR_PASC(1);
  SPI_CTAR_REG(spi,0) |=SPI_CTAR_ASC(1);
  //===============配置 Spi 时序完成====================== 
  
  SPI_SR_REG(spi) =  SPI_SR_RFDF_MASK   //清除状态标识
                    |SPI_SR_RFOF_MASK
                    |SPI_SR_TFFF_MASK
                    |SPI_SR_TFUF_MASK
                    |SPI_SR_TCF_MASK
                    |SPI_SR_EOQF_MASK;
  
  SPI_MCR_REG(spi) &=~SPI_MCR_HALT_MASK; //退出等待模式,SPI开始工作
  
  return 1;
}



/*
 * SPI_Master_WriteRead
 * K60主机SPI向从机写数据，并读取从机数据
 * 
 * 参数:
 *    spix--SPI选择
 *      |__SPI0       -选择SPI0模块
 *      |__SPI1       -选择SPI1模块
 *      |__SPI2       -选择SPI2模块
 *    data--要发送数据
 *      |__单位为一个字节，8位
 *    pcsx--CS片选端口号
 *      |__SPI_PCS0       -0号片选(SPI0、SPI1、SPI2含有)
 *      |__SPI_PCS1       -1号片选(SPI0、SPI1、SPI2含有)
 *      |__SPI_PCS2       -2号片选(SPI0、SPI1含有)
 *      |__SPI_PCS3       -3号片选(SPI0、SPI1含有)
 *      |__SPI_PCS4       -4号片选(SPI0含有)
 *      |__SPI_PCS5       -5号片选(SPI0含有)
 *    pcs_state--一帧数据传输完成后CS的状态
 *      |__SPI_PCS_ASSERTED -保持片选有效
 *      |__SPI_PCS_INACTIVE -片选无效
 * 输出:
 *    8位的读取从机的数据
 */

uint8 SPI_Master_WriteRead(SPIx spix,uint8 data,uint8 pcsx,uint8 pcs_state)
{
  uint8 temp;
  SPI_MemMapPtr spi = SPIx_Ptr[spix];
  
  //根据pcs_state选择片选是否有效
  SPI_PUSHR_REG(spi) = (((uint32_t)(((uint32_t)(pcs_state))<<SPI_PUSHR_CONT_SHIFT))&SPI_PUSHR_CONT_MASK)
               |SPI_PUSHR_CTAS(0)
               |SPI_PUSHR_PCS(pcsx)
               |data;                 
  
  while(!(SPI_SR_REG(spi) & SPI_SR_TCF_MASK));
  SPI_SR_REG(spi) |= SPI_SR_TCF_MASK ;               //清除发送缓冲标志位
  
  //使接收缓冲器为空
  while((SPI_SR_REG(spi) & SPI_SR_RFDF_MASK) == 0){}; //RX FIFO 未接收到数据则一直等待
  temp = (uint8)(SPI_POPR_REG(spi) & 0xff);           //数据以32位形式存在POPR中，转化格式 
  SPI_SR_REG(spi) |= SPI_SR_RFDF_MASK;                //清除标志位
  return temp;
  
}


/*
 * SPI_Master_Read
 * K60主机读取从机数据
 * 
 * 参数:
 *    spix--SPI选择
 *      |__SPI0       -选择SPI0模块
 *      |__SPI1       -选择SPI1模块
 *      |__SPI2       -选择SPI2模块
 * 输出:
 *    8位的读取从机的数据
 */
uint8 SPI_Master_Read(SPIx spix)
{
  uint8 temp;
  SPI_MemMapPtr spi = SPIx_Ptr[spix];

  while(!(SPI_SR_REG(spi) & SPI_SR_RFDF_MASK)); //=1 RIFO is not empty
  temp=(uint8)SPI_POPR_REG(spi);
  SPI_SR_REG(spi) |=SPI_SR_RFDF_MASK;

  return temp;
}
/*
 * SPI_Master_Write
 * K60主机SPI向从机写数据
 * 
 * 参数:
 *    spix--SPI选择
 *      |__SPI0       -选择SPI0模块
 *      |__SPI1       -选择SPI1模块
 *      |__SPI2       -选择SPI2模块
 *    data--要发送数据
 *      |__单位为一个字节，8位
 *    pcsx--CS片选端口号
 *      |__SPI_PCS0       -0号片选(SPI0、SPI1、SPI2含有)
 *      |__SPI_PCS1       -1号片选(SPI0、SPI1、SPI2含有)
 *      |__SPI_PCS2       -2号片选(SPI0、SPI1含有)
 *      |__SPI_PCS3       -3号片选(SPI0、SPI1含有)
 *      |__SPI_PCS4       -4号片选(SPI0含有)
 *      |__SPI_PCS5       -5号片选(SPI0含有)
 *    pcs_state--一帧数据传输完成后CS的状态
 *      |__SPI_PCS_ASSERTED -保持片选有效
 *      |__SPI_PCS_INACTIVE -片选无效
 */
void SPI_Master_Write(SPIx spix,uint8 data,uint8 pcsx,uint8 pcs_state)
{  
  SPI_MemMapPtr spi = SPIx_Ptr[spix];

  //根据pcs_state选择片选是否有效
  SPI_PUSHR_REG(spi) = (((uint32_t)(((uint32_t)(pcs_state))<<SPI_PUSHR_CONT_SHIFT))&SPI_PUSHR_CONT_MASK)
               |SPI_PUSHR_CTAS(0)
               |SPI_PUSHR_PCS(pcsx)
               |data; 

  while(!(SPI_SR_REG(spi) & SPI_SR_TCF_MASK));
  SPI_SR_REG(spi) |= SPI_SR_TCF_MASK ;            //清除发送缓冲标志位
}




