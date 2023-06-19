from django import forms
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit

class ContactoForm(forms.ModelForm):

    class Meta:
        model = Contacto
        fields = '__all__'

class MedicamentoForm(forms.ModelForm):
    
    class Meta:
        model = Medicamentos
        fields = '__all__'
        widgets = {
            "fecha_vencimento" : forms.SelectDateWidget()
        }

class CustomUserCreationForm(UserCreationForm):
    
    class Meta:
        model = User
        fields = 'username', 'first_name', 'last_name','email', 'password1', 'password2'

class PacienteRecetaForm(forms.ModelForm):

    class Meta:
        model = PacienteReceta
        fields = '__all__'

class AddressForm(forms.Form):
    address = forms.CharField(label='Dirección', widget=forms.TextInput(attrs={'id': 'address-input', 'placeholder': 'Ingrese una dirección'}))