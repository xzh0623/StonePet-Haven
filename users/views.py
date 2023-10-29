from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.contrib import messages
from django.shortcuts import render, redirect

# Create your views here.
def homepage(request):
    template = loader.get_template('homepage.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def login(request):
    template = loader.get_template('login.html')
    context = {

    }
    return HttpResponse(template.render(context, request))

def register(request):
    if request.method == 'POST':
        # 处理用户注册逻辑
        # 注册成功后，添加注册成功消息
        messages.success(request, '注册成功！请登录。')
        return redirect('login')
    else:
        # 显示注册页面
        return render(request, 'register.html')