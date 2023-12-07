function goBack() {
      // 使用 history 物件的 back 方法返回上一頁
      window.history.back();
}
// script.js

function goResetPassword() {
  // 取得電子郵件輸入框的值
  var email = document.getElementById("email").value;

  // 使用 Ajax 或其他方式將電子郵件傳送到後端
  // 這裡僅為範例，實際情況需要根據你的後端實作進一步處理
  sendEmailToBackend(email);
}

function sendEmailToBackend(email) {
  // 使用 Ajax 或其他方式將電子郵件傳送到後端
  // 這裡僅為範例，實際情況需要根據你的後端實作進一步處理
  // 例如使用 fetch 或 XMLHttpRequest 進行後端 API 呼叫
  fetch("/your_reset_password_api", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ email: email }),
  })
    .then((response) => response.json())
    .then((data) => {
      // 在這裡處理後端 API 回傳的結果
      console.log(data);
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}
