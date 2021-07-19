////////////////////////////////////////////Copyright (c)//////////////////////////////////////////
//                                      湖南 有限公司
//                                         硬    件    部
//
//                                     http://www.xxx.com
//
//-------------- 文件信息--------------------------------------------------------------------------
// 文 件 名:    data_type.h
// 文件描述:    通信协议处理单元
// 版    本:    V1.0 
// 创 建 人:    fazl
// 创建日期:    2013.09.29
//=================================================================================================
//-------------- 修改记录------------------------------------------------------------------------
// 修改内容:
// 当前版本:    V1.1
// 修 改 人:    fazl
// 修改日期:    2013.09.29
// 注    意:    
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef __APP_DATA_TYPE_H
#define __APP_DATA_TYPE_H 	

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
#include "type.h"

///////////// 寄存器(Body) ////////////////////////////
typedef struct
{
    u16 ID;                     //Node Index; 当前操作Node ID
    u16 Tx;                     //Tx Count
    u16 Rx;                     //Rx Count
    u16 Err;                    //Error Count

    u16 Tx_Flag;                     //Tx Flag
    u16 Rx_Flag;                     //Rx Flag

    u16 Timeout;                // 超时计数器
                                
    u16 Node;                   // 节点序号（有来自主侧的写信号，对应的目标节点）
    u16 Line;                   // 有来自主侧的写信号，信号标志

    u16 Addr;						//数据地址
    u16 Data;						//数据个数

    u16 Sta;                    //Status 错误超限 停用

    u16 RegXX;                      //
}Reg_Line_TypeDef;                  //寄存器组


typedef struct
{
    u16 ID;                     // Node ID
    u16 Tx;                     // Tx Count
    u16 Rx;                     // Rx Count
    u16 Err;                    // Error Count
                                
    u16 Addr;              // 数据地址
    u16 Data;              // 数据个数

    u16 Sta;                    // Status 错误超限 停用

    u16 RegXX;                  //
}Reg_Node_TypeDef;              // 寄存器组

#pragma pack(1)


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef struct
{   
    u8 sys_halt;
    u8 sys_warn;            //超限警报（0：正常）
    u8 Addr1;                //
    u8 Addr2;                //

    u8 BaudRate;                //


    u8 Reg_Base;                //

    
    u8 RFU[2];                 //预留空间，方便扩展

    u16 DevID;                //
    u16 DevSN;                //

    u8 CfgInitFlag;            //主要是用作ROM初始化
    u8 CRC8;
}Dev_Info_TypeDef;                  //

typedef struct
{
    u16 Reg00;                  // O2 浓度测量值
    u16 Reg01;                  // CO2 浓度测量值

    s16 Reg02;                  // 压差

    s16 Reg03;                  // 温度0
    s16 Reg04;                  // 湿度0
        
    s16 Reg05;          // 温度1
    u16 Reg06;          // 湿度1

    s16 Reg07;          // 温度2
	u16 Reg08;          // 湿度2

    s16 Reg09;          // 温度3
	u16 Reg0A;          // 湿度3

    s16 Reg0B;          // 温度4
	u16 Reg0C;          // 湿度4

    s16 Reg0D;          // 温度5
    u16 Reg0E;          // 湿度5

	u16 Reg0F;					// 继电器1
    u16 Reg10;					// 继电器2
    u16 Reg11;                  // 继电器3

    s16 Reg12;          // +压力上限
    s16 Reg13;          // +压力下限

    s16 Reg14;          // -压力上限
    s16 Reg15;          // -压力下限


    u16 RegXX;                      //
}Sys_Reg_TypeDef;                  //寄存器组

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
typedef union{
    u16 DAT;
    struct
    {
    u8 DAT_H;						//数据包高8位
    u8 DAT_L;						//数据包低8位
    }DAT_TD;
}CMD_DataUnion_TypeDef;



typedef struct
{   
    u8 ADD;							//从机通讯地址
    u8 CMD;							//功能号
    CMD_DataUnion_TypeDef REG;						//数据地址
    CMD_DataUnion_TypeDef NUM;						//数据个数
    CMD_DataUnion_TypeDef CHK;						//CRC16效验
}CMD_RxPack_TypeDef;     ///////////// --- 命令数据包（接收） --- ////////////


typedef struct
{   
    u8 ADD;							//从机通讯地址
    u8 CMD;							//功能号
    u8 CNT;						    //数据个数
    CMD_DataUnion_TypeDef NUM[256/2];						//数据个数
    CMD_DataUnion_TypeDef CHK;						//CRC16效验
}CMD_TxPack_03_TypeDef;     ///////////// --- 命令数据包（发送） --- ////////////

typedef struct
{   
    u8 ADD;							//从机通讯地址
    u8 CMD;							//功能号
    CMD_DataUnion_TypeDef REG;						//数据地址
    CMD_DataUnion_TypeDef NUM;						//数据个数
    CMD_DataUnion_TypeDef CHK;						//CRC16效验
}CMD_TxPack_06_TypeDef;     ///////////// --- 命令数据包（接收） --- ////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//-----------------------Flasl 区数据空间-------------------------------------------------


#pragma pack()



#endif  //__APP_DATA_TYPE_H//

