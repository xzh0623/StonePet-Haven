from django.http import HttpResponse
from django.template import loader
from django.contrib import messages
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, User,Buyer
from .forms import LoginForm
from django.db.models import Max
# Create your views here.
def home(request):
    return render(request, 'home.html')


def login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            account = form.cleaned_data['account']
            password = form.cleaned_data['password']

            user = User.objects.filter(account=account, password=password).first()

            if user:
                # 登入成功，重定向到主頁
                return redirect('home')
            else:
                # 登入失敗，設定錯誤訊息
                error = "Invalid username or password. Please try again."
                return render(request, 'login.html', {'form': form, 'error': error})
    else:
        form = LoginForm()

    return render(request, 'login.html', {'form': form})

def forgot_password(request):
    return render(request, 'forgot_password.html')

def register(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        email = request.POST['email']
        phone_number = request.POST['phone_number']
        account = request.POST['account']
        age = request.POST['age']
        address = request.POST['address']
        gender = request.POST['gender']

        # 創建 User 實例
        user_uid = generate_unique_user_id()
        user_instance = User(
            user_id=user_uid,  # 假設有一個函數生成唯一的用戶ID
            name=username,
            password=password,
            email=email,
            phone_number=phone_number,
            account=account,
            address=address,
            permission=1,  # 假設給予默認權限
            status=1  # 假設給予默認狀態
        )
        user_instance.save()
        
        # 創建 Buyer 實例
        buyer_instance = Buyer(
            user=user_instance,
            sex = int(request.POST.get('gender')),
            age=age
        )
        buyer_instance.save()
        

        messages.success(request, '註冊成功！')
        return redirect('home')  # 假設你有一個名為'home'的URL路由

    return render(request, 'register.html')

def generate_unique_user_id():
    # 獲取 User 模型中的最大 user_id
    max_user_id = User.objects.all().aggregate(Max('user_id'))['user_id__max']

    # 如果沒有任何用戶，將最大值設為 'US0000'
    if max_user_id is None:
        max_user_id = 'US0000'

    # 提取數字部分，增加1，然後組合成新的 user_id
    prefix = 'US'
    current_number = int(max_user_id[len(prefix):])
    new_number = current_number + 1
    new_user_id = f'{prefix}{new_number:04d}'

    return new_user_id