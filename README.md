# StonePet-Haven

## DEPENDENCY REQUIREMENT
``` powershell
❯ pip list
Package    Version
---------- -------
asgiref    3.7.2
Django     4.2.6
pip        23.3.1
setuptools 65.5.0
sqlparse   0.4.4
tzdata     2023.3
whitenoise 6.6.0
```

## DIARY (PUT THE LASTEST AT FRONT)

### 1214 by choco
* 完成註冊資料寫進資料庫，但沒完成驗證無效資料

### 1214 by kuan
* basic operation (WUD)

> TO DO LIST
> * auto update .sql every time an operation was performed
> * consider to seperate all classes so we can write some backend operation function to RWUD the data

### 1211 by kuan
* testpage is avaliable

> TO DO LIST
> * consider to seperate all classes so we can write some backend operation function to RWUD the data
> * how to keep our database uptodate
>    * real time operation (WUD)

### 1210 by kuan
* add git ignore
* add ./backend_operation
* add testpage
* testpage v1.1
    * return variable
    * (?) django connection faied
        * it may be the reason why i can never connect to the database and recieve the result of raw sql code

### 1207 整合 by hsiao

### web_architecture
```
|--- 首頁
|--------|--- 未登入首頁
|--------|--- 登入後首頁
|------------------|--- 賣家視圖
|----------------------|--- 管理商品
|----------------------|--- 管理訂單（已售商品）
|----------------------|--- 數據分析儀表板 if any
|------------------|--- 買家視圖
|----------------------|--- 瀏覽商品
|----------------------|--- 查看訂單（已購商品）
|----------------------|--- 購物車
|----------------------|--- 優惠券
|--- 商品
|--------|--- 商品列表
|--------|--- 商品詳情
|------------------|--- 賣家視圖
|----------------------|--- 編輯/刪除商品
|----------------------|--- 新增商品
|--- 購物車
|--------|--- 查看購物車
|--------|--- 結帳
|--- 訂單
|--------|--- 訂單歷史
|------------------|--- 賣家視圖
|----------------------|--- 已售商品的訂單
|------------------|--- 買家視圖
|----------------------|--- 已購商品的訂單
|--- 優惠券
|--------|--- 使用優惠券
|--------|--- 優惠券歷史
|--- 用戶帳戶
|--------|--- 個人資料
|------------------|--- 編輯個人資料
|------------------|--- 修改密碼
|------------------|--- 地址簿
|------------------|--- 付款方式
|--------|--- 設定
|------------------|--- 通知偏好
|------------------|--- 隱私設定
|--- 管理員儀表板
|--------|--- 優惠券管理
|------------------|--- 創建新優惠券
|------------------|--- 查看/停用優惠券
|--------|--- 用戶管理
|------------------|--- 查看用戶詳情
|------------------|--- 停用/啟用用戶
|--- 數據分析 if any
|--------|--- 銷售數據分析
|------------------|--- 查看銷售趨勢
|------------------|--- 商品表現

```