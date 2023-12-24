# yourapp/forms.py
from django import forms

class LoginForm(forms.Form):
    account = forms.CharField(label='Account', max_length=50)
    password = forms.CharField(label='Password', widget=forms.PasswordInput)

class CouponForm(forms.Form):
    coupon_id = forms.CharField(label='Coupon ID', max_length=50, required=True, widget=forms.TextInput(attrs={'class': 'coupon_id'}))
