from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, CustomUser, Seller, Buyer
from .forms import LoginForm, CustomUserRegistrationForm, SellerRegistrationForm, BuyerRegistrationForm, UserProfileForm
from django.shortcuts import render, redirect
from .utils import custom_authentication
from django.utils import timezone
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from datetime import date
from django.http import HttpResponse
# from .. backend_operation import TEST_add_data_to_models

# Create your views here.

def calculate_age(birth_date):
    today = date.today()
    age = today.year - birth_date.year - ((today.month, today.day) < (birth_date.month, birth_date.day))
    return age


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
            user = authenticate(request, account=account, password=password)
            if user is not None:
                login(request, user)
                return redirect('homepage')  # 登入成功后重定向到首页
            else:
                # 登录失败的处理，例如显示错误信息
                error_message = 'Invalid login credentials. Please try again.'
                return render(request, 'login.html', {'form': form, 'error_message': error_message})
    else:
        form = LoginForm()

    return render(request, 'login.html', {'form': form})

def logout_view(request):
    logout(request)
    return redirect('homepage')  # 登出后重定向到首页或其他页面

def register(request):
    if request.method == 'POST':
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

    if request.method == 'POST':
        form = UserProfileForm(request.POST, instance=user)
        if form.is_valid():
            form.save()
            return redirect('view_profile')
    else:
        form = UserProfileForm(instance=user)

    return render(request, 'view_profile.html', {'form': form})