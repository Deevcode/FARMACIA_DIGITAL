from .models import *
from rest_framework import serializers


class MedicamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Medicamentos
        fields = '__all__'