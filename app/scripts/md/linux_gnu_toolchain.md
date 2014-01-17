# 從uVision移植至linux gnu toolchain編譯環境

Sourcery CodeBench Lite 2012.03-56

[](https://sourcery.mentor.com/GNUToolchain/release2188)https://sourcery.mentor.com/GNUToolchain/release2188

*   Compiler Control String
*

-c --cpu Cortex-M4.fp -D__EVAL -D__MICROLIB -g -O0 --apcs=interwork -I..\ -I..\Libraries\CMSIS -I..\Libraries\CMSIS\startup -I..\Libraries\STM32F4xx_StdPeriph_Driver\inc -I..\Libraries\STM32F4xx_StdPeriph_Driver\src -I..\Program_Dirver -I..\Program_Algorithm -I..\Program_System -I..\Program_Module -I C:\Keil\ARM\RV31\Inc -I C:\Keil\ARM\CMSIS\Include -I C:\Keil\ARM\Inc\ST\STM32F4xx -DSTM32F40XX -DUSE_STDPERIPH_DRIVER -D__FPU_PRESENT="1" -D__FPU_USED="1" -DARM_MATH_CM4 -D__CC_ARM -o ".\Obj\*.o" --omf_browse ".\Obj\*.crf" --depend ".\Obj\*.d"

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_OcWf9PMTrRk_p.88549_1385907873406_%E6%93%B7%E5%8F%962.PNG)