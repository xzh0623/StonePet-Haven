from django.urls import path
from . import views


urlpatterns = [
    path('', views.home, name='home'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
<<<<<<< HEAD
    path('forgot_password/', views.forgot_password, name='forgot_password'),
<<<<<<< HEAD

=======
    path('testpage', views.testpage, name='TESTPAGE'),      # backend test page
>>>>>>> ee521bdae1e4c498fe2d2978979b4258bac846a7
=======
    path('creat_account/', views.creat_account, name='creat_account'),
>>>>>>> 0b4da967f5963edeccdf65d38a23e8f68c037295
] 