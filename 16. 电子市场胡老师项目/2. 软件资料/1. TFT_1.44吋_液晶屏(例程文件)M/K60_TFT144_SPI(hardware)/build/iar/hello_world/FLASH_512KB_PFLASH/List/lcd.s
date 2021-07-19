///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  09:08:42 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\driv /
//                    ers\TFT\lcd.c                                           /
//    Command line =  "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\dri /
//                    vers\TFT\lcd.c" -D IAR -D TWR_K60N512 -lCN              /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\FLASH_512KB_PFLASH\List\" -lB            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\FLASH_512KB_PFLASH\List\" -o             /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\FLASH_512KB_PFLASH\Obj\" --no_cse        /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_clustering --no_scheduling --debug                 /
//                    --endian=little --cpu=Cortex-M4 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\arm\INC\c\DLib_Config_Normal.h" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\projects\hello_world\" -I   /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\common\" -I                 /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\cpu\" -I                    /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\cpu\headers\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\adc16\" -I          /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\enet\" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\pmc\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\rtc\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\lptmr\" -I          /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\uart\" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\mcg\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\wdog\" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\platforms\" -I              /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\ftm\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\SPI\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\OLED\" -I           /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\..\..\src\drivers\TFT\" -I            /
//                    "C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\i /
//                    ar\hello_world\..\" -Ol --use_c++_inline                /
//    List file    =  C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\build\ia /
//                    r\hello_world\FLASH_512KB_PFLASH\List\lcd.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME lcd

        #define SHT_PROGBITS 0x1

        EXTERN GPIOx
        EXTERN SPI_Master_WriteRead
        EXTERN delay_ms

        PUBLIC BACK_COLOR
        PUBLIC DeviceCode
        PUBLIC LCD_Clear
        PUBLIC LCD_DrawPoint
        PUBLIC LCD_Init
        PUBLIC LCD_RESET
        PUBLIC LCD_SetCursor
        PUBLIC LCD_SetParam
        PUBLIC LCD_SetWindows
        PUBLIC LCD_WR_DATA
        PUBLIC LCD_WR_DATA_16Bit
        PUBLIC LCD_WR_REG
        PUBLIC LCD_WriteRAM_Prepare
        PUBLIC LCD_WriteReg
        PUBLIC POINT_COLOR
        PUBLIC lcddev

// C:\Users\Ping\Desktop\K60_TFT144_SPI(hardware)\src\drivers\TFT\lcd.c
//    1 #include "lcd.h"
//    2 #include "stdlib.h"
//    3 //////////////////////////////////////////////////////////////////////////////////	
//    4 /****************************************************************************************************
//    5 //=======================================Һ���������߽���==========================================//
//    6 //CS		��PB11	//Ƭѡ�ź�
//    7 //CLK	    ��PB13	//SPIʱ���ź�
//    8 //SDI(DIN)	��PB15	//SPI���������ź�
//    9 //=======================================Һ���������߽���==========================================//
//   10 //LED	    ��PB9	//��������źţ��ߵ�ƽ����
//   11 //RS(D/C)   ��PB10	//�Ĵ���/����ѡ���ź�(RS=0�������߷��͵���ָ�RS=1�������߷��͵�����������)
//   12 //RST	    ��PB12	//Һ������λ�źţ��͵�ƽ��λ
//   13 /////////////////////////////////////////////////////////////////////////////////////////////////
//   14 //==================================��ξ���ֻ��Ҫ3��IO=======================================//
//   15 //1.CS�źſ��Ծ��򣬲���SPI����Ƭѡ�ɽ�CS�ӵس��ͣ���ʡ1��IO
//   16 //2.LED��������źſ��ԽӸߵ�ƽ3.3V���ⳣ������ʡ1��IO
//   17 //3.RST��λ�źſ��Խӵ���Ƭ���ĸ�λ�ˣ�����ϵͳ�ϵ縴λ����ʡ1��IO
//   18 //==================================����л���������ʾ=======================================//
//   19 //��lcd.hͷ�ļ����޸ĺ�#define USE_HORIZONTAL ֵΪ0ʹ������ģʽ.1,ʹ�ú���ģʽ
//   20 //===========================����л�ģ��SPI����������Ӳ��SPI��������=========================//
//   21 //��lcd.hͷ�ļ����޸ĺ�#define USE_HARDWARE_SPI  ֵΪ0ʹ��ģ��SPI����.1,ʹ��Ӳ��SPI����
//   22 **************************************************************************************************/	
//   23 
//   24 	   
//   25 //����LCD��Ҫ����
//   26 //Ĭ��Ϊ����

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 _lcd_dev lcddev;
lcddev:
        DS8 16
//   28 
//   29 //������ɫ,������ɫ

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   30 u16 POINT_COLOR = 0x0000,BACK_COLOR = 0xFFFF;  
POINT_COLOR:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(1)
BACK_COLOR:
        DATA
        DC16 65535

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   31 u16 DeviceCode;	 
DeviceCode:
        DS8 2
//   32 
//   33 
//   34 //******************************************************************
//   35 //��������  LCD_WR_REG
//   36 //���ܣ�    ��Һ��������д��д16λָ��
//   37 //���������Reg:��д���ָ��ֵ
//   38 //����ֵ��  ��
//   39 //�޸ļ�¼����
//   40 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   41 void LCD_WR_REG(u16 data)
//   42 { 
LCD_WR_REG:
        PUSH     {R7,LR}
//   43    LCD_CS_CLR;
        LDR.W    R1,??DataTable8
        LDR      R1,[R1, #+8]
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x100
        LDR.W    R2,??DataTable8
        LDR      R2,[R2, #+8]
        STR      R1,[R2, #+0]
//   44    LCD_RS_CLR;
        LDR.W    R1,??DataTable8
        LDR      R1,[R1, #+8]
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x400
        LDR.W    R2,??DataTable8
        LDR      R2,[R2, #+8]
        STR      R1,[R2, #+0]
//   45    SPI_Master_WriteRead(SPI0,data,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   46    LCD_CS_SET;
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable8
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   47 }
        POP      {R0,PC}          ;; return
//   48 
//   49 //******************************************************************
//   50 //��������  LCD_WR_DATA
//   51 //���ܣ�    ��Һ��������д��д8λ����
//   52 //���������Data:��д�������
//   53 //����ֵ��  ��
//   54 //�޸ļ�¼����
//   55 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   56 void LCD_WR_DATA(u8 data)
//   57 {
LCD_WR_DATA:
        PUSH     {R7,LR}
//   58 	
//   59    LCD_CS_CLR;
        LDR.W    R1,??DataTable8
        LDR      R1,[R1, #+8]
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x100
        LDR.W    R2,??DataTable8
        LDR      R2,[R2, #+8]
        STR      R1,[R2, #+0]
//   60    LCD_RS_SET;
        LDR.W    R1,??DataTable8
        LDR      R1,[R1, #+8]
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x400
        LDR.W    R2,??DataTable8
        LDR      R2,[R2, #+8]
        STR      R1,[R2, #+0]
//   61    SPI_Master_WriteRead(SPI0,data,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   62    LCD_CS_SET;
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable8
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   63 
//   64 }
        POP      {R0,PC}          ;; return
//   65 //******************************************************************
//   66 //��������  LCD_DrawPoint_16Bit
//   67 //���ܣ�    8λ���������д��һ��16λ����
//   68 //���������(x,y):�������
//   69 //����ֵ��  ��
//   70 //�޸ļ�¼����
//   71 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   72 void LCD_WR_DATA_16Bit(u16 data)
//   73 {	
LCD_WR_DATA_16Bit:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   74    LCD_CS_CLR;
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.W    R1,??DataTable8
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   75    LCD_RS_SET;
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable8
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   76 
//   77    SPI_Master_WriteRead(SPI0,data>>8,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R1,R4,#+8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   78 
//   79    SPI_Master_WriteRead(SPI0,data,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   80 
//   81    LCD_CS_SET;
        LDR.N    R0,??DataTable8
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable8
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   82 }
        POP      {R4,PC}          ;; return
//   83 
//   84 //******************************************************************
//   85 //��������  LCD_WriteReg
//   86 //���ܣ�    д�Ĵ�������
//   87 //���������LCD_Reg:�Ĵ�����ַ
//   88 //			LCD_RegValue:Ҫд�������
//   89 //����ֵ��  ��
//   90 //�޸ļ�¼����
//   91 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   92 void LCD_WriteReg(u16 LCD_Reg, u16 LCD_RegValue)
//   93 {	
LCD_WriteReg:
        PUSH     {R4,LR}
        MOVS     R4,R1
//   94 	LCD_WR_REG(LCD_Reg);  
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LCD_WR_REG
//   95 	LCD_WR_DATA(LCD_RegValue);	    		 
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//   96 }	   
        POP      {R4,PC}          ;; return
//   97 	 
//   98 //******************************************************************
//   99 //��������  LCD_WriteRAM_Prepare
//  100 //���ܣ�    ��ʼдGRAM
//  101 //			�ڸ�Һ��������RGB����ǰ��Ӧ�÷���дGRAMָ��
//  102 //�����������
//  103 //����ֵ��  ��
//  104 //�޸ļ�¼����
//  105 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 void LCD_WriteRAM_Prepare(void)
//  107 {
LCD_WriteRAM_Prepare:
        PUSH     {R7,LR}
//  108 	LCD_WR_REG(lcddev.wramcmd);
        LDR.N    R0,??DataTable8_1
        LDRH     R0,[R0, #+8]
        BL       LCD_WR_REG
//  109 }	 
        POP      {R0,PC}          ;; return
//  110 
//  111 //******************************************************************
//  112 //��������  LCD_DrawPoint
//  113 //���ܣ�    ��ָ��λ��д��һ�����ص�����
//  114 //���������(x,y):�������
//  115 //����ֵ��  ��
//  116 //�޸ļ�¼����
//  117 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  118 void LCD_DrawPoint(u16 x,u16 y)
//  119 {
LCD_DrawPoint:
        PUSH     {R7,LR}
//  120 	LCD_SetCursor(x,y);//���ù��λ�� 
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LCD_SetCursor
//  121 	LCD_WR_DATA_16Bit(POINT_COLOR);
        LDR.N    R0,??DataTable8_2
        LDRH     R0,[R0, #+0]
        BL       LCD_WR_DATA_16Bit
//  122 }
        POP      {R0,PC}          ;; return
//  123 
//  124 
//  125 //******************************************************************
//  126 //��������  LCD_Reset
//  127 //���ܣ�    LCD��λ������Һ����ʼ��ǰҪ���ô˺���
//  128 //�����������
//  129 //����ֵ��  ��
//  130 //�޸ļ�¼����
//  131 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  132 void LCD_RESET(void)
//  133 {
LCD_RESET:
        PUSH     {R7,LR}
//  134 	LCD_RST_CLR;
        LDR.N    R0,??DataTable8
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x200
        LDR.N    R1,??DataTable8
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  135 	delay_ms(0xffff);	
        MOVW     R0,#+65535
        BL       delay_ms
//  136 	LCD_RST_SET;
        LDR.N    R0,??DataTable8
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable8
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//  137 	delay_ms(0xffff);
        MOVW     R0,#+65535
        BL       delay_ms
//  138 }
        POP      {R0,PC}          ;; return
//  139  	 
//  140 //******************************************************************
//  141 //��������  LCD_Init
//  142 //���ܣ�    LCD��ʼ��
//  143 //�����������
//  144 //����ֵ��  ��
//  145 //�޸ļ�¼����
//  146 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  147 void LCD_Init(void)
//  148 {  
LCD_Init:
        PUSH     {R7,LR}
//  149 //#if USE_HARDWARE_SPI //ʹ��Ӳ��SPI
//  150 //	SPI2_Init();
//  151 //#else	
//  152 //	LCD_GPIOInit();//ʹ��ģ��SPI
//  153 //#endif  										 
//  154 
//  155  	LCD_RESET(); //Һ������λ
        BL       LCD_RESET
//  156 
//  157 	//************* Start Initial Sequence **********//		
//  158 	//��ʼ��ʼ��Һ����
//  159 	LCD_WR_REG(0x11);//Sleep exit 
        MOVS     R0,#+17
        BL       LCD_WR_REG
//  160 	delay_ms (0xffff);		
        MOVW     R0,#+65535
        BL       delay_ms
//  161 	//ST7735R Frame Rate
//  162 	LCD_WR_REG(0xB1); 
        MOVS     R0,#+177
        BL       LCD_WR_REG
//  163 	LCD_WR_DATA(0x01); 
        MOVS     R0,#+1
        BL       LCD_WR_DATA
//  164 	LCD_WR_DATA(0x2C); 
        MOVS     R0,#+44
        BL       LCD_WR_DATA
//  165 	LCD_WR_DATA(0x2D); 
        MOVS     R0,#+45
        BL       LCD_WR_DATA
//  166 
//  167 	LCD_WR_REG(0xB2); 
        MOVS     R0,#+178
        BL       LCD_WR_REG
//  168 	LCD_WR_DATA(0x01); 
        MOVS     R0,#+1
        BL       LCD_WR_DATA
//  169 	LCD_WR_DATA(0x2C); 
        MOVS     R0,#+44
        BL       LCD_WR_DATA
//  170 	LCD_WR_DATA(0x2D); 
        MOVS     R0,#+45
        BL       LCD_WR_DATA
//  171 
//  172 	LCD_WR_REG(0xB3); 
        MOVS     R0,#+179
        BL       LCD_WR_REG
//  173 	LCD_WR_DATA(0x01); 
        MOVS     R0,#+1
        BL       LCD_WR_DATA
//  174 	LCD_WR_DATA(0x2C); 
        MOVS     R0,#+44
        BL       LCD_WR_DATA
//  175 	LCD_WR_DATA(0x2D); 
        MOVS     R0,#+45
        BL       LCD_WR_DATA
//  176 	LCD_WR_DATA(0x01); 
        MOVS     R0,#+1
        BL       LCD_WR_DATA
//  177 	LCD_WR_DATA(0x2C); 
        MOVS     R0,#+44
        BL       LCD_WR_DATA
//  178 	LCD_WR_DATA(0x2D); 
        MOVS     R0,#+45
        BL       LCD_WR_DATA
//  179 	
//  180 	LCD_WR_REG(0xB4); //Column inversion 
        MOVS     R0,#+180
        BL       LCD_WR_REG
//  181 	LCD_WR_DATA(0x07); 
        MOVS     R0,#+7
        BL       LCD_WR_DATA
//  182 	
//  183 	//ST7735R Power Sequence
//  184 	LCD_WR_REG(0xC0); 
        MOVS     R0,#+192
        BL       LCD_WR_REG
//  185 	LCD_WR_DATA(0xA2); 
        MOVS     R0,#+162
        BL       LCD_WR_DATA
//  186 	LCD_WR_DATA(0x02); 
        MOVS     R0,#+2
        BL       LCD_WR_DATA
//  187 	LCD_WR_DATA(0x84); 
        MOVS     R0,#+132
        BL       LCD_WR_DATA
//  188 	LCD_WR_REG(0xC1); 
        MOVS     R0,#+193
        BL       LCD_WR_REG
//  189 	LCD_WR_DATA(0xC5); 
        MOVS     R0,#+197
        BL       LCD_WR_DATA
//  190 
//  191 	LCD_WR_REG(0xC2); 
        MOVS     R0,#+194
        BL       LCD_WR_REG
//  192 	LCD_WR_DATA(0x0A); 
        MOVS     R0,#+10
        BL       LCD_WR_DATA
//  193 	LCD_WR_DATA(0x00); 
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  194 
//  195 	LCD_WR_REG(0xC3); 
        MOVS     R0,#+195
        BL       LCD_WR_REG
//  196 	LCD_WR_DATA(0x8A); 
        MOVS     R0,#+138
        BL       LCD_WR_DATA
//  197 	LCD_WR_DATA(0x2A); 
        MOVS     R0,#+42
        BL       LCD_WR_DATA
//  198 	LCD_WR_REG(0xC4); 
        MOVS     R0,#+196
        BL       LCD_WR_REG
//  199 	LCD_WR_DATA(0x8A); 
        MOVS     R0,#+138
        BL       LCD_WR_DATA
//  200 	LCD_WR_DATA(0xEE); 
        MOVS     R0,#+238
        BL       LCD_WR_DATA
//  201 	
//  202 	LCD_WR_REG(0xC5); //VCOM 
        MOVS     R0,#+197
        BL       LCD_WR_REG
//  203 	LCD_WR_DATA(0x0E); 
        MOVS     R0,#+14
        BL       LCD_WR_DATA
//  204 	
//  205 	LCD_WR_REG(0x36); //MX, MY, RGB mode 				 
        MOVS     R0,#+54
        BL       LCD_WR_REG
//  206 	LCD_WR_DATA(0xC8); 
        MOVS     R0,#+200
        BL       LCD_WR_DATA
//  207 	
//  208 	//ST7735R Gamma Sequence
//  209 	LCD_WR_REG(0xe0); 
        MOVS     R0,#+224
        BL       LCD_WR_REG
//  210 	LCD_WR_DATA(0x0f); 
        MOVS     R0,#+15
        BL       LCD_WR_DATA
//  211 	LCD_WR_DATA(0x1a); 
        MOVS     R0,#+26
        BL       LCD_WR_DATA
//  212 	LCD_WR_DATA(0x0f); 
        MOVS     R0,#+15
        BL       LCD_WR_DATA
//  213 	LCD_WR_DATA(0x18); 
        MOVS     R0,#+24
        BL       LCD_WR_DATA
//  214 	LCD_WR_DATA(0x2f); 
        MOVS     R0,#+47
        BL       LCD_WR_DATA
//  215 	LCD_WR_DATA(0x28); 
        MOVS     R0,#+40
        BL       LCD_WR_DATA
//  216 	LCD_WR_DATA(0x20); 
        MOVS     R0,#+32
        BL       LCD_WR_DATA
//  217 	LCD_WR_DATA(0x22); 
        MOVS     R0,#+34
        BL       LCD_WR_DATA
//  218 	LCD_WR_DATA(0x1f); 
        MOVS     R0,#+31
        BL       LCD_WR_DATA
//  219 	LCD_WR_DATA(0x1b); 
        MOVS     R0,#+27
        BL       LCD_WR_DATA
//  220 	LCD_WR_DATA(0x23); 
        MOVS     R0,#+35
        BL       LCD_WR_DATA
//  221 	LCD_WR_DATA(0x37); 
        MOVS     R0,#+55
        BL       LCD_WR_DATA
//  222 	LCD_WR_DATA(0x00); 	
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  223 	LCD_WR_DATA(0x07); 
        MOVS     R0,#+7
        BL       LCD_WR_DATA
//  224 	LCD_WR_DATA(0x02); 
        MOVS     R0,#+2
        BL       LCD_WR_DATA
//  225 	LCD_WR_DATA(0x10); 
        MOVS     R0,#+16
        BL       LCD_WR_DATA
//  226 
//  227 	LCD_WR_REG(0xe1); 
        MOVS     R0,#+225
        BL       LCD_WR_REG
//  228 	LCD_WR_DATA(0x0f); 
        MOVS     R0,#+15
        BL       LCD_WR_DATA
//  229 	LCD_WR_DATA(0x1b); 
        MOVS     R0,#+27
        BL       LCD_WR_DATA
//  230 	LCD_WR_DATA(0x0f); 
        MOVS     R0,#+15
        BL       LCD_WR_DATA
//  231 	LCD_WR_DATA(0x17); 
        MOVS     R0,#+23
        BL       LCD_WR_DATA
//  232 	LCD_WR_DATA(0x33); 
        MOVS     R0,#+51
        BL       LCD_WR_DATA
//  233 	LCD_WR_DATA(0x2c); 
        MOVS     R0,#+44
        BL       LCD_WR_DATA
//  234 	LCD_WR_DATA(0x29); 
        MOVS     R0,#+41
        BL       LCD_WR_DATA
//  235 	LCD_WR_DATA(0x2e); 
        MOVS     R0,#+46
        BL       LCD_WR_DATA
//  236 	LCD_WR_DATA(0x30); 
        MOVS     R0,#+48
        BL       LCD_WR_DATA
//  237 	LCD_WR_DATA(0x30); 
        MOVS     R0,#+48
        BL       LCD_WR_DATA
//  238 	LCD_WR_DATA(0x39); 
        MOVS     R0,#+57
        BL       LCD_WR_DATA
//  239 	LCD_WR_DATA(0x3f); 
        MOVS     R0,#+63
        BL       LCD_WR_DATA
//  240 	LCD_WR_DATA(0x00); 
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  241 	LCD_WR_DATA(0x07); 
        MOVS     R0,#+7
        BL       LCD_WR_DATA
//  242 	LCD_WR_DATA(0x03); 
        MOVS     R0,#+3
        BL       LCD_WR_DATA
//  243 	LCD_WR_DATA(0x10);  
        MOVS     R0,#+16
        BL       LCD_WR_DATA
//  244 	
//  245 	LCD_WR_REG(0x2a);
        MOVS     R0,#+42
        BL       LCD_WR_REG
//  246 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  247 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  248 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  249 	LCD_WR_DATA(0x7f);
        MOVS     R0,#+127
        BL       LCD_WR_DATA
//  250 
//  251 	LCD_WR_REG(0x2b);
        MOVS     R0,#+43
        BL       LCD_WR_REG
//  252 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  253 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  254 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  255 	LCD_WR_DATA(0x9f);
        MOVS     R0,#+159
        BL       LCD_WR_DATA
//  256 	
//  257 	LCD_WR_REG(0xF0); //Enable test command  
        MOVS     R0,#+240
        BL       LCD_WR_REG
//  258 	LCD_WR_DATA(0x01); 
        MOVS     R0,#+1
        BL       LCD_WR_DATA
//  259 	LCD_WR_REG(0xF6); //Disable ram power save mode 
        MOVS     R0,#+246
        BL       LCD_WR_REG
//  260 	LCD_WR_DATA(0x00); 
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  261 	
//  262 	LCD_WR_REG(0x3A); //65k mode 
        MOVS     R0,#+58
        BL       LCD_WR_REG
//  263 	LCD_WR_DATA(0x05); 	
        MOVS     R0,#+5
        BL       LCD_WR_DATA
//  264 	LCD_WR_REG(0x29);//Display on	
        MOVS     R0,#+41
        BL       LCD_WR_REG
//  265 
//  266 	LCD_SetParam();//����LCD����	 
        BL       LCD_SetParam
//  267 //	LCD_LED_SET;//��������	 
//  268 	//LCD_Clear(WHITE);
//  269 }
        POP      {R0,PC}          ;; return
//  270 //******************************************************************
//  271 //��������  LCD_Clear
//  272 //���ܣ�    LCDȫ�������������
//  273 //���������Color:Ҫ���������ɫ
//  274 //����ֵ��  ��
//  275 //�޸ļ�¼����
//  276 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  277 void LCD_Clear(u16 Color)
//  278 {
LCD_Clear:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//  279 	u16 i,j;      
//  280 	LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);	  
        LDR.N    R0,??DataTable8_1
        LDRH     R0,[R0, #+2]
        SUBS     R3,R0,#+1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDR.N    R0,??DataTable8_1
        LDRH     R0,[R0, #+0]
        SUBS     R2,R0,#+1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_SetWindows
//  281 	for(i=0;i<lcddev.width;i++)
        MOVS     R5,#+0
        B.N      ??LCD_Clear_0
//  282 	{
//  283 		for(j=0;j<lcddev.height;j++)
//  284 		LCD_WR_DATA_16Bit(Color);	//д������ 	 
??LCD_Clear_1:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LCD_WR_DATA_16Bit
        ADDS     R6,R6,#+1
??LCD_Clear_2:
        LDR.N    R0,??DataTable8_1
        LDRH     R0,[R0, #+2]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R0
        BCC.N    ??LCD_Clear_1
        ADDS     R5,R5,#+1
??LCD_Clear_0:
        LDR.N    R0,??DataTable8_1
        LDRH     R0,[R0, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCS.N    ??LCD_Clear_3
        MOVS     R6,#+0
        B.N      ??LCD_Clear_2
//  285 	}
//  286 }   		  
??LCD_Clear_3:
        POP      {R4-R6,PC}       ;; return
//  287 /*************************************************
//  288 ��������LCD_SetWindows
//  289 ���ܣ�����lcd��ʾ���ڣ��ڴ�����д�������Զ�����
//  290 ��ڲ�����xy�����յ�
//  291 ����ֵ����
//  292 *************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  293 void LCD_SetWindows(u16 xStar, u16 yStar,u16 xEnd,u16 yEnd)
//  294 {
LCD_SetWindows:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  295 #if USE_HORIZONTAL==1	//ʹ�ú���
//  296 	LCD_WR_REG(lcddev.setxcmd);	
//  297 	LCD_WR_DATA(xStar>>8);
//  298 	LCD_WR_DATA(0x00FF&xStar+3);		
//  299 	LCD_WR_DATA(xEnd>>8);
//  300 	LCD_WR_DATA(0x00FF&xEnd+3);
//  301 
//  302 	LCD_WR_REG(lcddev.setycmd);	
//  303 	LCD_WR_DATA(yStar>>8);
//  304 	LCD_WR_DATA(0x00FF&yStar+2);		
//  305 	LCD_WR_DATA(yEnd>>8);
//  306 	LCD_WR_DATA(0x00FF&yEnd+2);	
//  307 
//  308 #else
//  309 	
//  310 	LCD_WR_REG(lcddev.setxcmd);	
        LDR.N    R0,??DataTable8_1
        LDRH     R0,[R0, #+10]
        BL       LCD_WR_REG
//  311 	LCD_WR_DATA(xStar>>8);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R0,R4,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  312 	LCD_WR_DATA(0x00FF&xStar+2);		
        ADDS     R0,R4,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  313 	LCD_WR_DATA(xEnd>>8);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  314 	LCD_WR_DATA(0x00FF&xEnd+2);
        ADDS     R0,R6,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  315 
//  316 	LCD_WR_REG(lcddev.setycmd);	
        LDR.N    R0,??DataTable8_1
        LDRH     R0,[R0, #+12]
        BL       LCD_WR_REG
//  317 	LCD_WR_DATA(yStar>>8);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R0,R5,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  318 	LCD_WR_DATA(0x00FF&yStar+3);		
        ADDS     R0,R5,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  319 	LCD_WR_DATA(yEnd>>8);
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LSRS     R0,R7,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  320 	LCD_WR_DATA(0x00FF&yEnd+3);	
        ADDS     R0,R7,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  321 #endif
//  322 
//  323 	LCD_WriteRAM_Prepare();	//��ʼд��GRAM				
        BL       LCD_WriteRAM_Prepare
//  324 }   
        POP      {R0,R4-R7,PC}    ;; return
//  325 
//  326 /*************************************************
//  327 ��������LCD_SetCursor
//  328 ���ܣ����ù��λ��
//  329 ��ڲ�����xy����
//  330 ����ֵ����
//  331 *************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  332 void LCD_SetCursor(u16 Xpos, u16 Ypos)
//  333 {	  	    			
LCD_SetCursor:
        PUSH     {R7,LR}
//  334 	LCD_SetWindows(Xpos,Ypos,Xpos,Ypos);
        MOVS     R3,R1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R0
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LCD_SetWindows
//  335 } 
        POP      {R0,PC}          ;; return
//  336 
//  337 //����LCD����
//  338 //������к�����ģʽ�л�

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  339 void LCD_SetParam(void)
//  340 { 	
LCD_SetParam:
        PUSH     {R7,LR}
//  341 	lcddev.wramcmd=0x2C;
        LDR.N    R0,??DataTable8_1
        MOVS     R1,#+44
        STRH     R1,[R0, #+8]
//  342 #if USE_HORIZONTAL==1	//ʹ�ú���	  
//  343 	lcddev.dir=1;//����
//  344 	lcddev.width=128;
//  345 	lcddev.height=128;
//  346 	lcddev.setxcmd=0x2A;
//  347 	lcddev.setycmd=0x2B;			
//  348 	LCD_WriteReg(0x36,0xA8);
//  349 
//  350 #else//����
//  351 	lcddev.dir=0;//����				 	 		
        LDR.N    R0,??DataTable8_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
//  352 	lcddev.width=128;
        LDR.N    R0,??DataTable8_1
        MOVS     R1,#+128
        STRH     R1,[R0, #+0]
//  353 	lcddev.height=128;
        LDR.N    R0,??DataTable8_1
        MOVS     R1,#+128
        STRH     R1,[R0, #+2]
//  354 	lcddev.setxcmd=0x2A;
        LDR.N    R0,??DataTable8_1
        MOVS     R1,#+42
        STRH     R1,[R0, #+10]
//  355 	lcddev.setycmd=0x2B;	
        LDR.N    R0,??DataTable8_1
        MOVS     R1,#+43
        STRH     R1,[R0, #+12]
//  356 	LCD_WriteReg(0x36,0xC8);
        MOVS     R1,#+200
        MOVS     R0,#+54
        BL       LCD_WriteReg
//  357 #endif
//  358 }	
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     GPIOx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     lcddev

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     POINT_COLOR

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  359 
//  360 
// 
//    20 bytes in section .bss
//     2 bytes in section .data
// 1 162 bytes in section .text
// 
// 1 162 bytes of CODE memory
//    22 bytes of DATA memory
//
//Errors: none
//Warnings: none
