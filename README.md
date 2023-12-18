
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

### 1214 by kuan
* resolve image duplicate problem
    * only for those visiable/ accessable pages
    * except from product photo

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

### 1130backend update

### ???? by yulun

#### frontend
- 裡面包含figma轉換的所有網頁，需手動更改版面大小、樣式
- 這應該是目前找到還原度最高的，但版面只有支援手機

#### 進度
- 正在編輯註冊會員頁面資料內容(xzh)
- 首頁的選單按鈕跟搜索欄輸入完成，但搜索欄還沒改成POST FORM(yulun)
- 首頁排版以及首頁底下連結>>完成
- 首頁的搜尋設定及按鈕選單版面>>完成
- 登入頁面>>完成

#### 問題
- 重設密碼前端部分在script.js檔案裡面:  
在按下 "重設密碼" 按鈕時，goResetPassword 函數會獲取電子郵件輸入框的值並呼叫 sendEmailToBackend 函數，該函數會將電子郵件傳送到後端。你需要在後端實作一個 API，接收電子郵件並發送驗證碼到該郵件。這一部分需要根據你的後端語言（如 PHP）來實作。
- 更新 首頁的js togglemenu我丟在js檔案裡面不能觸發我只好丟在html

#### 功能需求-買家
##### 登入頁面(開發中)
##### 商品內容頁面:  
- 產品 ID(後台)  
- 產品名稱  
- 產品描述  
- 產品縮圖  
- 產品頁面圖  
- 價格  
- 商品剩餘數量  
- 賣家 ID(後台)  
##### 買家將商品加入購物車包含:  
- 購物車ID(後台)
##### 買家將商品加入購物車後的訂單頁面包含:(商品和訂單為一種商品生成一個訂單)  
- 訂單完成日期  
- 運送方式(0：賣家宅配1：貨到付款)  
- 運送地址  
- 運送費用(預設60)  
- 送貨狀態(0：已下訂單1：賣家確認訂單完成2：已寄貨3：待取貨4：交易完成)  
- 訂購日期(年月日時分秒)  
- 產品數量  
- 折價券ID(if any)  
- 訂單ID(後台)  
- 商品ID(後台)  
- 買家ID(後台)  
##### 交易完成後:訂單留言(if any)
##### 折價卷頁面包含:  
- 折價券 ID  
- 折價金額  
- 折價劵使用最低  
- 門檻  
- 折價劵生效日期  
- 折價劵到期日期  
- 賣家 ID(後台)  
- 折價卷類型(0：運費1：季節2：特殊活動)
#### 功能需求-賣家
##### 管理商品頁面:包含上述的商品內容
##### 銷售報表頁面:  
- 日銷量  
- 月銷量  
- 週銷量  
- 商品 ID  
##### 折價卷設定頁面內容包含上述(與管理員一起)
#### 功能需求-管理員
##### 使用者管理頁面