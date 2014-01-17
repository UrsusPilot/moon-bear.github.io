# 程式討論

## make openocd 使用教學

有時候程式碼雖然編過了, 但居然還是錯的, 所以我們可以利用make openocd 來讓gdbauto可以對我們的STM32F4Discovery進行除錯.

step1. 到[成大資工wiki Lab24](http://wiki.csie.ncku.edu.tw/embedded/Lab24)下載openocd

step2. 都下載完後, 必須設定路徑：vim ~/.bashrc　

　　　進去後最下面打上　**export PATH=/opt/openocd/bin:$PATH**

step3. 在make 後, 打上make openocd   (一定要先make才有elf)

step4. 按 [**ctrl+shift+t** ] (進入另一個終端機)

step5. 打 **make gdbauto**  (即可看到除錯畫面)

step6. 打 **monitor reset halt**  或按 reset 鈕  (讓系統重置)

*   如果停在xxxstartup.s的檔案代表正確重開，可以重新debug

step7. 可以看到直接進入中斷點  （前提必須在 **.gdb**的檔案設置好）

*   gdb script

step8. 利用usart 配合 gdb裡的**print** 可以直接在usart觀察變數的變化 

補充[：GDB cheat sheet](https://www.facebook.com/download/1440219162873171/refcard.pdf)（gdb的指令使用）

## Coding Style

**如何使用astyle自動排版?**

1.下載astyle

[](http://downloads.sourceforge.net/project/astyle/astyle/astyle%202.04/astyle_2.04_linux.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fastyle%2Ffiles%2Fastyle%2Fastyle%25202.04%2F&ts=1386641171&use_mirror=jaist)http://downloads.sourceforge.net/project/astyle/astyle/astyle%202.04/astyle_2.04_linux.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fastyle%2Ffiles%2Fastyle%2Fastyle%25202.04%2F&ts=1386641171&use_mirror=jaist

2.編譯檔案

解壓縮檔案後，到astyle資料夾下的/astyle/build/gcc打入指令

make

會看到該資料夾下面多了bin及obj資料夾

3.移動檔案到usr/local

sudo cp ./astyle /usr/local/bin/astyle

4.設定astyle參數

vim ~/.astylerc

*   style=linux
*   indent=force-tab=8
*   indent-cases
*   indent-preprocessor
*   break-blocks=all
*   pad-oper
*   pad-header
*   unpad-paren
*   keep-one-line-blocks
*   keep-one-line-statements
*   align-pointer=name
*   align-reference=name
*   suffix=none
*   ignore-exclude-errors-x
*   lineend=linux
*   exclude=EASTL

5.利用astyle自動排版   

*   Example to format a single file:  
*   astyle    /home/user/project/foo.cpp

*   Example to format all .cpp and .h files recursively:     
*   astyle   --recursive  /home/user/project/*.cpp  /home/user/project/*.h

 [](http://astyle.sourceforge.net/astyle.html#_Quick_Start)http://astyle.sourceforge.net/astyle.html#_Quick_Start   

 [](https://pixhawk.ethz.ch/px4/dev/code_style)https://pixhawk.ethz.ch/px4/dev/code_style

 **變數宣告**

  下列例如s32及s16不建議使用，此為舊的變數型態，統一使用int32_t(左側)尚未typedef的型態

*    /*!< STM32F10x Standard Peripheral Library old types (maintained for legacy purpose) */
*   typedef int32_t  s32;
*   typedef int16_t s16;
*   typedef int8_t  s8;
**   typedef const int32_t sc32;  /*!< Read Only */
*   typedef const int16_t sc16;  /*!< Read Only */
*   typedef const int8_t sc8;   /*!< Read Only */
**   typedef __IO int32_t  vs32;
*   typedef __IO int16_t  vs16;
*   typedef __IO int8_t   vs8;
**   typedef __I int32_t vsc32;  /*!< Read Only */
*   typedef __I int16_t vsc16;  /*!< Read Only */
*   typedef __I int8_t vsc8;   /*!< Read Only */
**   typedef uint32_t  u32;
*   typedef uint16_t u16;
*   typedef uint8_t  u8;
*    
*   typedef const uint32_t uc32;  /*!< Read Only */
*   typedef const uint16_t uc16;  /*!< Read Only */
*   typedef const uint8_t uc8;   /*!< Read Only */    
*   typedef __IO uint32_t  vu32;
*   typedef __IO uint16_t vu16;
*   typedef __IO uint8_t  vu8;
*   typedef __I uint32_t vuc32;  /*!< Read Only */
*   typedef __I uint16_t vuc16;  /*!< Read Only */
*   typedef __I uint8_t vuc8;   /*!< Read Only */

## 自訂型態

[](http://www.cmlab.csie.ntu.edu.tw/~perng/course/chap5/chap5.html)http://www.cmlab.csie.ntu.edu.tw/~perng/course/chap5/chap5.html

printf("%d, %s", v, str); 如果自己想寫【動態引數】該怎麼寫？

[](http://blog.udn.com/cchahacaptain/2238613)http://blog.udn.com/cchahacaptain/2238613

*   #include <stdio.h>
**   struct foo {
*       int test;
*   };
**   int f(struct foo *foo_input)
*   {
*       printf("%d\n", (*foo_input).test); // = printf("%d\n", foo_input->test);
*   }
**   int main()
*   {
*     struct foo foo1;
*     foo1.test = 1;
**     f(&foo1);
*     return 0;
*   }

## makefile教學

[](http://kevincrazy.pixnet.net/blog/post/29780477-makefile%E7%B0%A1%E6%98%93%E6%95%99%E5%AD%B8)http://kevincrazy.pixnet.net/blog/post/29780477-makefile%E7%B0%A1%E6%98%93%E6%95%99%E5%AD%B8...

[](http://tetralet.luna.com.tw/?op=ViewArticle&articleId=185)http://tetralet.luna.com.tw/?op=ViewArticle&articleId=185

gcc

gcc教學 vim makefile

CC = gcc

BIN = test

all:test.c

        $(CC) -o $(BIN) test.c

clean:

        rm -f $(BIN)

.PHONY:clean