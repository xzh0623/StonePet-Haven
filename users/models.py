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
from django.http import HttpResponse
from datetime import datetime

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