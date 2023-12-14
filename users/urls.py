from django.urls import path
from . import views


urlpatterns = [
    path('', views.home, name='home'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
<<<<<<< HEAD
    path('forgot_password/', views.forgot_password, name='forgot_password'),

=======
    path('testpage', views.testpage, name='TESTPAGE'),      # backend test page
>>>>>>> ee521bdae1e4c498fe2d2978979b4258bac846a7
] 