///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\driv /
//                    ers\SPI\HAL_SPI.c                                       /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\dri /
//                    vers\SPI\HAL_SPI.c" -D IAR -D TWR_K60N512 -lCN          /
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
//                    r\hello_world\FLASH_512KB_PFLASH\List\HAL_SPI.s         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME HAL_SPI

        #define SHT_PROGBITS 0x1

        EXTERN gpio_init

        PUBLIC SPI_Init
        PUBLIC SPI_Master_Read
        PUBLIC SPI_Master_Write
        PUBLIC SPI_Master_WriteRead
        PUBLIC SPIx_Ptr

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\drivers\SPI\HAL_SPI.c
//    1 /*
//    2 
//    3  *
//    4  * 文件名: HAL_SPI.c
//    5  * 用途: SPI底层模块相关函数
//    6  * 最后修改日期: 20120321
//    7  *
//    8  */
//    9 #include"HAL_SPI.h"
//   10 
//   11 /*
//   12 //SPI模块中断服务定义
//   13 #undef  VECTOR_042
//   14 #define VECTOR_042 LPLD_SPI_Isr
//   15 #undef  VECTOR_043
//   16 #define VECTOR_043 LPLD_SPI_Isr
//   17 #undef  VECTOR_044
//   18 #define VECTOR_044 LPLD_SPI_Isr
//   19 //以下函数在LPLD_Kinetis底层包，不必修改
//   20 extern void LPLD_SPI_Isr(void);
//   21 */
//   22 
//   23 //SPI映射地址数组

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   24 volatile SPI_MemMapPtr SPIx_Ptr[3] = {SPI0_BASE_PTR, 
SPIx_Ptr:
        DATA
        DC32 4002C000H, 4002D000H, 400AC000H
//   25                                       SPI1_BASE_PTR, 
//   26                                       SPI2_BASE_PTR};
//   27 
//   28 /*
//   29  * SPI_Init
//   30  * SPI初始化函数
//   31  * 
//   32  * 参数:
//   33  *    spix--选择SPI通道
//   34  *      |__SPI0     PORTA15 SCK 
//   35  *                  PORTA16 SOUT (serial OUT)
//   36  *                  PORTA17 SIN  (serial IN)
//   37  *      |__SPI1     PORTB11 SCK 
//   38  *                  PORTB16 SOUT (serial OUT)
//   39  *                  PORTB17 SIN  (serial IN)
//   40  *      |__SPI2     PORTD12 SCK      
//   41  *                  PORTD13 SOUT (serial OUT)
//   42  *                  PORTD14 SIN  (serial IN)
//   43  *    sck_div--SCK SCK分频系数
//   44  *      由SCK的时钟源为系统时钟fSYS 
//   45  *      SCK频率：F_SCK = (fSYS/PBR) x [(1+DBR)/BR]
//   46  *      在初始化函数中将DBR = 1、PBR = 2 
//   47  *      经计算得 F_SCK = fSYS/BR
//   48  *      BR = SPI_SCK_DIV_x
//   49  *      |__SPI_SCK_DIV_2      -2分频
//   50  *      |__SPI_SCK_DIV_4      -4分频
//   51  *      |__SPI_SCK_DIV_6      -6分频
//   52  *      |__SPI_SCK_DIV_8      -8分频
//   53  *      |__SPI_SCK_DIV_16     -16分频
//   54  *      |__SPI_SCK_DIV_32     -32分频
//   55  *      ......
//   56  *      |__SPI_SCK_DIV_8192   -8192分频
//   57  *      |__SPI_SCK_DIV_16384  -16384分频
//   58  *      |__SPI_SCK_DIV_32768  -32768分频
//   59  *
//   60  *    pcs_num--PCS端口的数量
//   61  *      如果 spix = SPI0
//   62  *      |__1--PCS0 PORTA14
//   63  *      |__2--PCS0 PORTA14
//   64  *            PCS1 PORTC3
//   65  *      |__3--PCS0 PORTA14
//   66  *            PCS1 PORTC3
//   67  *            PCS2 PORTC2
//   68  *      |__4--PCS0 PORTA14
//   69  *            PCS1 PORTC3
//   70  *            PCS2 PORTC2
//   71  *            PCS3 PORTC1
//   72  *      |__5--PCS0 PORTA14
//   73  *            PCS1 PORTC3
//   74  *            PCS2 PORTC2
//   75  *            PCS3 PORTC1
//   76  *            PCS4 PORTC0
//   77  *      |__6--PCS0 PORTA14
//   78  *            PCS1 PORTC3
//   79  *            PCS2 PORTC2
//   80  *            PCS3 PORTC1
//   81  *            PCS4 PORTC0
//   82  *            PCS5 PORTB23
//   83  *      如果 spix = SPI1
//   84  *      |__1--PCS0 PORTB10
//   85  *      |__2--PCS0 PORTB10
//   86  *            PCS1 PORTB9
//   87  *      |__3--PCS0 PORTB10
//   88  *            PCS1 PORTB9
//   89  *            PCS2 PORTE5
//   90  *      |__4--PCS0 PORTB10
//   91  *            PCS1 PORTB9
//   92  *            PCS2 PORTE5
//   93  *            PCS3 PORTE6
//   94  *      如果 spix = SPI2
//   95  *      |__1--PCS0 PORTD11
//   96  *      |__2--PCS0 PORTD11
//   97  *            PCS1 PORTD15
//   98  * 输出:
//   99  *    0：初始化错误
//  100  *    1：初始化成功
//  101  */
//  102 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  103 uint8 SPI_Init(SPIx spix,uint8 sck_div,uint8 pcs_num)
//  104 {
SPI_Init:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  105       
//  106      
//  107   
//  108   //初始化SPI——OLED显示屏采用四线的SPI驱动方式，所以要初始化CS，RST、DC引脚
//  109   
//  110       gpio_init  (PORTC,8,GPO,HIGH); //初始化OLED-CS引脚
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+8
        MOVS     R0,#+2
        BL       gpio_init
//  111   
//  112       gpio_init  (PORTC,9,GPO,HIGH); //初始化OLED-RST引脚
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+9
        MOVS     R0,#+2
        BL       gpio_init
//  113       
//  114       gpio_init  (PORTC,10,GPO,HIGH); //初始化OLED-D/C引脚
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+10
        MOVS     R0,#+2
        BL       gpio_init
//  115   
//  116       SPI_MemMapPtr spi = SPIx_Ptr[spix];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, R5, LSL #+2]
//  117    
//  118       //选择SPI模块时钟
//  119       
//  120       SIM_SCGC6 |= SIM_SCGC6_DSPI0_MASK;  
        LDR.N    R1,??DataTable3_1  ;; 0x4004803c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1000
        LDR.N    R2,??DataTable3_1  ;; 0x4004803c
        STR      R1,[R2, #+0]
//  121       //配置SPI0接口
//  122        
//  123       PORTC_PCR5 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SCK
        LDR.N    R1,??DataTable3_2  ;; 0x4004b014
        MOV      R2,#+576
        STR      R2,[R1, #+0]
//  124       PORTC_PCR6 = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
        LDR.N    R1,??DataTable3_3  ;; 0x4004b018
        MOV      R2,#+576
        STR      R2,[R1, #+0]
//  125       PORTC_PCR7 = 0 | PORT_PCR_MUX(2);                    //SIN
        LDR.N    R1,??DataTable3_4  ;; 0x4004b01c
        MOV      R2,#+512
        STR      R2,[R1, #+0]
//  126      
//  127      //判断当前使用的PCS的个数  
//  128       
//  129       
//  130   //配置SPI MCR寄存器
//  131   SPI_MCR_REG(spi) = 0 & (~SPI_MCR_MDIS_MASK) //使能SPI时钟
//  132                     |SPI_MCR_HALT_MASK        //让SPI进入停止模式
//  133                     |SPI_MCR_MSTR_MASK        //配置SPI为主机模式
//  134                     
//  135                     //|SPI_MCR_PCSIS_MASK       //PCS为高电平当在SPI不工作的时候
//  136                     |SPI_MCR_CLR_TXF_MASK     //首先要清除MDIS，清除TXF_MASK和RXF_MASK
//  137                     |SPI_MCR_CLR_RXF_MASK  
//  138                     |SPI_MCR_DIS_TXF_MASK     //然后再禁止TXD和RXD FIFO 模式 ，将SPI配置成正常模式
//  139                     |SPI_MCR_DIS_RXF_MASK; 
        LDR.N    R1,??DataTable3_5  ;; 0x80003c01
        STR      R1,[R0, #+0]
//  140   
//  141   //配置SPI CTAR寄存器
//  142   SPI_CTAR_REG(spi,0) = 0 | SPI_CTAR_DBR_MASK  //设置DBR = 1
//  143                     |SPI_CTAR_PBR(0)           //设置PBR = 2,上述两步配置占空比为50%
//  144                     |SPI_CTAR_FMSZ(7)          //设置一帧为8位，一个字节数据
//  145                     &~(SPI_CTAR_LSBFE_MASK);   //高位在前传输
        MOVS     R1,#-1207959552
        STR      R1,[R0, #+12]
//  146                                                //不活动时SCK为高
//  147   //==================配置 Spi 时序======================
//  148   //配置SCK的频率
//  149   //F_SCK = (fSYS/PBR) x [(1+DBR)/BR]
//  150   //现在DBR = 1、PBR = 2 经计算得 F_SCK = fSYS/BR
//  151   
//  152   SPI_CTAR_REG(spi,0) |=SPI_CTAR_BR(sck_div);
        LDR      R1,[R0, #+12]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R2,R4,#0xF
        ORRS     R1,R2,R1
        STR      R1,[R0, #+12]
//  153   
//  154   //配置PCS to SCK的延时
//  155   //tCSC = (1/fSYS) x PCSSCK x CSSCK
//  156   //tCSC = 1/150,000,000 x PCSSCK x CSSCK
//  157   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_PCSSCK(1); // Prescaler value is 3.
//  158   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_CSSCK(1);  // Delay Scaler Value is 4.
//  159   
//  160   //配置 PCS 结束 to 系一个帧开始延时
//  161   //tDT = (1/fSYS) x PDT x DT
//  162   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_DT(1);
//  163   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_PDT(1);
//  164   
//  165   //Config the Delay of the last edge of SCK and the negation of PCS
//  166   //tASC = (1/fSYS) x PASC x ASC
//  167   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_PASC(1);
//  168   //SPI_CTAR_REG(spi,0) |=SPI_CTAR_ASC(1);
//  169   //===============配置 Spi 时序完成====================== 
//  170   
//  171   SPI_SR_REG(spi) =  SPI_SR_RFDF_MASK   //清除状态标识
//  172                     |SPI_SR_RFOF_MASK
//  173                     |SPI_SR_TFFF_MASK
//  174                     |SPI_SR_TFUF_MASK
//  175                     |SPI_SR_TCF_MASK
//  176                     |SPI_SR_EOQF_MASK;
        LDR.N    R1,??DataTable3_6  ;; 0x9a0a0000
        STR      R1,[R0, #+44]
//  177   
//  178   SPI_MCR_REG(spi) &=~SPI_MCR_HALT_MASK; //退出等待模式,SPI开始工作
        LDR      R1,[R0, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        STR      R1,[R0, #+0]
//  179   
//  180   return 1;
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return
//  181 }
//  182 
//  183 
//  184 
//  185 /*
//  186  * SPI_Master_WriteRead
//  187  * K60主机SPI向从机写数据，并读取从机数据
//  188  * 
//  189  * 参数:
//  190  *    spix--SPI选择
//  191  *      |__SPI0       -选择SPI0模块
//  192  *      |__SPI1       -选择SPI1模块
//  193  *      |__SPI2       -选择SPI2模块
//  194  *    data--要发送数据
//  195  *      |__单位为一个字节，8位
//  196  *    pcsx--CS片选端口号
//  197  *      |__SPI_PCS0       -0号片选(SPI0、SPI1、SPI2含有)
//  198  *      |__SPI_PCS1       -1号片选(SPI0、SPI1、SPI2含有)
//  199  *      |__SPI_PCS2       -2号片选(SPI0、SPI1含有)
//  200  *      |__SPI_PCS3       -3号片选(SPI0、SPI1含有)
//  201  *      |__SPI_PCS4       -4号片选(SPI0含有)
//  202  *      |__SPI_PCS5       -5号片选(SPI0含有)
//  203  *    pcs_state--一帧数据传输完成后CS的状态
//  204  *      |__SPI_PCS_ASSERTED -保持片选有效
//  205  *      |__SPI_PCS_INACTIVE -片选无效
//  206  * 输出:
//  207  *    8位的读取从机的数据
//  208  */
//  209 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  210 uint8 SPI_Master_WriteRead(SPIx spix,uint8 data,uint8 pcsx,uint8 pcs_state)
//  211 {
SPI_Master_WriteRead:
        PUSH     {R4}
//  212   uint8 temp;
//  213   SPI_MemMapPtr spi = SPIx_Ptr[spix];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R4,??DataTable3
        LDR      R4,[R4, R0, LSL #+2]
//  214   
//  215   //根据pcs_state选择片选是否有效
//  216   SPI_PUSHR_REG(spi) = (((uint32_t)(((uint32_t)(pcs_state))<<SPI_PUSHR_CONT_SHIFT))&SPI_PUSHR_CONT_MASK)
//  217                |SPI_PUSHR_CTAS(0)
//  218                |SPI_PUSHR_PCS(pcsx)
//  219                |data;                 
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R0,R2,#+16
        ANDS     R0,R0,#0x3F0000
        ORRS     R0,R0,R3, LSL #+31
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R1,R0
        STR      R0,[R4, #+52]
//  220   
//  221   while(!(SPI_SR_REG(spi) & SPI_SR_TCF_MASK));
??SPI_Master_WriteRead_0:
        LDR      R0,[R4, #+44]
        CMP      R0,#+0
        BPL.N    ??SPI_Master_WriteRead_0
//  222   SPI_SR_REG(spi) |= SPI_SR_TCF_MASK ;               //清除发送缓冲标志位
        LDR      R0,[R4, #+44]
        ORRS     R0,R0,#0x80000000
        STR      R0,[R4, #+44]
//  223   
//  224   //使接收缓冲器为空
//  225   while((SPI_SR_REG(spi) & SPI_SR_RFDF_MASK) == 0){}; //RX FIFO 未接收到数据则一直等待
??SPI_Master_WriteRead_1:
        LDR      R0,[R4, #+44]
        LSLS     R0,R0,#+14
        BPL.N    ??SPI_Master_WriteRead_1
//  226   temp = (uint8)(SPI_POPR_REG(spi) & 0xff);           //数据以32位形式存在POPR中，转化格式 
        LDR      R0,[R4, #+56]
//  227   SPI_SR_REG(spi) |= SPI_SR_RFDF_MASK;                //清除标志位
        LDR      R1,[R4, #+44]
        ORRS     R1,R1,#0x20000
        STR      R1,[R4, #+44]
//  228   return temp;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return
//  229   
//  230 }
//  231 
//  232 
//  233 /*
//  234  * SPI_Master_Read
//  235  * K60主机读取从机数据
//  236  * 
//  237  * 参数:
//  238  *    spix--SPI选择
//  239  *      |__SPI0       -选择SPI0模块
//  240  *      |__SPI1       -选择SPI1模块
//  241  *      |__SPI2       -选择SPI2模块
//  242  * 输出:
//  243  *    8位的读取从机的数据
//  244  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  245 uint8 SPI_Master_Read(SPIx spix)
//  246 {
//  247   uint8 temp;
//  248   SPI_MemMapPtr spi = SPIx_Ptr[spix];
SPI_Master_Read:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable3
        LDR      R1,[R1, R0, LSL #+2]
//  249 
//  250   while(!(SPI_SR_REG(spi) & SPI_SR_RFDF_MASK)); //=1 RIFO is not empty
??SPI_Master_Read_0:
        LDR      R0,[R1, #+44]
        LSLS     R0,R0,#+14
        BPL.N    ??SPI_Master_Read_0
//  251   temp=(uint8)SPI_POPR_REG(spi);
        LDR      R0,[R1, #+56]
//  252   SPI_SR_REG(spi) |=SPI_SR_RFDF_MASK;
        LDR      R2,[R1, #+44]
        ORRS     R2,R2,#0x20000
        STR      R2,[R1, #+44]
//  253 
//  254   return temp;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  255 }
//  256 /*
//  257  * SPI_Master_Write
//  258  * K60主机SPI向从机写数据
//  259  * 
//  260  * 参数:
//  261  *    spix--SPI选择
//  262  *      |__SPI0       -选择SPI0模块
//  263  *      |__SPI1       -选择SPI1模块
//  264  *      |__SPI2       -选择SPI2模块
//  265  *    data--要发送数据
//  266  *      |__单位为一个字节，8位
//  267  *    pcsx--CS片选端口号
//  268  *      |__SPI_PCS0       -0号片选(SPI0、SPI1、SPI2含有)
//  269  *      |__SPI_PCS1       -1号片选(SPI0、SPI1、SPI2含有)
//  270  *      |__SPI_PCS2       -2号片选(SPI0、SPI1含有)
//  271  *      |__SPI_PCS3       -3号片选(SPI0、SPI1含有)
//  272  *      |__SPI_PCS4       -4号片选(SPI0含有)
//  273  *      |__SPI_PCS5       -5号片选(SPI0含有)
//  274  *    pcs_state--一帧数据传输完成后CS的状态
//  275  *      |__SPI_PCS_ASSERTED -保持片选有效
//  276  *      |__SPI_PCS_INACTIVE -片选无效
//  277  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  278 void SPI_Master_Write(SPIx spix,uint8 data,uint8 pcsx,uint8 pcs_state)
//  279 {  
SPI_Master_Write:
        PUSH     {R4}
//  280   SPI_MemMapPtr spi = SPIx_Ptr[spix];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R4,??DataTable3
        LDR      R0,[R4, R0, LSL #+2]
//  281 
//  282   //根据pcs_state选择片选是否有效
//  283   SPI_PUSHR_REG(spi) = (((uint32_t)(((uint32_t)(pcs_state))<<SPI_PUSHR_CONT_SHIFT))&SPI_PUSHR_CONT_MASK)
//  284                |SPI_PUSHR_CTAS(0)
//  285                |SPI_PUSHR_PCS(pcsx)
//  286                |data; 
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+16
        ANDS     R2,R2,#0x3F0000
        ORRS     R2,R2,R3, LSL #+31
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R1,R2
        STR      R1,[R0, #+52]
//  287 
//  288   while(!(SPI_SR_REG(spi) & SPI_SR_TCF_MASK));
??SPI_Master_Write_0:
        LDR      R1,[R0, #+44]
        CMP      R1,#+0
        BPL.N    ??SPI_Master_Write_0
//  289   SPI_SR_REG(spi) |= SPI_SR_TCF_MASK ;            //清除发送缓冲标志位
        LDR      R1,[R0, #+44]
        ORRS     R1,R1,#0x80000000
        STR      R1,[R0, #+44]
//  290 }
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     SPIx_Ptr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x4004b014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x4004b018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x4004b01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x80003c01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x9a0a0000

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  291 
//  292 
//  293 
//  294 
// 
//  12 bytes in section .data
// 294 bytes in section .text
// 
// 294 bytes of CODE memory
//  12 bytes of DATA memory
//
//Errors: none
//Warnings: none
