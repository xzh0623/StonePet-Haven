# 注意事項
- 圖片路徑要改  
- 如果頁面icon邊緣有被切到，自己到static/babystone/img找替代圖片  
- 如果覺得css檔名很醜，在切換的時候可以自己手動改檔名
# 分工
- xzh  
1、register開頭+forgotpassword  
2、login_title、unlogin_title  
3、menu1  
4、homepage  
5、連接頁面
- B  
1、shoppingcart  
2、homepage_shop
- C  
1、order開頭  
2、comment
- D  
1、item_page  
2、item_detail  
3、buyer_setting_item
- E  
1、finditem  
2、coupon  
3、person_info
# StonePet-Haven
# Frontend
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

# 1214 by kuan
* resolve image duplicate problem
    * only for those visiable/ accessable pages
    * except from product photo

# 1130backend update
# yulun
# StonePet-Haven
## frontend
- 裡面包含figma轉換的所有網頁，需手動更改版面大小、樣式
- 這應該是目前找到還原度最高的，但版面只有支援手機

### 進度
- 正在編輯註冊會員頁面資料內容(xzh)
- 首頁的選單按鈕跟搜索欄輸入完成，但搜索欄還沒改成POST FORM(yulun)
- 首頁排版以及首頁底下連結>>完成
- 首頁的搜尋設定及按鈕選單版面>>完成
- 登入頁面>>完成

### 問題
- 重設密碼前端部分在script.js檔案裡面:  
在按下 "重設密碼" 按鈕時，goResetPassword 函數會獲取電子郵件輸入框的值並呼叫 sendEmailToBackend 函數，該函數會將電子郵件傳送到後端。你需要在後端實作一個 API，接收電子郵件並發送驗證碼到該郵件。這一部分需要根據你的後端語言（如 PHP）來實作。
- 更新 首頁的js togglemenu我丟在js檔案裡面不能觸發我只好丟在html

### 功能需求-買家
- 登入頁面(開發中)
- 商品內容頁面:  
產品 ID(後台)  
產品名稱  
產品描述  
產品縮圖  
產品頁面圖  
價格  
商品剩餘數量  
賣家 ID(後台)  
- 買家將商品加入購物車包含:  
購物車ID(後台)
- 買家將商品加入購物車後的訂單頁面包含:(商品和訂單為一種商品生成一個訂單)  
訂單完成日期  
運送方式(0：賣家宅配1：貨到付款)  
運送地址  
運送費用(預設60)  
送貨狀態(0：已下訂單1：賣家確認訂單完成2：已寄貨3：待取貨4：交易完成)  
訂購日期(年月日時分秒)  
產品數量  
折價券ID(if any)  
訂單ID(後台)  
商品ID(後台)  
買家ID(後台)  
- 交易完成後:訂單留言(if any)
- 折價卷頁面包含:  
折價券 ID  
折價金額  
折價劵使用最低  
門檻  
折價劵生效日期  
折價劵到期日期  
賣家 ID(後台)  
折價卷類型(0：運費1：季節2：特殊活動)
### 功能需求-賣家
- 管理商品頁面:包含上述的商品內容
- 銷售報表頁面:  
日銷量  
月銷量  
週銷量  
商品 ID  
- 折價卷設定頁面內容包含上述(與管理員一起)
### 功能需求-管理員
- 使用者管理頁面
