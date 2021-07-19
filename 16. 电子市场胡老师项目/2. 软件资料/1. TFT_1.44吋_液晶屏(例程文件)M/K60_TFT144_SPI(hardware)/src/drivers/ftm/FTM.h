/**************************************************************************************
 * 文件名       ：FTM.h
 * 描述         ：包含PWM、输入捕捉函数配置头文件
 *
**********************************************************************************/

#ifndef _ftm_H
#define _ftm_H

extern volatile struct FTM_MemMap *FTMx[3];

typedef enum FTMn
{
    FTM0,
    FTM1,
    FTM2
} FTMn;

typedef enum CHn
{
    
    CH0,   
    CH1,   
    CH2,   
    CH3,  
    CH4,  
    CH5,   
    CH6,   
    CH7    
    // ×表示不存在
} CHn;



/**********************************  FTM    ***************************************/

//      模块通道    端口          可选范围             
#define FTM0_CH0    PTC1        //PTC1、PTA3            PTA3不要用（与Jtag、SWD冲突）
#define FTM0_CH1    PTC2        //PTC2、PTA4
#define FTM0_CH2    PTC3        //PTC3、PTA5
#define FTM0_CH3    PTC4        //PTC4、PTA6
#define FTM0_CH4    PTD4        //PTD4、PTA7
#define FTM0_CH5    PTD5        //PTD5、PTA0            PTA0不要用（与Jtag、SWD冲突）
#define FTM0_CH6    PTD6        //PTD6、PTA1            PTA1不要用（与Jtag冲突）
#define FTM0_CH7    PTD7        //PTD7、PTA2            PTA2不要用（与Jtag冲突）


//      模块通道    端口          可选范围             
#define FTM1_CH0    PTB0        //PTA8、PTA12、PTB0
#define FTM1_CH1    PTB1        //PTA9、PTA13、PTB1
/*
#define FTM1_CH2                //空
#define FTM1_CH3                //空
#define FTM1_CH4                //空
#define FTM1_CH5                //空
#define FTM1_CH6                //空
#define FTM1_CH7                //空
*/

//      模块通道    端口          可选范围             
#define FTM2_CH0    PTA10       //PTA10、PTB18
#define FTM2_CH1    PTA11       //PTA11、PTB19
/*
#define FTM2_CH2                //空
#define FTM2_CH3                //空
#define FTM2_CH4                //空
#define FTM2_CH5                //空
#define FTM2_CH6                //空
#define FTM2_CH7                //空
*/







/**********************************  FTM    ***************************************/

//      模块通道    端口          可选范围              建议
#define FTM0_CH0    PTC1        //PTC1、PTA3            PTA3不要用（与Jtag、SWD冲突）
#define FTM0_CH1    PTC2        //PTC2、PTA4
#define FTM0_CH2    PTC3        //PTC3、PTA5
#define FTM0_CH3    PTC4        //PTC4、PTA6
#define FTM0_CH4    PTD4        //PTD4、PTA7
#define FTM0_CH5    PTD5        //PTD5、PTA0            PTA0不要用（与Jtag、SWD冲突）
#define FTM0_CH6    PTD6        //PTD6、PTA1            PTA1不要用（与Jtag冲突）
#define FTM0_CH7    PTD7        //PTD7、PTA2            PTA2不要用（与Jtag冲突）



/*********************** PWM **************************/

#define FTM_PRECISON 100u     //定义占空比精度，100即精度为1%，1000u则精度为0.1%，用于占空比 duty 形参传入，即占空比为 duty/FTM_PRECISON

void  FTM_PWM_init(FTMn, CHn, u32 freq, u32 duty);  //初始化FTM的PWM功能并设置频率、占空比。设置通道输出占空比。同一个FTM，各通道的PWM频率是一样的，共3个FTM

void  FTM_PWM_Duty(FTMn, CHn,         u32 duty);    //设置通道占空比,占空比为 （duty * 精度） % ，如果 FTM_PRECISON 定义为 1000 ，duty = 100 ，则占空比 100*0.1%=10%
void  FTM_PWM_freq(FTMn,    u32 freq);              //设置FTM的频率


/*********************** 输入捕捉 **************************/

typedef enum Input_cfg
{
    Rising,               //上升沿捕捉
    Falling,              //下降沿捕捉
    Rising_or_Falling     //跳变沿捕捉
} Input_cfg;


void FTM_Input_init(FTMn, CHn, Input_cfg);

#define FTM_IRQ_EN(FTMn,CHn)        FTM_CnSC_REG(FTMx[FTMn],CHn) |= FTM_CnSC_CHIE_MASK       //开启 FTMn_CHn 中断
#define FTM_IRQ_DIS(FTMn,CHn)       FTM_CnSC_REG(FTMx[FTMn],CHn) &= ~FTM_CnSC_CHIE_MASK      //关闭 FTMn_CHn 中断








#endif  //_FTM_H_



