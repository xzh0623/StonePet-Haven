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

class Product(models.Model):
    product_id = models.CharField(primary_key=True, max_length=6)
    product_name = models.CharField(max_length=255)
    description_of_product = models.CharField(max_length=255)
    picture_in_browsing = models.ImageField(upload_to='product_images/', blank=True, null=True)
    picture_in_description = models.ImageField(upload_to='product_images/', blank=True, null=True)
    price = models.IntegerField()
    quantity_in_stock = models.IntegerField()
    

    class Meta:
        managed = False
        db_table = 'product'