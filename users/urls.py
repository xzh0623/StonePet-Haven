from django.urls import path
from . import views

urlpatterns = [
<<<<<<< HEAD
    path('', views.homepage, name='homepage'),
    path('products/', views.products, name='products'),
    path('products/<str:product_id>/', views.product_detail, name='product_detail'),
    
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),

    path('register/', views.register, name='register'),
    path('registration_choice/', views.registration_choice, name='registration_choice'),
    path('seller_registration/', views.seller_registration, name='seller_registration'),
    path('buyer_registration/', views.buyer_registration, name='buyer_registration'),
    path('success/', views.success_page, name='success_page'),

    path('profile/', views.view_profile, name='view_profile'),
    path('edit_profile/', views.edit_profile, name='edit_profile'),
    path('order_history/', views.order_history, name='order_history'),

    path('product_management/', views.product_management, name='product_management'),
    path('add_product/', views.add_product, name='add_product'),
    path('edit_product/<str:product_id>/', views.edit_product, name='edit_product'),
]
=======
    path('', views.homepage, name='homepage'),                     #
    path('login/', views.login, name='login'),                              #
    # path('register/', views.register, name='register'),                     #
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
    path('testpage/', views.testpage, name='testpage'),
] 
>>>>>>> origin/Kuan_remote
