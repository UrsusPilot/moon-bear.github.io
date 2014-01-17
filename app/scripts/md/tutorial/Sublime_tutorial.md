# [Sublime](http://www.sublimetext.com/) 教學

在Linux裡，如果只會用vim，其實非常的不方便，sublime是一個很強大的免費軟體, 有點類似Keil C , 它可以直接幫你** trace code跳入底層的函式**,  讓開發者方便許多，但sublime剛開始的設定有點複雜，所以在此敘述安裝後的設定流程。

Sublime 2官網下載：

[](http://www.sublimetext.com/2)[http://www.sublimetext.com/2](http://www.sublimetext.com/2)

下載CSCOPE ：[](https://github.com/ameyp/CscopeSublime/archive/master.zip)[https://github.com/ameyp/CscopeSublime/archive/master.zip](https://github.com/ameyp/CscopeSublime/archive/master.zip)

下載ctags :[](https://github.com/SublimeText/CTags/archive/master.zip)[https://github.com/SublimeText/CTags/archive/master.zip](https://github.com/SublimeText/CTags/archive/master.zip)

建議都是放在跟Sublime Text 2同一個目錄下.
<undefined><li>**step1**</li></undefined>

1) 打開sublime_text,進去後, <u>ctrl + `</u> 叫出 console

2) 複製以下內容到console command line

-----------------------------------------------------------------------------------------

import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('[](http://sublime.wbond.net/)http://sublime.wbond.net/'+pf.replace(' ',' ')).read()); print 'Please restart Sublime Text to finish installation'

-------------------------------------------------------------------------------------------

3) 看到結束之後,關掉重開Sublime Text 2

4) 在工作列就可以看到 Preferences -> Pacakge Control ,表示安裝成功

**step2**

Preferences -> Package Control,執行之後可以看到畫面<u>Package Control ：</u>

直接打上ｉ，然後選第一個 <u>Package Control ：install package</u> 等待幾分鐘會出現畫面

再打上ctags  按下去就對了,安裝好在重開

**step3**

再到終端機打上：  

sudo apt-get install cscope（安裝cscope）

sudo apt-get install ctags（安裝ctags）

**step4**

到終端機打cscope -b -q -k -R 可建立cscope

到sublime工作列 Find-> CTags -> Rebuild Tags 可建立ctags

參考連結：

[](http://villprog.blogspot.tw/2013/04/sublime-text-2.html)[http://villprog.blogspot.tw/2013/04/sublime-text-2.html](http://villprog.blogspot.tw/2013/04/sublime-text-2.html)

[](http://villprog.blogspot.tw/2013/04/sublime-text-2.html)[http://villprog.blogspot.tw/2013/04/sublime-text-2.html](http://villprog.blogspot.tw/2013/04/sublime-text-2.html)

[](http://blog.csdn.net/thunderclaus/article/details/11556159)[http://blog.csdn.net/thunderclaus/article/details/11556159](http://blog.csdn.net/thunderclaus/article/details/11556159)

[](http://cloverhsc.blogspot.tw/2013/09/sublime-text-ccide-in-windows3-ctags.html)[http://cloverhsc.blogspot.tw/2013/09/sublime-text-ccide-in-windows3-ctags.html](http://cloverhsc.blogspot.tw/2013/09/sublime-text-ccide-in-windows3-ctags.html)