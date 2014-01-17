# Debug for SPI of nRF24L01 (利用邏輯分析儀)

因為nRF遲遲測不出來，為了尋找問題所在，而利用了[邏輯分析儀](http://www.zeroplus.com.tw/logic-analyzer_tw/products.php?product_id=101&pdn=1&pdnex=150)來測試板stm32f4Discovery是否輸出有問題

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_gU3VHHMOKUE_p.88862_1387244974067_921284_692216187464466_187371135_o.jpg)

![](https://hackpad-attachments.s3.amazonaws.com/hackpad.com_gU3VHHMOKUE_p.88862_1387244700410_SPI.png)

其中

A0 = CE (PC4)

A1 = CSN (PB12)

A2 = SCK (PB13)

A5 = MOSI (PB15)

A4 = MISO (PB14)

A3 = IRQ (PC5)

從[nRF程式碼](https://github.com/zxc2694/QuadrotorGroundStation/blob/master/module_nrf24l01.c)與波形來看，因為**nRF_Check（）**過不了的關係所以A0一直都沒有值是正確的；然而A1動作也是對的，在**nRF_ReadBuf（）與nRF_WriteBuf（）**重複執行，所以會產生這樣的訊號；A2可以看到確實有clock輸出 ；A4、A5可以先不用管，因為我們只有單一傳輸沒有一對多；而A3的值也沒問題。**所以STM32的輸出根本沒有錯。**
<undefined><li>**問題的可能性只有四種：**</li></undefined>

1. 程式碼有問題。                                

2. STM32f4Discovery板子有問題。

3.接線錯誤。

4. nRF有問題。
<undefined><li>**解決問題：**</li></undefined>

1. 一樣的程式碼，在同STM32核心，飛控板裡的nRF可以正確執行，所以程式碼一定是對的！

2. **這裡的邏輯分析儀就是用來判斷第二點的問題**，所以板子輸出是對的！

3. 在一開始，接線一直是我們認為最有問題的，但所有的接線腳位，都已經知道正確接法了，接了20次有了......，連線都重新全換過，所以非常確定不是接線問題！

4. 結論就是 nRF有問題，買來的兩個nRF或許是壞的！