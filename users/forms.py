# yourapp/forms.py
from django import forms

class LoginForm(forms.Form):
    account = forms.CharField(label='Account', max_length=50)
    password = forms.CharField(label='Password', widget=forms.PasswordInput)
