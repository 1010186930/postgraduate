///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\SPI\SP /
//                    I_FLASH.c                                               /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\SPI\SP /
//                    I_FLASH.c -D IAR -D TWR_K60N512 -lCN                    /
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
//                    rld\RAM_128KB\List\SPI_FLASH.s                          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME SPI_FLASH

        #define SHT_PROGBITS 0x1

        EXTERN GPIOx
        EXTERN SPI_Master_WriteRead

        PUBLIC Compare_Mem
        PUBLIC Copy_Char
        PUBLIC Copy_Mem
        PUBLIC Init_Buffer
        PUBLIC SPI_FLASH_BUF
        PUBLIC SPI_FLASH_Write_Disable
        PUBLIC SPI_FLASH_Write_Enable
        PUBLIC SPI_FLASH_Write_SR
        PUBLIC SPI_Flash_Erase_Chip
        PUBLIC SPI_Flash_Erase_Sector
        PUBLIC SPI_Flash_PowerDown
        PUBLIC SPI_Flash_Read
        PUBLIC SPI_Flash_ReadDeviceID
        PUBLIC SPI_Flash_ReadID
        PUBLIC SPI_Flash_ReadSR
        PUBLIC SPI_Flash_WAKEUP
        PUBLIC SPI_Flash_Wait_Busy
        PUBLIC SPI_Flash_Write
        PUBLIC SPI_Flash_Write_NoCheck
        PUBLIC SPI_Flash_Write_Page
        PUBLIC SPIx_ReadWriteByte
        PUBLIC TimingDelay_Decrement
        PUBLIC delay_ms

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\SPI\SPI_FLASH.c
//    1 
//    2 /*************************************************************************
//    3 
//    4 SPI驱动程序：W25X/Q32的驱动程序
//    5 
//    6 //4Kbytes为一个Sector
//    7 //16个扇区为1个Block
//    8 //W25X16
//    9 //容量为2M字节,共有32个Block,512个Sector
//   10 
//   11 
//   12 
//   13 *************************************************************************/
//   14 
//   15 #include "SPI_FLASH.H"
//   16 
//   17 #include "uart.h"
//   18 
//   19 
//   20 /*************************************************
//   21 函数功能：硬件SPI口发送或者接收一个字节数据
//   22 
//   23 *************************************************/
//   24 
//   25 //SPIx 读写一个字节
//   26 //TxData:要写入的字节
//   27 //返回值:读取到的字节

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 unsigned char SPIx_ReadWriteByte(unsigned char TxData)
//   29 {		
SPIx_ReadWriteByte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   30 	
//   31   unsigned char i;
//   32   
//   33   i= SPI_Master_WriteRead(SPI0,TxData,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
        MOVS     R5,R0
//   34   
//   35    return  i;
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//   36 
//   37 }
//   38 
//   39 
//   40 //读取SPI_FLASH的状态寄存器
//   41 //BIT7  6   5   4   3   2   1   0
//   42 //SPR   RV  TB BP2 BP1 BP0 WEL BUSY
//   43 //SPR:默认0,状态寄存器保护位,配合WP使用
//   44 //TB,BP2,BP1,BP0:FLASH区域写保护设置
//   45 //WEL:写使能锁定
//   46 //BUSY:忙标记位(1,忙;0,空闲)
//   47 //默认:0x00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   48 unsigned char SPI_Flash_ReadSR(void)   
//   49 {  
SPI_Flash_ReadSR:
        PUSH     {R4,LR}
//   50   
//   51 	unsigned char byte=0;   
        MOVS     R4,#+0
//   52         
//   53 	SPI_FLASH_CS_LOW(); 
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   54         //使能器件   
//   55 	SPIx_ReadWriteByte(W25X_ReadStatusReg);    //发送读取状态寄存器命令
        MOVS     R0,#+5
        BL       SPIx_ReadWriteByte
//   56         
//   57 	byte=SPIx_ReadWriteByte(0Xff);             //读取一个字节
        MOVS     R0,#+255
        BL       SPIx_ReadWriteByte
        MOVS     R4,R0
//   58  
//   59 	SPI_FLASH_CS_HIGH();                            //取消片选
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   60         
//   61 	return byte;   
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//   62 
//   63 
//   64 } 
//   65 //写SPI_FLASH状态寄存器
//   66 //只有SPR,TB,BP2,BP1,BP0(bit 7,5,4,3,2)可以写!!!

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 void SPI_FLASH_Write_SR(unsigned char sr)   
//   68 { 
SPI_FLASH_Write_SR:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   69 
//   70 
//   71 	SPI_FLASH_CS_LOW();                            //使能器件   
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   72 	SPIx_ReadWriteByte(W25X_WriteStatusReg);   //发送写取状态寄存器命令    
        MOVS     R0,#+1
        BL       SPIx_ReadWriteByte
//   73 	SPIx_ReadWriteByte(sr);               //写入一个字节  
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//   74 	SPI_FLASH_CS_HIGH();                            //取消片选     	      
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   75 
//   76 
//   77 }   
        POP      {R4,PC}          ;; return
//   78 //SPI_FLASH写使能	
//   79 //将WEL置位   

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   80 void SPI_FLASH_Write_Enable(void)   
//   81 {
SPI_FLASH_Write_Enable:
        PUSH     {R7,LR}
//   82 	SPI_FLASH_CS_LOW();                            //使能器件   
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   83     SPIx_ReadWriteByte(W25X_WriteEnable);      //发送写使能  
        MOVS     R0,#+6
        BL       SPIx_ReadWriteByte
//   84 	SPI_FLASH_CS_HIGH();                            //取消片选     	      
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   85 } 
        POP      {R0,PC}          ;; return
//   86 //SPI_FLASH写禁止	
//   87 //将WEL清零  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   88 void SPI_FLASH_Write_Disable(void)   
//   89 {  
SPI_FLASH_Write_Disable:
        PUSH     {R7,LR}
//   90 	SPI_FLASH_CS_LOW();                            //使能器件   
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   91     SPIx_ReadWriteByte(W25X_WriteDisable);     //发送写禁止指令    
        MOVS     R0,#+4
        BL       SPIx_ReadWriteByte
//   92 	SPI_FLASH_CS_HIGH();                            //取消片选     	      
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   93 } 			    
        POP      {R0,PC}          ;; return
//   94 //读取芯片ID W25X16的ID:0XEF14

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   95 unsigned short int SPI_Flash_ReadID(void)
//   96 {
SPI_Flash_ReadID:
        PUSH     {R4,LR}
//   97 	unsigned short int Temp = 0;	  
        MOVS     R4,#+0
//   98 	SPI_FLASH_CS_LOW();				    
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   99 	SPIx_ReadWriteByte(0x90);//发送读取ID命令	    
        MOVS     R0,#+144
        BL       SPIx_ReadWriteByte
//  100 	SPIx_ReadWriteByte(0x00); 	    
        MOVS     R0,#+0
        BL       SPIx_ReadWriteByte
//  101 	SPIx_ReadWriteByte(0x00); 	    
        MOVS     R0,#+0
        BL       SPIx_ReadWriteByte
//  102 	SPIx_ReadWriteByte(0x00); 	 			   
        MOVS     R0,#+0
        BL       SPIx_ReadWriteByte
//  103 	Temp|=SPIx_ReadWriteByte(0x00)<<8;  
        MOVS     R0,#+0
        BL       SPIx_ReadWriteByte
        ORRS     R0,R4,R0, LSL #+8
        MOVS     R4,R0
//  104 	Temp|=SPIx_ReadWriteByte(0xFF);	 
        MOVS     R0,#+255
        BL       SPIx_ReadWriteByte
        ORRS     R0,R0,R4
        MOVS     R4,R0
//  105 	SPI_FLASH_CS_HIGH();				    
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  106 	return Temp;
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,PC}          ;; return
//  107 } 
//  108 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  109 unsigned int  SPI_Flash_ReadDeviceID(void)  	    //读取FLASH ID
//  110 
//  111 {
SPI_Flash_ReadDeviceID:
        PUSH     {R4,LR}
//  112 	unsigned int Temp = 0;	  
        MOVS     R4,#+0
//  113 	SPI_FLASH_CS_LOW();				    
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  114 	SPIx_ReadWriteByte(0x9F);//发送读取ID命令	    
        MOVS     R0,#+159
        BL       SPIx_ReadWriteByte
//  115 	//SPIx_ReadWriteByte(0x00); 	    
//  116 	//SPIx_ReadWriteByte(0x00); 	    
//  117 	//SPIx_ReadWriteByte(0x00); 	 			   
//  118 	Temp|=SPIx_ReadWriteByte(0xFF)<<16;  
        MOVS     R0,#+255
        BL       SPIx_ReadWriteByte
        ORRS     R0,R4,R0, LSL #+16
        MOVS     R4,R0
//  119 	Temp|=SPIx_ReadWriteByte(0xFF)<<8;
        MOVS     R0,#+255
        BL       SPIx_ReadWriteByte
        ORRS     R0,R4,R0, LSL #+8
        MOVS     R4,R0
//  120 	Temp|=SPIx_ReadWriteByte(0xFF);	 
        MOVS     R0,#+255
        BL       SPIx_ReadWriteByte
        ORRS     R0,R0,R4
        MOVS     R4,R0
//  121 	SPI_FLASH_CS_HIGH();
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  122 					    
//  123 	return Temp;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  124 } 
//  125 
//  126   		    
//  127 //读取SPI FLASH  
//  128 //在指定地址开始读取指定长度的数据
//  129 //pBuffer:数据存储区
//  130 //ReadAddr:开始读取的地址(24bit)
//  131 //NumByteToRead:要读取的字节数(最大65535)

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  132 void SPI_Flash_Read(unsigned char* pBuffer,unsigned int ReadAddr,unsigned short int NumByteToRead)//读取SPI FLASH 在指定地址开始读取指定长度的数据   
//  133 { 
SPI_Flash_Read:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  134  	unsigned short int i;    												    
//  135 	SPI_FLASH_CS_LOW();                            			//使能器件   
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  136     SPIx_ReadWriteByte(W25X_ReadData);         				//发送读取命令   
        MOVS     R0,#+3
        BL       SPIx_ReadWriteByte
//  137     SPIx_ReadWriteByte((unsigned char)((ReadAddr)>>16));    //发送24bit地址    
        LSRS     R0,R5,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//  138     SPIx_ReadWriteByte((unsigned char)((ReadAddr)>>8));   
        LSRS     R0,R5,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//  139     SPIx_ReadWriteByte((unsigned char)ReadAddr);   
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//  140     for(i=0;i<NumByteToRead;i++)
        MOVS     R0,#+0
        MOVS     R7,R0
??SPI_Flash_Read_0:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R7,R6
        BCS.N    ??SPI_Flash_Read_1
//  141 	{ 
//  142         pBuffer[i]=SPIx_ReadWriteByte(0XFF);   				//循环读数  
        MOVS     R0,#+255
        BL       SPIx_ReadWriteByte
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        STRB     R0,[R7, R4]
//  143     }
        ADDS     R7,R7,#+1
        B.N      ??SPI_Flash_Read_0
//  144 	SPI_FLASH_CS_HIGH();                            		//取消片选     	      
??SPI_Flash_Read_1:
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  145 }  
        POP      {R0,R4-R7,PC}    ;; return
//  146 //SPI在一页(0~65535)内写入少于256个字节的数据
//  147 //在指定地址开始写入最大256字节的数据
//  148 //pBuffer:数据存储区
//  149 //WriteAddr:开始写入的地址(24bit)
//  150 //NumByteToWrite:要写入的字节数(最大256),该数不应该超过该页的剩余字节数!!!	 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  151 void SPI_Flash_Write_Page(unsigned char* pBuffer,unsigned int WriteAddr,unsigned short int NumByteToWrite)//SPI在一页(0~65535)内写入少于256个字节的数据
//  152 {
SPI_Flash_Write_Page:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  153  	unsigned short int i;  
//  154     SPI_FLASH_Write_Enable();                  					//SET WEL 
        BL       SPI_FLASH_Write_Enable
//  155 	SPI_FLASH_CS_LOW();                            				//使能器件   
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  156     SPIx_ReadWriteByte(W25X_PageProgram);      					//发送写页命令   
        MOVS     R0,#+2
        BL       SPIx_ReadWriteByte
//  157     SPIx_ReadWriteByte((unsigned char)((WriteAddr)>>16)); 		//发送24bit地址    
        LSRS     R0,R5,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//  158     SPIx_ReadWriteByte((unsigned char)((WriteAddr)>>8));   
        LSRS     R0,R5,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//  159     SPIx_ReadWriteByte((unsigned char)WriteAddr);   
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//  160     for(i=0;i<NumByteToWrite;i++)SPIx_ReadWriteByte(pBuffer[i]);//循环写数  
        MOVS     R0,#+0
        MOVS     R7,R0
??SPI_Flash_Write_Page_0:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R7,R6
        BCS.N    ??SPI_Flash_Write_Page_1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRB     R0,[R7, R4]
        BL       SPIx_ReadWriteByte
        ADDS     R7,R7,#+1
        B.N      ??SPI_Flash_Write_Page_0
//  161 	SPI_FLASH_CS_HIGH();                            			//取消片选 
??SPI_Flash_Write_Page_1:
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  162 	SPI_Flash_Wait_Busy();					   					//等待写入结束
        BL       SPI_Flash_Wait_Busy
//  163 } 
        POP      {R0,R4-R7,PC}    ;; return
//  164 //无检验写SPI FLASH 
//  165 //必须确保所写的地址范围内的数据全部为0XFF,否则在非0XFF处写入的数据将失败!
//  166 //具有自动换页功能 
//  167 //在指定地址开始写入指定长度的数据,但是要确保地址不越界!
//  168 //pBuffer:数据存储区
//  169 //WriteAddr:开始写入的地址(24bit)
//  170 //NumByteToWrite:要写入的字节数(最大65535)
//  171 //CHECK OK

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  172 void SPI_Flash_Write_NoCheck(unsigned char* pBuffer,unsigned int WriteAddr,unsigned short int NumByteToWrite)   
//  173 { 			 		 
SPI_Flash_Write_NoCheck:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
//  174 	unsigned short int pageremain;	   
//  175 	pageremain=256-WriteAddr%256; //单页剩余的字节数		 	    
        MOV      R0,#+256
        MOV      R1,#+256
        UDIV     R2,R6,R1
        MLS      R2,R2,R1,R6
        SUBS     R0,R0,R2
        MOVS     R4,R0
//  176 	if(NumByteToWrite<=pageremain)pageremain=NumByteToWrite;//不大于256个字节
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R4,R7
        BCC.N    ??SPI_Flash_Write_NoCheck_0
        MOVS     R4,R7
//  177 	while(1)
//  178 	{	   
//  179 		SPI_Flash_Write_Page(pBuffer,WriteAddr,pageremain);
??SPI_Flash_Write_NoCheck_0:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        MOVS     R0,R5
        BL       SPI_Flash_Write_Page
//  180 		if(NumByteToWrite==pageremain)break;//写入结束了
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R7,R4
        BEQ.N    ??SPI_Flash_Write_NoCheck_1
//  181 	 	else //NumByteToWrite>pageremain
//  182 		{
//  183 			pBuffer+=pageremain;
//  184 			WriteAddr+=pageremain;	
//  185 
//  186 			NumByteToWrite-=pageremain;			  //减去已经写入了的字节数
//  187 			if(NumByteToWrite>256)pageremain=256; //一次可以写入256个字节
//  188 			else pageremain=NumByteToWrite; 	  //不够256个字节了
//  189 		}
//  190 	};	    
//  191 } 
??SPI_Flash_Write_NoCheck_2:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADDS     R5,R4,R5
        UXTAH    R6,R6,R4
        SUBS     R7,R7,R4
        MOVW     R0,#+257
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,R0
        BCC.N    ??SPI_Flash_Write_NoCheck_3
        MOV      R0,#+256
        MOVS     R4,R0
        B.N      ??SPI_Flash_Write_NoCheck_0
??SPI_Flash_Write_NoCheck_3:
        MOVS     R4,R7
        B.N      ??SPI_Flash_Write_NoCheck_0
??SPI_Flash_Write_NoCheck_1:
        POP      {R0,R4-R7,PC}    ;; return
//  192 //写SPI FLASH  
//  193 //在指定地址开始写入指定长度的数据
//  194 //该函数带擦除操作!
//  195 //pBuffer:数据存储区
//  196 //WriteAddr:开始写入的地址(24bit)
//  197 //NumByteToWrite:要写入的字节数(最大65535)  		   
//  198 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  199 unsigned char SPI_FLASH_BUF[4096];
SPI_FLASH_BUF:
        DS8 4096
//  200 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  201 void SPI_Flash_Write(unsigned char* pBuffer,unsigned int WriteAddr,unsigned short int NumByteToWrite)   
//  202 { 
SPI_Flash_Write:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  203 	unsigned int secpos;
//  204 	unsigned short int secoff;
//  205 	unsigned short int secremain;	   
//  206  	unsigned short int i;    
//  207 	
//  208 
//  209 
//  210 	secpos=WriteAddr/4096;//扇区地址 0~511 for w25x16
        LSRS     R0,R5,#+12
        MOVS     R7,R0
//  211 	secoff=WriteAddr%4096;//在扇区内的偏移
        MOV      R0,#+4096
        UDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        MOV      R8,R1
//  212 	secremain=4096-secoff;//扇区剩余空间大小   
        RSBS     R0,R8,#+4096
        MOV      R9,R0
//  213 
//  214 	if(NumByteToWrite<=secremain)secremain=NumByteToWrite;//不大于4096个字节
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R9,R6
        BCC.N    ??SPI_Flash_Write_0
        MOV      R9,R6
//  215 	while(1) 
//  216 	{	
//  217 		SPI_Flash_Read(SPI_FLASH_BUF,secpos*4096,4096);//读出整个扇区的内容
??SPI_Flash_Write_0:
        MOV      R2,#+4096
        MOV      R0,#+4096
        MUL      R1,R0,R7
        LDR.N    R0,??DataTable13_1
        BL       SPI_Flash_Read
//  218 		for(i=0;i<secremain;i++)//校验数据
        MOVS     R0,#+0
        MOV      R10,R0
??SPI_Flash_Write_1:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R10,R9
        BCS.N    ??SPI_Flash_Write_2
//  219 		{
//  220 			if(SPI_FLASH_BUF[secoff+i]!=0XFF)break;//需要擦除  	  
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        UXTAH    R0,R10,R8
        LDR.N    R1,??DataTable13_1
        LDRB     R0,[R0, R1]
        CMP      R0,#+255
        BNE.N    ??SPI_Flash_Write_2
//  221 		}
??SPI_Flash_Write_3:
        ADDS     R10,R10,#+1
        B.N      ??SPI_Flash_Write_1
//  222 		if(i<secremain)//需要擦除
??SPI_Flash_Write_2:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R10,R9
        BCS.N    ??SPI_Flash_Write_4
//  223 		{
//  224 			SPI_Flash_Erase_Sector(secpos);//擦除这个扇区
        MOVS     R0,R7
        BL       SPI_Flash_Erase_Sector
//  225 			for(i=0;i<secremain;i++)	   //复制
        MOVS     R0,#+0
        MOV      R10,R0
??SPI_Flash_Write_5:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R10,R9
        BCS.N    ??SPI_Flash_Write_6
//  226 			{
//  227 				SPI_FLASH_BUF[i+secoff]=pBuffer[i];	  
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTAH    R0,R8,R10
        LDR.N    R1,??DataTable13_1
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        LDRB     R2,[R10, R4]
        STRB     R2,[R0, R1]
//  228 			}
        ADDS     R10,R10,#+1
        B.N      ??SPI_Flash_Write_5
//  229 			SPI_Flash_Write_NoCheck(SPI_FLASH_BUF,secpos*4096,4096);//写入整个扇区  
??SPI_Flash_Write_6:
        MOV      R2,#+4096
        MOV      R0,#+4096
        MUL      R1,R0,R7
        LDR.N    R0,??DataTable13_1
        BL       SPI_Flash_Write_NoCheck
        B.N      ??SPI_Flash_Write_7
//  230 
//  231 		}else SPI_Flash_Write_NoCheck(pBuffer,WriteAddr,secremain);//写已经擦除了的,直接写入扇区剩余区间. 				   
??SPI_Flash_Write_4:
        MOV      R2,R9
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        MOVS     R0,R4
        BL       SPI_Flash_Write_NoCheck
//  232 		if(NumByteToWrite==secremain)break;//写入结束了
??SPI_Flash_Write_7:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R6,R9
        BEQ.N    ??SPI_Flash_Write_8
//  233 		else//写入未结束
//  234 		{
//  235 			secpos++;//扇区地址增1
//  236 			secoff=0;//偏移位置为0 	 
//  237 
//  238 		   	pBuffer+=secremain;  //指针偏移
//  239 			WriteAddr+=secremain;//写地址偏移	   
//  240 		   	NumByteToWrite-=secremain;				//字节数递减
//  241 			if(NumByteToWrite>4096)secremain=4096;	//下一个扇区还是写不完
//  242 			else secremain=NumByteToWrite;			//下一个扇区可以写完了
//  243 		}	 
//  244 	};	 	 
//  245 }
??SPI_Flash_Write_9:
        ADDS     R7,R7,#+1
        MOVS     R0,#+0
        MOV      R8,R0
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADDS     R4,R9,R4
        UXTAH    R5,R5,R9
        SUBS     R6,R6,R9
        MOVW     R0,#+4097
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R0
        BCC.N    ??SPI_Flash_Write_10
        MOV      R0,#+4096
        MOV      R9,R0
        B.N      ??SPI_Flash_Write_0
??SPI_Flash_Write_10:
        MOV      R9,R6
        B.N      ??SPI_Flash_Write_0
??SPI_Flash_Write_8:
        POP      {R4-R10,PC}      ;; return
//  246 //擦除整个芯片
//  247 //整片擦除时间:
//  248 //W25X16:25s 
//  249 //W25X32:40s 
//  250 //W25X64:40s 
//  251 //等待时间超长...

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  252 void SPI_Flash_Erase_Chip(void)   
//  253 {                                             
SPI_Flash_Erase_Chip:
        PUSH     {R7,LR}
//  254     SPI_FLASH_Write_Enable();                  //SET WEL 
        BL       SPI_FLASH_Write_Enable
//  255     SPI_Flash_Wait_Busy();   
        BL       SPI_Flash_Wait_Busy
//  256   	SPI_FLASH_CS_LOW();                        //使能器件   
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  257     SPIx_ReadWriteByte(W25X_ChipErase);        //发送片擦除命令  
        MOVS     R0,#+199
        BL       SPIx_ReadWriteByte
//  258 	SPI_FLASH_CS_HIGH();                       //取消片选     	      
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  259 	SPI_Flash_Wait_Busy();   				   //等待芯片擦除结束
        BL       SPI_Flash_Wait_Busy
//  260 }   
        POP      {R0,PC}          ;; return
//  261 //擦除一个扇区
//  262 //Dst_Addr:扇区地址 0~511 for w25x16
//  263 //擦除一个扇区的最少时间:150ms

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  264 void SPI_Flash_Erase_Sector(unsigned int Dst_Addr)   
//  265 {   
SPI_Flash_Erase_Sector:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  266 	Dst_Addr*=4096;
        MOV      R0,#+4096
        MULS     R4,R0,R4
//  267     SPI_FLASH_Write_Enable();                  //SET WEL 	 
        BL       SPI_FLASH_Write_Enable
//  268     SPI_Flash_Wait_Busy();   
        BL       SPI_Flash_Wait_Busy
//  269   	SPI_FLASH_CS_LOW();                            //使能器件   
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  270     SPIx_ReadWriteByte(W25X_SectorErase);      //发送扇区擦除指令 
        MOVS     R0,#+32
        BL       SPIx_ReadWriteByte
//  271     SPIx_ReadWriteByte((unsigned char)((Dst_Addr)>>16));  //发送24bit地址    
        LSRS     R0,R4,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//  272     SPIx_ReadWriteByte((unsigned char)((Dst_Addr)>>8));   
        LSRS     R0,R4,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//  273     SPIx_ReadWriteByte((unsigned char)Dst_Addr);  
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPIx_ReadWriteByte
//  274 	SPI_FLASH_CS_HIGH();                            //取消片选     	      
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  275     SPI_Flash_Wait_Busy();   				   //等待擦除完成
        BL       SPI_Flash_Wait_Busy
//  276 }  
        POP      {R4,PC}          ;; return
//  277 //等待空闲

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  278 void SPI_Flash_Wait_Busy(void)   
//  279 {   
SPI_Flash_Wait_Busy:
        PUSH     {R7,LR}
//  280 	
//  281 	while ((SPI_Flash_ReadSR()&0x01)==0x01);   // 等待BUSY位清空
??SPI_Flash_Wait_Busy_0:
        BL       SPI_Flash_ReadSR
        LSLS     R0,R0,#+31
        BMI.N    ??SPI_Flash_Wait_Busy_0
//  282 
//  283 }
        POP      {R0,PC}          ;; return
//  284 
//  285   
//  286 //进入掉电模式

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  287 void SPI_Flash_PowerDown(void)   
//  288 { 
SPI_Flash_PowerDown:
        PUSH     {R7,LR}
//  289   	SPI_FLASH_CS_LOW();                            //使能器件   
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  290     SPIx_ReadWriteByte(W25X_PowerDown);        //发送掉电命令  
        MOVS     R0,#+185
        BL       SPIx_ReadWriteByte
//  291 	SPI_FLASH_CS_HIGH();                            //取消片选     	      
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  292     delay_ms(1);                               //等待TPD  
        MOVS     R0,#+1
        BL       delay_ms
//  293 }   
        POP      {R0,PC}          ;; return
//  294 //唤醒

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  295 void SPI_Flash_WAKEUP(void)   
//  296 {  
SPI_Flash_WAKEUP:
        PUSH     {R7,LR}
//  297   	SPI_FLASH_CS_LOW();                            //使能器件   
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  298     SPIx_ReadWriteByte(W25X_ReleasePowerDown);   //  send W25X_PowerDown command 0xAB    
        MOVS     R0,#+171
        BL       SPIx_ReadWriteByte
//  299 	SPI_FLASH_CS_HIGH();                            //取消片选     	      
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  300     delay_ms(1);                               //等待TRES1
        MOVS     R0,#+1
        BL       delay_ms
//  301 }   
        POP      {R0,PC}          ;; return
//  302 
//  303 
//  304 //使用SysTick的普通计数模式对延迟进行管理
//  305 //包括delay_us,delay_ms
//  306 //2010/5/27

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  307 static unsigned int TimingDelay;
TimingDelay:
        DS8 4
//  308 
//  309 
//  310  /**
//  311   * @brief  Inserts a delay time.
//  312   * @param nTime: specifies the delay time length, in milliseconds.
//  313   * @retval : None
//  314   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  315 void delay_ms(unsigned int nTime)
//  316 { 
//  317  while(--nTime);
delay_ms:
??delay_ms_0:
        SUBS     R0,R0,#+1
        CMP      R0,#+0
        BNE.N    ??delay_ms_0
//  318 
//  319  
//  320 }
        BX       LR               ;; return
//  321 
//  322 /**
//  323   * @brief  Decrements the TimingDelay variable.
//  324   * @param  None
//  325   * @retval : None
//  326   */
//  327 
//  328 
//  329 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  330 void TimingDelay_Decrement(void)
//  331 {
//  332   if (TimingDelay != 0x00)
TimingDelay_Decrement:
        LDR.N    R0,??DataTable13_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??TimingDelay_Decrement_0
//  333   { 
//  334     TimingDelay--;
        LDR.N    R0,??DataTable13_2
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable13_2
        STR      R0,[R1, #+0]
//  335   }
//  336 }
??TimingDelay_Decrement_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     GPIOx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     SPI_FLASH_BUF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     TimingDelay
//  337 
//  338 
//  339 
//  340 
//  341 
//  342  /**********************************初始化缓冲区为0x0或者0xFF**********************************/ 
//  343  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  344 void Init_Buffer (unsigned char *P,unsigned int Count,unsigned char Type) 
//  345 
//  346 {
Init_Buffer:
        PUSH     {R4}
//  347   unsigned int i;
//  348   
//  349    if(Type==0)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BNE.N    ??Init_Buffer_0
//  350    {
//  351    
//  352      for(i=0;i<Count;i++)*P++=0x0;
        MOVS     R4,#+0
        MOVS     R3,R4
??Init_Buffer_1:
        CMP      R3,R1
        BCS.N    ??Init_Buffer_2
        MOVS     R4,#+0
        STRB     R4,[R0, #+0]
        ADDS     R0,R0,#+1
        ADDS     R3,R3,#+1
        B.N      ??Init_Buffer_1
//  353    
//  354    }
//  355    else
//  356    {
//  357      for(i=0;i<Count;i++)*P++=0xFF;
??Init_Buffer_0:
        MOVS     R4,#+0
        MOVS     R3,R4
??Init_Buffer_3:
        CMP      R3,R1
        BCS.N    ??Init_Buffer_2
        MOVS     R4,#+255
        STRB     R4,[R0, #+0]
        ADDS     R0,R0,#+1
        ADDS     R3,R3,#+1
        B.N      ??Init_Buffer_3
//  358 
//  359    }
//  360 
//  361 }
??Init_Buffer_2:
        POP      {R4}
        BX       LR               ;; return
//  362 
//  363 
//  364 
//  365 
//  366 /**************************************************************************************
//  367   函数功能：内存拷贝函数
//  368 
//  369 **************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  370 void Copy_Mem (unsigned char *P1, const unsigned char *P2,unsigned int Count)
//  371 {
Copy_Mem:
        PUSH     {R4}
//  372    
//  373    unsigned int i ;
//  374    for(i=0;i<Count;i++)*P1++=*P2++;
        MOVS     R4,#+0
        MOVS     R3,R4
??Copy_Mem_0:
        CMP      R3,R2
        BCS.N    ??Copy_Mem_1
        LDRB     R4,[R1, #+0]
        STRB     R4,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
        ADDS     R3,R3,#+1
        B.N      ??Copy_Mem_0
//  375 
//  376   
//  377 }
??Copy_Mem_1:
        POP      {R4}
        BX       LR               ;; return
//  378 
//  379 
//  380 /**************************************************************************************
//  381   函数功能：内存拷贝函数
//  382 
//  383 **************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  384 void Copy_Char (unsigned char *P1, unsigned char *P2,unsigned int Count)
//  385 {
Copy_Char:
        PUSH     {R4}
//  386    
//  387    unsigned int i ;
//  388    for(i=0;i<Count;i++)*P1++=*P2++;
        MOVS     R4,#+0
        MOVS     R3,R4
??Copy_Char_0:
        CMP      R3,R2
        BCS.N    ??Copy_Char_1
        LDRB     R4,[R1, #+0]
        STRB     R4,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
        ADDS     R3,R3,#+1
        B.N      ??Copy_Char_0
//  389 
//  390   
//  391 }
??Copy_Char_1:
        POP      {R4}
        BX       LR               ;; return
//  392 
//  393 
//  394 
//  395 
//  396 /**************************************************************************************
//  397   函数功能：内存比较函数函数
//  398   比较指针指向的两个缓冲区的数据是否一样
//  399   一样返回值为：  0
//  400   不一样返回值为：1
//  401 
//  402 ***************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  403 unsigned char Compare_Mem (unsigned char *P1,unsigned char *P2,unsigned int Count)
//  404 {
Compare_Mem:
        PUSH     {R4,R5}
        MOVS     R3,R0
//  405    
//  406    unsigned int i ;
//  407    
//  408    for(i=0;i<Count;i++)
        MOVS     R0,#+0
        MOVS     R4,R0
??Compare_Mem_0:
        CMP      R4,R2
        BCS.N    ??Compare_Mem_1
//  409    {
//  410     
//  411      if(*P1==*P2)
        LDRB     R0,[R3, #+0]
        LDRB     R5,[R1, #+0]
        CMP      R0,R5
        BNE.N    ??Compare_Mem_2
//  412      {
//  413        
//  414        P1++;
        ADDS     R3,R3,#+1
//  415        
//  416        P2++;
        ADDS     R1,R1,#+1
//  417        
//  418      }
        ADDS     R4,R4,#+1
        B.N      ??Compare_Mem_0
//  419      else
//  420      {
//  421        return 1;
??Compare_Mem_2:
        MOVS     R0,#+1
        B.N      ??Compare_Mem_3
//  422             
//  423      }
//  424      
//  425    };
//  426     return 0;
??Compare_Mem_1:
        MOVS     R0,#+0
??Compare_Mem_3:
        POP      {R4,R5}
        BX       LR               ;; return
//  427   
//  428 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  429 
//  430 
//  431 
//  432 
//  433 
//  434 
//  435 
//  436 
//  437 
//  438 
//  439 
//  440 
//  441 
//  442 
//  443 
//  444 
//  445 
//  446 
//  447 
//  448 
//  449 
//  450 
//  451 
//  452 
//  453 
//  454 
//  455 
//  456 
//  457 
//  458 
//  459 
// 
// 4 100 bytes in section .bss
// 1 402 bytes in section .text
// 
// 1 402 bytes of CODE memory
// 4 100 bytes of DATA memory
//
//Errors: none
//Warnings: none
