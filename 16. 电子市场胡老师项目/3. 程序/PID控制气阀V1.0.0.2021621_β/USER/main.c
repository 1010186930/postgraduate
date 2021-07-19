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
#define EPSILON 1e-6
char hex[50] = "";
double set_flowvalue=0;
double set_voltagevalue=0;
double voltage_adc=0;
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
	u8 tempbuf[100]="";	//存放上位机发送设定电压的数组
    u16 adcx=0;	//adc的采样值
    u8 rs485buf[100];	//rs485的接收数组
	u16 Input_value=0x300;	//gp8202的输入值
    char display_setflowvalue[50]="";	//在屏幕上显示设定的流量值
	const char valve_unit[]="ml";
    u8 key=0;
    delay_init();	//延时函数初始化
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);	//中断优先级分组为2 
	EXTIX_Init();	//外部中断配置，用于按键key1，key2的操作
    LCD_Init();	//屏幕的初始化
    Adc_Init();	//ADC初始化
	PID_init();	//PID初始化
	GP8202_Init();	//GP8202初始化
    TIM4_Init(200-1,7200-1);	//定时器4设定在20ms轮询一次
    RS485_Init(9600);	//485通信初始化，波特率为9600
    BACK_COLOR=WHITE;
    POINT_COLOR=BLACK;
    LCD_Clear(WHITE);
	/*屏幕显示ADC的采样值、对应的采样电压、气阀流量和设定的流量*/
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
	/*显示转换得到的设定流量，整数不满千的部分用0补充，0用白色绘制起到隐藏的作用*/
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
	/*随便给个较小的气阀电压，让气阀开启，这里给的是5*2*(0x4CC/0xFFF)=3
	GP8202的输出电压范围应为0~5V，即0~0x800*/
	GP8202_SendDate(0x000);
	
	TIM3_Init(10000-1,7200-1);	//1s轮询一次的定时器3，给上位机发送当前采样的电压和对应的流量
    while(1)
    {
		if(set_flag==0)	//5s没更新按键后，更新set_flowvalue
		{
			POINT_COLOR=BROWN;
			set_flowvalue=thousand*1000+hundred*100+ten*10+unit+tenths*0.1+percentile*0.01+thousandth*0.001;
			sprintf(display_setflowvalue,"%.3f",set_flowvalue);
			strcat(display_setflowvalue,"ml\r\n");
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
			set_voltagevalue=FlowtoVoltage(set_flowvalue);	//将设定的流量值转换为PID中使用的设定电压值
		}
		/*按键检测，实现key1和key2的对应功能(key1位选，key2 0~9调值)*/
        K_UP_sacnf_func(len,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);	
		
		RS485_Receive_Data(rs485buf,&key);	//等待接收来自上位机的指令
		/*如果接收到完整的数据，进行解包并显示，更新set_voltagevalue
		设置电压下发:  	@4.5V\r\n		或	@4500mV\r\n
		下位机数据上传:	@3.995V@345mL/S\r\n	或	@3995ｍV@345mL/S\r\n
		*/
        if(key)//上位机发送完成
        {
			POINT_COLOR=BROWN;
			rs485buf[key]='\0';
			/*上位机发送的是电压，只能接收mV，例如2548mV*/
			strncpy((char*)tempbuf,(char*)(rs485buf+1),key-5);
			set_voltagevalue=(atof((char*)tempbuf)/1000);
			set_flowvalue=VoltagetoFlow(set_voltagevalue);
            sprintf(display_setflowvalue,"%.3f",set_flowvalue);
			strcat(display_setflowvalue,valve_unit);
			LCD_Fill(5,110,100,126,WHITE);
			POINT_COLOR=WHITE;
			RS485_SendData("123\r\n",5);	
			/*显示流量*/
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
			RS485_RX_CNT=0;//接收计数器清零
			RS485_TX_EN=0;//开启接收模式	
        }
        adcx=Get_Adc_Average(ADC_Channel_10,10);	//ADC采样
        Show_Adc_Average(78,10,adcx,&voltage_adc,16);	//显示采样值、采样电压、转换到流量
		if((set_voltagevalue-0) > EPSILON)
		{
			voltage_pid=PID_realize(set_voltagevalue,voltage_adc);	//将设定电压值和采样电压值传入PID用于PID调节
			change_percentage=fabs(voltage_pid-voltage_adc)/voltage_adc;	//计算PID调整的电压的比例
			sprintf(display_setflowvalue,"change_percentage:%.3f",change_percentage);
				strcat(display_setflowvalue,"\r\n");
				RS485_SendData((u8*)display_setflowvalue,strlen(display_setflowvalue));	
	//		change_percentage=(voltage_pid-voltage_adc)/voltage_adc;	
			/*对GP8202的输入值按比例调节*/
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
//			Input_value=(u16)(Input_value-fabs(voltage_pid-voltage_adc)/10);
			sprintf(display_setflowvalue,"Input_value:%d",Input_value);
				strcat(display_setflowvalue,"\r\n");
				RS485_SendData((u8*)display_setflowvalue,strlen(display_setflowvalue));
			/*如果设定值符合要求再输入给GP8202，否则输入0，重新开始调节*/
			if((u16)Input_value<=0x800&&(u16)Input_value>=0x10)
			{
				GP8202_SendDate(Input_value);
				RS485_SendData("ok\r\n",4);
			}
			else if((u16)Input_value<0x10)	
			{
				Input_value=0x10;
				GP8202_SendDate(Input_value);
				RS485_SendData("ok\r\n",4);
			}
			else if((u16)Input_value>0x800)
			{
				
				GP8202_SendDate(0x000);
				RS485_SendData("failed\r\n",8);
			}
		}

//调试备用：	
				
    }
}
