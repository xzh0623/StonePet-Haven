# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Administrator(models.Model):
    user = models.OneToOneField('User', models.DO_NOTHING, primary_key=True)

    class Meta:
        managed = False
        db_table = 'administrator'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


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


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


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
