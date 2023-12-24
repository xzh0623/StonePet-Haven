from django.urls import path
from . import views


urlpatterns = [
    path('', views.homepage, name='homepage'),
    path('products/', views.products, name='products'),
    path('products/<str:product_id>/', views.product_detail, name='product_detail'),
    
    path('login/', views.login, name='login'),
    
    path('register/', views.register, name='register'),
    path('registration_choice/', views.registration_choice, name='registration_choice'),
    path('seller_registration/', views.seller_registration, name='seller_registration'),
    path('buyer_registration/', views.buyer_registration, name='buyer_registration'),
    path('success/', views.success_page, name='success_page'),
] 