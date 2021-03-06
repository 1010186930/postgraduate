
#include "common.h"

void delay(uint32);
void GPIO_Init(void);
void LEDs_On(void);
void LEDs_Off(void);
void LED_Dir_Out(void);
void RTC_Init(void);

#ifdef CPU_MK60N512VMD100

  #define ENABLE_GPIO_CLOCKS (SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK))//修改，适合本电路
  #define LED0_EN (PORTB_PCR20 = PORT_PCR_MUX(1))
  #define LED1_EN (PORTB_PCR21 = PORT_PCR_MUX(1))
  #define LED2_EN (PORTB_PCR22 = PORT_PCR_MUX(1))
  #define LED3_EN (PORTB_PCR23 = PORT_PCR_MUX(1))

  #define LED0_TOGGLE (GPIOB_PTOR = (1<<23))
  #define LED1_TOGGLE (GPIOB_PTOR = (1<<22))
  #define LED2_TOGGLE (GPIOB_PTOR = (1<<21))
  #define LED3_TOGGLE (GPIOB_PTOR = (1<<20))

#else

  #define ENABLE_GPIO_CLOCKS (SIM_SCGC5 |= (SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK))
  #define LED0_EN (PORTB_PCR11 = PORT_PCR_MUX(1))
  #define LED1_EN (PORTC_PCR7 = PORT_PCR_MUX(1))
  #define LED2_EN (PORTC_PCR8 = PORT_PCR_MUX(1))
  #define LED3_EN (PORTC_PCR9 = PORT_PCR_MUX(1))

  #define LED0_TOGGLE (GPIOB_PTOR = (1<<11))
  #define LED1_TOGGLE (GPIOC_PTOR = (1<<7))
  #define LED2_TOGGLE (GPIOC_PTOR = (1<<8))
  #define LED3_TOGGLE (GPIOC_PTOR = (1<<9))

#endif