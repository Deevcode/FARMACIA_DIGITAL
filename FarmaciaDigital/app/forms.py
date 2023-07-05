from django import forms
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
################################################################################################################################################
# FORMULARIO PARA CONTACTO
class ContactoForm(forms.ModelForm):

    class Meta:
        model = Contacto
        fields = '__all__'
################################################################################################################################################
# FORMULARIOS PARA MEDICAMENTOS
class MedicamentoForm(forms.ModelForm):
    
    class Meta:
        model = Medicamentos
        fields = '__all__'
        widgets = {
            "fecha_vencimento" : forms.SelectDateWidget()
        }
################################################################################################################################################
# FORMULARIO DE CREACION DE USARIO
class CustomUserCreationForm(UserCreationForm):
    
    class Meta:
        model = User
        fields = 'username', 'first_name', 'last_name','email', 'password1', 'password2'
################################################################################################################################################
# FORMULARIO DE RECETAS
class PacienteRecetaForm(forms.ModelForm):

    class Meta:
        model = PacienteReceta
        fields = '__all__'
################################################################################################################################################
# FORMULARIO DE DIRECCION FARMACIAS
class AddressForm(forms.Form):
    address = forms.CharField(label='Dirección', widget=forms.TextInput(attrs={'id': 'address-input', 'placeholder': 'Ingrese una dirección'}))
