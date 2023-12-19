from django.urls import path
from . import views


urlpatterns = [
    path('', views.home, name='home'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),

    path('forgot_password/', views.forgot_password, name='forgot_password'),
<<<<<<< HEAD
    #path('verify/<str:uidb64>/<str:token>/', views.verify_account, name='verify_account'),
    path('email_verification/', views.email_verification, name='email_verification'),


=======
    path('testpage', views.testpage, name='TESTPAGE'),      # backend test page
>>>>>>> 5b2fe27196f2612bf7364e4efe3c4ab0d7a487cc
] 