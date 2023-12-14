# Create your models here.
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
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
