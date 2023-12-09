from django.urls import path
from . import views

urlpatterns = [
    path('homepage/', views.homepage, name='homepage'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('shoppingcart/', views.shoppingcart, name='shoppingcart'),
    path('forgotpassword/', views.forgotpassword, name='forgotpassword'),
    path('registermember/', views.registermember, name='registermember'),
    path('registeroption/', views.registeroption, name='registeroption'),
    path('registerbuyer/', views.registerbuyer, name='registerbuyer'),
    path('registerseller/', views.registerseller, name='registerseller'),
    path('0_introduction/', views.introduction, name='0_introduction'),
    path('0_cooperation/', views.cooperation, name='0_cooperation'),
    path('0_information/', views.information, name='0_information'),
    path('0_policy/', views.policy, name='0_policy'),
] 