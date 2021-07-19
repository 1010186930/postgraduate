#include "delay.h"
#include "sys.h"
#include "lcd.h"
#include "adc.h"
#include "GUI.h"
#include "rs485.h"
#include "time.h"
#include "stdio.h"
#include "string.h"
#include "pid.h"
#include "exti.h"
#include "GP8202.h"
#include "myiic.h"
char hex[50] = "";
float set_flowvalue=1234.567;
static u8 thousand=0;
static u8 hundred=0;
static u8 ten=0;
static u8 unit=0;
static u8 tenths=0;
static u8 percentile=0;
static u8 thousandth=0;
u8 set_flag=1;
u8 pid_set=1;
u8 len=0;
u16 input_8202=0;
float voltage_pid=0;
u8 Find_dot(char* buf)
{
	char* p = buf;
	u8 intlen = 0;
	p = strchr((const char*)buf, '.');
	if (p)
		intlen = (u8)(p - buf);
	else
		intlen = 0;
	return intlen;
}
float add_bit(u8 dotplace,u8 dotlen,char* buf)
{
	float num=0;
	int i,j;
	for(i=dotplace-1,j=1;i>=0;i--,j*=10)
	{
		
		num+=buf[i-1]*j;
	}

}
void reversestr(char* source, char target[], unsigned int length)
{
	int i;
	for (i = 0; i < length; i++)
		target[i] = source[length - 1 - i];
	target[i] = 0;
}
void tohex(unsigned int num, char* hexStr)
{
	unsigned int n = num;
	char hextable[] = "0123456789ABCDEF";
	char temphex[16], hex[16];
	int i = 0;
	while (n) {
		temphex[i++] = hextable[n % 16];
		n /= 16;
	}
	temphex[i] = 0;
	reversestr(temphex, hex, i);
	strcpy(hexStr, hex);
}
u16 hextou16(char* hex)
{
	u16 res = 0;
	char* a = hex;
	u8 cnt = 0;
	while (*a)
	{
		if (cnt == 0)
		{
			switch (*a)
			{
			case 'A':
				res = 0xa << 8;
				break;
			case 'B':
				res = 0xb << 8;
				break;
			case 'C':
				res = 0xc << 8;
				break;
			case 'D':
				res = 0xd << 8;
				break;
			case 'E':
				res = 0xe << 8;
				break;
			case 'F':
				res = 0xf << 8;
				break;
			default:
				res = (*a-'0') << 8;
				break;
			}
		}
		else if (cnt == 1)
		{
			switch (*a)
			{
			case 'A':
				res |= 0xa << 4;
				break;
			case 'B':
				res |= 0xb << 4;
				break;
			case 'C':
				res |= 0xc << 4;
				break;
			case 'D':
				res |= 0xd << 4;
				break;
			case 'E':
				res |= 0xe << 4;
				break;
			case 'F':
				res |= 0xf << 4;
				break;
			default:
				res |= (*a - '0') << 4;
				break;
			}
		}
		else if (cnt == 2)
		{
			switch (*a)
			{
			case 'A':
				res |= 0xa;
				break;
			case 'B':
				res |= 0xb;
				break;
			case 'C':
				res |= 0xc;
				break;
			case 'D':
				res |= 0xd;
				break;
			case 'E':
				res |= 0xe;
				break;
			case 'F':
				res |= 0xf;
				break;
			default:
				res |= (*a - '0');
				break;
			}
		}
		else if (cnt == 3)
			break;
		a++;
		cnt++;

	}
	return res;
}
int main(void)
{
	int i=0;
    u16 adcx=0;

    u8 rs485buf[9];
	u16 Input_value=0x000;
    char display_setflowvalue[50]="";
	const char valve_unit[]="ml";
    u8 key=0;
    float voltage_adc=0;
    delay_init();	    	 //延时函数初始化
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	EXTIX_Init();
    LCD_Init();
    Adc_Init();	  		//ADC初始化
	GP8202_Init();
    TIM4_Init(200-1,7200-1);//20ms
    RS485_Init(9600);
    BACK_COLOR=WHITE;
    POINT_COLOR=BLACK;
    LCD_Clear(WHITE);
    Show_Str(5,10,POINT_COLOR,BACK_COLOR,"采样数值:",16,1);
	POINT_COLOR=BLUE;
	Show_Str(5,30,POINT_COLOR,BACK_COLOR,"采样电压:0.000V",16,1);
	POINT_COLOR=RED;
    Show_Str(5,50,POINT_COLOR,BACK_COLOR,"气阀流量:",16,1);
	POINT_COLOR=BROWN;
    Show_Str(5,90,POINT_COLOR,BACK_COLOR,"设定流量:",16,1);
	POINT_COLOR=WHITE;
	sprintf(display_setflowvalue,"%.3f",set_flowvalue);
	strcat(display_setflowvalue,valve_unit);
	len=Float_to_Bit(set_flowvalue,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);
	switch(len)
	{
		case 5:
			LCD_ShowNum(5,110,0,1,16);
			LCD_ShowNum(13,110,0,1,16);
			LCD_ShowNum(21,110,0,1,16);
			POINT_COLOR=BROWN;
			Show_Str(29,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
			break;
		case 6:
			LCD_ShowNum(5,110,0,1,16);
			LCD_ShowNum(13,110,0,1,16);
			POINT_COLOR=BROWN;
			Show_Str(21,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
			break;
		case 7:
			LCD_ShowNum(5,110,0,1,16);
			POINT_COLOR=BROWN;
			Show_Str(13,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
			break;
		default:
			POINT_COLOR=BROWN;
			Show_Str(5,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
			break;
	}
	Input_value=(u16)(FlowtoVoltage(set_flowvalue)*409.5);
	sprintf(display_setflowvalue,"%d",Input_value);
//	tohex(Input_value, hex);
//	input_8202=hextou16(hex);
//	RS485_Send_Data((u8*)hex,strlen(hex));
	RS485_Send_Data((u8*)display_setflowvalue,strlen(display_setflowvalue));
	GP8202_SendDate(Input_value);
//	TIM3_Init(10000-1,7200-1);//500ms
    while(1)
    {
		
		if(set_flag==0)
		{
			
			POINT_COLOR=BROWN;
			set_flowvalue=thousand*1000+hundred*100+ten*10+unit+tenths*0.1+percentile*0.01+thousandth*0.001;
			sprintf(display_setflowvalue,"%.3f",set_flowvalue);
			strcat(display_setflowvalue,"ml\r\n");
			RS485_Send_Data((u8*)display_setflowvalue,strlen(display_setflowvalue));
			LCD_Fill(5,110,100,126,WHITE);
			delay_ms(10);

			POINT_COLOR=WHITE;
			len=Float_to_Bit(set_flowvalue,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);
			switch(len)
			{
				case 5:
					LCD_ShowNum(5,110,0,1,16);
					LCD_ShowNum(13,110,0,1,16);
					LCD_ShowNum(21,110,0,1,16);
					POINT_COLOR=BROWN;
					Show_Str(29,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
					break;
				case 6:
					LCD_ShowNum(5,110,0,1,16);
					LCD_ShowNum(13,110,0,1,16);
					POINT_COLOR=BROWN;
					Show_Str(21,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
					break;
				case 7:
					LCD_ShowNum(5,110,0,1,16);
					POINT_COLOR=BROWN;
					Show_Str(13,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
					break;
				default:
					POINT_COLOR=BROWN;
					Show_Str(5,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
					break;
			}
			set_flag=1;
		}
        K_UP_sacnf_func(len,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);
		RS485_Receive_Data(rs485buf,&key);
		delay_ms(100);
        if(key)//接收到有数据
        {
//			RS485_Send_Data(&key,1);
//			RS485_Send_Data("\r\n",2);
//			RS485_Send_Data(rs485buf,strlen(rs485buf));
//			RS485_Send_Data("\r\n",2);
			
			POINT_COLOR=BROWN;
//			if(key>8)
//				key=8;
//			i=Find_dot((char*)rs485buf);
		
            set_flowvalue=atof((const char*)rs485buf);
//			memset(display_setflowvalue,'\0',sizeof(display_setflowvalue)/sizeof(char));
            sprintf(display_setflowvalue,"%.3f",set_flowvalue);
			strcat(display_setflowvalue,valve_unit);
			LCD_Fill(5,110,100,126,WHITE);
			
			POINT_COLOR=WHITE;
			len=Float_to_Bit(set_flowvalue,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);
			switch(len)
			{
				case 5:
					LCD_ShowNum(5,110,0,1,16);
					LCD_ShowNum(13,110,0,1,16);
					LCD_ShowNum(21,110,0,1,16);
					POINT_COLOR=BROWN;
					Show_Str(29,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
					break;
				case 6:
					LCD_ShowNum(5,110,0,1,16);
					LCD_ShowNum(13,110,0,1,16);
					POINT_COLOR=BROWN;
					Show_Str(21,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
					break;
				case 7:
					LCD_ShowNum(5,110,0,1,16);
					POINT_COLOR=BROWN;
					Show_Str(13,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
					break;
				default:
					POINT_COLOR=BROWN;
					Show_Str(5,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
					break;
			}
            key=0;
			
           
        }
        adcx=Get_Adc_Average(ADC_Channel_10,10);
        Show_Adc_Average(78,10,adcx,&voltage_adc,16);
		Input_value=(u16)(FlowtoVoltage(set_flowvalue)*409.5);
//		GP8202_SendDate(Input_value);
        /*PID Control Change output value*/
		voltage_pid=PID_realize(set_flowvalue,voltage_adc);
		Input_value=(u16)(voltage_pid*409.5);//voltage_pid*0x0FFF/10
		GP8202_SendDate(Input_value);
		
		
    }
}
