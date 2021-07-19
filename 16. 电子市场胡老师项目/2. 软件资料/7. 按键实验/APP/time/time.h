#ifndef _time_H
#define _time_H

#include "system.h"
typedef enum
{
	FALSE=0,
	TRUE=!FALSE
}bool;

void TIM4_Init(u16 per,u16 psc);
void K_UP_sacnf_func(void);

#endif
