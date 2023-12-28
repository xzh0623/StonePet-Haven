# Create your models here.
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from typing import Any
from django.db import models
from django.http import HttpResponse
from datetime import datetime
import sys

# class BasicModel:
#     def updateAll():
#         return 0
#     def updatePart():
#         return 0
#     def create():
#         return 0
#     def delete():
#         return 0

class BasicModel(models.Model):
    def findShow(request, pk:str):
        primary_name = BasicModel.getPrimaryKey()
        data = BasicModel.objects.filter(primary_name = pk)
        print(data.values())

    def getPrimaryKey(request):
        for field in BasicModel._meta.fields:
            if field.primary_key:
                print(field)
                return


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
    delivary_method = models.IntegerField()
    delivary_address = models.CharField(max_length=255)
    status = models.IntegerField()
    order_date = models.DateTimeField()
    quantity_of_product = models.IntegerField()
    seller = models.ForeignKey('Seller', models.DO_NOTHING)
    delivary_fee = models.IntegerField(blank=True, null=True)
    comment = models.CharField(max_length=255, blank=True, null=True)
    coupon = models.ForeignKey(Coupon, models.DO_NOTHING, blank=True, null=True)
    order_end = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order'

    def __init__(self, *args: Any, **kwargs: Any) -> None:
        super().__init__(*args, **kwargs)

    def updateAll(request, update_id):
        to_update = Order.objects.get(id=update_id)
        
        ######
        
        to_update.save()
        return HttpResponse("Record updated successfully.")

    def create(request, update_order_id: str, update_delivary_method: int, update_delivary_address: str, 
               update_status_NO_USE, order_date_NO_USE, update_quantity_of_product: int, update_seller: str,
               update_delivary_fee:int = 0, update_comment:str = "", update_cupon:int = "", update_order_end:datetime = ""):
        
        new_test_record = Order(
            order_id = update_order_id,
            order_end = update_order_end, 
            delivary_method = update_delivary_method,
            delivary_address = update_delivary_address, 
            delivary_fee = update_delivary_fee,
            status = 0, 
            order_date = datetime.now(),
            quantity_of_product = update_quantity_of_product, 
            seller = update_seller, 
            comment = update_comment, 
            cupon = update_cupon
        )

        new_test_record.save()
        return HttpResponse("New record created and saved successfully.")

    def delete(request, record_id):
        try:
            # Get the instance with the specified primary key
            to_delete = TestTable.objects.get(id=record_id)

            # Delete the instance
            to_delete.delete()

            return HttpResponse("Record deleted successfully.")
        except TestTable.DoesNotExist:
            return HttpResponse("FAILED to delete the tecord. Record_id NOT FOUND")
    
    def findShow(self, request, pk:str):

        # order_thing = Order()
        # if hasattr(order_thing, '_meta'):
        #     primary_key_name = order_thing._meta.pk.name
        #     print(type(primary_key_name))

        data = Order.objects.filter(order_id = pk)
        return(data.values())

class Product(models.Model):
    product_id = models.CharField(primary_key=True, max_length=6)
    product_name = models.CharField(max_length=255)
    description_of_product = models.CharField(max_length=255)
    picture_in_browsing = models.CharField(max_length=255)
    picture_in_description = models.CharField(max_length=255)
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

    def create(request, update_user:str, update_joint_date_NO_USE):
        new = Seller(
            user= update_user,
            joint_date = datetime.now()
        )

        new.save()
        return HttpResponse("New record created and saved successfully.")

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

    all_attribute = [name, description, created_at]

    class Meta:
        managed = False
        db_table = 'test_table'

    # info should be a list of all information to update the table
    def updateAll(request, update_id, info):
        to_update = TestTable.objects.get(id=update_id)

        to_update.name = info[0]
        to_update.description = info[1]

        to_update.save()
        return HttpResponse("Record update successfully.")
    
    def create(request, info):
        new_test_record = TestTable(
            name = info[0],
            description = info[1],
            created_at = datetime.now()
        )

        new_test_record.save()
        return HttpResponse("New record created and saved successfully.")

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
        db_table = 'User'

    def create(request, update_user_id:str, update_name:str, update_account:str,
               update_password:str, update_address:str, update_email:str, 
               update_phone_number:str, update_permision:int, update_status:int):
        
        new = User(
            user_id = update_user_id,
            name = update_name,
            account = update_account,
            password = update_password,
            address = update_address,
            email = update_email,
            phone_number = update_phone_number,
            permission = update_permision,
            status =update_status,
        )

        new.save()
        return HttpResponse("New record created and saved successfully.")
