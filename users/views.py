from django.http import HttpResponse
from django.template import loader
from django.contrib import messages
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, User,Buyer
from .forms import LoginForm
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_str
from django.utils.http import urlsafe_base64_decode
from . import models
import django

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
        # 创建 User 实例
        result = User.Create(request)

        if result == "True":
            # 发送验证电子邮件
            return redirect('home')  # 重定向到主页或其他适当的页面
        else:
            return render(request, 'register.html',{'error': result})
    return render(request, 'register.html')
    
def testpage(request):

    # BASIC OPERATION TO USE
    # models.TestTable.Create(request)
    # models.TestTable.Delete(request, 5)
    # models.TestTable.Update(request)

    TestTableValues = models.TestTable.objects.all().values()
    temp = django.db.connection.ensure_connection()     # return None, 不知道是不是這個原因沒辦法讀取server
    template = loader.get_template('testpage.html')
    context = {
        "TestTableValues" : TestTableValues,
        "temp": temp,
    }
    return HttpResponse(template.render(context, request))



def index(request):
    if request and request.method == 'GET':

        from models import ExtraObject, TestModel

        # Create exmple data if table is empty:
        if TestModel.objects.count() == 0:
            for i in range(15):
                extra = ExtraObject.objects.create(name=str(i))
                test = TestModel.objects.create(key=extra, name='test_%d' % i)
                test.many.add(test)
                print(test)

        to_edit = TestModel.objects.get(id=1)
        to_edit.name = 'edited_test'
        to_edit.key = ExtraObject.objects.create(name='new_for')
        to_edit.save()

        new_key = ExtraObject.objects.create(name='new_for_update')
        to_update = TestModel.objects.filter(id=2).update(name='updated_name', key=new_key)
        # return any kind of HttpResponse

def email_verification(request):
    if request.method == 'POST':
        User.verify_account(request)
        return redirect('home')
    return render(request, 'email_verification.html')