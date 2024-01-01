# forms.py
from django import forms
from .models import CustomUser, Product
from django.contrib.auth.forms import UserCreationForm

class LoginForm(forms.Form):
    account = forms.CharField(label='Account', max_length=50)
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

class CheckoutForm(forms.Form):
    name = forms.CharField(label='姓名', max_length=100, required=True)
    address = forms.CharField(label='地址', widget=forms.Textarea, required=True)
    payment_method = forms.ChoiceField(label='選擇付款方式', choices=[('credit_card', '信用卡'), ('cash', '現金')], widget=forms.RadioSelect, required=True)
    delivery_method = forms.ChoiceField(label='選擇取貨方式', choices=[('cash_on_delivery', '貨到付款（現金）'), ('store_pickup_cash', '超商取貨（現金）'), ('store_pickup_credit_card', '超商取貨（信用卡）')], widget=forms.RadioSelect, required=True)
    credit_card = forms.CharField(label='信用卡號', max_length=16, min_length=16, required=False)
    expiration_date = forms.CharField(label='有效期限', max_length=7, min_length=7, widget=forms.TextInput(attrs={'placeholder': 'MM/YYYY'}), required=False)