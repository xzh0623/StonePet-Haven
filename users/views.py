from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from .models import Product, User,Buyer,Coupon,Seller
from .forms import LoginForm,CouponForm
from django.shortcuts import render, redirect
from . import models
# from .. backend_operation import TEST_add_data_to_models
import django
from django.contrib.auth.hashers import make_password
from django.core.mail import send_mail
from django.template.loader import render_to_string

# Create your views here.
def homepage(request):
    template = loader.get_template('homepage.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            account = form.cleaned_data['account']
            password = form.cleaned_data['password']
            user = User.objects.filter(account=account, password=password).first()
            
            if user:
                # 登入成功，重定向到主頁
                return render(request, 'homepage.html', {'user': user})
            else:
                # 登入失敗，設定錯誤訊息
                error = "Invalid username or password. Please try again."
                return render(request, 'login.html', {'form': form, 'error': error})
    else:
        form = LoginForm()

    return render(request, 'login.html', {'form': form})

def shoppingcart(request):
    template = loader.get_template('shoppingcart.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def forgotpassword(request):
    if request.method == 'POST':
        email = request.POST.get('email')

        # 检查邮箱是否存在
        if User.objects.filter(email=email).exists():
            # 获取用户实例
            user_instance = User.objects.get(email=email)
            #生成重置密码链接
            reset_password_url = f"http://127.0.0.1:8000/reset_password/?user_id=" + user_instance.user_id
            # # 发送重置密码邮件
            send_resetpassword_email(user_instance, reset_password_url)
            messages.success(request, '重置密碼郵件已發送。')
            return redirect('forgotpassword')
        else:
            messages.error(request, '電子郵件未註冊。')

    return render(request, 'forgotpassword.html')
    

def registermember(request):
    template = loader.get_template('registermember.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def registeroption(request):
    template = loader.get_template('registeroption.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def registerbuyer(request):
    if request.method == 'POST':
    
        result = User.Create(request)
        if result == "True":
            # 发送验证电子邮件
            messages.success(request, '請查看電子郵件完成註冊！')
            
            return redirect('registerbuyer')  # 重定向到主页或其他适当的页面
        else:
            return render(request, 'registerbuyer.html',{'error': result})

    return render(request, 'registerbuyer.html')

def registerseller(request):
    if request.method == 'POST':
        result= User.Create(request)
        if result == "True":
        # 发送验证电子邮件
             messages.success(request, '請查看電子郵件完成註冊！')
             return redirect('registerseller')  # 重定向到主页或其他适当的页面
        else:
             return render(request, 'registerseller.html',{'error': result})

    return render(request, 'registerseller.html')
    
def introduction(request):
    template = loader.get_template('0_introduction.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def cooperation(request):
    template = loader.get_template('0_cooperation.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def information(request):
    template = loader.get_template('0_information.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def policy(request):
    template = loader.get_template('0_policy.html')
    context = {

    }
    return HttpResponse(template.render(context, request))
# def register(request):
#     if request.method == 'POST':
    
#         # 創建 User 實例
#         User.Create(request)
        
#         # 創建 Buyer 實例
#         '''
#         buyer_instance = Buyer(
#             user=user_instance,
#             sex = int(request.POST.get('gender')),
#             age=age
#         )
#         buyer_instance.save()
#         '''
#         messages.success(request, '注册成功！请登录。')
#         return redirect('login')

#     return render(request, 'register.html')
def coupon(request):
    coupons = Coupon.objects.all()
    if request.method == 'POST':
        form = CouponForm(request.POST)
        if form.is_valid():
            coupon_id = form.cleaned_data['coupon_id']
            coupon = Coupon.objects.filter(coupon_id=coupon_id).first()

            if coupon:
                # 如果存在對應的優惠券，將其傳到前端
                return render(request, 'coupon.html', {'form': form, 'coupon': coupon})
            else:
                # 如果找不到對應的優惠券，回傳全部折價券
                return render(request, 'coupon.html', {'form': form,'coupons':coupons})
    else:
        form = CouponForm()
    return render(request, 'coupon.html', {'form': form,'coupons':coupons})

def person_info(request):
    if request.method == 'POST':
        user_id = request.POST.get('user_id')
        check_is_update = request.POST.get('account')
        user = User.objects.filter(user_id=user_id).first()
        if check_is_update is not None:
            result = User.Update(request)
            if result == True:
                user = User.objects.filter(user_id=user_id).first()
            return render(request, 'homepage.html',{'user': user})
    return render(request, 'person_info.html',{'user': user})
def email_verification(request):
    if request.method == 'POST':
        User.verify_account(request)
        return redirect('homepage')
    return render(request, 'email_verification.html')

def reset_password(request):
    if request.method == 'POST':
        result=User.reset_password(request)
        if result=="True":
            return redirect('login')
        else:
           return render(request, 'reset_password.html', {'error': result}) 
    return render(request, 'reset_password.html')

def send_resetpassword_email(user_instance, reset_password_url):
    email_template = render_to_string(
        'resetpassword_email_template.html',
        {'user_instance': user_instance, 'reset_password_url': reset_password_url}
    )
    #郵件內容
    subject = '重置密碼'
    message = '請點擊以下連結重置密碼：\n\n' + reset_password_url
    from_email = 't110590036@ntut.org.tw'
    to_email = user_instance.email
    send_mail(subject, message, from_email, [to_email], html_message=email_template)
