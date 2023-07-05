from .models import *
from rest_framework import serializers

################################################################################################################################################
# SERIALIZADOR DE MEDICAMENTOS API
class MedicamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Medicamentos
        fields = '__all__'