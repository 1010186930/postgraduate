
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

	if (Usart1_Rx_Buffer[0] != (Line_Reg.ID+1))		//���Ǳ���������ձ�־,������ջ�����
	{
		Usart1_Rx_Flag=0;
		Usart1_Rx_Count=0;
		memset((u8 *)Usart1_Rx_Buffer, 0, sizeof(CMD_RxPack_TypeDef));     //
		return FALSE;
	}

	len = (Node_Reg[Line_Reg.ID].Data + Node_Reg[Line_Reg.ID].Data + 0x05 - sizeof(RxPack_Buf.CHK.DAT));

	//////////  ȡ����  ////////////
    memcpy(p, (u8 *)Usart1_Rx_Buffer, len);         //ȡ����
    memcpy((u8 *)&RxPack_Buf.CHK.DAT, (u8 *)Usart1_Rx_Buffer + len, sizeof(RxPack_Buf.CHK.DAT));
                                                            //
    memset((u8 *)Usart1_Rx_Buffer, 0, (Node_Reg[Line_Reg.ID].Data + Node_Reg[Line_Reg.ID].Data + 0x05));         //��ջ���
    Usart1_Rx_Flag=0;
    Usart1_Rx_Count=0;

	//crc_temp = App_RS485_Get_CRC(p, 6);
    crc_temp = App_Tab_Get_CRC16(p, len);

	if ((crc_temp) != RxPack_Buf.CHK.DAT)        // CRCУ�鲻��ȷ���˳�
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

	if(RxPack_Buf.CMD == 0x03)          //�Ƿ�Ϊ������ַ�Ķ�����
	{
		j = RxPack_Buf.CNT / 2;  //��ȡҪ��ȡ�ļĴ����ĸ��� 
		
        if (j !=  Node_Reg[Line_Reg.ID].Data)               //�Ĵ�����������ȷ
        {
            return FALSE;
        }
        
		for(k=0; k<Node_Reg[Line_Reg.ID].Data; k++)//��Ҫ���ص�����׼�������Ϳռ�
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

            // ======== ����ʱ��485-2���� ==================
            App_Data_02_Polling();

        }while((Line_Reg.Timeout < 500) && (Usart1_Rx_Flag == 0));       // 500ms ��ʱ

        if(Usart1_Rx_Flag != 0)
        {
            Status = App_RS485_01_RxLoad();

            if (Status != FALSE)
            {
                App_RS485_01_RxHandle();

                if (Line_Reg.ID == 0)                   // �Զ�ѹ������ --- ���ط���
                {
                    App_Reg_Pa_Check();
                }

                Node_Reg[Line_Reg.ID].Err = 0;          // ���������0
            }

            return TRUE;
        }
        else
        {
            if (Node_Reg[Line_Reg.ID].Err < 10)         // �������
            {
                Node_Reg[Line_Reg.ID].Err ++;
                
            }
            else                                        // �����������
            {
                for(i=0; i<Node_Reg[Line_Reg.ID].Data; i++)     //��λ�Ĵ�������
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
    
    //memcpy((u8 *)Usart1_Tx_Buffer, q, Usart1_Tx_Count);         //ȡ����
	//memcpy(q, (u8 *)&TxPack_03_Buf.CHK.DAT, sizeof(TxPack_03_Buf.CHK.DAT));

    Usart1_SendBuf_DMA(q, Usart1_Tx_Count);
	
}

// -----------    ------------
BOOL App_RS485_01_Addr_Swtich(u32 polling_cnt)          //�ӵ�ַ�л�
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

	if (Usart2_Rx_Buffer[0] != Dev_Info.Addr2)		//���Ǳ���������ձ�־,������ջ�����
	{
		Usart2_Rx_Flag=0;
		Usart2_Rx_Count=0;
		memset((u8 *)Usart2_Rx_Buffer, 0, sizeof(CMD_RxPack_TypeDef));     //
		return FALSE;
	}

	//__REV16(data);

	//////////  ȡ����  ////////////
    memcpy(p, (u8 *)Usart2_Rx_Buffer, sizeof(CMD_RxPack_TypeDef));         //ȡ����
                                                            //
    memset((u8 *)Usart2_Rx_Buffer, 0, sizeof(CMD_RxPack_TypeDef));         //��ջ���
    Usart2_Rx_Flag=0;
    Usart2_Rx_Count=0;

	//crc_temp = App_RS485_Get_CRC(p, 6);
    crc_temp = App_Tab_Get_CRC16(p, sizeof(CMD_RxPack_TypeDef) - 2);

	if ((crc_temp) != Rx_02_Pack_Buf.CHK.DAT)        // CRCУ�鲻��ȷ���˳�
	{
        return FALSE;
	}
    //--- START ---
    LED_01_ON();

	if(Rx_02_Pack_Buf.CMD == 0x03)          //�Ƿ�Ϊ������ַ�Ķ�����
	{
		Tx_02_Pack_03_Buf.ADD = Dev_Info.Addr2; //Rx_02_Pack_Buf.ADD;    
		Tx_02_Pack_03_Buf.CMD = 0x03;   //Rx_02_Pack_Buf.CMD;
		i=__REV16(Rx_02_Pack_Buf.REG.DAT);  //��ȡ�Ĵ�������ʼ��ַ
		j=__REV16(Rx_02_Pack_Buf.NUM.DAT);  //��ȡҪ��ȡ�ļĴ����ĸ���
		//j=j<<1;
        if ((i + j) > SYS_REG_SIZE)               //���ݳ������Ĵ����޷���ȡ
        {
            return FALSE;
        }
		Tx_02_Pack_03_Buf.CNT = j*2;//׼�����ص����ݣ������ݱ�ʾ�������ݵĸ���

		for(k=0;k<j;k++)//��Ҫ���ص�����׼�������Ϳռ�
		{
			Tx_02_Pack_03_Buf.NUM[k].DAT = __REV16(regdata[i+k]);
		}
		Tx_02_Pack_03_Buf.CHK.DAT = App_Tab_Get_CRC16(q, Tx_02_Pack_03_Buf.CNT + 3);
		App_RS485_02_Send_Pack03();//����
	}
    else if(Rx_02_Pack_Buf.CMD == 0x06) //�Ƿ�Ϊ������ַ��д����
	{
		Tx_02_Pack_06_Buf.ADD = Dev_Info.Addr2; //Rx_02_Pack_Buf.ADD;    
		Tx_02_Pack_06_Buf.CMD = 0x06;   //Rx_02_Pack_Buf.CMD;
        Tx_02_Pack_06_Buf.REG.DAT = Rx_02_Pack_Buf.REG.DAT;
		//EA=0;//�رս����ж�
		i=__REV16(Rx_02_Pack_Buf.REG.DAT);  //��ȡ�Ĵ�������ʼ��ַ
		j=__REV16(Rx_02_Pack_Buf.NUM.DAT);  //��ȡҪд������
		if((0x000F <= i) && (i <= 0x0015))//ֻд��д�Ĵ���
		{
            if (App_Reg_Check(i, j))                       //������õ����ݳ�����Χ����ȷ�����ΪĬ��ֵ
            {
                regdata[i]=j;
                App_Config_Save();
            }
            Tx_02_Pack_06_Buf.NUM.DAT = __REV16(regdata[i]);
            Tx_02_Pack_06_Buf.CHK.DAT = App_Tab_Get_CRC16(r, sizeof(Tx_02_Pack_06_Buf)-2);            
            App_RS485_02_Send_Pack06();//����
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
	if (RXBuff[1] != Dev_Info.Addr2)		//���Ǳ���������ձ�־,������ջ�����
	{
		ubReceiveFlag=0;
		memset((u8 *)RXBuff, 0, sizeof(CMD_RxPack_TypeDef));     //
		return FALSE;
	}
	//////////  ȡ����  ////////////
    memcpy(p, (u8 *)RXBuff+1, sizeof(CMD_RxPack_TypeDef));         //ȡ����
    memset((u8 *)RXBuff, 0, sizeof(CMD_RxPack_TypeDef)+1);         //��ջ���
    ubReceiveFlag=0;
    crc_temp = App_Tab_Get_CRC16(p, sizeof(CMD_RxPack_TypeDef) - 2);

	if ((crc_temp) != Rx_02_Pack_Buf.CHK.DAT)        // CRCУ�鲻��ȷ���˳�
	{
        return FALSE;
	}
    //--- START ---
    LED_01_ON();
	if(Rx_02_Pack_Buf.CMD == 0x03)          //�Ƿ�Ϊ������ַ�Ķ�����
	{
		Tx_02_Pack_03_Buf.ADD = Dev_Info.Addr2; //Rx_02_Pack_Buf.ADD;    
		Tx_02_Pack_03_Buf.CMD = 0x03;   //Rx_02_Pack_Buf.CMD;

		//EA=0;//�رս����ж�
		i=__REV16(Rx_02_Pack_Buf.REG.DAT);  //��ȡ�Ĵ�������ʼ��ַ
		j=__REV16(Rx_02_Pack_Buf.NUM.DAT);  //��ȡҪ��ȡ�ļĴ����ĸ���
		//j=j<<1;
        if ((i + j) > SYS_REG_SIZE)               //���ݳ������Ĵ����޷���ȡ
        {
            return FALSE;
        }
		Tx_02_Pack_03_Buf.CNT = j*2;//׼�����ص����ݣ������ݱ�ʾ�������ݵĸ���
		for(k=0;k<j;k++)//��Ҫ���ص�����׼�������Ϳռ�
		{
			Tx_02_Pack_03_Buf.NUM[k].DAT = __REV16(regdata[i+k]);
		}
		Tx_02_Pack_03_Buf.CHK.DAT = App_Tab_Get_CRC16(q, Tx_02_Pack_03_Buf.CNT + 3);
		App_RF485_02_Send_Pack03();//����
	}
    else if(Rx_02_Pack_Buf.CMD == 0x06) //�Ƿ�Ϊ������ַ��д����
	{
		Tx_02_Pack_06_Buf.ADD = Dev_Info.Addr2; //Rx_02_Pack_Buf.ADD;    
		Tx_02_Pack_06_Buf.CMD = 0x06;   //Rx_02_Pack_Buf.CMD;
        Tx_02_Pack_06_Buf.REG.DAT = Rx_02_Pack_Buf.REG.DAT;
		//EA=0;//�رս����ж�
		i=__REV16(Rx_02_Pack_Buf.REG.DAT);  //��ȡ�Ĵ�������ʼ��ַ
		j=__REV16(Rx_02_Pack_Buf.NUM.DAT);  //��ȡҪд������
		if((0x000F <= i) && (i <= 0x0015))//ֻд��д�Ĵ���
		{
            if (App_Reg_Check(i, j))                       //������õ����ݳ�����Χ����ȷ�����ΪĬ��ֵ
            {
                regdata[i]=j;
                App_Config_Save();
            }
            Tx_02_Pack_06_Buf.NUM.DAT = __REV16(regdata[i]);
            Tx_02_Pack_06_Buf.CHK.DAT = App_Tab_Get_CRC16(r, sizeof(Tx_02_Pack_06_Buf)-2);            
            App_RF485_02_Send_Pack06();//����            
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
    //------------ ����2���� ----------------------------------------------------------------
    if(ubReceiveFlag != 0)
    {
        //--- START ---
        //LED_01_ON();
        App_RF485_02_Handle();
        WDT_Feed();
        //--- END ---
        LED_01_OFF();
    }
    //------------ ����2���� ----------------------------------------------------------------
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
void App_Sys_Reg_Config_Init(void)               //�Ĵ�����ʼ��
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


