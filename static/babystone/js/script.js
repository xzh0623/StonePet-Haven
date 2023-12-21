document.addEventListener('DOMContentLoaded', function () {
  const searchIcon = document.querySelector('.search-44M');
  const searchContainer = document.getElementById('searchContainer');
  const otherElements = document.querySelector('.group-1-oPK');

  searchIcon.addEventListener('click', function (event) {
    event.stopPropagation();

    // 顯示搜尋列表
    searchContainer.style.visibility = 'visible';

    // 隱藏其他元素
    otherElements.style.visibility = 'hidden';

    // 添加點擊事件監聽器，當點擊頁面其他地方時取消覆蓋效果
    document.addEventListener('click', cancelOverlayOnClickOutside);
  });
// function toggleMenu() {
//     const menuContainer = document.getElementById('menuContainer');
//     const homeMenuItem = document.querySelector('.item--L1j');
  
//     if (menuContainer.style.maxHeight === '0px') {
//       // 顯示選單
//       menuContainer.style.maxHeight = '500px';
//       menuContainer.style.opacity = '1';
//       menuContainer.style.pointerEvents = 'auto';
  
//       // 顯示最上面的首頁
//       homeMenuItem.style.display = 'block';
//     } else {
//       // 隱藏選單
//       menuContainer.style.maxHeight = '0';
//       menuContainer.style.opacity = '0';
//       menuContainer.style.pointerEvents = 'none';
  
//       // 隱藏最上面的首頁
//       homeMenuItem.style.display = 'none';
//     }
// }
function cancelOverlayOnClickOutside(event) {
    const searchContainer = document.getElementById('searchContainer');

    // 如果點擊的區域不在搜尋列表內，則取消覆蓋效果
    if (!searchContainer.contains(event.target)) {
      searchContainer.style.visibility = 'hidden';

      // 將其他元素設置為 visible
      otherElements.style.visibility = 'visible';

      // 移除點擊事件監聽器
      document.removeEventListener('click', cancelOverlayOnClickOutside);
    }
  }
});
function goBack() {//返回上一頁
      window.history.back();
}


function showPopup() {
    // 顯示遮罩層和彈出視窗
    document.getElementById('overlay').style.display = 'flex';
}

function hidePopup() {
    // 隱藏遮罩層和彈出視窗
    document.getElementById('overlay').style.display = 'none';
}

// 获取下拉选择框的值
// var selectedGender = document.getElementById("genderSelect").value;
// console.log(selectedGender);



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

