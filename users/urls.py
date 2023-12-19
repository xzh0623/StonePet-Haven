from django.urls import path
from . import views


urlpatterns = [
    path('', views.home, name='home'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),

    path('forgot_password/', views.forgot_password, name='forgot_password'),
    path('email_verification/', views.email_verification, name='email_verification'),
    path('testpage', views.testpage, name='TESTPAGE'),      # backend test page

] 