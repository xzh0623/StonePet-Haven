from django.urls import path
from . import views


urlpatterns = [
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
    path('coupon/', views.coupon, name='coupon'),
    path('forgot_password/', views.forgot_password, name='forgot_password'),
    path('resetpassword_email_template/', views.resetpassword_email_template, name='resetpassword_email_template'),


    path('profile/', views.view_profile, name='view_profile'),
    path('edit_profile/', views.edit_profile, name='edit_profile'),
    path('order_history/', views.order_history, name='order_history'),

    path('product_management/', views.product_management, name='product_management'),
    path('add_product/', views.add_product, name='add_product'),
    path('edit_product/<str:product_id>/', views.edit_product, name='edit_product'),

    path('add_to_cart/<str:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('view_cart/', views.view_cart, name='view_cart'),
    path('remove_from_cart/<str:delete_product_id>/', views.remove_from_cart, name='remove_from_cart'),
    path('update_cart/<int:cart_item_id>/<int:quantity>/', views.update_cart, name='update_cart'),

    path('checkout/', views.checkout, name='checkout'),
    path('order_success/', views.order_success, name='order_success'),
]