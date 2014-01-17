# Git 教學

**Q.`git clone`從遠端下載檔案後，如何下載其分支?**

A`git fetch origin branch_name:branch_name`

一般而言在打到`git fetch origin`按`tab`就會有提示跑出來

**Q.如何修改遠端分支的名稱？**

A.本例為遠端上的分支名master改為master-old

*   git push origin master:master-old        # 1
*   git branch master-old origin/master-old  # 2
*   git push -f origin     

Ref:

[](http://stackoverflow.com/questions/1526794/how-to-rename-master-branch-in-git)http://stackoverflow.com/questions/1526794/how-to-rename-master-branch-in-git

**Q. 合作開發專案時，當有人上傳新的程式碼，但他只放在他的分支，如何讓我的分支也能夠更新與他一模一樣？**

*   (假設apple和banana兩人在合作開發quadcopter，我是apple有一個叫appbranch的分支, 想更新和banana的分支banbranch一樣)

**Ａ：**

   git checkout appbranch

   git  pull origin [](https://github.com/banana/Qcopter.git)https://git[h](https://git)[ub.com](https://gith)[/](https://github.com)[ba](https://github.com//Qcopter.git)[na](https://github.com/ba/Qcopter.git)[na](https://github.com/bana/Qcopter.git)[/](https://github.com/apple)[Q](https://github.com/apple/)[c](https://github.com/apple/Q)[op](https://github.com/apple/Qc)[ter](https://github.com/apple/Qcop).git[ "banbranch"](https://github.com/banana/Qcopter.git)（重點在分支要打上"  "）

   git pull後通常都會發生程式衝突，必須要手動修正(ps.可以利用git difftool 來更改程式碼)

   git  pull [](https://github.com/banana/Qcopter.git)[https://github.com/banana/Qcopter.git](https://github.com/banana/Qcopter.git)[ "banbranch"](https://github.com/banana/Qcopter.git)（在一次）

   git commit -a -m'~~~~'   (要打上 -a)

   git push origin appbranch 

*    git pull 二次是因為當第二次pull 程式碼就不會有衝突了, 就可以直接打上commit
*   如果只有一次的話，可能會有一些問題，當你手動更改或許還有些許衝突, 然後這樣子在network graph裡面就看不到你的線連到原作者的路徑了 ,保險一點的方法就是git pull 兩次
*   origin只有第一次要打 後來就可以不用打

**Q.我要如何把自己master的程式推到github上面？**

A:

   git status  //看你有動過什麼檔案

   git add "modify name" //增加你動過的檔案

   git commit //write your title and record shh key

   tig //確認你的更新有沒歷史紀錄

   git pull //推到你自己的github上

   如果是分支 是打git push origin `branchname`

   pull 是代表你要中端機的code更新跟github一樣

  例如你抓別人的code 別人更新了 你只要在他資料夾打git pull 就更新跟

  他一樣了  

**Q.git pull什麼時候需要加網址？**

A:  當你是fork別人的專案,然後當初git clone 自己網址才要加網址

     如果你是git clone 別人網址 沒fork 只要打git pull

**Q.我想回到之前的commit？**

A. 

1.  在github的commit看想回到哪裡， commit裡面有 SSH key 把它複製下來.（假設SSH key為4bc3e5c572d86f1aebd5dce53a4bec2c0c090209）
2.  git reset --hard 4bc3e5c572d86f1aebd5dce53a4bec2c0c090209

*   它會顯示  HEAD is now at 4bc3e5c "你的commit名稱"

3. 用tig 看是否已跳回去。