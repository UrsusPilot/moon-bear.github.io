# OV7670-CMOS模組

原始版本datasheet[](http://www.voti.nl/docs/OV7670.pdf)http://www.voti.nl/docs/OV7670.pdf

*    controlled through the Serial Camera Control Bus (SCCB) interface.

*   st standard lib DCMI example 有寫說SCCB是I2C like protocol！
*   詳細SCCB spec: [](http://www.ovt.com/download_document.php?type=document&DID=63)http://www.ovt.com/download_document.php?type=document&DID=63
*

為了配合王同學[的QcopterMV開發板](https://github.com/Hom19910422/QCopterMachineVision)，改用此模組(**OV7670-CMOS**)傳輸影像。

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_HdKevEgZfSA_p.88862_1388211875814_123.jpg)
<table style="font-size:13px;cell-spacing: 0px; border-collapse: collapse;"><tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">VDD</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">GND</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Pin</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Type</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Description</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">SDIOC</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">SDIOD</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">VDD**</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Supply</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Power supply</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">VSYNC</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">HREF</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">GND</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Supply</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Ground level</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">PCLK</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">XCLK</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">SDIOC</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Input</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">SCCB clock</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">D7</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">D6</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">SDIOD</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Output</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">SCCB data</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">D5</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">D4</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">VSYNC</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Output</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Vertical synchronization</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">D3</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">D2</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">HREF</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Output</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Horizontal synchronization</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">D1</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">D0</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">PCLK</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Output</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Pixel clock</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">RESET</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">PWDN</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">XCLK</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Input</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">System clock</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">D0-D7</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Output</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Video parallel output</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">RESET</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Input</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Reset (Active low)</td>
</tr>
<tr><td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added"></td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">/</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">PWDN</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Input</td>
<td style="border:1px solid #999; min-width: 50px;height: 22px;line-height: 16px;padding: 0 4px 0 4px;" class="added">Power down (Active high)</td>
</tr>
</table>

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_HdKevEgZfSA_p.88862_1387902424723_未命名.png)

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_HdKevEgZfSA_p.88862_1387902993979_未命名.png)

王同學的QcopterMV開發板

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_HdKevEgZfSA_p.88862_1387902821381_hackpad.com_FHBw4daIJbY_p.88549_1387801133805_DCMI.png)

TTL Connection:

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_HdKevEgZfSA_p.88862_1388735966152_1234.bmp)

補充一下datasheet 此模組(**OV7670-CMOS**)

IO 1~IO 3 對應到王同學的QcopterMV開發板lay out圖中的

NetDCMI_18~NetDCMI_20

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_HdKevEgZfSA_p.94311_1387903408829_undefined)

接腳說明:

*    OV7670 视频口有八根数据线, D[7:0]，它支持的数据格式有 8 位 RGB raw 输出, 8 位 YcbCr 输出, 8 位 RGB 565/555/444 输出。
*   行同步信号 Href 和 Hsyn 是用同一引脚（Href pin）输出，通过写 SCCB 寄存器，可 选择这个引脚作为 Href 或 hsyn 信号。
*   SCCB 总线 SIO_C 和 SIO_D 应外加上拉电阻，典型值是 4.7K。
*     Reset#低有效，可由 GPIO 控制，若不使用时可连到 DOVDD。如果 Reset#连到 DOVDD，必 须通过写 SCCB 寄存器来进行软件复位。  

## github  DCMI_OV7670

我們的影像開發專案：[](https://github.com/zxc2694/DCMI_OV7670)[https://github.com/zxc2694/DCMI_OV7670](https://github.com/zxc2694/DCMI_OV7670)

**sccb.h:(腳位)**

*     [#define](/ep/search/?q=%23define&via=HdKevEgZfSA)  SCCB_SDA_PIN   GPIO_Pin_13
*     #define  SCCB_SCL_PIN   GPIO_Pin_3
*     #define  SCCB_SDA_GPIO      GPIOC
*     #define  SCCB_SCL_GPIO      GPIOB

*     #define Sensor_VSYNC_PIN    GPIO_Pin_7
*     #define GPIO_VSYNC          GPIOB
*     #define RCC_VSYNC_Clock     RCC_AHB2Periph_GPIOB

*     #define GPIO_PIN_VSYNC_CMOS                GPIO_Pin_3
*     #define EXTI_LINE_VSYNC_CMOS               EXTI_Line3
*     #define GPIO_PORT_SOURCE_VSYNC_CMOS        GPIO_PortSourceGPIOC
*     #define GPIO_PIN_SOURCE_VSYNC_CMOS         GPIO_PinSource3

**SCCB_OV7670.c (_DCMI pins的連接_)**
<undefined><li>**void OV7670_HW_Init(void)  **</li></undefined>

[](https://github.com/zxc2694/DCMI_OV7670/blob/master/program/SCCB_OV7670.c)[https://github.com/zxc2694/DCMI_OV7670/blob/master/program/SCCB_OV7670.c](https://github.com/zxc2694/DCMI_OV7670/blob/master/program/SCCB_OV7670.c)
<undefined><li>
</li></undefined>

## 相關教學

1.[基于STM32F417的图像采集系统设计](http://www.dzsj.net/dzcp/%E5%9F%BA%E4%BA%8ESTM32F417%E7%9A%84%E5%9B%BE%E5%83%8F%E9%87%87%E9%9B%86%E7%B3%BB%E7%BB%9F%E8%AE%BE%E8%AE%A1.htm)

2.[51+OV7670+FIFO+SD卡+znFAT+QVGA BMP 实现简易数码相机](http://bbs.eeworld.com.cn/thread-355582-1-1.html)

3. 參考文件 : [OV7670-CCD模組.rar](https://www.dropbox.com/s/6e5dv705glwmz6a/OV7670-CCD%E6%A8%A1%E7%B5%84.rar)

4. [DCMI_Config](http://www.amobbs.com/thread-5038120-1-1.html)

5. [SCCB與 I2C差別](http://wenku.baidu.com/view/74efaec0aa00b52acfc7ca22.html) ([補充](http://blog.csdn.net/liugf05/article/details/8167771))

*   OV7670输出同步信号包括：场同步信号VSYNC、行同步信号HREF、像素时钟PCLK。
*   在系统初始化设置成功以后，微控制器不断监测VSYNC信号电平变化，根据VSYNC产生的中断情况，控制FIFO对图像数据的读／写：

1.  当STM32F417**第一次检测到VSYNC下降沿时，系统第一次产生中断，表明OV7670开始输出一帧图像**，STM32F417将FIFO_WEN置高电平，当HREF有效(高电平)时，**FIFO_WEN**与HREF通过与非门使能FIFO的WCK，将有效图像数据自动写入FIFO中。
2.  **.当第二次VSYNC中断产生时，表明已经将一帧完整的图像写入FIFO**，系统通过将**FIFO_WEN**置低，锁存一帧图像数据，实现图像的静态存储。此时，STM32F417送给FIFO的读时钟RCLK一个上升沿，将数据从FIFO中读出来，完成图像数据的实时采集与提取。

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_HdKevEgZfSA_p.88862_1388213982652_undefined)

*   由于对摄像头工作参数的配置主要通过**SCCB**来实现，因此，在系统进行软件设计时，首先设计SCCB相关程序，进而通过SCCB设置摄像头的相关参数。

其它 github參考範例:

[](https://github.com/desaster/ov7670test)[https://github.com/desaster/ov7670test](https://github.com/desaster/ov7670test)

[](https://github.com/ctc8631/ov7670)[https://github.com/ctc8631/ov7670](https://github.com/ctc8631/ov7670)

[](https://github.com/Ursadon/ov7670-stm32)[https://github.com/Ursadon/ov7670-stm32](https://github.com/Ursadon/ov7670-stm32)