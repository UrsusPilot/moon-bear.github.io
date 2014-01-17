# STM32F4與FreeRTOS中斷

在開發途中發現許多幾個跟中斷的問題，我們要使用FreeRTOS就必須符合正確觸發中斷的條件。

第一個也是最重要的就是－**FreeRTOS的Task優先權(數字越大擁有越高優先權)和Cortex-M的中斷優先權(數字越小擁有越大優先權)是剛好顛倒的**，這在FreeRTOS網站上強調很多次。

第二個則是FreeRTOS建議Cortex-M架構的MCU使用只用搶佔優先權(preemption piority)沒有次要優先權(sub piority)的中斷，在使用ST LIB時必須在使用任何NVIC之前呼叫

NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4)

這樣才能確保呼叫正確，以STM32F4例子來說我們有4bit的preemption level，0~15的優先權

在FreeRTOSConfig.h有兩個選擇可以決定如何移植FreeRTOS的中斷

*   configKERNEL_INTERRUPT_PRIORITY should be set to the lowest priority. 
<undefined><li>**<u>1.For ports that only implement configKERNEL_INTERRUPT_PRIORITY</u>**</li></undefined>

configKERNEL_INTERRUPT_PRIORITY sets the interrupt priority **used by the RTOS kernel itself**.

*    Interrupts that call API functions must also execute **at this priority.**
*    Interrupts that do not call API functions can  execute at higher priorities 
*   Interrupts that do not call API functions can execute  at higher priorities and therefore never have their execution delayed  by the RTOS kernel activity (within the limits of the hardware itself)

<undefined><li>**<u>2.For ports that implement both configKERNEL_INTERRUPT_PRIORITY and configMAX_SYSCALL_INTERRUPT_PRIORITY</u>**</li></undefined>

*   configKERNEL_INTERRUPT_PRIORITY sets the interrupt priority used by the RTOS kernel itself.  
*   configMAX_SYSCALL_INTERRUPT_PRIORITY sets the **highest interrupt priority** from which interrupt **safe FreeRTOS API functions **can be called. 
*   A full interrupt nesting model is achieved by setting  configMAX_SYSCALL_INTERRUPT_PRIORITY above (that is, at a higher  priority level) than configKERNEL_INTERRUPT_PRIORITY.
*   **This means the FreeRTOS kernel does not completely disable interrupts, even inside critical sections.**
*   Interrupts that do not call API functions can execute  at priorities above configMAX_SYSCALL_INTERRUPT_PRIORITY and therefore  never be delayed by the RTOS kernel execution. 

Ex: 0 being the lowest and 7 being the highest

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_b5vnsVtmVuw_p.88549_1388039125130_Interrupt-priorities-interrupt-nesting.jpg)

To utilize this scheme your application design must adhere to the following rule: **Any  interrupt that uses the FreeRTOS API must be set to the same priority  as the RTOS kernel (as configured by the configKERNEL_INTERRUPT_PRIORITY macro), or at or below  configMAX_SYSCALL_INTERRUPT_PRIORITY for ports that include this  functionality.**

所有要用FreeRTOS API的中斷其優先權必須要同等於RTOS Kernel的中斷相等(**configKERNEL_INTERRUPT_PRIORITY**)或是優先權比**configMAX_SYSCALL_INTERRUPT_PRIORITY低**

從上的結論可以看出，在我們的例子使用了2的實現方式，這代表著中斷可以為不呼叫FreeRTOS的API或是呼叫FreeRTOS的API。也可以分成優先權比**configMAX_SYSCALL_INTERRUPT_PRIORITY**高或低。

**Tasks 流程**

[](http://www.freertos.org/RTOS-task-states.html)http://www.freertos.org/RTOS-task-states.html

vTaskResume() & vTaskSuspend() 的使用

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_b5vnsVtmVuw_p.88862_1388901188242_tskstate.gif)

## Semaphore

[](http://www.socialledge.com/sjsu/index.php?title=FreeRTOS_Tutorial "FreeRTOS_Tutorial")http://www.socialledge.com/sjsu/index.php?title=FreeRTOS_Tutorial

*

[](http://www.youtube.com/watch?v=grXuVMttVuU)http://www.youtube.com/watch?v=grXuVMttVuU