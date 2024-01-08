# Create your models here.
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.

from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
from django.utils import timezone

class CustomUserManager(BaseUserManager):
    def create_user(self, account, password=None, **extra_fields):
        # 创建普通用户
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)
        
        user = self.model(account=account, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, account, password=None, **extra_fields):
        # 创建超级用户
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('permission', 2)  # 设置 permission 为 2

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self.create_user(account, password, **extra_fields)
    
    def generate_user_id(self):
        user_count = self.count() + 1
        user_id = f"US{user_count:04d}"
        return user_id

class CustomUser(AbstractBaseUser, PermissionsMixin):
    user_id = models.CharField(primary_key=True, max_length=6)
    name = models.CharField(max_length=255)
    account = models.CharField(unique=True, max_length=255)
    password = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=255)
    permission = models.IntegerField(default=0)
    status = models.IntegerField(default=0)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    objects = CustomUserManager()

    USERNAME_FIELD = 'account'

    # 其他字段...

    def __str__(self):
        return self.account
    
class Seller(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE, primary_key=True)
    join_date = models.DateField(default=timezone.now)

class Buyer(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE, primary_key=True)
    gender = models.CharField(max_length=10)
    birth_date = models.DateField()


class ProductManager(models.Manager):
    def generate_product_id(self):
        product_count = self.count() + 1
        product_id = f"PR{product_count:04d}"
        return product_id
    
class Product(models.Model):
    product_id = models.CharField(primary_key=True, max_length=6)
    seller = models.ForeignKey(Seller, on_delete=models.CASCADE, null=True, blank=True)
    product_name = models.CharField(max_length=255)
    description_of_product = models.TextField()
    picture_in_browsing = models.ImageField(upload_to='browsing_pictures/', null=True, blank=True)
    picture_in_description = models.ImageField(upload_to='description_pictures/', null=True, blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity_in_stock = models.PositiveIntegerField()
    is_active = models.BooleanField(default=True)

    objects = ProductManager()  # Add this line to associate the manager with the model

    def __str__(self):
        return self.product_name

class CartManager(models.Manager):
    def generate_cart_id(self):
        cart_count = self.count() + 1
        cart_id = f"CR{cart_count:04d}"
        return cart_id
    
    def create_cart(self, user):
        cart = self.create(user=user)
        cart.cart_id = self.generate_cart_id()
        cart.save()

        return cart
    
class Cart(models.Model):
    cart_id = models.CharField(primary_key=True, max_length=6)
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    
    objects = CartManager()

class CartItem(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

class OrderManager(models.Manager):
    def generate_order_id(self):
        order_count = self.count() + 1
        order_id = f"OR{order_count:04d}"
        return order_id
    
    def create_order(self, user, name, address, payment_method, delivery_method, credit_card=None, expiration_date=None):
        order = self.create(
            user=user,
            name=name,
            address=address,
            payment_method=payment_method,
            delivery_method=delivery_method,
            credit_card=credit_card,
            expiration_date=expiration_date,
        )
        order.order_id = self.generate_order_id()
        order.save()

        return order

class Order(models.Model):
    ORDER_STATUS_CHOICES = [
        ('pending_payment', '等待付款'),
        ('pending_shipment', '等待出貨'),
        ('pending_delivery', '等待收貨'),
        ('order_completed', '訂單已完成'),
        ('order_failed', '未成立'),
    ]
    order_id = models.CharField(primary_key=True, max_length=6)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    address = models.TextField()
    payment_method = models.CharField(max_length=50)
    delivery_method = models.CharField(max_length=50)
    credit_card = models.CharField(max_length=16, blank=True, null=True)
    expiration_date = models.CharField(max_length=7, blank=True, null=True)
    order_status = models.CharField(max_length=20, choices=ORDER_STATUS_CHOICES, default='pending_payment')
    order_date = models.DateTimeField(default=timezone.now, editable=False)
    order_completed_date = models.DateTimeField(blank=True, null=True)
    # 其他相应的订单信息，例如订单状态、创建时间等

    objects = OrderManager()

    def __str__(self):
        return f"Order {self.order_id} - {self.user.username}"

class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

class Coupon(models.Model):
    coupon_id = models.CharField(primary_key=True, max_length=6)
    discount_amount = models.IntegerField()
    minimum_limit = models.IntegerField()
    start_date = models.DateTimeField()
    expired_date = models.DateTimeField()
    seller = models.ForeignKey('Seller', on_delete=models.DO_NOTHING)
    type_of_discount_policies = models.IntegerField()

    def __str__(self):
        return f"Coupon {self.coupon_id} - {self.seller.user.name}"
