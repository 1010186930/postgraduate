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
u8 pid_set=1;
u8 len=0;
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
int main(void)
{
	int i=0;
    u16 adcx=0;

    u8 rs485buf[100];
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
	//RS485_Send_Data((u8*)display_setflowvalue,strlen(display_setflowvalue));
	GP8202_SendDate(Input_value);
	
	set_flowvalue = 1.01;
	while(1){
		//set_flowvalue += 1.01;
		//sprintf(display_setflowvalue,"%.3f\r\n",set_flowvalue);
		//RS485_Send_Data((u8*)display_setflowvalue, strlen(display_setflowvalue));
		//delay_ms(500);
		
		//RS485_Send_Data里面的清零要注意了，清了就收不到了
		// 这个问题，你自己分析下代码吧，哈哈
		
		//RS485_Send_Data((u8*)"@", 1);
		RS485_Receive_Data(rs485buf,&key);
		//delay_ms(500);
		if(key)//接收到有数据
        {
			//RS485_Send_Data((u8*)"-", 1);
			rs485buf[key] = '\0';
			
			sprintf(display_setflowvalue,"Recv %d:%s.\r\n", key, rs485buf);
			RS485_Send_Data((u8*)display_setflowvalue, strlen(display_setflowvalue));
			
			set_flowvalue = atof((char*)rs485buf);
			sprintf(display_setflowvalue,"set_flowvalue = %.3f.\r\n", set_flowvalue);
			RS485_Send_Data((u8*)display_setflowvalue, strlen(display_setflowvalue));
			
			//delay_ms(500);
			key=0;           
        }	
		
		
	
	}

//	TIM3_Init(10000-1,7200-1);//500ms
    while(1)
    {
		RS485_Receive_Data(rs485buf,&key);
		delay_ms(500);
        if(key)//接收到有数据
        {
			//RS485_Send_Data(rs485buf,key);

			key=0;
           
        }	
    }
}
