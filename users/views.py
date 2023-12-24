from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, CustomUser, Seller, Buyer
from .forms import LoginForm, CustomUserRegistrationForm, SellerRegistrationForm, BuyerRegistrationForm
from django.shortcuts import render, redirect
from .utils import custom_authentication
from django.utils import timezone
from datetime import date
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

def login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)  # 將 'YourLoginForm' 替換為實際的登錄表單名稱

        if form.is_valid():
            account = form.cleaned_data['account']
            password = form.cleaned_data['password']

            # 你的自定義身份驗證邏輯
            user = custom_authentication(account, password)

            if user is not None:
                # 登錄用戶（根據你的身份驗證邏輯修改這部分）
                # 例如，你可能設置一個會話變數或使用基於令牌的方法
                request.session['user_id'] = user.id
                return redirect('home')  # 將 'home' 替換為你的主頁URL名稱
            else:
                # 身份驗證失敗
                error = '無效的登錄憑據。請重試。'
        else:
            # 表單無效
            error = '無效的表單提交。請檢查輸入的數據。'
    else:
        form = LoginForm()  # 將 'YourLoginForm' 替換為實際的登錄表單名稱
        error = None

    return render(request, 'login.html', {'form': form, 'error': error})

def register(request):
    if request.method == 'POST':
        form = CustomUserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.user_id = CustomUser.objects.generate_user_id()
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
            user.save()

            seller = Seller.objects.create(user=user)
            seller.join_date = timezone.now()
            seller.save()

            # 设置用户权限
            user.permission = 1
            user.save()

            return redirect('success_page')  # 你需要创建一个成功页面的模板
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

            return redirect('success_page')
    else:
        form = BuyerRegistrationForm()

    return render(request, 'buyer_registration.html', {'form': form})
