////////////////////////////////////////////Copyright (c)//////////////////////////////////////////
//                                      ���� ���޹�˾
//                                         Ӳ    ��    ��
//
//                                     http://www.xxx.com
//
//-------------- �ļ���Ϣ--------------------------------------------------------------------------
// �� �� ��:    data_type.h
// �ļ�����:    ͨ��Э�鴦��Ԫ
// ��    ��:    V1.0 
// �� �� ��:    fazl
// ��������:    2013.09.29
//=================================================================================================
//-------------- �޸ļ�¼------------------------------------------------------------------------
// �޸�����:
// ��ǰ�汾:    V1.1
// �� �� ��:    fazl
// �޸�����:    2013.09.29
// ע    ��:    
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef __APP_DATA_TYPE_H
#define __APP_DATA_TYPE_H 	

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
#include "type.h"

///////////// �Ĵ���(Body) ////////////////////////////
typedef struct
{
    u16 ID;                     //Node Index; ��ǰ����Node ID
    u16 Tx;                     //Tx Count
    u16 Rx;                     //Rx Count
    u16 Err;                    //Error Count

    u16 Tx_Flag;                     //Tx Flag
    u16 Rx_Flag;                     //Rx Flag

    u16 Timeout;                // ��ʱ������
                                
    u16 Node;                   // �ڵ���ţ������������д�źţ���Ӧ��Ŀ��ڵ㣩
    u16 Line;                   // �����������д�źţ��źű�־

    u16 Addr;						//���ݵ�ַ
    u16 Data;						//���ݸ���

    u16 Sta;                    //Status ������ ͣ��

    u16 RegXX;                      //
}Reg_Line_TypeDef;                  //�Ĵ�����


typedef struct
{
    u16 ID;                     // Node ID
    u16 Tx;                     // Tx Count
    u16 Rx;                     // Rx Count
    u16 Err;                    // Error Count
                                
    u16 Addr;              // ���ݵ�ַ
    u16 Data;              // ���ݸ���

    u16 Sta;                    // Status ������ ͣ��

    u16 RegXX;                  //
}Reg_Node_TypeDef;              // �Ĵ�����

#pragma pack(1)


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef struct
{   
    u8 sys_halt;
    u8 sys_warn;            //���޾�����0��������
    u8 Addr1;                //
    u8 Addr2;                //

    u8 BaudRate;                //


    u8 Reg_Base;                //

    
    u8 RFU[2];                 //Ԥ���ռ䣬������չ

    u16 DevID;                //
    u16 DevSN;                //

    u8 CfgInitFlag;            //��Ҫ������ROM��ʼ��
    u8 CRC8;
}Dev_Info_TypeDef;                  //

typedef struct
{
    u16 Reg00;                  // O2 Ũ�Ȳ���ֵ
    u16 Reg01;                  // CO2 Ũ�Ȳ���ֵ

    s16 Reg02;                  // ѹ��

    s16 Reg03;                  // �¶�0
    s16 Reg04;                  // ʪ��0
        
    s16 Reg05;          // �¶�1
    u16 Reg06;          // ʪ��1

    s16 Reg07;          // �¶�2
	u16 Reg08;          // ʪ��2

    s16 Reg09;          // �¶�3
	u16 Reg0A;          // ʪ��3

    s16 Reg0B;          // �¶�4
	u16 Reg0C;          // ʪ��4

    s16 Reg0D;          // �¶�5
    u16 Reg0E;          // ʪ��5

	u16 Reg0F;					// �̵���1
    u16 Reg10;					// �̵���2
    u16 Reg11;                  // �̵���3

    s16 Reg12;          // +ѹ������
    s16 Reg13;          // +ѹ������

    s16 Reg14;          // -ѹ������
    s16 Reg15;          // -ѹ������


    u16 RegXX;                      //
}Sys_Reg_TypeDef;                  //�Ĵ�����

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
typedef union{
    u16 DAT;
    struct
    {
    u8 DAT_H;						//���ݰ���8λ
    u8 DAT_L;						//���ݰ���8λ
    }DAT_TD;
}CMD_DataUnion_TypeDef;



typedef struct
{   
    u8 ADD;							//�ӻ�ͨѶ��ַ
    u8 CMD;							//���ܺ�
    CMD_DataUnion_TypeDef REG;						//���ݵ�ַ
    CMD_DataUnion_TypeDef NUM;						//���ݸ���
    CMD_DataUnion_TypeDef CHK;						//CRC16Ч��
}CMD_RxPack_TypeDef;     ///////////// --- �������ݰ������գ� --- ////////////


typedef struct
{   
    u8 ADD;							//�ӻ�ͨѶ��ַ
    u8 CMD;							//���ܺ�
    u8 CNT;						    //���ݸ���
    CMD_DataUnion_TypeDef NUM[256/2];						//���ݸ���
    CMD_DataUnion_TypeDef CHK;						//CRC16Ч��
}CMD_TxPack_03_TypeDef;     ///////////// --- �������ݰ������ͣ� --- ////////////

typedef struct
{   
    u8 ADD;							//�ӻ�ͨѶ��ַ
    u8 CMD;							//���ܺ�
    CMD_DataUnion_TypeDef REG;						//���ݵ�ַ
    CMD_DataUnion_TypeDef NUM;						//���ݸ���
    CMD_DataUnion_TypeDef CHK;						//CRC16Ч��
}CMD_TxPack_06_TypeDef;     ///////////// --- �������ݰ������գ� --- ////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//-----------------------Flasl �����ݿռ�-------------------------------------------------


#pragma pack()



#endif  //__APP_DATA_TYPE_H//

