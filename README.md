# 操作流程
## 前置
### 安裝Django
   [按照網頁流程操作到Install Django](https://www.w3schools.com/django/django_install_django.php)
   
### 安裝XAMPP
第一步：安裝XAMPP（版本8.0.30）　　
![image](https://github.com/xzh0623/StonePet-Haven/assets/126553336/c014abd2-5562-452c-8f98-72294d5bdfdc)  
第二步：執行指令安裝  
![image](https://github.com/xzh0623/StonePet-Haven/assets/110615484/896567bb-7e71-45f9-8f15-10ea43e59bc2)　　
![image](https://github.com/xzh0623/StonePet-Haven/assets/110615484/ae22d749-e342-4619-9b73-78558c51db35)　　

第三步：執行XAMPP（開啟Apache MySQL，有本地SQL不用開啟）　　
![image](https://github.com/xzh0623/StonePet-Haven/assets/126553336/5975119d-1832-4553-bcc0-1a8603c8fdc5)  

### 進入資料庫管理頁面
![image](https://github.com/xzh0623/StonePet-Haven/assets/122630372/4e1a6f33-f647-4948-b11d-d7e6d1f6c37f)　　
* 進入後點擊新增，新增資料庫，名稱為web_development　　
![image](https://github.com/xzh0623/StonePet-Haven/assets/122630372/39305534-32d1-4117-8394-c2242ce8d55b)
* 將資料匯入至資料庫　　
![image](https://github.com/xzh0623/StonePet-Haven/assets/122630372/8ad1893f-d54f-42df-9729-ac9b6056aa97)　　
![image](https://github.com/xzh0623/StonePet-Haven/assets/122630372/bb9d4764-18b3-49a3-8bdb-85b9f2c58258)
* 選取完web_development.sql往下拉按下匯入按鈕，如果資料庫理沒有資料再匯入一次試試看　　

## 執行
執行XAMPP（開啟Apache, MySQL（如有連接本地SQL不用開啟）），到資料夾啟動vscode
![image](https://github.com/xzh0623/StonePet-Haven/assets/122630372/4a1ba02d-b5e7-4172-8d1a-46dfda538aaa)
先執行
```
python/py manage.py migrate
python/py manage.py collectstatic
python/py manage.py runserver
```
備註：如果圖片沒有顯示，使用前需要先設定 setting.py 裡面的```debug=true```，執行runserver後打開網頁讓他可以蒐集到圖片等快取資料，再把```debug=false```，重啟網站方可使用

### 使用者登入
資料庫有使用者資料可以使用  
登入使用者帳號：  
* 帳號：choco234  
* 密碼：234　（密碼皆為帳號後的數字）

### 管理員登入
* 帳號：hsiao
* 密碼：123
