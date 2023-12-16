from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from .models import Product, User,Buyer
from .forms import LoginForm
from django.shortcuts import render, redirect
from . import models
# from .. backend_operation import TEST_add_data_to_models
import django

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
                messages.success(request, '登录成功！欢迎回来。')
                return redirect('homepage')
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
    template = loader.get_template('forgotpassword.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

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
    
        # 創建 User 實例
        User.Create(request)
        
        # 創建 Buyer 實例
        '''
        buyer_instance = Buyer(
            user=user_instance,
            sex = int(request.POST.get('gender')),
            age=age
        )
        buyer_instance.save()
        '''
        messages.success(request, '注册成功！请登录。')
        return redirect('login')

    return render(request, 'registerbuyer.html')

def registerseller(request):
    template = loader.get_template('registerseller.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

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

