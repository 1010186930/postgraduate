/*
 * File:		gpio_k60.c
 * Purpose:		LED and Switch Example
 *
 *                      Configures GPIO for the LED and push buttons on the TWR-K60N512
 *                      Blue LED - On
 *                      Green LED - Toggles on/off
 *                      Orange LED - On if SW2 pressed
 *                      Yellow LED - On if SW1 pressed
 *
 *                      Also configures push buttons for falling IRQ's. ISR
 *                        configured in vector table in isr.h
 *
 */


#define GPIO_PIN_MASK            0x1Fu
#define GPIO_PIN(x)              (((1)<<(x & GPIO_PIN_MASK)))


 #define LED3_TOGGLE (GPIOB_PTOR = (1<<20))   //对IO口的值取反，翻转IO口
 #define LED2_TOGGLE (GPIOB_PTOR = (1<<21))
 #define LED1_TOGGLE (GPIOB_PTOR = (1<<22))
 #define LED0_TOGGLE (GPIOB_PTOR = (1<<23))

#include "common.h"




//Function declarations
void porta_isr(void);
void porte_isr(void);
void init_gpio(void);
void delay(void);

/********************************************************************/

void main (void)
{
  printf("TWR-K60N512 GPIO Example!\n");

  /* Turn on all port clocks */
  SIM_SCGC5 = SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK | SIM_SCGC5_PORTE_MASK;

  /* Enable GPIOA and GPIOE interrupts in NVIC */
  enable_irq(87); //GPIOA Vector is 103. IRQ# is 103-16=87
  enable_irq(91); //GPIOE Vector is 107. IRQ# is 107-16=91

  /* Initialize GPIO on TWR-K60N512 */
  init_gpio();

  while(1)
  {
     
    //Toggle
    
    LED0_TOGGLE;
    
       delay();
     
    
     LED1_TOGGLE;
     
       delay();
     
     LED2_TOGGLE;
    
       delay();
    
     LED3_TOGGLE;
     
       delay();
  }
}

/*
 * Initialize GPIO for Tower switches and LED's
 *
 *   PTA19 - SW1
 *   PTE26 - SW2
 *
 *   PTA10 - Blue (E4)
 *   PTA29 - Green (E3)
 *   PTA28 - Yellow (E2)
 *   PTA11 - Orange (E1)
 *
 */
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

/********************************************************************/

/*
 * ISR for PORTA interrupts
 */
void porta_isr(void)
{
  PORTA_ISFR=0xFFFFFFFF;  //Clear Port A ISR flags
  printf("SW1 Pressed\n");
}

/*
 * ISR for PORTE interrupts
 */
void porte_isr(void)
{
  PORTE_ISFR=0xFFFFFFFF;  //Clear Port E ISR flags
  printf("SW2 Pressed\n");
}

/*
 * ISR for PORTC interrupts
 */
void portc_isr(void)
{
  PORTC_ISFR=0xFFFFFFFF;  //Clear Port C ISR flags
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