///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      16/Aug/2015  08:45:43 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\TFT\lc /
//                    d.c                                                     /
//    Command line =  C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\TFT\lc /
//                    d.c -D IAR -D TWR_K60N512 -lCN                          /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\RAM_128KB\List\ -lB C:\Users\Ping\Desktop\K60_TFT14 /
//                    4_SPI\build\iar\hello_world\RAM_128KB\List\ -o          /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\RAM_128KB\Obj\ --no_cse --no_unroll --no_inline     /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.0 Evaluation\arm\INC\c\DLib_Config_Normal.h" -I       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\projects\hello_world\ -I               /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\common\ -I                             /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\cpu\ -I C:\Users\Ping\Desktop\K60_TFT1 /
//                    44_SPI\build\iar\hello_world\..\..\..\src\cpu\headers\  /
//                    -I C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello /
//                    _world\..\..\..\src\drivers\adc16\ -I                   /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\enet\ -I                       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\pmc\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\rtc\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\lptmr\ -I                      /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\uart\ -I                       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\mcg\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\wdog\ -I                       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\platforms\ -I                          /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\ftm\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\SPI\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\OLED\ -I                       /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\..\..\src\drivers\TFT\ -I                        /
//                    C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\..\ -On --use_c++_inline                            /
//    List file    =  C:\Users\Ping\Desktop\K60_TFT144_SPI\build\iar\hello_wo /
//                    rld\RAM_128KB\List\lcd.s                                /
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
        PUBLIC LCD_GPIOInit
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

// C:\Users\Ping\Desktop\K60_TFT144_SPI\src\drivers\TFT\lcd.c
//    1 #include "lcd.h"
//    2 #include "stdlib.h"
//    3 //#include "usart.h"
//    4 //#include "delay.h"	 
//    5 //////////////////////////////////////////////////////////////////////////////////	
//    6 /****************************************************************************************************
//    7 //=======================================Һ���������߽���==========================================//
//    8 //CS		��PB11	//Ƭѡ�ź�
//    9 //CLK	    ��PB13	//SPIʱ���ź�
//   10 //SDI(DIN)	��PB15	//SPI���������ź�
//   11 //=======================================Һ���������߽���==========================================//
//   12 //LED	    ��PB9	//��������źţ��ߵ�ƽ����
//   13 //RS(D/C)   ��PB10	//�Ĵ���/����ѡ���ź�(RS=0�������߷��͵���ָ�RS=1�������߷��͵�����������)
//   14 //RST	    ��PB12	//Һ������λ�źţ��͵�ƽ��λ
//   15 /////////////////////////////////////////////////////////////////////////////////////////////////
//   16 //==================================��ξ���ֻ��Ҫ3��IO=======================================//
//   17 //1.CS�źſ��Ծ��򣬲���SPI����Ƭѡ�ɽ�CS�ӵس��ͣ���ʡ1��IO
//   18 //2.LED��������źſ��ԽӸߵ�ƽ3.3V���ⳣ������ʡ1��IO
//   19 //3.RST��λ�źſ��Խӵ���Ƭ���ĸ�λ�ˣ�����ϵͳ�ϵ縴λ����ʡ1��IO
//   20 //==================================����л���������ʾ=======================================//
//   21 //��lcd.hͷ�ļ����޸ĺ�#define USE_HORIZONTAL ֵΪ0ʹ������ģʽ.1,ʹ�ú���ģʽ
//   22 //===========================����л�ģ��SPI����������Ӳ��SPI��������=========================//
//   23 //��lcd.hͷ�ļ����޸ĺ�#define USE_HARDWARE_SPI  ֵΪ0ʹ��ģ��SPI����.1,ʹ��Ӳ��SPI����
//   24 **************************************************************************************************/	
//   25 
//   26 	   
//   27 //����LCD��Ҫ����
//   28 //Ĭ��Ϊ����

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 _lcd_dev lcddev;
lcddev:
        DS8 16
//   30 
//   31 //������ɫ,������ɫ

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   32 u16 POINT_COLOR = 0x0000,BACK_COLOR = 0xFFFF;  
POINT_COLOR:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(1)
BACK_COLOR:
        DATA
        DC16 65535

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   33 u16 DeviceCode;	 
DeviceCode:
        DS8 2
//   34 
//   35 
//   36 //******************************************************************
//   37 //��������  LCD_WR_REG
//   38 //���ܣ�    ��Һ��������д��д16λָ��
//   39 //���������Reg:��д���ָ��ֵ
//   40 //����ֵ��  ��
//   41 //�޸ļ�¼����
//   42 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 void LCD_WR_REG(u16 data)
//   44 { 
LCD_WR_REG:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   45    LCD_CS_CLR;
        LDR.W    R0,??DataTable7
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.W    R1,??DataTable7
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   46    LCD_RS_CLR;
        LDR.W    R0,??DataTable7
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x400
        LDR.W    R1,??DataTable7
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   47    SPI_Master_WriteRead(SPI0,data,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   48    LCD_CS_SET;
        LDR.W    R0,??DataTable7
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable7
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   49 }
        POP      {R4,PC}          ;; return
//   50 
//   51 //******************************************************************
//   52 //��������  LCD_WR_DATA
//   53 //���ܣ�    ��Һ��������д��д8λ����
//   54 //���������Data:��д�������
//   55 //����ֵ��  ��
//   56 //�޸ļ�¼����
//   57 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   58 void LCD_WR_DATA(u8 data)
//   59 {
LCD_WR_DATA:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   60 	
//   61    LCD_CS_CLR;
        LDR.W    R0,??DataTable7
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.W    R1,??DataTable7
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   62    LCD_RS_SET;
        LDR.W    R0,??DataTable7
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable7
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   63    SPI_Master_WriteRead(SPI0,data,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   64    LCD_CS_SET;
        LDR.W    R0,??DataTable7
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable7
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   65 
//   66 }
        POP      {R4,PC}          ;; return
//   67 //******************************************************************
//   68 //��������  LCD_DrawPoint_16Bit
//   69 //���ܣ�    8λ���������д��һ��16λ����
//   70 //���������(x,y):�������
//   71 //����ֵ��  ��
//   72 //�޸ļ�¼����
//   73 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   74 void LCD_WR_DATA_16Bit(u16 data)
//   75 {	
LCD_WR_DATA_16Bit:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   76    LCD_CS_CLR;
        LDR.W    R0,??DataTable7
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.W    R1,??DataTable7
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   77    LCD_RS_SET;
        LDR.N    R0,??DataTable7
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   78 
//   79    SPI_Master_WriteRead(SPI0,data>>8,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R1,R4,#+8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   80 
//   81    SPI_Master_WriteRead(SPI0,data,SPI_PCS4,SPI_PCS_ASSERTED);
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_Master_WriteRead
//   82 
//   83    LCD_CS_SET;
        LDR.N    R0,??DataTable7
        LDR      R0,[R0, #+8]
        LDR      R0,[R0, #+0]
        MOV      R1,#+256
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+8]
        STR      R0,[R1, #+0]
//   84 }
        POP      {R4,PC}          ;; return
//   85 
//   86 //******************************************************************
//   87 //��������  LCD_WriteReg
//   88 //���ܣ�    д�Ĵ�������
//   89 //���������LCD_Reg:�Ĵ�����ַ
//   90 //			LCD_RegValue:Ҫд�������
//   91 //����ֵ��  ��
//   92 //�޸ļ�¼����
//   93 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   94 void LCD_WriteReg(u16 LCD_Reg, u16 LCD_RegValue)
//   95 {	
LCD_WriteReg:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   96 	LCD_WR_REG(LCD_Reg);  
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LCD_WR_REG
//   97 	LCD_WR_DATA(LCD_RegValue);	    		 
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//   98 }	   
        POP      {R0,R4,R5,PC}    ;; return
//   99 	 
//  100 //******************************************************************
//  101 //��������  LCD_WriteRAM_Prepare
//  102 //���ܣ�    ��ʼдGRAM
//  103 //			�ڸ�Һ��������RGB����ǰ��Ӧ�÷���дGRAMָ��
//  104 //�����������
//  105 //����ֵ��  ��
//  106 //�޸ļ�¼����
//  107 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  108 void LCD_WriteRAM_Prepare(void)
//  109 {
LCD_WriteRAM_Prepare:
        PUSH     {R7,LR}
//  110 	LCD_WR_REG(lcddev.wramcmd);
        LDR.N    R0,??DataTable7_1
        LDRH     R0,[R0, #+8]
        BL       LCD_WR_REG
//  111 }	 
        POP      {R0,PC}          ;; return
//  112 
//  113 //******************************************************************
//  114 //��������  LCD_DrawPoint
//  115 //���ܣ�    ��ָ��λ��д��һ�����ص�����
//  116 //���������(x,y):�������
//  117 //����ֵ��  ��
//  118 //�޸ļ�¼����
//  119 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 void LCD_DrawPoint(u16 x,u16 y)
//  121 {
LCD_DrawPoint:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  122 	LCD_SetCursor(x,y);//���ù��λ�� 
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LCD_SetCursor
//  123 	LCD_WR_DATA_16Bit(POINT_COLOR);
        LDR.N    R0,??DataTable7_2
        LDRH     R0,[R0, #+0]
        BL       LCD_WR_DATA_16Bit
//  124 }
        POP      {R0,R4,R5,PC}    ;; return
//  125 
//  126 //******************************************************************
//  127 //��������  LCD_GPIOInit
//  128 //���ܣ�    Һ����IO��ʼ����Һ����ʼ��ǰҪ���ô˺���
//  129 //�����������
//  130 //����ֵ��  ��
//  131 //�޸ļ�¼����
//  132 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  133 void LCD_GPIOInit(void)
//  134 {
//  135  
//  136 }
LCD_GPIOInit:
        BX       LR               ;; return
//  137 
//  138 //******************************************************************
//  139 //��������  LCD_Reset
//  140 //���ܣ�    LCD��λ������Һ����ʼ��ǰҪ���ô˺���
//  141 //�����������
//  142 //����ֵ��  ��
//  143 //�޸ļ�¼����
//  144 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  145 void LCD_RESET(void)
//  146 {
LCD_RESET:
        PUSH     {R7,LR}
//  147 //	LCD_RST_CLR;
//  148 	delay_ms(100);	
        MOVS     R0,#+100
        BL       delay_ms
//  149 //	LCD_RST_SET;
//  150 	delay_ms(50);
        MOVS     R0,#+50
        BL       delay_ms
//  151 }
        POP      {R0,PC}          ;; return
//  152  	 
//  153 //******************************************************************
//  154 //��������  LCD_Init
//  155 //���ܣ�    LCD��ʼ��
//  156 //�����������
//  157 //����ֵ��  ��
//  158 //�޸ļ�¼����
//  159 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  160 void LCD_Init(void)
//  161 {  
LCD_Init:
        PUSH     {R7,LR}
//  162 //#if USE_HARDWARE_SPI //ʹ��Ӳ��SPI
//  163 //	SPI2_Init();
//  164 //#else	
//  165 //	LCD_GPIOInit();//ʹ��ģ��SPI
//  166 //#endif  										 
//  167 
//  168  	LCD_RESET(); //Һ������λ
        BL       LCD_RESET
//  169 
//  170 	//************* Start Initial Sequence **********//		
//  171 	//��ʼ��ʼ��Һ����
//  172 	LCD_WR_REG(0x11);//Sleep exit 
        MOVS     R0,#+17
        BL       LCD_WR_REG
//  173 	delay_ms (120);		
        MOVS     R0,#+120
        BL       delay_ms
//  174 	//ST7735R Frame Rate
//  175 	LCD_WR_REG(0xB1); 
        MOVS     R0,#+177
        BL       LCD_WR_REG
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
//  180 	LCD_WR_REG(0xB2); 
        MOVS     R0,#+178
        BL       LCD_WR_REG
//  181 	LCD_WR_DATA(0x01); 
        MOVS     R0,#+1
        BL       LCD_WR_DATA
//  182 	LCD_WR_DATA(0x2C); 
        MOVS     R0,#+44
        BL       LCD_WR_DATA
//  183 	LCD_WR_DATA(0x2D); 
        MOVS     R0,#+45
        BL       LCD_WR_DATA
//  184 
//  185 	LCD_WR_REG(0xB3); 
        MOVS     R0,#+179
        BL       LCD_WR_REG
//  186 	LCD_WR_DATA(0x01); 
        MOVS     R0,#+1
        BL       LCD_WR_DATA
//  187 	LCD_WR_DATA(0x2C); 
        MOVS     R0,#+44
        BL       LCD_WR_DATA
//  188 	LCD_WR_DATA(0x2D); 
        MOVS     R0,#+45
        BL       LCD_WR_DATA
//  189 	LCD_WR_DATA(0x01); 
        MOVS     R0,#+1
        BL       LCD_WR_DATA
//  190 	LCD_WR_DATA(0x2C); 
        MOVS     R0,#+44
        BL       LCD_WR_DATA
//  191 	LCD_WR_DATA(0x2D); 
        MOVS     R0,#+45
        BL       LCD_WR_DATA
//  192 	
//  193 	LCD_WR_REG(0xB4); //Column inversion 
        MOVS     R0,#+180
        BL       LCD_WR_REG
//  194 	LCD_WR_DATA(0x07); 
        MOVS     R0,#+7
        BL       LCD_WR_DATA
//  195 	
//  196 	//ST7735R Power Sequence
//  197 	LCD_WR_REG(0xC0); 
        MOVS     R0,#+192
        BL       LCD_WR_REG
//  198 	LCD_WR_DATA(0xA2); 
        MOVS     R0,#+162
        BL       LCD_WR_DATA
//  199 	LCD_WR_DATA(0x02); 
        MOVS     R0,#+2
        BL       LCD_WR_DATA
//  200 	LCD_WR_DATA(0x84); 
        MOVS     R0,#+132
        BL       LCD_WR_DATA
//  201 	LCD_WR_REG(0xC1); 
        MOVS     R0,#+193
        BL       LCD_WR_REG
//  202 	LCD_WR_DATA(0xC5); 
        MOVS     R0,#+197
        BL       LCD_WR_DATA
//  203 
//  204 	LCD_WR_REG(0xC2); 
        MOVS     R0,#+194
        BL       LCD_WR_REG
//  205 	LCD_WR_DATA(0x0A); 
        MOVS     R0,#+10
        BL       LCD_WR_DATA
//  206 	LCD_WR_DATA(0x00); 
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  207 
//  208 	LCD_WR_REG(0xC3); 
        MOVS     R0,#+195
        BL       LCD_WR_REG
//  209 	LCD_WR_DATA(0x8A); 
        MOVS     R0,#+138
        BL       LCD_WR_DATA
//  210 	LCD_WR_DATA(0x2A); 
        MOVS     R0,#+42
        BL       LCD_WR_DATA
//  211 	LCD_WR_REG(0xC4); 
        MOVS     R0,#+196
        BL       LCD_WR_REG
//  212 	LCD_WR_DATA(0x8A); 
        MOVS     R0,#+138
        BL       LCD_WR_DATA
//  213 	LCD_WR_DATA(0xEE); 
        MOVS     R0,#+238
        BL       LCD_WR_DATA
//  214 	
//  215 	LCD_WR_REG(0xC5); //VCOM 
        MOVS     R0,#+197
        BL       LCD_WR_REG
//  216 	LCD_WR_DATA(0x0E); 
        MOVS     R0,#+14
        BL       LCD_WR_DATA
//  217 	
//  218 	LCD_WR_REG(0x36); //MX, MY, RGB mode 				 
        MOVS     R0,#+54
        BL       LCD_WR_REG
//  219 	LCD_WR_DATA(0xC8); 
        MOVS     R0,#+200
        BL       LCD_WR_DATA
//  220 	
//  221 	//ST7735R Gamma Sequence
//  222 	LCD_WR_REG(0xe0); 
        MOVS     R0,#+224
        BL       LCD_WR_REG
//  223 	LCD_WR_DATA(0x0f); 
        MOVS     R0,#+15
        BL       LCD_WR_DATA
//  224 	LCD_WR_DATA(0x1a); 
        MOVS     R0,#+26
        BL       LCD_WR_DATA
//  225 	LCD_WR_DATA(0x0f); 
        MOVS     R0,#+15
        BL       LCD_WR_DATA
//  226 	LCD_WR_DATA(0x18); 
        MOVS     R0,#+24
        BL       LCD_WR_DATA
//  227 	LCD_WR_DATA(0x2f); 
        MOVS     R0,#+47
        BL       LCD_WR_DATA
//  228 	LCD_WR_DATA(0x28); 
        MOVS     R0,#+40
        BL       LCD_WR_DATA
//  229 	LCD_WR_DATA(0x20); 
        MOVS     R0,#+32
        BL       LCD_WR_DATA
//  230 	LCD_WR_DATA(0x22); 
        MOVS     R0,#+34
        BL       LCD_WR_DATA
//  231 	LCD_WR_DATA(0x1f); 
        MOVS     R0,#+31
        BL       LCD_WR_DATA
//  232 	LCD_WR_DATA(0x1b); 
        MOVS     R0,#+27
        BL       LCD_WR_DATA
//  233 	LCD_WR_DATA(0x23); 
        MOVS     R0,#+35
        BL       LCD_WR_DATA
//  234 	LCD_WR_DATA(0x37); 
        MOVS     R0,#+55
        BL       LCD_WR_DATA
//  235 	LCD_WR_DATA(0x00); 	
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  236 	LCD_WR_DATA(0x07); 
        MOVS     R0,#+7
        BL       LCD_WR_DATA
//  237 	LCD_WR_DATA(0x02); 
        MOVS     R0,#+2
        BL       LCD_WR_DATA
//  238 	LCD_WR_DATA(0x10); 
        MOVS     R0,#+16
        BL       LCD_WR_DATA
//  239 
//  240 	LCD_WR_REG(0xe1); 
        MOVS     R0,#+225
        BL       LCD_WR_REG
//  241 	LCD_WR_DATA(0x0f); 
        MOVS     R0,#+15
        BL       LCD_WR_DATA
//  242 	LCD_WR_DATA(0x1b); 
        MOVS     R0,#+27
        BL       LCD_WR_DATA
//  243 	LCD_WR_DATA(0x0f); 
        MOVS     R0,#+15
        BL       LCD_WR_DATA
//  244 	LCD_WR_DATA(0x17); 
        MOVS     R0,#+23
        BL       LCD_WR_DATA
//  245 	LCD_WR_DATA(0x33); 
        MOVS     R0,#+51
        BL       LCD_WR_DATA
//  246 	LCD_WR_DATA(0x2c); 
        MOVS     R0,#+44
        BL       LCD_WR_DATA
//  247 	LCD_WR_DATA(0x29); 
        MOVS     R0,#+41
        BL       LCD_WR_DATA
//  248 	LCD_WR_DATA(0x2e); 
        MOVS     R0,#+46
        BL       LCD_WR_DATA
//  249 	LCD_WR_DATA(0x30); 
        MOVS     R0,#+48
        BL       LCD_WR_DATA
//  250 	LCD_WR_DATA(0x30); 
        MOVS     R0,#+48
        BL       LCD_WR_DATA
//  251 	LCD_WR_DATA(0x39); 
        MOVS     R0,#+57
        BL       LCD_WR_DATA
//  252 	LCD_WR_DATA(0x3f); 
        MOVS     R0,#+63
        BL       LCD_WR_DATA
//  253 	LCD_WR_DATA(0x00); 
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  254 	LCD_WR_DATA(0x07); 
        MOVS     R0,#+7
        BL       LCD_WR_DATA
//  255 	LCD_WR_DATA(0x03); 
        MOVS     R0,#+3
        BL       LCD_WR_DATA
//  256 	LCD_WR_DATA(0x10);  
        MOVS     R0,#+16
        BL       LCD_WR_DATA
//  257 	
//  258 	LCD_WR_REG(0x2a);
        MOVS     R0,#+42
        BL       LCD_WR_REG
//  259 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  260 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  261 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  262 	LCD_WR_DATA(0x7f);
        MOVS     R0,#+127
        BL       LCD_WR_DATA
//  263 
//  264 	LCD_WR_REG(0x2b);
        MOVS     R0,#+43
        BL       LCD_WR_REG
//  265 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  266 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  267 	LCD_WR_DATA(0x00);
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  268 	LCD_WR_DATA(0x9f);
        MOVS     R0,#+159
        BL       LCD_WR_DATA
//  269 	
//  270 	LCD_WR_REG(0xF0); //Enable test command  
        MOVS     R0,#+240
        BL       LCD_WR_REG
//  271 	LCD_WR_DATA(0x01); 
        MOVS     R0,#+1
        BL       LCD_WR_DATA
//  272 	LCD_WR_REG(0xF6); //Disable ram power save mode 
        MOVS     R0,#+246
        BL       LCD_WR_REG
//  273 	LCD_WR_DATA(0x00); 
        MOVS     R0,#+0
        BL       LCD_WR_DATA
//  274 	
//  275 	LCD_WR_REG(0x3A); //65k mode 
        MOVS     R0,#+58
        BL       LCD_WR_REG
//  276 	LCD_WR_DATA(0x05); 	
        MOVS     R0,#+5
        BL       LCD_WR_DATA
//  277 	LCD_WR_REG(0x29);//Display on	
        MOVS     R0,#+41
        BL       LCD_WR_REG
//  278 
//  279 	LCD_SetParam();//����LCD����	 
        BL       LCD_SetParam
//  280 //	LCD_LED_SET;//��������	 
//  281 	//LCD_Clear(WHITE);
//  282 }
        POP      {R0,PC}          ;; return
//  283 //******************************************************************
//  284 //��������  LCD_Clear
//  285 //���ܣ�    LCDȫ�������������
//  286 //���������Color:Ҫ���������ɫ
//  287 //����ֵ��  ��
//  288 //�޸ļ�¼����
//  289 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  290 void LCD_Clear(u16 Color)
//  291 {
LCD_Clear:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//  292 	u16 i,j;      
//  293 	LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);	  
        LDR.N    R0,??DataTable7_1
        LDRH     R0,[R0, #+2]
        SUBS     R3,R0,#+1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDR.N    R0,??DataTable7_1
        LDRH     R0,[R0, #+0]
        SUBS     R2,R0,#+1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_SetWindows
//  294 	for(i=0;i<lcddev.width;i++)
        MOVS     R0,#+0
        MOVS     R5,R0
??LCD_Clear_0:
        LDR.N    R0,??DataTable7_1
        LDRH     R0,[R0, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCS.N    ??LCD_Clear_1
//  295 	{
//  296 		for(j=0;j<lcddev.height;j++)
        MOVS     R0,#+0
        MOVS     R6,R0
??LCD_Clear_2:
        LDR.N    R0,??DataTable7_1
        LDRH     R0,[R0, #+2]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R0
        BCS.N    ??LCD_Clear_3
//  297 		LCD_WR_DATA_16Bit(Color);	//д������ 	 
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LCD_WR_DATA_16Bit
        ADDS     R6,R6,#+1
        B.N      ??LCD_Clear_2
//  298 	}
??LCD_Clear_3:
        ADDS     R5,R5,#+1
        B.N      ??LCD_Clear_0
//  299 }   		  
??LCD_Clear_1:
        POP      {R4-R6,PC}       ;; return
//  300 /*************************************************
//  301 ��������LCD_SetWindows
//  302 ���ܣ�����lcd��ʾ���ڣ��ڴ�����д�������Զ�����
//  303 ��ڲ�����xy�����յ�
//  304 ����ֵ����
//  305 *************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  306 void LCD_SetWindows(u16 xStar, u16 yStar,u16 xEnd,u16 yEnd)
//  307 {
LCD_SetWindows:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  308 #if USE_HORIZONTAL==1	//ʹ�ú���
//  309 	LCD_WR_REG(lcddev.setxcmd);	
//  310 	LCD_WR_DATA(xStar>>8);
//  311 	LCD_WR_DATA(0x00FF&xStar+3);		
//  312 	LCD_WR_DATA(xEnd>>8);
//  313 	LCD_WR_DATA(0x00FF&xEnd+3);
//  314 
//  315 	LCD_WR_REG(lcddev.setycmd);	
//  316 	LCD_WR_DATA(yStar>>8);
//  317 	LCD_WR_DATA(0x00FF&yStar+2);		
//  318 	LCD_WR_DATA(yEnd>>8);
//  319 	LCD_WR_DATA(0x00FF&yEnd+2);	
//  320 
//  321 #else
//  322 	
//  323 	LCD_WR_REG(lcddev.setxcmd);	
        LDR.N    R0,??DataTable7_1
        LDRH     R0,[R0, #+10]
        BL       LCD_WR_REG
//  324 	LCD_WR_DATA(xStar>>8);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R0,R4,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  325 	LCD_WR_DATA(0x00FF&xStar+2);		
        ADDS     R0,R4,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  326 	LCD_WR_DATA(xEnd>>8);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  327 	LCD_WR_DATA(0x00FF&xEnd+2);
        ADDS     R0,R6,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  328 
//  329 	LCD_WR_REG(lcddev.setycmd);	
        LDR.N    R0,??DataTable7_1
        LDRH     R0,[R0, #+12]
        BL       LCD_WR_REG
//  330 	LCD_WR_DATA(yStar>>8);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R0,R5,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  331 	LCD_WR_DATA(0x00FF&yStar+3);		
        ADDS     R0,R5,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  332 	LCD_WR_DATA(yEnd>>8);
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LSRS     R0,R7,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  333 	LCD_WR_DATA(0x00FF&yEnd+3);	
        ADDS     R0,R7,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WR_DATA
//  334 #endif
//  335 
//  336 	LCD_WriteRAM_Prepare();	//��ʼд��GRAM				
        BL       LCD_WriteRAM_Prepare
//  337 }   
        POP      {R0,R4-R7,PC}    ;; return
//  338 
//  339 /*************************************************
//  340 ��������LCD_SetCursor
//  341 ���ܣ����ù��λ��
//  342 ��ڲ�����xy����
//  343 ����ֵ����
//  344 *************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  345 void LCD_SetCursor(u16 Xpos, u16 Ypos)
//  346 {	  	    			
LCD_SetCursor:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  347 	LCD_SetWindows(Xpos,Ypos,Xpos,Ypos);
        MOVS     R3,R5
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LCD_SetWindows
//  348 } 
        POP      {R0,R4,R5,PC}    ;; return
//  349 
//  350 //����LCD����
//  351 //������к�����ģʽ�л�

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  352 void LCD_SetParam(void)
//  353 { 	
LCD_SetParam:
        PUSH     {R7,LR}
//  354 	lcddev.wramcmd=0x2C;
        LDR.N    R0,??DataTable7_1
        MOVS     R1,#+44
        STRH     R1,[R0, #+8]
//  355 #if USE_HORIZONTAL==1	//ʹ�ú���	  
//  356 	lcddev.dir=1;//����
//  357 	lcddev.width=128;
//  358 	lcddev.height=128;
//  359 	lcddev.setxcmd=0x2A;
//  360 	lcddev.setycmd=0x2B;			
//  361 	LCD_WriteReg(0x36,0xA8);
//  362 
//  363 #else//����
//  364 	lcddev.dir=0;//����				 	 		
        LDR.N    R0,??DataTable7_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
//  365 	lcddev.width=128;
        LDR.N    R0,??DataTable7_1
        MOVS     R1,#+128
        STRH     R1,[R0, #+0]
//  366 	lcddev.height=128;
        LDR.N    R0,??DataTable7_1
        MOVS     R1,#+128
        STRH     R1,[R0, #+2]
//  367 	lcddev.setxcmd=0x2A;
        LDR.N    R0,??DataTable7_1
        MOVS     R1,#+42
        STRH     R1,[R0, #+10]
//  368 	lcddev.setycmd=0x2B;	
        LDR.N    R0,??DataTable7_1
        MOVS     R1,#+43
        STRH     R1,[R0, #+12]
//  369 	LCD_WriteReg(0x36,0xC8);
        MOVS     R1,#+200
        MOVS     R0,#+54
        BL       LCD_WriteReg
//  370 #endif
//  371 }	
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     GPIOx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     lcddev

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
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
//  372 
//  373 
// 
//    20 bytes in section .bss
//     2 bytes in section .data
// 1 148 bytes in section .text
// 
// 1 148 bytes of CODE memory
//    22 bytes of DATA memory
//
//Errors: none
//Warnings: none
