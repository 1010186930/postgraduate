

/*********************************************************************************

 
SPI驱动程序头文件







**********************************************************************************/





#ifndef   __SPI_FLASH_H 
#define   __SPI_FLASH_H     1


#include"common.h"

/*********************************************************************** 
   SPI引脚定义
 
    MOSI  ---        
 
    MISO  ---        
 
    SCLK  ---        
 
     CS  ---         
 
************************************************************************/



/* Select SPI FLASH: Chip Select pin low  */
#define SPI_FLASH_CS_LOW()       GPIO_SET(PORTC,0,0)  
/* Deselect SPI FLASH: Chip Select pin high */
#define SPI_FLASH_CS_HIGH()      GPIO_SET(PORTC,0,1)  
//W25X16读写
#define FLASH_ID 0XEF14
//指令表
#define W25X_WriteEnable		0x06 
#define W25X_WriteDisable		0x04 
#define W25X_ReadStatusReg		0x05 
#define W25X_WriteStatusReg		0x01 
#define W25X_ReadData			0x03 
#define W25X_FastReadData		0x0B 
#define W25X_FastReadDual		0x3B 
#define W25X_PageProgram		0x02 
#define W25X_BlockErase			0xD8 
#define W25X_SectorErase		0x20 
#define W25X_ChipErase			0xC7 
#define W25X_PowerDown			0xB9 
#define W25X_ReleasePowerDown	0xAB 
#define W25X_DeviceID			0xAB 
#define W25X_ManufactDeviceID	0x90 
#define W25X_JedecDeviceID		0x9F 

void SysTick_init(void);
void delay_ms(unsigned int nTime);
void TimingDelay_Decrement(void);


void SPI_Flash_Init(void);
unsigned short int  SPI_Flash_ReadID(void);  	    //读取FLASH ID
unsigned int  SPI_Flash_ReadDeviceID(void);  	    //读取FLASH ID

unsigned char	 SPI_Flash_ReadSR(void);        //读取状态寄存器 
void SPI_FLASH_Write_SR(unsigned char sr);  	//写状态寄存器
void SPI_FLASH_Write_Enable(void);  //写使能 
void SPI_FLASH_Write_Disable(void);	//写保护

void SPI_Flash_Write_Page(unsigned char* pBuffer,unsigned int WriteAddr,unsigned short int NumByteToWrite);//SPI在一页(0~65535)内写入少于256个字节的数据

void SPI_Flash_Read(unsigned char* pBuffer,unsigned int ReadAddr,unsigned short int NumByteToRead);   //读取flash
void SPI_Flash_Write(unsigned char* pBuffer,unsigned int WriteAddr,unsigned short int NumByteToWrite);//写入flash
void SPI_Flash_Erase_Chip(void);    	  //整片擦除
void SPI_Flash_Erase_Sector(unsigned int Dst_Addr);//扇区擦除
void SPI_Flash_Wait_Busy(void);           //等待空闲
void SPI_Flash_PowerDown(void);           //进入掉电模式
void SPI_Flash_WAKEUP(void);			  //唤醒

void TestFlash (void);//测试Flash

#endif

