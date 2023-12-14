from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.contrib import messages
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
