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
float set_flowvalue=1000;
static u8 thousand=0;
static u8 hundred=0;
static u8 ten=0;
static u8 unit=0;
static u8 tenths=0;
static u8 percentile=0;
static u8 thousandth=0;
u8 set_flag=1;
u8 len=0;
float temp=0;
int main(void)
{
    u16 adcx=0;
	float voltage_pid=0;
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
    while(1)
    {	
		
		RS485_Receive_Data(rs485buf,&key);
        if(key)//接收到有数据
        {
			
			set_flowvalue=atof((const char*)rs485buf);
			sprintf(display_setflowvalue,"%.3f",set_flowvalue);
			strcat(display_setflowvalue,valve_unit);
			key=0;
           RS485_Send_Data(display_setflowvalue,strlen(display_setflowvalue));
			temp=FlowtoVoltage(set_flowvalue);
			sprintf(display_setflowvalue,"%.3f",temp);
			strcat(display_setflowvalue,"V");
			 RS485_Send_Data("---",3);
			 RS485_Send_Data(display_setflowvalue,strlen(display_setflowvalue));
			RS485_Send_Data("\r\n",2);
        }
		Input_value=(u16)(FlowtoVoltage(set_flowvalue)*409.5);
		GP8202_SendDate(Input_value);
		
    }
}
