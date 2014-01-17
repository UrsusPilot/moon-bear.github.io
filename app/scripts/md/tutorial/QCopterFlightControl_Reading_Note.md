# QCopterFlightControl Reading Note

這個專頁為分享閱讀[Hom](https://github.com/Hom19910422)的QCopterFlightControl的一些筆記。

github: [](https://github.com/Hom19910422/QCopterFlightControl)https://github.com/Hom19910422/QCopterFlightControl

學習四軸飛行器基本知識

[](http://blog.oscarliang.net/build-a-quadcopter-beginners-tutorial-1/)[http://blog.oscarliang.net/build-a-quadcopter-beginners-tutorial-1/](http://blog.oscarliang.net/build-a-quadcopter-beginners-tutorial-1/)

姿態推導

[](http://www.freescale.com/files/sensors/doc/app_note/AN3461.pdf)http://www.freescale.com/files/sensors/doc/app_note/AN3461.pdf

## 如何讓飛控板一開始就進行穩定控制

因為原始作者使用自行設計的遙控器,但是我們並沒有這個遙控器,所以如果我們要用市售的rc遙控器必須用pwm input去控制系統給roll, pitch ,yaw,thrust，所以要先設計一個可以接受pwm訊號控制的軟體。

*   在QCopterFC_transport.h這裡發現接收rf訊號時裡面有幾個參數是控制的參數

*   #define Exp_Pitch   RecvData[20]
*   #define Exp_Roll    RecvData[21]
*   #define Exp_Yaw     RecvData[22]
*   #define Exp_Thr     RecvData[23]

*   void SysTick_Handler( void )

*   /* Check Connection */
*   [ ](/ep/search/?q=%23define&via=Shw0s5MqHBf)[#define](https://embeddedcool.hackpad.com/ep/search/?q=%23define&via=Shw0s5MqHBf) NoSignal 1  // 1 sec
*      if(KEYR_L == 0)
*   Motor_Control(PWM_MOTOR_MIN, PWM_MOTOR_MIN, PWM_MOTOR_MIN, PWM_MOTOR_MIN);
*      else if(((Time_Sec-RecvTime_Sec)>NoSignal) || ((Time_Sec-RecvTime_Sec)<-NoSignal))
*      Motor_Control(PWM_MOTOR_MIN, PWM_MOTOR_MIN, PWM_MOTOR_MIN, PWM_MOTOR_MIN);
*      else     
*      Motor_Control(Final_M1, Final_M2, Final_M3, Final_M4);

KEYR_L == 0為讓馬達設為最低轉速，經作者王文宏證實這個變數代表著關油門；第五至六行應為判斷無rf訊號也關油門。如果把這些都刪掉只留下第8行我們就可以讓飛控板一開始就可以進行平衡的控制

## PWM

[[pwm教學](http://www.360doc.com/content/11/0917/23/7736891_149119727.shtml) ]解釋多個PWM可由一個TIM控制

PWM有兩種mode分別為模式1 模式2

模式1

脈衝寬度調製模式可以產生一個由TIMx_ARR寄存器確定頻率、由TIMx_CCRx寄存器確定占空比的信號。

在TIMx_CCMRx寄存器中的OCxM位寫入’110’(PWM模式1)或’111’(PWM模式2)，能夠獨立地設置每個OCx輸出通道產生一路PWM。必須設置TIMx_CCMRx寄存器OCxPE位以使能相應的預裝載寄存器，最後還要設置TIMx_CR1寄存器的ARPE位使能自動重裝載的預裝載寄存器(在向上計數或中心對稱模式中)。

在PWM模式(模式1或模式2)下，TIMx_CNT和TIM1_CCRx始終在進行比較，(依據計數器的計數方向)以確定是否符合TIM1_CCRx≤TIM1_CNT或者TIM1_CNT≤TIM1_CCRx。然而為了與OCREF_CLR的功能(在下一個PWM週期之前，ETR信號上的一個外部事件能夠清除OCxREF)一致，OCxREF信號只能在下述條件下產生：

110：PWM模式1－在向上計數時，一旦TIMx_CNT<TIMx_CCR1時通道1為有效電平，否則為無效電平；在向下計數時，一旦TIMx_CNT>TIMx_CCR1時通道1為無效電平(OC1REF=0)，否則為有效電平(OC1REF=1)。

111：PWM模式2－在向上計數時，一旦TIMx_CNT<TIMx_CCR1時通道1為無效電平，否則為有效電平；在向下計數時，一旦TIMx_CNT>TIMx_CCR1時通道1為有效電平，否則為無效電平。

本例展示了如何設置TIM工作在脈衝寬度調製模式（PWM Pulse Width Modulation

mode）。

TIM3時鐘設置為36MHz，預分頻設置為0，TIM2計數器時鐘可表達為：

TIM3 counter clock = TIMxCLK / (Prescaler +1) = 36 MHz

設置TIM3_CCR1寄存器值為500，則TIM3通道1產生一個頻率為36MHz，占空比（duty cycle）為50%的PWM信號。

同理，根據寄存器TIM3_CCR2 、TIM3_CCR3和 TIM3_CCR4的值，TIM3通道2產生一個頻率為36MHz，占空比（duty cycle）為37.5%的PWM信號；TIM3通道1產生一個頻率為36MHz，占空比（duty cycle）為25%的PWM信號；TIM3通道1產生一個頻率為36MHz，占空比（duty cycle）為12.5%的PWM信號。

可以通過示波器，在相應管腳觀察到輸出信號。

*   u16 CCR1_Val = 500;
*   u16 CCR2_Val = 375;
*   u16 CCR3_Val = 250;
*   u16 CCR4_Val = 125;
*    
*     TIM_TimeBaseStructure.TIM_Period = 999;         
*     TIM_TimeBaseStructure.TIM_Prescaler = 0;      
*     TIM_TimeBaseStructure.TIM_ClockDivision = 0;   
*     TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
*     TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure);
*     TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;         
*     TIM_OCInitStructure.TIM_Channel = TIM_Channel_1;         
*     TIM_OCInitStructure.TIM_Pulse = CCR1_Val; 
*     TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;   
*     TIM_OCInit(TIM3, &TIM_OCInitStructure);
*   _启用CCR1寄存器的影子寄存器（直到产生更新事件才更改设置）_
*     TIM_OC1PreloadConfig(TIM3, TIM_OCPreload_Enable);
*    
*     TIM_OCInitStructure.TIM_Channel = TIM_Channel_2;         
*     TIM_OCInitStructure.TIM_Pulse = CCR2_Val; 
*    
*     TIM_OCInit(TIM3, &TIM_OCInitStructure);
*     TIM_OC2PreloadConfig(TIM3, TIM_OCPreload_Enable);
*    
*     TIM_OCInitStructure.TIM_Channel = TIM_Channel_3;         
*     TIM_OCInitStructure.TIM_Pulse = CCR3_Val; 
*    
*     TIM_OCInit(TIM3, &TIM_OCInitStructure);
*     TIM_OC3PreloadConfig(TIM3, TIM_OCPreload_Enable);
*    
*      TIM_OCInitStructure.TIM_Channel = TIM_Channel_4;         
*     TIM_OCInitStructure.TIM_Pulse = CCR4_Val; 
*    
*     TIM_OCInit(TIM3, &TIM_OCInitStructure);
*     TIM_OC4PreloadConfig(TIM3, TIM_OCPreload_Enable);
*    
*     TIM_ARRPreloadConfig(TIM3, ENABLE);
*    
*     TIM_Cmd(TIM3, ENABLE);
*     while (1)
*     {
*     } 
*   }

## 飛控板上的PWM宣告用到的file

*   module_motor.c file

*   GPIO_PinAFConfig(GPIOA, GPIO_PinSource6, GPIO_AF_TIM3);
*   GPIO_PinAFConfig(GPIOA, GPIO_PinSource7, GPIO_AF_TIM3);
*   GPIO_PinAFConfig(GPIOB, GPIO_PinSource0, GPIO_AF_TIM3);
*   GPIO_PinAFConfig(GPIOB, GPIO_PinSource1, GPIO_AF_TIM3);

*     module_motor.h file

*   #define PWM_Motor1 TIM3->CCR1   // 無刷 PWM
*   #define PWM_Motor2 TIM3->CCR2   // 無刷 PWM
*   #define PWM_Motor3 TIM3->CCR3   // 無刷 PWM
*   #define PWM_Motor4 TIM3->CCR4   // 無刷 PWM

CCR代表控制脈波寬度調變得週期大小 chanel

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_Shw0s5MqHBf_p.94311_1385729095049_pwm)

## 飛控板開啟流程

## PWM Input Capture

市售遙控器原理為:

操作搖桿產生PWM singal ->RF Modulation->RF Demodulation->PWM signal->飛控板

所以要解析遙控器的訊號重點為如何處理PWM Input Capture->連結