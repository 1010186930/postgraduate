/***************************************************************
 *
 * OpenBeacon.org - CRC16 routine
 *
 * Copyright 2007 Milosch Meriac <meriac@openbeacon.de>
 *
 ***************************************************************

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; version 2.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

*/

#ifndef __CRC16_H__
#define __CRC16_H__

#include "stm32f0xx.h"
#include "main.h"

/***************************************************************
函数名称：App_Tab_Get_CRC16
参数说明：查表计算得CRC
返回说明：
函数说明：
 ***************************************************************/
u16 App_Tab_Get_CRC16( u8 * pucFrame, u16 usLen );

/***************************************************************
函数名称：App_Calc_Get_CRC16
参数说明：直接运算得CRC
返回说明：
函数说明：
 ***************************************************************/
u16 App_Calc_Get_CRC16(__IO u8 *ptr,u8 len) ;


//extern uint16_t crc16 (const uint8_t * buffer, uint32_t size);
//extern uint16_t icrc16 (const uint8_t * buffer, uint32_t size);

u16 App_Tab_Get_CRC16( u8 * pucFrame, u16 usLen );
u16 App_Calc_Get_CRC16(__IO u8 *ptr,u8 len) ;

#endif/*__CRC16_H__*/
