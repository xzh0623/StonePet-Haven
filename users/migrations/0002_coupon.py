# Generated by Django 4.2.6 on 2024-01-08 16:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Coupon',
            fields=[
                ('coupon_id', models.CharField(max_length=6, primary_key=True, serialize=False)),
                ('discount_amount', models.IntegerField()),
                ('minimum_limit', models.IntegerField()),
                ('start_date', models.DateTimeField()),
                ('expired_date', models.DateTimeField()),
                ('type_of_discount_policies', models.IntegerField()),
                ('seller', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='users.seller')),
            ],
        ),
    ]
