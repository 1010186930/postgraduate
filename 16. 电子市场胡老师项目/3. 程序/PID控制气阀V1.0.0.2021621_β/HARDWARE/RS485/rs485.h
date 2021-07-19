#ifndef __RS485_H
#define __RS485_H			 
#include "sys.h"

#define RX_MAXSIZE 64
#define TX_MAXSIZE 64
	  		  	
extern u8 RS485_RX_BUFF[RX_MAXSIZE]; 		//接收缓冲,最大64个字节
extern u8 RS485_TX_BUFF[TX_MAXSIZE]; 		//发送缓冲,最大64个字节
extern u16 RS485_RX_CNT;   			//接收到的数据长度
extern u16 RS485_TX_CNT;   			//发送的数据长度
extern u8 RS485_FrameFlag;			//帧结束标记
//模式控制
#define RS485_TX_EN		PAout(6)	//485模式控制.0,接收;1,发送.
//如果想串口中断接收，请不要注释以下宏定义
#define EN_USART2_RX 	1			//0,不接收;1,接收.




void RS485_Init(u32 bound);
void RS485_SendData(u8 *buf,u8 len);
void RS485_Receive_Data(u8 *buf,u8 *len);


#endif	   
















