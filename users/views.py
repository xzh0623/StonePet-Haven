from django.shortcuts import render, redirect, get_object_or_404
from .models import *
from .forms import *
from django.shortcuts import render, redirect
from .utils import custom_authentication
from django.utils import timezone
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.contrib import messages

from django.contrib.auth.hashers import make_password
from django.core.mail import send_mail
from django.template.loader import render_to_string
# from .. backend_operation import TEST_add_data_to_models

# Create your views here.
from django.http import Http404

########--------ABOUT HOMEPAGE--------########

def homepage(request):
    user_is_authenticated = request.user.is_authenticated
    username = request.user.name if user_is_authenticated else None
    context = {
        'user_is_authenticated': user_is_authenticated,
        'username': username
        }
    return render(request, 'homepage.html', context)

########--------ABOUT PRODUCT--------########

def products(request):
    products = Product.objects.all()
    context = {
        'products' : products
    }
    return render(request, 'products.html', context)

def product_detail(request, product_id):
    # 根據商品ID檢索商品
    product = get_object_or_404(Product, product_id=product_id)
    context = {
        'product': product
        }

    return render(request, 'product_detail.html', context)

########--------ABOUT LOGIN/OUT--------########

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

########--------ABOUT REGISTER--------########

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

########--------ABOUT USER_PROFILE--------########

@login_required
def view_profile(request):
    user = request.user
    context = {
        'user': user
    }

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

########--------ABOUT PRODUCT_MANAGEMENT--------########

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

########--------ABOUT SHOPPINGCART--------########

@login_required
def add_to_cart(request, product_id):
    # 获取要添加到购物车的产品
    cart_id=Cart.objects.generate_cart_id()

    product = get_object_or_404(Product, product_id=product_id)

    try:
        cart = Cart.objects.get(user=request.user)
    except Cart.DoesNotExist:
        # 如果购物车不存在，则创建一个新的购物车
        cart = Cart.objects.create(cart_id=cart_id, user=request.user)

    # 创建或更新购物车中的商品条目
    cart_item, item_created = CartItem.objects.get_or_create(cart=cart, product=product)
    if not item_created:
        cart_item.quantity += 1
        cart_item.save()

    messages.success(request, f'{product.product_name} 已添加到购物车。')

    # 重定向到产品详情页面或其他适当的页面
    return redirect('product_detail', product_id=product_id)

@login_required
def view_cart(request):
    user = request.user
    cart = Cart.objects.filter(user=user).first()
    cart_items = CartItem.objects.filter(cart=cart)
    cart_total = sum(item.product.price * item.quantity for item in cart_items)
    for item in cart_items:
        item.subtotal = item.product.price * item.quantity
    context = {
        'cart_items': cart_items,
        'cart_total': cart_total,
    }
    return render(request, 'view_cart.html', context)

@login_required
def remove_from_cart(request, delete_product_id):
    # cart = Cart.objects.get(cart_id=cart_id)
    # product = Product.objects.get(product_id=delete_product_id)
    # TODO: 實現從購物車中刪除項目的邏輯
    cart_item = CartItem.objects.filter(id = delete_product_id)

    #cart_item = get_object_or_404(CartItem, cart = cart_id)
    cart_item.delete()
    messages.success(request, '購物車中的項目已成功刪除。')
    return redirect('view_cart')

@login_required
def update_cart(request, cart_item_id, quantity):
    # TODO: 實現更新購物車中項目數量的邏輯
    cart_item = get_object_or_404(CartItem, id=cart_item_id, user=request.user)
    cart_item.quantity = int(quantity)
    cart_item.save()
    messages.success(request, '購物車已成功更新。')
    return redirect('view_cart')

########--------ABOUT ORDER--------########

@login_required
def order_history(request):
    # 获取当前用户的订单历史
    user_orders = Order.objects.filter(user=request.user).order_by('-order_id')

    context = {
        'user_orders': user_orders,
    }

    return render(request, 'order_history.html', context)

@login_required
def checkout(request):
    # 根据需要获取购物车内容
    cookie_name = request.COOKIES.get('name')
    cookie_address = request.COOKIES.get('address')
    cookie_payment_method = request.COOKIES.get('payment_method')
    cookie_delivery_method = request.COOKIES.get('delivery_method')
    cookie_credit_card = request.COOKIES.get('credit_card')
    cookie_expiration_date = request.COOKIES.get('expiration_date','')

    user = request.user
    cart = Cart.objects.filter(user=user).first()
    cart_items = CartItem.objects.filter(cart=cart)
    
    # coupon_id = request.GET.get('coupon_id')
    # coupon_instance = Coupon.objects.get(coupon_id=coupon_id)
    # # 获取discount_amount
    # discount_amount = coupon_instance.discount_amount
    # cart_total = sum(item.product.price * item.quantity* (100-discount_amount)/100 for item in cart_items)
    try:
        coupon_id = request.GET.get('coupon_id')
        coupon_instance = Coupon.objects.get(coupon_id=coupon_id)
        # 获取discount_amount
        discount_amount = coupon_instance.discount_amount
    except Coupon.DoesNotExist:
        # 处理 Coupon 不存在的情况
        coupon_instance = None 
        discount_amount = 0
    cart_total = sum(item.product.price * item.quantity * (100 - discount_amount) / 100 for item in cart_items)
    for item in cart_items:
        item.subtotal = item.product.price * item.quantity * (100-discount_amount)/100
    if request  .method == 'POST':
        form = CheckoutForm(request.POST)
        if form.is_valid():

            # 处理订单，例如创建一个 Order 实例
            order_id = Order.objects.generate_order_id()
            
            print("I innnnnnnnnnnnnnnnnn")
            '''
            monthly_report = MonthlyReport.objects.get_or_create(
                product_id=form.cleaned_data['product_id'],
                month=form.cleaned_data['month'],
                defaults={'total_sales': 0}
            )[0]'''
            #monthly_report.total_sales += calculate_total_sales(cart_items)  # 假设有一个计算总销售额的函数
            #monthly_report.save()
            order = Order.objects.create(
                order_id=order_id,
                user=user,
                name=form.cleaned_data['name'],
                address=form.cleaned_data['address'],
                payment_method=form.cleaned_data['payment_method'],
                delivery_method=form.cleaned_data['delivery_method'],
                credit_card=form.cleaned_data.get('credit_card', ''),
                expiration_date=form.cleaned_data.get('expiration_date', ''),
                # 其他相应的订单信息
            )

            # 为每个购物车项创建相应的订单项，并在此计算小计
            for item in cart_items:
                product = item.product
                product.quantity_in_stock -= item.quantity
                product.save()

                order_item = OrderItem.objects.create(
                    order=order,
                    product=item.product,
                    quantity=item.quantity,
                )

            # 清空购物车
            #CartItem.objects.filter(cart=cart).delete()

            # 显示订单成功的消息
            messages.success(request, '您的订单已经成功提交！感谢您的购买。')

            # 重定向到订单成功页面
            return redirect('order_success')
    else:
        # 如果是GET请求，返回包含表单的页面
        form = CheckoutForm()
        initial_data = {'name': cookie_name, 'address': cookie_address, 'payment_method': cookie_payment_method, 'delivery_method': cookie_delivery_method, 'credit_card': cookie_credit_card, 'expiration_date': cookie_expiration_date}
        form = CheckoutForm(initial=initial_data)
        coupon_id = request.GET.get('coupon_id')
        context = {
            'form': form,
            'cart_items': cart_items,
            'cart_total': cart_total,
            'coupon_id': coupon_id
        }
        return render(request, 'checkout.html', context)
    
########--------ABOUT ORDER--------########

@login_required
def view_cart(request):
    user = request.user
    cart = Cart.objects.filter(user=user).first()
    cart_items = CartItem.objects.filter(cart=cart)
    cart_total = sum(item.product.price * item.quantity for item in cart_items)
    for item in cart_items:
        item.subtotal = item.product.price * item.quantity
    context = {
        'cart_items': cart_items,
        'cart_total': cart_total,
    }
    return render(request, 'view_cart.html', context)

def order_success(request):
    # 假設在處理訂單成功時你有一個訂單物件，你可以將相應的信息傳遞到模板中
    latest_order = Order.objects.latest('order_id')
    context = {
        'order': latest_order
        }
    return render(request, 'order_success.html', context)

def coupon(request):
    user_is_authenticated = request.user.is_authenticated
    username = request.user.name if user_is_authenticated else None
    coupons = Coupon.objects.all()
    if request.method == 'POST':
        form = CouponQueryForm(request.POST)
        if form.is_valid():
            coupon_id = form.cleaned_data['coupon_id']
            coupon = Coupon.objects.filter(coupon_id=coupon_id).first()
            if coupon:
                # 如果存在對應的優惠券，將其傳到前端
                context = {
                    'user_is_authenticated': user_is_authenticated,
                    'username': username,
                    'form': form,
                    'coupon':coupon
                    }
                return render(request, 'coupon.html', context)
            else:
                context = {
                    'user_is_authenticated': user_is_authenticated,
                    'username': username,
                    'form': form,
                    'coupons':coupons
                    }
                return render(request, 'coupon.html', context)
    else:
        # 如果找不到對應的優惠券，回傳全部折價券
        form = CouponQueryForm()
        context = {
            'user_is_authenticated': user_is_authenticated,
            'username': username,
            'form': form,
            'coupons':coupons
            }
    return render(request, 'coupon.html', context)

def forgot_password(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        # 检查邮箱是否存在
        if CustomUser.objects.filter(email=email).exists():
            
            # 获取用户实例
            user_instance = CustomUser.objects.get(email=email)
            #生成重置密码链接
            reset_password_url = "http://127.0.0.1:8000/resetpassword_email_template/?user_id=" + user_instance.user_id
            #print(user_instance.user_id,"1111",user_instance)
            # # 发送重置密码邮件x
            send_resetpassword_email(user_instance, reset_password_url)
            messages.success(request, '重置密碼郵件已發送。')
            return redirect('homepage')
        else:
            messages.error(request, '電子郵件未註冊。')
    return render(request, 'forgot_password.html')

def email_verification(request):
    if request.method == 'POST':
        CustomUser.verify_account(request)
        return redirect('homepage')
    return render(request, 'email_verification.html')

def reset_password(request):
    if request.method == 'POST':
        result=CustomUser.reset_password(request)
        if result=="True":
            return redirect('login')
        else:
           return render(request, 'reset_password.html', {'error': result}) 
    return render(request, 'reset_password.html')

def send_resetpassword_email(user_instance, reset_password_url):
    email_template = render_to_string(
        'email_verification_message.html',
        {'user_instance': user_instance, 'reset_password_url': reset_password_url}
    )
    #郵件內容
    subject = '重置密碼'
    message = 'hi' #'請點擊以下連結重置密碼：\n\n' + reset_password_url
    from_email = 't110590036@ntut.org.tw'
    to_email = user_instance.email
    send_mail(subject, message, from_email, [to_email], html_message=email_template)

def resetpassword_email_template(request):
    uid = request.GET.get('user_id')
    user = get_object_or_404(CustomUser, user_id=uid)
    if request.method == 'POST':
        form = UserPasswordForm(request.POST, instance=user)
        print("noooooo")
        print(form)
        if form.is_valid():
            password = form.cleaned_data['password']
            user.set_password(password)
            user.save()
            print("savvvvvvvvvvvvvvvvvvvvvvvvvv")
            #form.save()
            return redirect('homepage')  # 修改为你的用户个人资料页面的 URL
        else:
            # 处理表单验证失败的逻辑
            error_message = '請確保輸入的信息正確並且確認密碼匹配。'
            return render(request, 'resetpassword_email_template.html', {'form': form, 'error': error_message})
    else:
        form = UserPasswordForm()

    context = {
        'form': form
    }

    return render(request, 'resetpassword_email_template.html', context)
