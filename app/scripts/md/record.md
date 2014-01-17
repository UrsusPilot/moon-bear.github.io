# 實驗記錄

## 1/12決戰電機系館

*   1000-1200  訪談錄影
*   1200-1330  場地佈置
*   1300-1630  報告15min/team
*   1630-1700  外面場地進行飛行
*   1700--    獎項頒獎

*   [注意] 我跟老師改約早上11點30囉 ! 當天請大家 **11點在航太系門口 **一起過去嘿!!

## 1/10

*   著手重新設計nrf傳送封包(一個封包32byte與nrf2401的單次傳送最大值相符)

        *   設計完成，目前已經可以把shell和gui message共存:[github link](https://github.com/fboris/QuadcopterFlightControl/commit/c0597f66df089259ac77ac7f330d51bc4e8b319b) 
    *   控制板上nrf2401->nrf2401+STM32F4Discovery(轉USART)->電腦

*   承翰接手飛行，但是出現throttle跳動異常行為，尚未確認是飛行員的操作或者飛控板接收異常(wfly遙控器)

        *   監看PWM input capture, pid output value行為正常

*   飛行教學：於模擬飛行後實際飛行四軸,步驟為下,確認電源開始之後,init成功,此時遙控器一定要開啟以免程式錯誤造成誤飛動作,並把遙控器的安全開關打開(ch1~ch4輸入無法給任何動作)打開安全開關後,測試th roll & pitch yaw所對應到的馬達必須要對,也就是飛行之前必須校正完全,在進行飛行動作,而四軸th到一定值後,不穩定系統的四軸馬上進行漂移,請即時作姿態的遙控器控制

## 1/9

*   進一步完善reset指令,新增reset [parameter]
*   鄭聖文:接手SD卡開發

        *   -構想:建立兩檔,log, config(每次開機讀config的一些參數到系統,更改之歷史紀錄丟log)

*   嘗試各種方法改善nrf速度，但是仍然無法達到xbee的水準

        *   降低延遲時間
    *   等待IRQ pin高電位

## 1/8

*   status monitor中新增reset all指令(並模組化原status monitor架構)
*   添加一些說明、授權相關文件

## 1/7

*   原本是用vTaskResume()跟vTaskSuspend()機制來啟動sdio, 但讀寫多次vTaskResume()會error無法進入stio_task(存檔大約5次以上會失敗),  改用 [xSemaphoreHandle](https://github.com/zxc2694/QuadrotorFlightControl/commit/7e0071149890bac8168b0abd44d657eb425f349f) 機制來取代。現在sdsave讀寫多次已經都沒有問題了 。

## 1/6

*   新增功能:讓status monitor顯示尚未update的設定值
*   預計新增:set reset一類指令來完善監視器的功能
*   nrf通訊問題解決，但是nrf設計封包一次可以傳32byte，必須將原本的文字重新分割分批傳送
*   sdsave問題仍未改善，有機會無法存檔

## 1/5

*   新增兩個指令sdinfo、sdsave在shell裡，一個用來顯示SD card訊息(記憶體大小)，一個用來儲存現在的姿態。
*   已解決SD card只能讀一次的問題，現在可以連續讀取文件內容。但sdsave有bug，讀取時快時慢，甚至有時卡住。

*   用gdb觀察sdio_task行為如何?
*   沒問題囉 ! 今早已修復。
*

*   nrf2401模組重新使用

        *   github repo:[](https://github.com/fboris/QuadrotorGroundStation)https://github.com/fboris/QuadrotorGroundStation
    *   已可以通過之前卡在nrf_check()並可以由飛控板發送訊息，由nrf2401+STM32F4Discovery的地面站轉成USART由電腦接收，目前雖然可以收到資料但是收到的資料都是空白的'\0'

*   製作硬體蜂鳴器電路,為了避免四軸當電池電量過低,或是飛行狀態有危險的時候,

*   立刻發出Alarm聲響,告知目前狀態可能導致四軸失控,做降落防範機制

*   現在好像太小聲了...我們似乎把buzzer買成speaker

*   **ps指令目前停止使用，因為底層所呼叫的vTaskList() FreeRTOS已經不再維護是舊的函式**

## 1/4

*   本日飛行測試

*

*   在FreeRTOS下執行
*   因為利用USART回傳訊息給WEB GUI與Shell功能衝突，目前只能擇一
*   可以實際運行status_report(GUI回報)，並可以即時的反應其參數
*   shell只有在地面測試馬達，尚未起飛。根據Ming的說法是在我大量輸出monitor的資訊時會有一點不平衡的現象，不過在我接上示波器觀察flightcontrol task並沒有被延遲的情況
*   發現濾波器問題，當飛行器接受控制向前指令受到明顯的加速度後，其姿態並不能正確的被算出，而是水平的狀態。這代表至少在AHRS部分計算有受到加速規的影響。
*   讓Linenoise支持Ctrl + C熱鍵來捨棄一行指令
*   讓Status monitor支持命令列的自動補齊功能
*   [ [四軸飛高高海報專區](https://embeddedcool.hackpad.com/NcfzuQiG05v) ]

## 1/3

*   修正monitor的結束後快速打上ps指令會導致系統崩潰,由gdb追蹤後發現,程式會卡在malloc的部份,經查閱了一些文件之後,推測是跟記憶體管理的策略有關

*   現象為:打了monitor進入monitor再打quit出來monitor，此時所有command都會失效
*   而ps曾經在一開機打直接讓系統當機

參考:[](http://mcuos.com/viewthread.php?action=printable&tid=45)[http://mcuos.com/viewthread.php?action=printable&tid=45](http://mcuos.com/viewthread.php?action=printable&tid=45)

*      [](http://www.amobbs.com/thread-5545257-1-1.html)[http://www.amobbs.com/thread-5545257-1-1.html](http://www.amobbs.com/thread-5545257-1-1.html)
*      [](http://stackoverflow.com/questions/18355914/freertos-allocation-error)[http://stackoverflow.com/questions/18355914/freertos-allocation-error](http://stackoverflow.com/questions/18355914/freertos-allocation-error)

"This was probably caused by fragmentation in **heap_2.c**. Even though the allocations were pretty small, the behaviour was consistent. Using **heap_4.c** solved it."

*   Good point! You can track the lifecycle of the allocated objects.

*   在shell task

## 1/2

*   Web GUI Plot已初步完成

        *   [](https://github.com/chilijung/flight-plot)https://github.com/chilijung/flight-plot

*   修正Linenoise歷史紀錄不常操作導致系統崩潰問題

*   系統架構圖(第二版)

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_Y38T9JXygI8_p.88862_1388674362841_System_Structure.bmp)

## 1/1 新年快樂!

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_Y38T9JXygI8_p.88575_1388511573739_螢幕擷圖存為 2014-01-01 01:38:36.png)

*   Shell現在支持:**clear**、**help**、**monitor**(未完)、**ps**四個指令
*   QuadCopter Status Monitor界面大致設計完畢

      新增set指令:set pitch.kp 50.5 (並加入警示功能)

*    在飛控正在執行的時候通常kp和kd都會一起改，而且通常Roll與Pitch的kp及kd都會改，建議在設定後可以自己決定如何生效(讓操作者有時間反應)
*   上述已完成

*   QuadCopter Status monitor指令

     resume(關閉命令列,回到狀態回報模式)

*   help(說明)
*   quit(離開程式)
*   set(設定) - set [parameter] [value]來設定新的值到緩衝區 / set update 啟用新的設定值

**QuadCopter TODO:**

*   將更改過但未生效的設定值秀出來

*   **Bug**

shell一直按enter會crash，停在vPortMalloc中，並且原本的flight control會無法正確排程。

*   1/2修正

加入sdio task會讓roll  及 pitch無法控制，疑似與昨天發現的printf  bug類似。

*   如果只有單一個sdio_task 是可以成功執行寫入文字檔，數個task，會互相影響而崩潰。
*   應該是有資源沒有保護到,應加入semaphore or mutex

## 12/31

*   各位請補充一下有什麼需要測試

*   問題:Shell 如何與[紀力榮](https://www.facebook.com/lirong.ji)的Web GUI共存？
*   因為時間關係，影像部分可能來不及了，本來SD卡要用來儲存影像，現在希望SD卡改成拿來儲存PID控制的數據變化。
*   已將sdio相關程式([連結](https://github.com/zxc2694/QuadrotorFlightControl/commits/master))移進我們的專案裡。
*   新增help指令。

## 12/30

*   改寫命令解析器,使其成為一個模組、可重複利用(新增group概念)
*   獨立出Quadcopter Status Monitor相關程式碼
*   Bug:

        *   printf在statusreport_task中如果呼叫第二次printf，會讓AngE的值變成0x40000，但是如果printf只有呼叫一次並沒有這問題。[github commit](https://github.com/fboris/QuadrotorFlightControl/commit/5a85da4391a3311c0b847484a0f58567ff63e342) 

*   我們所參考的影像專案，[makefile](https://github.com/zxc2694/DCMI_OV7670/tree/test_makefile)寫好了，但是原作**漏掉非常多的檔案**，像是 <u>[stm324xg_eval_lcd.c](https://github.com/zxc2694/DCMI_OV7670/blob/test_makefile/Libraries/STM3240_EVAL/stm324xg_eval_lcd.c) 、</u>[stm324xg_eval.c](https://github.com/zxc2694/DCMI_OV7670/blob/test_makefile/Libraries/STM3240_EVAL/stm324xg_eval.c)等等，雖然已全補上，但是有些.h檔是他自己寫的，卻沒有放上來，以至於SCL_High、SDA_Low、SDA_High等等，這些副涵式完全讀不到，一堆無解的error。

*   先暫時別動這邊了

## 12/29

*   感謝新夥伴[紀力榮](https://www.facebook.com/lirong.ji)加入四軸飛高高，幫忙用Web UI 設計好用的監控界面。

*   建議繼續發展Shell,畢竟有些參數還是透過命令列調整較為容易

*   新增影像模組專案[[DCMI_OV7670](https://github.com/zxc2694/DCMI_OV7670)]，目前還無法測試，初步觀察程式碼認為是可行的。([參考出處](http://www.61ic.com/code/viewthread.php?tid=606048))
*   [stm32_sdio](https://github.com/poemking/stm32_sdio)(SD卡)與[DCMI_OV7670](https://github.com/zxc2694/DCMI_OV7670)專案的**Libraries**(2013.1)一致，方便日後合併。

## 12/27

*   飛行**模擬器測試成功**,在飛行四軸實體機前,需先使用遙控器的模擬軟體進行飛行

     我們使用的是AERO fly這套軟體,遙控器使用5CH來進行控制:

     左邊2CH的十字鈕各為[上下ELVE(**pitch**) 左右RUDD**(yaw**)]

*   右邊2CH的十字鈕各為[上下THRO 左右AILE(**roll**) ]
*   1CH為搖控電源開關,四軸在飛行危險時的保護開關

*   完成移植命令解析器,Shell移植成功,準備開始撰寫週邊指令

*   1.status可以先參考我之前狀態回報需要顯示的訊息
*   2.新增set pid可以調整on-line調整pid參數，並在調整的時候可以看目前的重要訊息(例如status所顯示的)，我的想法是在開啟pid  tuning的時候建立一個task去更新pid參數，然後退出會自己把task刪除
*   可以 suspend 一個 FreeRTOS task，若 task 只做 PID 參數調整那平常就保持 suspend/idle 狀態即可
<ul style="list-style: none;"><li>
</li></ul style="list-style: none;">

## 12/26

*   USART同步問題解決,**linenoise測試成功**,開始移植命令解析器

*   [github commit](https://github.com/fboris/QuadrotorFlightControl/commit/3ae7737f1fa8a528e5bc4501ed9d7671dd47b02a) 

*   **命令列構想**:

1.  status指令進入狀態回報程式,以ctrl + c 中斷                   
2.  set指令設定某些四軸的環境變數
3.  info指令顯示一些四軸的環境變數
4.  提案:用command來拍照、儲存一些資料到SD卡
5.  online tuning PID parameter

*   在FreeRTOS分支裡的QCopter.c中有需多條件式編譯，建議集中到同個檔案管理(類似FreeRTOSConfig.h)
*   建立一個自動測試可以測試shell environment 會不會崩潰
*   必須測試FreeRTOS是否正確排程Flight Control
*   影像專案CAMERA_Capture 可能無法使用，因為此專案的影像傳輸是用**I2C**的方式，但是王同學的QCopterMV開發板，並沒有拉出I2C的線，必須配合他的板子用**camera interface**的傳輸方式，所以需要尋找其他的專案。(ST有提供camera interface的LIB，但是他的模組是OV2640，跟我們不太一樣，不確定會不會有問題！)

## 12/25

今日進度

*   很幸運的實驗室剛好有一顆可以傳輸8bit的**影像模組**（[OV7670](http://goods.ruten.com.tw/item/show?21306136604079)）所以直接它拿來使用，從[OV7670的layout圖](https://embeddedcool.hackpad.com/OV7670-CMOS-HdKevEgZfSA) 可以看出與[QCopteMV開發版](https://github.com/Hom19910422/QCopterMachineVision)接腳是完全配對的，可以直接插入。
*   在github新增了新專案**[CAMERA_Capture](https://github.com/zxc2694/CAMERA_Capture)**，此專案目前還沒有makefile。
*   由於Ming說要飛四軸之前，要先練習過遙控器的**模擬器**，這樣之後控制飛機比較安全，所以到了祥大模型店買了模擬軟體以及遙控器（之前都是借用航太系的遙控器），不過遙控器裡面的設定很複雜，因為他都是給定翼機在飛的，而我們是旋翼機，目前調它的姿態控制有點問題。
*   遇到了FreeRTOS與**中斷處理**的問題[[詳細狀況](https://embeddedcool.hackpad.com/STM32F4FreeRTOS-b5vnsVtmVuw)]。昨天遇到的問題是聖文的USART中斷不能正確的進入，問題一開始以為是NVIC沒設定Preemption Piority的問題，後來發現是NVIC的Preemption Piority必須要設定成小於configMAX_SYSCALL_INTERRUPT_PRIORITY才能在中斷中正確的呼叫xxFromISR的的API

## 12/24

今日進度                              

*   影像處理模組出了點問題，我們買到的是跟王同學不合的接腳，他的影像模組是用**8bit**在傳輸影像的，我們不小心買到用**10bit**傳輸的模組，本來打算乾脆用stm32f4那塊版子，直接接10bit影像模組，但又發現執行SD卡很不方便，最後還是決定重買一個影像模組，繼續使用王同學的[QCopteMV開發版](https://github.com/Hom19910422/QCopterMachineVision) ，所以PX4的程式碼暫時不能使用了。

## 12/23

今日進度

*   測試SD卡成功[[連結](https://github.com/poemking/stm32_sdio) ]，SDIO經由原模組透過st link可以成功抓到micro SD卡的存取容量及內容，按下key後會把資料寫入sd卡，最後把sd卡透過讀卡機可讀出txt file。
*   參考PX4的影像模組[程式碼mt9v034.c](https://github.com/zxc2694/Flow/blob/master/src/mt9v034.c) ，並改成我們所需要的全域變數[[連結](https://github.com/zxc2694/QuadrotorFlightControl/commit/de8f5cc28077c78f265528688c23277f090eae4f)]，目前可以正確make。 
*   補充：[[Sublime教學](https://embeddedcool.hackpad.com/Sublime--BPlyxVOT8mm) ], 此軟體可以讓開發者更加容易追蹤程式碼。
*   濾波器部份要先完成可以視覺化顯示波形的方法(python matplot)，和利用周明哲同學提供的適用於四軸飛行器上的 Complemtary Filter改善。 

## 12/22

Shell移植分成三部:

*   移植標準C函數(Freestanding) - string.c , memory相關函數。 
*   Linenoise interface。 
*   命令解析器

已完成一、二項,並發現USART因為FreeRTOS關係有同步問題待解決

*   這部份我也在PWM Input Capture中斷的地方遇到，不清楚要用怎樣的流程呼叫才算安全的處理中斷

## 12/21

*

*   在較大的環境試飛成功，解決overflow的問題以及發現之前調的PID參數太大(因為之前飛行overflow的問題)，最後測試出來的pid參數跟原作者王文宏的非常相似
*   We use PID to control three posture roll pitch yaw , turning  PID parameter a moment, finally plant already stable state.However we have some problem, for example change moving-average filter to complementary filter in order to erase input noise.
*   we can use linenoise to standalone quadrotor in the future. 
*   測試四軸的PID控制 :

     [](http://www.youtube.com/watch?v=45PlQ4KLEqU&feature=youtu.be)[http://www.youtube.com/watch?v=45PlQ4KLEqU&feature=youtu.be](http://www.youtube.com/watch?v=45PlQ4KLEqU&feature=youtu.be)

*   USB 的報告組別已經提供整理好的 fatfs 程式碼，可參考: [](http://wiki.csie.ncku.edu.tw/embedded/USB)http://wiki.csie.ncku.edu.tw/embedded/USB
*   回覆Jserv : usb組的程式我們看過了,  他的寫法跟王同學寫的幾乎差不多,  所以我們拿他的來測試的，謝謝Jserv提供︿︿
*   應該說fatfs都是用同個lib，新舊版的差異而已，之後可能可以整合看看

**   12/20

## 

*12/

*   **日進度**
*   遇到PWM CCR被設成負值出現overf
*   遙控器會自行關機閃紅燈->目前找不到問題。
*   在開啟[safety switchh的情況下](https://embeddedcool.hackpad.com/python-python-GW5aXW19xC6)馬達持續運轉。->目前也是找不到問
*   利用 python se
*   完成移植FreeRTOS

## 

*12/

*   日進度

*     購買飛控板SDIO用於影像資料儲存要用的micro SD卡+擴充片,將以9條杜邦

*原本 rol

*   前分支狀態：
*   master:如果pid參數設成50，開機時會有油門(Throttle)設成最大

## 

*12/

*   日進度

*    將串列傳輸的讀取與寫入改成呼叫serial.putch（）與serial.getch（）函式, 讓程式碼看起來更加直觀, 並且增加puts功能，給printf使用, 而今天puts有點卡住, 利用make openo

[](http://www.ciselant.de/projects/gcc_printf/gcc_printf.html)

## 

*12/

*   日進度
*    初步測試成功，需要再調整PI

*

## 

*12/

*   日進度

## 

*12/

*   日進度

*啟動時如果有遙控器傳

*   commit1為例:
*   else if(current[2] < PWM5_PreviousValue)

*    PWM5_InputCaptureValue = 0xFFFFFFFF - PWM5_PreviousVal**ue + current[2] ; **

*

## 

*12/

*   日進度

## 

*12/

*   日進度

*嘗試使用STM32F4Discovery去使用nRF

*   是換飛控板後又可以通過，似乎是硬體問題必須再進行確認
*   nrF_Check為經由spi寫入資料到RF Module的暫存器,再從該暫存器讀值比較是否相同
*   如果你們SPI在Discovery上面有問題但是線路又確定無誤的話，嘗試將SPI Clock放慢，用

*

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_Y38T9JXygI8_p.88862_1386918044552_1461140_689850664367685_1838297370_n.jpg)

## 

*12/

*   日進度
*   完成支援浮點數
*   讓全域變數為一個結構
*   修改一些程式碼的設計
<ul style="list-style: none;"><li>新增地站(放置電腦旁)：主要用來調[參數，利用RF模組與四軸傳輸。](https://github.com/zxc2694/QuadrotorGroundStation)</li>
<li>
</li></ul style="list-style: none;">

## 

*12/

*   日進[度](https://embeddedcool.hackpad.com/nRF24L01-9tVeioOBKG7)

## 

*12/

*   日進度

## 

*12/

*   日進度
*   購買了st-link燒路器，使得linux系統下能夠燒錄飛控板。
*   停止最佳化功能(gcc -02)，才能正確執行makefile[，應](https://github.com/fboris/QuadrotorFlightControl/commit/b0c542dbd446c348a490b7d2cb1e65a1dd29990b)該

## 

*12/

*   日進度

*   重新layout第二版本的7805穩壓電路，因為第一版

*   尚未測試利用分壓電路得到最高3.3V以用來量測電池電壓

## 

*12/

*   日進度
*   經過Jserv大神的修改後，已經可以成功的使用Makefile編譯出檔案，尚

## 

*

## 

*

## 

<ul style="list-style: none;"><li>
</li></ul style="list-style: none;">

## 

<ul style="list-style: none;"><li>
</li></ul style="list-style: none;">

## 

*

*多個PWM(max=4)可使用同組TIMER

*   [而TIMER & PWM的使用可參考](http://www.360doc.com/content/11/0917/23/7736891_149118340.shtml)
*   [STM32 TIM輸出比較的三種](http://www.360doc.com/content/11/0917/23/7736891_149119361.shtml)模式
*   [STM32 TIM計時器輸出比較 //](http://www.360doc.com/content/11/0919/13/7736891_149463961.shtml)
*   [STM32通用計時器TIM2-](http://www.360doc.com/content/11/0917/23/7736891_149119727.shtml)

*   STM32 TIM的PMW模式

## 

*   **11/27**

        *   **今日進度**
    *   **機架組裝**
    *   ** 電子變速器與無刷馬**

*    測試及決定馬達轉向
*   螺旋槳的方向有分，較高的那邊為旋轉的方向(順或逆時針)
*   因為上述原因，馬達轉向要配合螺旋槳的方向。測試成功時會有向下吹的風
*   馬達雖然有三條線，但是那三條線並不是固定的配置，必須要經過測試去測其轉向。如果不是我們預期的轉向可以直接將某兩條線對調接上電子變速

*

*電子變速器 (Electronic Speed Control)