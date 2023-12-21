from django.urls import path
from . import views


urlpatterns = [
    path('', views.homepage, name='homepage'),
    path('products/', views.products, name='products'),
    path('products/<str:product_id>/', views.product_detail, name='product_detail'),
] 