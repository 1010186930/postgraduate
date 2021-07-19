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
#include "math.h"
#include "modbus.h"
#include "crc.h"

#define EPSILON 1e-6
char hex[50] = "";
double set_flowvalue=1234.567;
double set_voltagevalue;
u16 adcx=0;
u16 Input_value=0x000;
u8 thousand=0;
u8 hundred=0;
u8 ten=0;
u8 unit=0;
u8 tenths=0;
u8 percentile=0;
u8 thousandth=0;
u8 set_flag=1;
u8 pid_set=1;
u8 len=0;
u16 input_8202=0;
double voltage_pid=0;
double change_value;
double actual_value;
u8 pid_up=0;
double change_percentage;

int main(void)
{
    u8 rs485buf[9];
	
    char display_setflowvalue[50]="";
	const char valve_unit[]="ml";
    u8 key=0;
    double voltage_adc=0;
    delay_init();	    	 //延时函数初始化
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	EXTIX_Init();
    LCD_Init();
    Adc_Init();	  		//ADC初始化
	PID_init();
	GP8202_Init();
    TIM4_Init(200-1,7200-1);//20ms
    RS485_Init(9600);
	TIM3_Init(40-1,7200-1);//每帧数据间隔至少为3.5个字符时间,(1/9600)*3.5≈0.36ms,因此定时器0.4ms轮询一次
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
//	Input_value=(u16)(FlowtoVoltage(set_flowvalue)*409.5);
//	sprintf(display_setflowvalue,"%d",Input_value);
//	RS485_SendData((u8*)display_setflowvalue,strlen(display_setflowvalue));
	GP8202_SendDate(0x200);
	
    while(1)
    {
		if(set_flag==0)
		{
			
			POINT_COLOR=BROWN;
			set_flowvalue=thousand*1000+hundred*100+ten*10+unit+tenths*0.1+percentile*0.01+thousandth*0.001;
//			sprintf(display_setflowvalue,"%.3f",set_flowvalue);
//			strcat(display_setflowvalue,"ml\r\n");
//			RS485_SendData((u8*)display_setflowvalue,strlen(display_setflowvalue));
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
			set_voltagevalue=FlowtoVoltage(set_flowvalue);
		}
        K_UP_sacnf_func(len,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);
		
		MODBUS_Service();
//		RS485_Receive_Data(rs485buf,&key);
//		delay_ms(100);
//        if(key)//接收到有数据
//        {
//			/*上位机发送的是电压*/
//			POINT_COLOR=BROWN;
//			rs485buf[key] = '\0';
//            set_voltagevalue=atof((const char*)rs485buf);
//			set_flowvalue=VoltagetoFlow(set_voltagevalue);
//            sprintf(display_setflowvalue,"%.3f",set_flowvalue);
//			strcat(display_setflowvalue,valve_unit);
//			LCD_Fill(5,110,100,126,WHITE);
//			POINT_COLOR=WHITE;
//			len=Float_to_Bit(set_flowvalue,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);
//			switch(len)
//			{
//				case 5:
//					LCD_ShowNum(5,110,0,1,16);
//					LCD_ShowNum(13,110,0,1,16);
//					LCD_ShowNum(21,110,0,1,16);
//					POINT_COLOR=BROWN;
//					Show_Str(29,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
//					break;
//				case 6:
//					LCD_ShowNum(5,110,0,1,16);
//					LCD_ShowNum(13,110,0,1,16);
//					POINT_COLOR=BROWN;
//					Show_Str(21,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
//					break;
//				case 7:
//					LCD_ShowNum(5,110,0,1,16);
//					POINT_COLOR=BROWN;
//					Show_Str(13,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
//					break;
//				default:
//					POINT_COLOR=BROWN;
//					Show_Str(5,110,POINT_COLOR,BACK_COLOR,(u8*)display_setflowvalue,16,1);
//					break;
//			}
//            key=0;
//			
//           
//        }
        adcx=Get_Adc_Average(ADC_Channel_10,10);
        Show_Adc_Average(78,10,adcx,&voltage_adc,16);
//        /*PID Control Change output value*/
		
//		sprintf(display_setflowvalue,"voltage_adc:%.3f",voltage_adc);
//		strcat(display_setflowvalue,"\r\n");
//		RS485_SendData((u8*)display_setflowvalue,strlen(display_setflowvalue));
		
		
		voltage_pid=PID_realize(set_voltagevalue,voltage_adc);
		
//		sprintf(display_setflowvalue,"%.3f",voltage_pid);
//		strcat(display_setflowvalue,"v\r\n");
//		RS485_SendData((u8*)display_setflowvalue,strlen(display_setflowvalue));
		
		change_percentage=(voltage_pid-voltage_adc)/voltage_adc;
		
		
		
		
//		sprintf(display_setflowvalue,"percentage:%.3f",change_percentage);
//		strcat(display_setflowvalue,"\r\n");
//		RS485_SendData((u8*)display_setflowvalue,strlen(display_setflowvalue));
		
		
		
		
		change_percentage=fabs(voltage_pid-voltage_adc)/voltage_adc;
		
		
		
		
		
		if(fabs(voltage_pid-voltage_adc)>EPSILON&&voltage_pid>voltage_adc)
		{
			pid_up=1;
			Input_value=(u16)(Input_value*(1+change_percentage));
			pid_up=0;
		}
		else if(fabs(voltage_pid-voltage_adc)>EPSILON&&voltage_pid<voltage_adc)
		{
			pid_up=0;
			Input_value=(u16)(Input_value*(1-change_percentage));
		}
//		sprintf(display_setflowvalue,"Input_value:%d",Input_value);
//		strcat(display_setflowvalue,"\r\n");
//		RS485_SendData((u8*)display_setflowvalue,strlen(display_setflowvalue));
		if((u16)Input_value<=0x800)
			GP8202_SendDate(Input_value);
		else
		{
			GP8202_SendDate(0x000);

		}
			
    }
}
