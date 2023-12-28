# forms.py
from django import forms
from .models import CustomUser, Product
from django.contrib.auth.forms import UserCreationForm

class LoginForm(forms.Form):
    account = forms.CharField(label='Account', max_length=50)
<<<<<<< HEAD
    password = forms.CharField(label='Password', widget=forms.PasswordInput)


class CustomUserRegistrationForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = CustomUser
        fields = ['name', 'account', 'password', 'address', 'email', 'phone_number']

class SellerRegistrationForm(forms.ModelForm):

    class Meta:
        model = CustomUser
        fields = ['name', 'account', 'password', 'address', 'email', 'phone_number']
        widgets = {
            'password': forms.PasswordInput(),
        }

class BuyerRegistrationForm(forms.ModelForm):
    GENDER_CHOICES = [
        ('male', 'Male'),
        ('female', 'Female'),
        ('other', 'Other'),
    ]
    gender = forms.ChoiceField(choices=GENDER_CHOICES, widget=forms.RadioSelect)
    birth_date = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))

    class Meta:
        model = CustomUser
        fields = ['name', 'account', 'password', 'address', 'email', 'phone_number' ]
        widgets = {
            'password': forms.PasswordInput(),
        }

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = CustomUser
        fields = ['name', 'email', 'phone_number', 'address']

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['product_name', 'description_of_product', 'picture_in_browsing', 'picture_in_description', 'price', 'quantity_in_stock', 'is_active']
=======
    password = forms.CharField(label='Password', widget=forms.PasswordInput)
>>>>>>> origin/Kuan_remote
