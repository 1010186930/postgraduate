
#include "app_data_unit.h"
#include "main.h"
#include "crc16.h"


__IO CMD_TxPack_03_TypeDef RxPack_Buf;
__IO CMD_RxPack_TypeDef TxPack_03_Buf;
__IO CMD_RxPack_TypeDef TxPack_06_Buf;

__IO CMD_RxPack_TypeDef Rx_02_Pack_Buf;
__IO CMD_TxPack_03_TypeDef Tx_02_Pack_03_Buf;
__IO CMD_TxPack_06_TypeDef Tx_02_Pack_06_Buf;

__IO Sys_Reg_TypeDef Sys_Reg;
__IO u16 *regdata = (__IO u16 *)&Sys_Reg;

__IO Dev_Info_TypeDef Dev_Info;


__IO Reg_Node_TypeDef Node_Reg[6];            //
__IO Reg_Line_TypeDef Line_Reg;

/////////////////////////////////////////////////////////////////////////////

BOOL App_RS485_01_RxLoad(void)
{
	u8 *p = (u8 *)&RxPack_Buf;

	__IO u16 crc_temp;
    u16 i, j, k;
    u16 len;

	WDT_Feed();

	if (Usart1_Rx_Buffer[0] != (Line_Reg.ID+1))		//不是本机清除接收标志,清除接收缓冲区
	{
		Usart1_Rx_Flag=0;
		Usart1_Rx_Count=0;
		memset((u8 *)Usart1_Rx_Buffer, 0, sizeof(CMD_RxPack_TypeDef));     //
		return FALSE;
	}

	len = (Node_Reg[Line_Reg.ID].Data + Node_Reg[Line_Reg.ID].Data + 0x05 - sizeof(RxPack_Buf.CHK.DAT));

	//////////  取数据  ////////////
    memcpy(p, (u8 *)Usart1_Rx_Buffer, len);         //取缓存
    memcpy((u8 *)&RxPack_Buf.CHK.DAT, (u8 *)Usart1_Rx_Buffer + len, sizeof(RxPack_Buf.CHK.DAT));
                                                            //
    memset((u8 *)Usart1_Rx_Buffer, 0, (Node_Reg[Line_Reg.ID].Data + Node_Reg[Line_Reg.ID].Data + 0x05));         //清空缓存
    Usart1_Rx_Flag=0;
    Usart1_Rx_Count=0;

	//crc_temp = App_RS485_Get_CRC(p, 6);
    crc_temp = App_Tab_Get_CRC16(p, len);

	if ((crc_temp) != RxPack_Buf.CHK.DAT)        // CRC校验不正确则退出
	{
        return FALSE;
	}

    return TRUE;
}

BOOL App_RS485_01_RxHandle(void)
{
  u16 i, j, k;
    u8 *p = (u8 *)&RxPack_Buf;

    //--- START ---
    //LED_01_ON();

    WDT_Feed();

	if(RxPack_Buf.CMD == 0x03)          //是否为本机地址的读命令
	{
		j = RxPack_Buf.CNT / 2;  //提取要读取的寄存器的个数 
		
        if (j !=  Node_Reg[Line_Reg.ID].Data)               //寄存器个数不正确
        {
            return FALSE;
        }
        
		for(k=0; k<Node_Reg[Line_Reg.ID].Data; k++)//将要返回的数据准备到发送空间
		{
			regdata[Node_Reg[Line_Reg.ID].Addr + k] = __REV16(RxPack_Buf.NUM[k].DAT);
		}

	}
    else
    {
        return FALSE;
    }
    

	return TRUE;
}

BOOL App_RS485_01_TxHandle(void)
{
    static u16 i = 0;
    //u32 i, j, k;
    BOOL Status;
    u8 *q = (u8 *)&TxPack_03_Buf;
    //u32 

    Usart1_Rx_Flag=0;
    //Usart1_Rx_Count=0;

    //for(i=0; i<6; i++)
    {

        TxPack_03_Buf.ADD = (Line_Reg.ID+1);    
		TxPack_03_Buf.CMD = 0x03;

        TxPack_03_Buf.REG.DAT = __REV16(Node_Reg[Line_Reg.ID].Addr);
        TxPack_03_Buf.NUM.DAT = __REV16(Node_Reg[Line_Reg.ID].Data);
   
        TxPack_03_Buf.CHK.DAT = App_Tab_Get_CRC16(q, sizeof(TxPack_03_Buf) - 2);

        App_RS485_01_Send_Pack03();

        //transmit_packet_task(q, (u8)sizeof(TxPack_03_Buf));

        //------------------------------------
        Line_Reg.Timeout = 0;

        do
        {
            WDT_Feed();
            Delay_ms(1);
            Line_Reg.Timeout ++;

            // ======== 空闲时间485-2处理 ==================
            App_Data_02_Polling();

        }while((Line_Reg.Timeout < 500) && (Usart1_Rx_Flag == 0));       // 500ms 超时

        if(Usart1_Rx_Flag != 0)
        {
            Status = App_RS485_01_RxLoad();

            if (Status != FALSE)
            {
                App_RS485_01_RxHandle();

                if (Line_Reg.ID == 0)                   // 自动压力保护 --- 开关阀门
                {
                    App_Reg_Pa_Check();
                }

                Node_Reg[Line_Reg.ID].Err = 0;          // 错误计数清0
            }

            return TRUE;
        }
        else
        {
            if (Node_Reg[Line_Reg.ID].Err < 10)         // 错误计数
            {
                Node_Reg[Line_Reg.ID].Err ++;
                
            }
            else                                        // 错误计数超限
            {
                for(i=0; i<Node_Reg[Line_Reg.ID].Data; i++)     //复位寄存器数据
        		{
        			regdata[Node_Reg[Line_Reg.ID].Addr + i] = REG_EMPTY_DATA;
        		}
            }

            return FALSE;
        }
    }
    //return TRUE;
}

void App_RS485_01_Send_Pack03(void)
{
    u8 *q = (u8 *)&TxPack_03_Buf;

    Usart1_Tx_Count = sizeof(TxPack_03_Buf);
    
    //memcpy((u8 *)Usart1_Tx_Buffer, q, Usart1_Tx_Count);         //取缓存
	//memcpy(q, (u8 *)&TxPack_03_Buf.CHK.DAT, sizeof(TxPack_03_Buf.CHK.DAT));

    Usart1_SendBuf_DMA(q, Usart1_Tx_Count);
	
}

// -----------    ------------
BOOL App_RS485_01_Addr_Swtich(u32 polling_cnt)          //从地址切换
{
    BOOL result = FALSE;
    switch(polling_cnt)
    {
    case 0x02: Line_Reg.ID = 1; result = TRUE; break;
    case 0x04: Line_Reg.ID = 2; result = TRUE; break;
    case 0x06: Line_Reg.ID = 3; result = TRUE; break;
    case 0x08: Line_Reg.ID = 4; result = TRUE; break;
    case 0x0A: Line_Reg.ID = 5; result = TRUE; break;

    case 0x0A + 1 + 8*0:
    case 0x0A + 1 + 8*1:
    case 0x0A + 1 + 8*2:
    case 0x0A + 1 + 8*3:
    case 0x0A + 1 + 8*4: Line_Reg.ID = 0; result = TRUE; break;
    default: result = FALSE; break;
    }

    return result;
}

/////////////////////////////////////////////////////////////////////////////

BOOL App_RS485_02_Handle(void)
{
	u8 *p = (u8 *)&Rx_02_Pack_Buf;
    u8 *q = (u8 *)&Tx_02_Pack_03_Buf;
	u8 *r = (u8 *)&Tx_02_Pack_06_Buf;
	__IO u16 crc_temp;
    u16 i, j, k;

	WDT_Feed();

	if (Usart2_Rx_Buffer[0] != Dev_Info.Addr2)		//不是本机清除接收标志,清除接收缓冲区
	{
		Usart2_Rx_Flag=0;
		Usart2_Rx_Count=0;
		memset((u8 *)Usart2_Rx_Buffer, 0, sizeof(CMD_RxPack_TypeDef));     //
		return FALSE;
	}

	//__REV16(data);

	//////////  取数据  ////////////
    memcpy(p, (u8 *)Usart2_Rx_Buffer, sizeof(CMD_RxPack_TypeDef));         //取缓存
                                                            //
    memset((u8 *)Usart2_Rx_Buffer, 0, sizeof(CMD_RxPack_TypeDef));         //清空缓存
    Usart2_Rx_Flag=0;
    Usart2_Rx_Count=0;

	//crc_temp = App_RS485_Get_CRC(p, 6);
    crc_temp = App_Tab_Get_CRC16(p, sizeof(CMD_RxPack_TypeDef) - 2);

	if ((crc_temp) != Rx_02_Pack_Buf.CHK.DAT)        // CRC校验不正确则退出
	{
        return FALSE;
	}
    //--- START ---
    LED_01_ON();

	if(Rx_02_Pack_Buf.CMD == 0x03)          //是否为本机地址的读命令
	{
		Tx_02_Pack_03_Buf.ADD = Dev_Info.Addr2; //Rx_02_Pack_Buf.ADD;    
		Tx_02_Pack_03_Buf.CMD = 0x03;   //Rx_02_Pack_Buf.CMD;
		i=__REV16(Rx_02_Pack_Buf.REG.DAT);  //提取寄存器的起始地址
		j=__REV16(Rx_02_Pack_Buf.NUM.DAT);  //提取要读取的寄存器的个数
		//j=j<<1;
        if ((i + j) > SYS_REG_SIZE)               //数据超长，寄存器无法读取
        {
            return FALSE;
        }
		Tx_02_Pack_03_Buf.CNT = j*2;//准备返回的数据，该数据表示返回数据的个数

		for(k=0;k<j;k++)//将要返回的数据准备到发送空间
		{
			Tx_02_Pack_03_Buf.NUM[k].DAT = __REV16(regdata[i+k]);
		}
		Tx_02_Pack_03_Buf.CHK.DAT = App_Tab_Get_CRC16(q, Tx_02_Pack_03_Buf.CNT + 3);
		App_RS485_02_Send_Pack03();//发送
	}
    else if(Rx_02_Pack_Buf.CMD == 0x06) //是否为本机地址的写命令
	{
		Tx_02_Pack_06_Buf.ADD = Dev_Info.Addr2; //Rx_02_Pack_Buf.ADD;    
		Tx_02_Pack_06_Buf.CMD = 0x06;   //Rx_02_Pack_Buf.CMD;
        Tx_02_Pack_06_Buf.REG.DAT = Rx_02_Pack_Buf.REG.DAT;
		//EA=0;//关闭接收中断
		i=__REV16(Rx_02_Pack_Buf.REG.DAT);  //提取寄存器的起始地址
		j=__REV16(Rx_02_Pack_Buf.NUM.DAT);  //提取要写的数据
		if((0x000F <= i) && (i <= 0x0015))//只写能写寄存器
		{
            if (App_Reg_Check(i, j))                       //如果设置的数据超过范围或不正确，则改为默认值
            {
                regdata[i]=j;
                App_Config_Save();
            }
            Tx_02_Pack_06_Buf.NUM.DAT = __REV16(regdata[i]);
            Tx_02_Pack_06_Buf.CHK.DAT = App_Tab_Get_CRC16(r, sizeof(Tx_02_Pack_06_Buf)-2);            
            App_RS485_02_Send_Pack06();//发送
            WDT_Feed();          
            App_Reg_Exec();
		}
        else
        {
            return FALSE;
        }
	}
    else
    {
        return FALSE;
    }
	return TRUE;	  
}

void App_RS485_02_Send_Pack03(void)
{
    u8 *q = (u8 *)&Tx_02_Pack_03_Buf;
    Usart2_Tx_Count = Tx_02_Pack_03_Buf.CNT + 3;
	memcpy(q + Usart2_Tx_Count, (u8 *)&Tx_02_Pack_03_Buf.CHK.DAT, sizeof(Tx_02_Pack_03_Buf.CHK.DAT));
    Usart2_Tx_Count += sizeof(Tx_02_Pack_03_Buf.CHK.DAT);
    Delay_ms(2);
    Usart2_SendBuf_DMA(q, Usart2_Tx_Count);
}
void App_RS485_02_Send_Pack06(void)
{
    u8 *q = (u8 *)&Tx_02_Pack_06_Buf;
    Usart2_Tx_Count = sizeof(Tx_02_Pack_06_Buf);
    Delay_ms(2);
    Usart2_SendBuf_DMA(q, Usart2_Tx_Count);
}
/////////////////////////////////////////////////////////////////////////////

BOOL App_RF485_02_Handle(void)
{
	u8 *p = (u8 *)&Rx_02_Pack_Buf;
    u8 *q = (u8 *)&Tx_02_Pack_03_Buf;
	u8 *r = (u8 *)&Tx_02_Pack_06_Buf;
	__IO u16 crc_temp;
    u16 i, j, k;
	WDT_Feed();
	if (RXBuff[1] != Dev_Info.Addr2)		//不是本机清除接收标志,清除接收缓冲区
	{
		ubReceiveFlag=0;
		memset((u8 *)RXBuff, 0, sizeof(CMD_RxPack_TypeDef));     //
		return FALSE;
	}
	//////////  取数据  ////////////
    memcpy(p, (u8 *)RXBuff+1, sizeof(CMD_RxPack_TypeDef));         //取缓存
    memset((u8 *)RXBuff, 0, sizeof(CMD_RxPack_TypeDef)+1);         //清空缓存
    ubReceiveFlag=0;
    crc_temp = App_Tab_Get_CRC16(p, sizeof(CMD_RxPack_TypeDef) - 2);

	if ((crc_temp) != Rx_02_Pack_Buf.CHK.DAT)        // CRC校验不正确则退出
	{
        return FALSE;
	}
    //--- START ---
    LED_01_ON();
	if(Rx_02_Pack_Buf.CMD == 0x03)          //是否为本机地址的读命令
	{
		Tx_02_Pack_03_Buf.ADD = Dev_Info.Addr2; //Rx_02_Pack_Buf.ADD;    
		Tx_02_Pack_03_Buf.CMD = 0x03;   //Rx_02_Pack_Buf.CMD;

		//EA=0;//关闭接收中断
		i=__REV16(Rx_02_Pack_Buf.REG.DAT);  //提取寄存器的起始地址
		j=__REV16(Rx_02_Pack_Buf.NUM.DAT);  //提取要读取的寄存器的个数
		//j=j<<1;
        if ((i + j) > SYS_REG_SIZE)               //数据超长，寄存器无法读取
        {
            return FALSE;
        }
		Tx_02_Pack_03_Buf.CNT = j*2;//准备返回的数据，该数据表示返回数据的个数
		for(k=0;k<j;k++)//将要返回的数据准备到发送空间
		{
			Tx_02_Pack_03_Buf.NUM[k].DAT = __REV16(regdata[i+k]);
		}
		Tx_02_Pack_03_Buf.CHK.DAT = App_Tab_Get_CRC16(q, Tx_02_Pack_03_Buf.CNT + 3);
		App_RF485_02_Send_Pack03();//发送
	}
    else if(Rx_02_Pack_Buf.CMD == 0x06) //是否为本机地址的写命令
	{
		Tx_02_Pack_06_Buf.ADD = Dev_Info.Addr2; //Rx_02_Pack_Buf.ADD;    
		Tx_02_Pack_06_Buf.CMD = 0x06;   //Rx_02_Pack_Buf.CMD;
        Tx_02_Pack_06_Buf.REG.DAT = Rx_02_Pack_Buf.REG.DAT;
		//EA=0;//关闭接收中断
		i=__REV16(Rx_02_Pack_Buf.REG.DAT);  //提取寄存器的起始地址
		j=__REV16(Rx_02_Pack_Buf.NUM.DAT);  //提取要写的数据
		if((0x000F <= i) && (i <= 0x0015))//只写能写寄存器
		{
            if (App_Reg_Check(i, j))                       //如果设置的数据超过范围或不正确，则改为默认值
            {
                regdata[i]=j;
                App_Config_Save();
            }
            Tx_02_Pack_06_Buf.NUM.DAT = __REV16(regdata[i]);
            Tx_02_Pack_06_Buf.CHK.DAT = App_Tab_Get_CRC16(r, sizeof(Tx_02_Pack_06_Buf)-2);            
            App_RF485_02_Send_Pack06();//发送            
            WDT_Feed();
            App_Reg_Exec();
		}
        else
        {
            return FALSE;
        }
	}
    else
    {
        return FALSE;
    }
	return TRUE;  
}
void App_RF485_02_Send_Pack03(void)
{
    u8 *q = (u8 *)&Tx_02_Pack_03_Buf;
    Usart2_Tx_Count = Tx_02_Pack_03_Buf.CNT + 3;
	  memcpy(q + Usart2_Tx_Count, (u8 *)&Tx_02_Pack_03_Buf.CHK.DAT, sizeof(Tx_02_Pack_03_Buf.CHK.DAT));
    Usart2_Tx_Count += sizeof(Tx_02_Pack_03_Buf.CHK.DAT);
    transmit_packet_task(q, (u8)Usart2_Tx_Count);
}
void App_RF485_02_Send_Pack06(void)
{
    u8 *q = (u8 *)&Tx_02_Pack_06_Buf;
    Usart2_Tx_Count = sizeof(Tx_02_Pack_06_Buf);
    transmit_packet_task(q, (u8)Usart2_Tx_Count);
}
/////////////////////////////////////////////////////////////////////////////
void App_Data_02_Polling(void)
{
    //------------ 串口2处理 ----------------------------------------------------------------
    if(ubReceiveFlag != 0)
    {
        //--- START ---
        //LED_01_ON();
        App_RF485_02_Handle();
        WDT_Feed();
        //--- END ---
        LED_01_OFF();
    }
    //------------ 串口2处理 ----------------------------------------------------------------
    if(Usart2_Rx_Flag != 0)
    {
        //--- START ---
        //LED_01_ON();
        App_RS485_02_Handle();
        WDT_Feed();
        LED_01_OFF();
    }
}
/////////////////////////////////////////////////////////////////
void App_Sys_Reg_Config_Init(void)               //寄存器初始化
{
    u16 i  = 0;
    Line_Reg.ID = 0;
    Line_Reg.Tx = 0;
    Line_Reg.Rx = 0;
    Line_Reg.Rx_Flag = 0;
    Line_Reg.Tx_Flag = 0;
    Line_Reg.Timeout = 0;
    for (i=0; i<6; i++)
    {
        Node_Reg[i].ID = i;
        Node_Reg[i].Tx = 0;
        Node_Reg[i].Rx = 0;
        Node_Reg[i].Err = 0;
        Node_Reg[i].Sta = 0;
        if (i == 0)
        {
            Node_Reg[i].Addr = 0;
            Node_Reg[i].Data = 5;
        }
        else
        {
            Node_Reg[i].Addr = (i - 1)*2 + 0x05;
            Node_Reg[i].Data = 2;
        }
    }
    App_Config_Init();
}


//--------------------------------------------------------------


