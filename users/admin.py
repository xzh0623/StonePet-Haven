from django.contrib import admin
from .models import CustomUser, Buyer, Seller, Product

# Register your models here.
admin.site.register(CustomUser)
admin.site.register(Product)