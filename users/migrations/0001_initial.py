# Generated by Django 4.2.6 on 2023-12-27 20:23

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('user_id', models.CharField(max_length=6, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('account', models.CharField(max_length=255, unique=True)),
                ('password', models.CharField(max_length=255)),
                ('address', models.CharField(max_length=255)),
                ('email', models.CharField(max_length=255)),
                ('phone_number', models.CharField(max_length=255)),
                ('permission', models.IntegerField(default=0)),
                ('status', models.IntegerField(default=0)),
                ('is_staff', models.BooleanField(default=False)),
                ('is_superuser', models.BooleanField(default=False)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('cart_id', models.CharField(max_length=6, primary_key=True, serialize=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('product_id', models.CharField(max_length=6, primary_key=True, serialize=False)),
                ('product_name', models.CharField(max_length=255)),
                ('description_of_product', models.TextField()),
                ('picture_in_browsing', models.ImageField(blank=True, null=True, upload_to='browsing_pictures/')),
                ('picture_in_description', models.ImageField(blank=True, null=True, upload_to='description_pictures/')),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('quantity_in_stock', models.PositiveIntegerField()),
                ('is_active', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='Buyer',
            fields=[
<<<<<<< HEAD
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('gender', models.CharField(max_length=10)),
                ('birth_date', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='Seller',
            fields=[
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('join_date', models.DateField(default=django.utils.timezone.now)),
=======
                ('order_id', models.CharField(max_length=6, primary_key=True, serialize=False)),
                ('order_end', models.DateTimeField()),
                ('delivary_method', models.IntegerField()),
                ('delivary_address', models.CharField(max_length=255)),
                ('delivary_fee', models.IntegerField(blank=True)),
                ('status', models.IntegerField()),
                ('order_date', models.DateTimeField()),
                ('quantity_of_product', models.IntegerField()),
                ('comment', models.CharField(blank=True, max_length=255, null=True)),
>>>>>>> origin/Kuan_remote
            ],
        ),
        migrations.CreateModel(
            name='CartItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.PositiveIntegerField(default=1)),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.cart')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.product')),
                ('user', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='product',
            name='seller',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='users.seller'),
        ),
    ]
