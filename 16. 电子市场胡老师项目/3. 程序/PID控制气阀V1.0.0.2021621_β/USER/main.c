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
	u8 tempbuf[100]="";	//�����λ�������趨��ѹ������
    u16 adcx=0;	//adc�Ĳ���ֵ
    u8 rs485buf[100];	//rs485�Ľ�������
	u16 Input_value=0x300;	//gp8202������ֵ
    char display_setflowvalue[50]="";	//����Ļ����ʾ�趨������ֵ
	const char valve_unit[]="ml";
    u8 key=0;
    delay_init();	//��ʱ������ʼ��
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);	//�ж����ȼ�����Ϊ2 
	EXTIX_Init();	//�ⲿ�ж����ã����ڰ���key1��key2�Ĳ���
    LCD_Init();	//��Ļ�ĳ�ʼ��
    Adc_Init();	//ADC��ʼ��
	PID_init();	//PID��ʼ��
	GP8202_Init();	//GP8202��ʼ��
    TIM4_Init(200-1,7200-1);	//��ʱ��4�趨��20ms��ѯһ��
    RS485_Init(9600);	//485ͨ�ų�ʼ����������Ϊ9600
    BACK_COLOR=WHITE;
    POINT_COLOR=BLACK;
    LCD_Clear(WHITE);
	/*��Ļ��ʾADC�Ĳ���ֵ����Ӧ�Ĳ�����ѹ�������������趨������*/
    Show_Str(5,10,POINT_COLOR,BACK_COLOR,"������ֵ:",16,1);
	POINT_COLOR=BLUE;
	Show_Str(5,30,POINT_COLOR,BACK_COLOR,"������ѹ:0.000V",16,1);
	POINT_COLOR=RED;
    Show_Str(5,50,POINT_COLOR,BACK_COLOR,"��������:",16,1);
	POINT_COLOR=BROWN;
    Show_Str(5,90,POINT_COLOR,BACK_COLOR,"�趨����:",16,1);
	POINT_COLOR=WHITE;
	sprintf(display_setflowvalue,"%.3f",set_flowvalue);
	strcat(display_setflowvalue,valve_unit);
	len=Float_to_Bit(set_flowvalue,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);
	/*��ʾת���õ����趨��������������ǧ�Ĳ�����0���䣬0�ð�ɫ���������ص�����*/
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
	/*��������С��������ѹ�����������������������5*2*(0x4CC/0xFFF)=3
	GP8202�������ѹ��ΧӦΪ0~5V����0~0x800*/
	GP8202_SendDate(0x000);
	
	TIM3_Init(10000-1,7200-1);	//1s��ѯһ�εĶ�ʱ��3������λ�����͵�ǰ�����ĵ�ѹ�Ͷ�Ӧ������
    while(1)
    {
		if(set_flag==0)	//5sû���°����󣬸���set_flowvalue
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
			set_voltagevalue=FlowtoVoltage(set_flowvalue);	//���趨������ֵת��ΪPID��ʹ�õ��趨��ѹֵ
		}
		/*������⣬ʵ��key1��key2�Ķ�Ӧ����(key1λѡ��key2 0~9��ֵ)*/
        K_UP_sacnf_func(len,&thousand,&hundred,&ten,&unit,&tenths,&percentile,&thousandth);	
		
		RS485_Receive_Data(rs485buf,&key);	//�ȴ�����������λ����ָ��
		/*������յ����������ݣ����н������ʾ������set_voltagevalue
		���õ�ѹ�·�:  	@4.5V\r\n		��	@4500mV\r\n
		��λ�������ϴ�:	@3.995V@345mL/S\r\n	��	@3995��V@345mL/S\r\n
		*/
        if(key)//��λ���������
        {
			POINT_COLOR=BROWN;
			rs485buf[key]='\0';
			/*��λ�����͵��ǵ�ѹ��ֻ�ܽ���mV������2548mV*/
			strncpy((char*)tempbuf,(char*)(rs485buf+1),key-5);
			set_voltagevalue=(atof((char*)tempbuf)/1000);
			set_flowvalue=VoltagetoFlow(set_voltagevalue);
            sprintf(display_setflowvalue,"%.3f",set_flowvalue);
			strcat(display_setflowvalue,valve_unit);
			LCD_Fill(5,110,100,126,WHITE);
			POINT_COLOR=WHITE;
			RS485_SendData("123\r\n",5);	
			/*��ʾ����*/
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
			RS485_RX_CNT=0;//���ռ���������
			RS485_TX_EN=0;//��������ģʽ	
        }
        adcx=Get_Adc_Average(ADC_Channel_10,10);	//ADC����
        Show_Adc_Average(78,10,adcx,&voltage_adc,16);	//��ʾ����ֵ��������ѹ��ת��������
		if((set_voltagevalue-0) > EPSILON)
		{
			voltage_pid=PID_realize(set_voltagevalue,voltage_adc);	//���趨��ѹֵ�Ͳ�����ѹֵ����PID����PID����
			change_percentage=fabs(voltage_pid-voltage_adc)/voltage_adc;	//����PID�����ĵ�ѹ�ı���
			sprintf(display_setflowvalue,"change_percentage:%.3f",change_percentage);
				strcat(display_setflowvalue,"\r\n");
				RS485_SendData((u8*)display_setflowvalue,strlen(display_setflowvalue));	
	//		change_percentage=(voltage_pid-voltage_adc)/voltage_adc;	
			/*��GP8202������ֵ����������*/
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
			/*����趨ֵ����Ҫ���������GP8202����������0�����¿�ʼ����*/
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

//���Ա��ã�	
				
    }
}
