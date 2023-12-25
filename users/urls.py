from django.urls import path
from . import views

urlpatterns = [
    path('', views.homepage, name='homepage'),                     #
    path('login/', views.login, name='login'),                              #
    # path('register/', views.register, name='register'),                     #
    path('shoppingcart/', views.shoppingcart, name='shoppingcart'),
    path('shoppingcart_unlogin/', views.shoppingcart_unlogin, name='shoppingcart_unlogin'),         #
    path('forgotpassword/', views.forgotpassword, name='forgotpassword'),   #
    path('registermember/', views.registermember, name='registermember'),   #
    path('registeroption/', views.registeroption, name='registeroption'),   #
    path('registerbuyer/', views.registerbuyer, name='registerbuyer'),      #
    path('registerseller/', views.registerseller, name='registerseller'),   #
    path('0_introduction/', views.introduction, name='0_introduction'),     #
    path('0_cooperation/', views.cooperation, name='0_cooperation'),        #
    path('0_information/', views.information, name='0_information'),        #
    path('0_policy/', views.policy, name='0_policy'),   
    path('0_userpolicy/', views.userpolicy, name='0_userpolicy'),    
    path('0_privacy/', views.privacy, name='0_privacy'),
    path('email_verification/', views.email_verification, name='email_verification'), 
    path('reset_password/', views.reset_password, name='reset_password'),  #
] 