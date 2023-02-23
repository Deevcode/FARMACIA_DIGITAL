from django import forms
from .models import Contacto, Medicamentos

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