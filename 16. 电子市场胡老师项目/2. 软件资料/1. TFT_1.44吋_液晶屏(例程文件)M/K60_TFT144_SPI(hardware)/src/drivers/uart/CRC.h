#ifndef   __CRC_H
#define   __CRC_H    1

#include "stdio.h"

/*
**************************************************************************************************************
*										    函  数
**************************************************************************************************************
*/
 extern  unsigned short int  AH_CRC_Verify( unsigned char  *str, unsigned short int size, unsigned char mode ); /* 校验数据的CRC      */
 extern  unsigned int  AH_Full_0F_Verify( unsigned char  *str, unsigned int  size );              /* 全0全F校验         */
 extern  unsigned char  CRC_CHECK ( unsigned char *strFrame, unsigned char crc_longth );        /*  */                                                                              

#endif
//数据结构定义

