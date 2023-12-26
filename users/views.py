from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from .models import Product, User,Buyer,Seller
from .forms import LoginForm
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
                messages.success(request, '您好！')
                
                return redirect('homepage')
            else:
                # 登入失敗，設定錯誤訊息
                error = "帳號或密碼無效。"
                return render(request, 'login.html', {'form': form, 'error': error})
    else:
        form = LoginForm()

    return render(request, 'login.html', {'form': form})

def shoppingcart(request):

    return render(request, 'shoppingcart.html')

def shoppingcart_unlogin(request):

    return render(request, 'shoppingcart_unlogin.html')

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

def userpolicy(request):
    template = loader.get_template('0_userpolicy.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def privacy(request):
    template = loader.get_template('0_privacy.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def itempage(request):
    template = loader.get_template('item_page.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def coupon(request):
    template = loader.get_template('coupon.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

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