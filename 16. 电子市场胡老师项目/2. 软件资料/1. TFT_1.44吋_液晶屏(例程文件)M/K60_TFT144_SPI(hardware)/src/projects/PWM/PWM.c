/*********************************************************************************
 * 文件名       ：main.c
 * 描述         ：PWM实验
 *
 * 库版本       ：
 * 嵌入系统     ：
 *
**********************************************************************************/

#include "common.h"


#define GPIO_PIN_MASK            0x1Fu
#define GPIO_PIN(x)              (((1)<<(x & GPIO_PIN_MASK)))



#define LED3_TOGGLE (GPIOB_PTOR = (1<<20))
#define LED2_TOGGLE (GPIOB_PTOR = (1<<21))
#define LED1_TOGGLE (GPIOB_PTOR = (1<<22))
#define LED0_TOGGLE (GPIOB_PTOR = (1<<23))


void init_gpio();

void delay();

#if 1    //这里选择 0 或 1 来切换编译两个不同的main函数

/*************************************************************************
*
*
*  实验操作：这里用 FTM1_CH0 产生 PWM 脉冲波 ，即 PTA0 管脚。
*            把 PTB0 接入示波器
*
*  实验效果：可以测出频率为 35kHz
*
*  实验目的：测试 PWM 频率是否正确
*
*  备    注：FTM.h 里有各个FTM通道所对应管脚的表格，方便查看
*            占空比传递进入的参数，要根据 FTM_PRECISON 的定义来选择
*************************************************************************/
void  main()
{
    
    init_gpio();//初始化IO口
    
    LED3_TOGGLE;
    
    FTM_PWM_init(FTM1, CH0,1, 50); //初始化FTM1_CH0输出频率为35kHZ,占空比为50%的PWM ：FTM1_CH0对应PTB0口
    while(1)
    {
    }
}

#else


/*************************************************************************
*                               PWM实验LED测试
*
*  实验说明：用LED来测试占空比的变化。
*
*  实验操作：这里用 FTM1_CH0 产生 PWM 脉冲波
*            在 FTM.h 里，可以查到 FTM1_CH0 对应管脚为 PTA8
*            把 PTB0 接入 LED0，即 PTB0 和 PTB20 短接
*
*  实验效果：可以看到 LED0 由暗变亮，再突然暗，如此下去……
*
*  实验目的：测试 PWM 频率是否正确

*  备    注：引脚是否为PWM的输出引脚，请查看数据手册功能的对照表
*           
*************************************************************************/
void  main()
{
    u32 i;
    init_gpio();//初始化IO口
    FTM_PWM_init(FTM1, CH0, 35000, 100);     //FTM1_CH0初始化PWM ：PA8
    while(1)
    {
        for(i = 10; i > 1; i--)
        {
            FTM_PWM_Duty(FTM1, CH0, i * 10);  //改变占空比，逐渐变小 ,LED 逐渐变亮 （低电平点亮）
            time_delay_ms(100);               //延时100ms
        }
    }
}
/********************************************************************/


#endif



void init_gpio()
{
  //Set PTA19 and PTE26 (connected to SW1 and SW2) for GPIO functionality, falling IRQ,
  //   and to use internal pull-ups. (pin defaults to input state)
  //PORTA_PCR19=PORT_PCR_MUX(1)|PORT_PCR_IRQC(0xA)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;
  //PORTE_PCR26=PORT_PCR_MUX(1)|PORT_PCR_IRQC(0xA)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;

  //Set PTB10, PTB21, PTB21, and PTB23 (connected to LED's) for GPIO functionality//修改适合本电路板
  
  
  PORTB_PCR20=(0|PORT_PCR_MUX(1));
  PORTB_PCR21=(0|PORT_PCR_MUX(1));
  PORTB_PCR22=(0|PORT_PCR_MUX(1));
  PORTB_PCR23=(0|PORT_PCR_MUX(1));

  //Change PTB20, PTB21, PTB22, PTB23 to outputs
  GPIOB_PDDR=GPIO_PDDR_PDD(GPIO_PIN(20) | GPIO_PIN(21) | GPIO_PIN(22) | GPIO_PIN(23) );	
}

/*
 * Function to provide a short delay
 */
void delay()
{
  unsigned int i, n;
  for(i=0;i<30000;i++)
  {
    for(n=0;n<100;n++)
    {
      asm("nop");
    }
  }
}