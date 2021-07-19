#ifndef __RS485_H
#define __RS485_H			 
#include "sys.h"

#define RX_MAXSIZE 64
#define TX_MAXSIZE 64
	  		  	
extern u8 RS485_RX_BUFF[RX_MAXSIZE]; 		//���ջ���,���64���ֽ�
extern u8 RS485_TX_BUFF[TX_MAXSIZE]; 		//���ͻ���,���64���ֽ�
extern u16 RS485_RX_CNT;   			//���յ������ݳ���
extern u16 RS485_TX_CNT;   			//���͵����ݳ���
extern u8 RS485_FrameFlag;			//֡�������
//ģʽ����
#define RS485_TX_EN		PAout(6)	//485ģʽ����.0,����;1,����.
//����봮���жϽ��գ��벻Ҫע�����º궨��
#define EN_USART2_RX 	1			//0,������;1,����.




void RS485_Init(u32 bound);
void RS485_SendData(u8 *buf,u8 len);
void RS485_Receive_Data(u8 *buf,u8 *len);


#endif	   
















