from django.http import HttpResponse
from django.template import loader
from django.contrib import messages
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, User
from .forms import LoginForm
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

def register(request):
    return render(request, 'register.html')

def forgot_password(request):
    return render(request, 'forgot_password.html')