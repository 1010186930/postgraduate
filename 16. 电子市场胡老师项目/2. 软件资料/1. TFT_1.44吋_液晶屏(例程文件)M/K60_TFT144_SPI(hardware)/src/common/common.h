/*
 * File:        common.h
 * Purpose:     File to be included by all project files
 *
 * Notes:
 */

#ifndef _COMMON_H_
#define _COMMON_H_

/********************************************************************/

/*
 * Debug prints ON (#define) or OFF (#undef)
 */
#define DEBUG
#define DEBUG_PRINT



/*****************************设置数据类型*****************************/
typedef 	unsigned 	char		u8;	  //无符号型
typedef 	unsigned 	short int	u16;
typedef 	unsigned 	long  int	u32;
typedef    __UINT64_T_TYPE__        u64;

typedef 			char		s8;	  //有符号型
typedef 			short int	s16;
typedef 			long  int	s32;
typedef    __INT64_T_TYPE__     s64;



/* 
 * Include the generic CPU header file 
 */
#include "arm_cm4.h"


/* 
 * Include the platform specific header file 
 */
#if (defined(TWR_K40X256))
  #include "k40_tower.h"
#elif (defined(TWR_K60N512))
 #include "k60_tower.h"
#elif (defined(TWR_K53N512))
 #include "k53_tower.h"
#else
  #error "No valid platform defined"
#endif

/* 
 * Include the cpu specific header file 
 */
#if (defined(CPU_MK40N512VMD100))
//  #include "MK40N512VMD100.h"
  #include "MK40DZ10.h"
#elif (defined(CPU_MK60N512VMD100))
//  #include "MK60N512VMD100.h"
  #include "MK60DZ10.h"
#elif (defined(CPU_MK53N512CMD100))
//  #include "MK53N512CMD100.h"
  #include "MK53DZ10.h"
#else
  #error "No valid CPU defined"
#endif


/* 
 * Include any toolchain specfic header files 
 */
#if (defined(CW))
  #include "cw.h"
#elif (defined(IAR))
  #include "iar.h"
#else
#warning "No toolchain specific header included"
#endif

/* 
 * Include common utilities
 */
#include "assert.h"
#include "io.h"
#include "startup.h"
#include "stdlib.h"

#include "ftm.h"

#include"HAL_SPI.h"

#include "SPI_FLASH.H"

#include  "CRC.H"

#include "uart.h"


//#include "CourierNew_14x15.h"
//#include "CourierNew_5x7.h"
#include "oled.h"
//#include "OLED_SSD1306.h"


#if (defined(IAR))
	#include "intrinsics.h"
#endif

/********************************************************************/

#endif /* _COMMON_H_ */
