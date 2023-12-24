# Create your models here.
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

from django.db.models import Max
from django.core.mail import send_mail
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from django.utils.translation import gettext as _
from django.core.mail import EmailMessage
from django.conf import settings
from asgiref.sync import sync_to_async
from django.shortcuts import get_object_or_404
from django.http import HttpResponse
from datetime import datetime




class Administrator(models.Model):
    user = models.OneToOneField('User', models.DO_NOTHING, primary_key=True)

    class Meta:
        managed = False
        db_table = 'administrator'


class Buyer(models.Model):
    user = models.OneToOneField('User', models.DO_NOTHING, primary_key=True)
    sex = models.IntegerField(blank=True, null=True)
    age = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'buyer'
    @classmethod
    def Create(cls, request,user_instance):
        if request.method == 'POST':
            age = request.POST.get('age')

            # 创建 User 实例
            buyer_instance = Buyer(
            user=user_instance,
            sex = int(request.POST.get('gender')),
            age=age
        )
        buyer_instance.save()


class Contain(models.Model):
    product = models.OneToOneField('Product', models.DO_NOTHING, primary_key=True)  # The composite primary key (product_id, order_id) found, that is not supported. The first column is selected.
    order = models.ForeignKey('Order', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'contain'
        unique_together = (('product', 'order'),)


class Coupon(models.Model):
    coupon_id = models.CharField(primary_key=True, max_length=6)
    discount_amount = models.IntegerField()
    minimum_limit = models.IntegerField()
    start_date = models.DateTimeField()
    expired_date = models.DateTimeField()
    seller = models.ForeignKey('Seller', models.DO_NOTHING)
    type_of_discount_policies = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'coupon'


class Manage(models.Model):
    administrator = models.OneToOneField(Administrator, models.DO_NOTHING, primary_key=True)  # The composite primary key (administrator_id, coupon_id) found, that is not supported. The first column is selected.
    coupon = models.ForeignKey(Coupon, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'manage'
        unique_together = (('administrator', 'coupon'),)


class Order(models.Model):
    order_id = models.CharField(primary_key=True, max_length=6)
    order_end = models.DateTimeField()
    delivary_method = models.IntegerField()
    delivary_address = models.CharField(max_length=255)
    delivary_fee = models.IntegerField(blank=True, null=True)
    status = models.IntegerField()
    order_date = models.DateTimeField()
    quantity_of_product = models.IntegerField()
    comment = models.CharField(max_length=255, blank=True, null=True)
    seller = models.ForeignKey('Seller', models.DO_NOTHING)
    coupon = models.ForeignKey(Coupon, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order'


class Product(models.Model):
    product_id = models.CharField(primary_key=True, max_length=6)
    product_name = models.CharField(max_length=255)
    description_of_product = models.CharField(max_length=255)
    picture_in_browsing = models.ImageField(upload_to='product_images/', blank=True, null=True)
    picture_in_description = models.ImageField(upload_to='product_images/', blank=True, null=True)
    price = models.IntegerField()
    quantity_in_stock = models.IntegerField()
    seller = models.ForeignKey('Seller', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'product'



class ProductSales(models.Model):
    daily = models.IntegerField(blank=True, null=True)
    monthly = models.IntegerField(blank=True, null=True)
    weekly = models.IntegerField(blank=True, null=True)
    product = models.OneToOneField(Product, models.DO_NOTHING, primary_key=True)

    class Meta:
        managed = False
        db_table = 'product_sales'


class Purchase(models.Model):
    buyer = models.OneToOneField(Buyer, models.DO_NOTHING, primary_key=True)  # The composite primary key (buyer_id, product_id) found, that is not supported. The first column is selected.
    product = models.ForeignKey(Product, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'purchase'
        unique_together = (('buyer', 'product'),)


class Seller(models.Model):
    user = models.OneToOneField('User', models.DO_NOTHING, primary_key=True)
    joint_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'seller'


class ShoppingCart(models.Model):
    cart_id = models.CharField(primary_key=True, max_length=6)
    buyer = models.ForeignKey(Buyer, models.DO_NOTHING)
    order = models.ForeignKey(Order, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'shopping_cart'


class TestTable(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'test_table'

    
    def Update(request):
        # Assuming the request contains the necessary data for the update

        # Get an instance of TestTable to update (you can use any criteria)
        to_update = TestTable.objects.get(id=1)  # You should use a valid criterion here

        # Update the fields
        to_update.name = 'Updated Name'
        to_update.description = 'Updated Description'
        to_update.created_at = datetime.now()

        # Save the changes to the database
        to_update.save()

        # Optionally, you can return an HttpResponse
        return HttpResponse("Record updated successfully.")
    
    def Create(request):
        # Assuming the request contains the necessary data for creating a new record

        # Create a new instance of TestTable
        new_test_record = TestTable(
            name='New Record',
            description='Description for the new record',
            created_at=datetime.now()
        )

        # Save the new instance to the database
        new_test_record.save()

        # Optionally, you can return an HttpResponse
        return HttpResponse("New record created and saved successfully.")
    
    def Delete(request, record_id):
        # Assuming the request contains the necessary data for deleting the record
        # and `record_id` is the primary key of the record to be deleted.

        try:
            # Get the instance with the specified primary key
            to_delete = TestTable.objects.get(id=record_id)

            # Delete the instance
            to_delete.delete()

            # Optionally, you can return an HttpResponse
            # return HttpResponse("Record deleted successfully.")
        except TestTable.DoesNotExist:
            # Handle the case where the record with the specified id does not exist
            # Optionally, you can return an HttpResponse or raise an exception
            pass

    # Note: Adjust the code based on your actual use case.


class User(models.Model):
    user_id = models.CharField(primary_key=True, max_length=6)
    name = models.CharField(max_length=255)
    account = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=255)
    permission = models.IntegerField()
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'user'

    @classmethod
    def Create(cls, request):
        if request.method == 'POST':
                # 获取用户提交的信息
            username = request.POST.get('username')
            password = request.POST.get('password')
            email = request.POST.get('email')
            phone_number = request.POST.get('phone_number')
            account = request.POST.get('account')
            address = request.POST.get('address')

            # 检查是否存在相同的账户、电话号码或电子邮件
            if cls.objects.filter(account=account).exists():
                return "帳戶已存在"
            if cls.objects.filter(phone_number=phone_number).exists():
                return "電話號碼已存在"
            if cls.objects.filter(email=email).exists():
                return "電子郵件已存在"

            # 创建 User 实例
            user_uid = cls.generate_unique_user_id()
            user_instance = cls(
                user_id=user_uid,
                name=username,
                password=password,
                email=email,
                phone_number=phone_number,
                account=account,
                address=address,
                permission=1,
                status=1
            )
            # 发送验证电子邮件
            cls.send_verification_email(request, user_instance)
             # 发送电子邮件
            #send_mail('hi', 'hii','t110590036@ntut.org.tw' , ['t110590033@ntut.org.tw'])
            # 保存用户实例
            user_instance.save()
            Buyer.Create(request,user_instance)
            return "True"

        return None  # 或者返回适当的值，表示未进行创建

    @classmethod
    def generate_unique_user_id(cls):
        # 获取 User 模型中的最大 user_id
        max_user_id = cls.objects.all().aggregate(Max('user_id'))['user_id__max']

        # 如果没有任何用户，将最大值设为 'US0000'
        if max_user_id is None:
            max_user_id = 'US0000'

        # 提取数字部分，增加1，然后组合成新的 user_id
        prefix = 'US'
        current_number = int(max_user_id[len(prefix):])
        new_number = current_number + 1
        new_user_id = f'{prefix}{new_number:04d}'

        return new_user_id
    
    @classmethod
    def send_verification_email(cls, request, user_instance):
        full_verification_url = "http://127.0.0.1:8000/email_verification/?user_id=" + user_instance.user_id
        
        email_template = render_to_string(
                'email_verification_message.html',
                {'user_instance': user_instance, 'verification_url': full_verification_url}
        )
         # 构建邮件内容
        subject = _('Verify Your Account')
        message = 'hi'
        from_email = 't110590036@ntut.org.tw'  # 发送邮件的邮箱
        to_email = user_instance.email

        # # 发送电子邮件
         #send_mail(subject, email_template, from_email, [to_email])
        send_mail(subject, message, from_email, [to_email], html_message=email_template)
    
    @classmethod
    def verify_account(cls, request):
        user_id = request.GET.get('user_id')  # 假设你通过 URL 参数传递了 user_id
        user = get_object_or_404(cls, user_id=user_id)
        request.session['user_uid'] = 'US0007';
        if user.status != 2:
            user.status = 2  # 假设状态码 2 表示已验证      
            user.save() 
