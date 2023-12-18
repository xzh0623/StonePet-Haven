from django.urls import path
from . import views


urlpatterns = [
<<<<<<< HEAD
    path('homepage/', views.homepage, name='homepage'),                     #
    path('login/', views.login, name='login'),                              #
    path('register/', views.register, name='register'),                     #
    path('shoppingcart/', views.shoppingcart, name='shoppingcart'),         #
    path('forgotpassword/', views.forgotpassword, name='forgotpassword'),   #
    path('registermember/', views.registermember, name='registermember'),   #
    path('registeroption/', views.registeroption, name='registeroption'),   #
    path('registerbuyer/', views.registerbuyer, name='registerbuyer'),      #
    path('registerseller/', views.registerseller, name='registerseller'),   #
    path('0_introduction/', views.introduction, name='0_introduction'),     #
    path('0_cooperation/', views.cooperation, name='0_cooperation'),        #
    path('0_information/', views.information, name='0_information'),        #
    path('0_policy/', views.policy, name='0_policy'),                       #
=======
    path('', views.home, name='home'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),

    path('forgot_password/', views.forgot_password, name='forgot_password'),
    path('testpage', views.testpage, name='TESTPAGE'),      # backend test page
>>>>>>> 9b78428d59ff7c4a2353ce3241820f07e703e7ed
] 