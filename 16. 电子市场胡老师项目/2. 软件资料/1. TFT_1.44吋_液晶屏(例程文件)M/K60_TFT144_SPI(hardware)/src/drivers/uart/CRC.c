#include  "CRC.H"


//CRC使用
 typedef struct                
   {                             
	 unsigned char	 L;             
	 unsigned char	 H;              
   } INT_08BIT_2;  

 typedef union                  
  {	                            
    unsigned short     int  Int16Bit;       
	INT_08BIT_2  Int08Bit;       
  } INT_16BIT_08BIT; 



unsigned short     int const CRC_Tab[] =  {
//CRCTB1: ;?256??
	0x00000,0x01021,0x02042,0x03063,
	0x04084,0x050a5,0x060c6,0x070e7,
	0x08108,0x09129,0x0a14a,0x0b16b,
	0x0c18c,0x0d1ad,0x0e1ce,0x0f1ef,
	0x01231,0x00210,0x03273,0x02252,
	0x052b5,0x04294,0x072f7,0x062d6,
	0x09339,0x08318,0x0b37b,0x0a35a,
	0x0d3bd,0x0c39c,0x0f3ff,0x0e3de,
	0x02462,0x03443,0x00420,0x01401,
	0x064e6,0x074c7,0x044a4,0x05485,
	0x0a56a,0x0b54b,0x08528,0x09509,
	0x0e5ee,0x0f5cf,0x0c5ac,0x0d58d,
	0x03653,0x02672,0x01611,0x00630,
	0x076d7,0x066f6,0x05695,0x046b4,
	0x0b75b,0x0a77a,0x09719,0x08738,
	0x0f7df,0x0e7fe,0x0d79d,0x0c7bc,
	0x048c4,0x058e5,0x06886,0x078a7,
	0x00840,0x01861,0x02802,0x03823,
	0x0c9cc,0x0d9ed,0x0e98e,0x0f9af,
	0x08948,0x09969,0x0a90a,0x0b92b,
	0x05af5,0x04ad4,0x07ab7,0x06a96,
	0x01a71,0x00a50,0x03a33,0x02a12,
	0x0dbfd,0x0cbdc,0x0fbbf,0x0eb9e,
	0x09b79,0x08b58,0x0bb3b,0x0ab1a,
	0x06ca6,0x07c87,0x04ce4,0x05cc5,
	0x02c22,0x03c03,0x00c60,0x01c41,
	0x0edae,0x0fd8f,0x0cdec,0x0ddcd,
	0x0ad2a,0x0bd0b,0x08d68,0x09d49,
	0x07e97,0x06eb6,0x05ed5,0x04ef4,
	0x03e13,0x02e32,0x01e51,0x00e70,
	0x0ff9f,0x0efbe,0x0dfdd,0x0cffc,
	0x0bf1b,0x0af3a,0x09f59,0x08f78,
//CRCTB2: ;?256??
	0x09188,0x081a9,0x0b1ca,0x0a1eb,
	0x0d10c,0x0c12d,0x0f14e,0x0e16f,
	0x01080,0x000a1,0x030c2,0x020e3,
	0x05004,0x04025,0x07046,0x06067,
	0x083b9,0x09398,0x0a3fb,0x0b3da,
	0x0c33d,0x0d31c,0x0e37f,0x0f35e,
	0x002b1,0x01290,0x022f3,0x032d2,
	0x04235,0x05214,0x06277,0x07256,
	0x0b5ea,0x0a5cb,0x095a8,0x08589,
	0x0f56e,0x0e54f,0x0d52c,0x0c50d,
	0x034e2,0x024c3,0x014a0,0x00481,
	0x07466,0x06447,0x05424,0x04405,
	0x0a7db,0x0b7fa,0x08799,0x097b8,
	0x0e75f,0x0f77e,0x0c71d,0x0d73c,
	0x026d3,0x036f2,0x00691,0x016b0,
	0x06657,0x07676,0x04615,0x05634,
	0x0d94c,0x0c96d,0x0f90e,0x0e92f,
	0x099c8,0x089e9,0x0b98a,0x0a9ab,
	0x05844,0x04865,0x07806,0x06827,
	0x018c0,0x008e1,0x03882,0x028a3,
	0x0cb7d,0x0db5c,0x0eb3f,0x0fb1e,
	0x08bf9,0x09bd8,0x0abbb,0x0bb9a,
	0x04a75,0x05a54,0x06a37,0x07a16,
	0x00af1,0x01ad0,0x02ab3,0x03a92,
	0x0fd2e,0x0ed0f,0x0dd6c,0x0cd4d,
	0x0bdaa,0x0ad8b,0x09de8,0x08dc9,
	0x07c26,0x06c07,0x05c64,0x04c45,
	0x03ca2,0x02c83,0x01ce0,0x00cc1,
	0x0ef1f,0x0ff3e,0x0cf5d,0x0df7c,
	0x0af9b,0x0bfba,0x08fd9,0x09ff8,
	0x06e17,0x07e36,0x04e55,0x05e74,
	0x02e93,0x03eb2,0x00ed1,0x01ef0
                               };


/*
**************************************************************************************************************
*										      CRC 校 验
* 描 述:  校验一串char数据的CRC
*
* 输 入:  CPU_CHAR   *str  		- 要校验数据的指针
*         CPU_INT16U size		- 要校验数据的长度
*		  CPU_INT08U mode		- 校验的模式
*						         1:  为该串数据增加CRC校验  同时返回校验的CRC值
*							     0:  该串数据是否通过校验	返回校验的CRC值
* 返 回:
*
* 注 意:
*
**************************************************************************************************************
*/
 unsigned short     int AH_CRC_Verify( unsigned char *str, unsigned short     int size, unsigned char mode )
  {          
    unsigned int       i;
	INT_16BIT_08BIT	 crc;
	INT_16BIT_08BIT	 y;

	crc.Int16Bit = 0;

	for( i = 0 ; i < size ; i++ )
	 {
		y.Int16Bit    = CRC_Tab[ str[ i ] ^ crc.Int08Bit.H ];
		y.Int08Bit.H ^= crc.Int08Bit.L;
		crc.Int16Bit  = y.Int16Bit;
	 }
	if( mode == 1 )
	 {
		str[ i++ ] = y.Int08Bit.H ;
		str[ i ]   = y.Int08Bit.L ;
	 }

	return( crc.Int16Bit );
  } 




/*
****************************************************
*		数 据 全0 全F 判 断
*
* 描 述:  对一串数据进行全0全F判断，主要是进行FLASH校验使用。
*
* 输 入:  CPU_CHAR   *str  		- 要校验数据的指针
*         CPU_INT32U size		- 要校验数据的长度
*
* 返 回:  0x00  数据为全0
*         0xFF  数据为全F
*         0x01  数据非0
*
****************************************************
*/
unsigned int AH_Full_0F_Verify( unsigned char *str, unsigned int size )
  {
    unsigned int i;

    for( i = 0; i < size; i++ )
     {                                                 /* 全0判断          (1)                               */
       if( str[i] != 0x00 )                       
        { break; }
     }
    if( i == size )                                    /* 数据为全0                                          */
     { return 0x00; } 
    for( i = 0; i < size; i++ )
     {                                                 /* 全F判断          (2)                               */
       if( str[i] != 0xFF )                       
        { break; }
     }
    if( i == size )                                    /* 数据为全F                                          */
     { return 0xFF; } 

    return 0x01;
  }


 unsigned char CRC_CHECK ( unsigned char *strFrame, unsigned char crc_longth )
  {
    unsigned int i;
	INT_16BIT_08BIT crc ;
	INT_16BIT_08BIT y ;
	crc.Int16Bit = 0 ;
	for( i = 0 ; i < crc_longth ; i++ )
	 {
		y.Int16Bit    = CRC_Tab[ *strFrame ^ crc.Int08Bit.H ] ;
		y.Int08Bit.H ^= crc.Int08Bit.L ;
		crc.Int16Bit  = y.Int16Bit ;
        strFrame++;
	 }
    crc.Int08Bit.H ^= crc.Int08Bit.L ;
	return ( crc.Int08Bit.H ) ;
  }

/***********************************************
函数功能：对数组中的元素进行异或
入口参数：buffer,数组首地址；length,数组长度
***********************************************/
unsigned char XOR(unsigned char *buffer,unsigned char length)
{
	unsigned char result;
	unsigned char i;
	result =0;
	for(i =0;i< length;i++)
	{
		result ^=buffer[i];
	}
  return(result);
}
void CalCrc16(unsigned char* input, unsigned char* Crc16, unsigned int len)   
{
	unsigned int temp=0x6363;
    unsigned int i;
    unsigned char j;

	for( i=0; i<len; i++ )
	{	
	  temp = temp ^((unsigned int)input[i]);
	  for (j = 0; j < 8; j++)
	  {
		if (temp & 0x0001)
		{
		  temp = (temp >> 1) ^ 0x8408;
	        }
		else
		{
		  temp = (temp >> 1);
		}
	  }
	}
	Crc16[0] = (unsigned char)(temp);
  	Crc16[1] = (unsigned char)(temp>>8);
} 
//*----------------------------------------------------------------------------
//* Function Name       : BE4StrToInt
//* Object              : 4字节HEX字符串变化INT
//* Input Parameters    : none
//* Output Parameters   : none
//* Functions called    : none
//*----------------------------------------------------------------------------
unsigned int BE4StrToInt(unsigned char *str)
{	
	int i;
	char * p;
	p = (char*)&i;
	*(p+0)=*(str+3);	
	*(p+1)=*(str+2);	
	*(p+2)=*(str+1);	
	*(p+3)=*(str+0);	
	return i;
}
