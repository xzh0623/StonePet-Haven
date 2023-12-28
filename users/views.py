<<<<<<< HEAD
from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, CustomUser, Seller, Buyer
from .forms import LoginForm, CustomUserRegistrationForm, SellerRegistrationForm, BuyerRegistrationForm, UserProfileForm, ProductForm
=======
from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from .models import Product, User,Buyer
from .forms import LoginForm
>>>>>>> origin/Kuan_remote
from django.shortcuts import render, redirect
from .utils import custom_authentication
from django.utils import timezone
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from datetime import date
from django.http import HttpResponse
# from .. backend_operation import TEST_add_data_to_models
<<<<<<< HEAD

# Create your views here.

def calculate_age(birth_date):
    today = date.today()
    age = today.year - birth_date.year - ((today.month, today.day) < (birth_date.month, birth_date.day))
    return age
=======
import django
import sys

# Create your views here.
def homepage(request):
    template = loader.get_template('homepage.html')
    context = {
>>>>>>> origin/Kuan_remote

    }
    return HttpResponse(template.render(context, request))

def homepage(request):
    user_is_authenticated = request.user.is_authenticated
    username = request.user.name if user_is_authenticated else None
    context = {
        'user_is_authenticated': user_is_authenticated,
        'username': username
        }
    return render(request, 'homepage.html', context)

def products(request):
    products = Product.objects.all()
    context = {
        'products' : products
    }
    return render(request, 'products.html', context)

def product_detail(request, product_id):
    # 根據商品ID檢索商品
    product = get_object_or_404(Product, product_id=product_id)
    print(product.product_name)
    context = {
        'product': product
        }

    return render(request, 'product_detail.html', context)

def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            account = form.cleaned_data['account']
            password = form.cleaned_data['password']
<<<<<<< HEAD
            user = authenticate(request, account=account, password=password)
            if user is not None:
                login(request, user)
                return redirect('homepage')  # 登入成功后重定向到首页
=======

            user = User.objects.filter(account=account, password=password).first()

            if user:
                # 登入成功，重定向到主頁
                messages.success(request, '登录成功！欢迎回来。')
                return redirect('homepage')
>>>>>>> origin/Kuan_remote
            else:
                # 登录失败的处理，例如显示错误信息
                error_message = 'Invalid login credentials. Please try again.'
                return render(request, 'login.html', {'form': form, 'error_message': error_message})
    else:
        form = LoginForm()

    return render(request, 'login.html', {'form': form})

<<<<<<< HEAD
def logout_view(request):
    logout(request)
    return redirect('homepage')  # 登出后重定向到首页或其他页面
=======
def shoppingcart(request):
    template = loader.get_template('shoppingcart.html')
    context = {
>>>>>>> origin/Kuan_remote

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
<<<<<<< HEAD
        form = CustomUserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.user_id = CustomUser.objects.generate_user_id()
            user.set_password(form.cleaned_data['password'])
            user.save()
            print("用户注册成功")
            return redirect('success_page')
    else:
        form = CustomUserRegistrationForm()

    return render(request, 'register.html', {'form': form})

def success_page(request):
    return render(request, 'success_page.html')

def registration_choice(request):
    if request.method == 'POST':
        user_type = request.POST.get('user_type')

        if user_type == 'seller':
            return render(request, 'seller_registration.html')
        elif user_type == 'buyer':
            return render(request, 'buyer_registration.html')
        else:
            return render(request, 'error_page.html')

    return render(request, 'registration_choice.html')

def seller_registration(request):
    if request.method == 'POST':
        form = SellerRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.user_id = CustomUser.objects.generate_user_id()
            user.set_password(form.cleaned_data['password'])
            user.save()

            seller = Seller.objects.create(user=user)
            seller.join_date = timezone.now()
            seller.save()

            # 设置用户权限
            user.permission = 1
            user.save()

            authenticated_user = authenticate(request, username=user.account, password=request.POST['password'])
            if authenticated_user:
                login(request, authenticated_user)
                # 设置用户权限
                authenticated_user.permission = 1
                authenticated_user.save()
                return redirect('success_page')  # 你需要创建一个成功页面的模板
            else:
                    # 处理验证失败的情况
                    return HttpResponse("Authentication failed.")
    else:
        form = SellerRegistrationForm()

    return render(request, 'seller_registration.html', {'form': form})


def buyer_registration(request):
    if request.method == 'POST':
        form = BuyerRegistrationForm(request.POST)
        if form.is_valid():
            # 创建 CustomUser 对象
            user = form.save(commit=False)
            user.user_id = CustomUser.objects.generate_user_id()
            user.set_password(form.cleaned_data['password'])
            user.save()

            # 创建关联的 Buyer 对象
            buyer = Buyer.objects.create(
                user=user,
                gender=form.cleaned_data['gender'],
                birth_date=form.cleaned_data['birth_date'],
            )
            buyer.save()

            # 设置用户权限
            user.permission = 0
            user.save()
            authenticated_user = authenticate(request, username=user.account, password=request.POST['password'])
            if authenticated_user:
                login(request, authenticated_user)
                # 设置用户权限
                authenticated_user.permission = 0
                authenticated_user.save()
                return redirect('success_page')  # 你需要创建一个成功页面的模板
            return redirect('success_page')
    else:
        form = BuyerRegistrationForm()

    return render(request, 'buyer_registration.html', {'form': form})

@login_required
def view_profile(request):
    user = request.user
    context = {
        'user': user
=======
    
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

>>>>>>> origin/Kuan_remote
    }

<<<<<<< HEAD
    return render(request, 'view_profile.html', context)

@login_required
def edit_profile(request):
    user = request.user

    if request.method == 'POST':
        form = UserProfileForm(request.POST, instance=user)
        if form.is_valid():
            form.save()
            return redirect('view_profile')  # 修改为你的用户个人资料页面的 URL
    else:
        form = UserProfileForm(instance=user)

    context = {
        'form': form
    }
    
    return render(request, 'edit_profile.html', context)

@login_required
def order_history(request):
    # Add logic to handle displaying user order history
    return render(request, 'order_history.html')

@login_required
def product_management(request):
    user_products = Product.objects.filter(seller=request.user.seller)

    context = {'products': user_products}
    return render(request, 'product_management.html', context)

@login_required
def add_product(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            product = form.save(commit=False)
            product.seller = request.user.seller
            product.product_id = Product.objects.generate_product_id()
            product.save()
            return redirect('product_management')
    else:
        form = ProductForm()

    return render(request, 'add_product.html', {'form': form})

@login_required
def edit_product(request, product_id):
    product = Product.objects.get(product_id=product_id)

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            return redirect('product_management')
    else:
        form = ProductForm(instance=product)

    return render(request, 'edit_product.html', {'form': form, 'product': product})
=======
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

def testpage(request):
    template = loader.get_template('testpage.html')
    # models.TestTable.create(request, 0)
    # models.TestTable.updateAll(request, 6 , info)
    # models.TestTable.findShow(request, 6)

    # testpage_value = models.Order.objects.all().values()

    order_thing = models.Order()

    testpage_value = order_thing.findShow(request, 'OR0002')

    p_name = [models.Order.objects.get(pk = 'OR0002').pk, 5]

    context = {
        'temp': testpage_value,
        'p_name': p_name,
    }
    return HttpResponse(template.render(context, request))

>>>>>>> origin/Kuan_remote
