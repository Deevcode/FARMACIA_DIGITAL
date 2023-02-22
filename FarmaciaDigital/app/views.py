from django.shortcuts import render
from .models import Medicamentos


#VISTA DEL HOME
def home(request):
    return render(request, 'app/home.html')

#VISTA DEL CONTACTO
def contacto(request):
    return render(request, 'app/contacto.html')    

#VISTA DE MEDICAMENTOS
def medicamentos(request):
    medicamentos = Medicamentos.objects.all()
    data = {
        'medicamentos' :  medicamentos

    }
    return render(request, 'app/medicamentos.html',data)    

#VISTA DE BODEGA
def bodega(request):
    return render(request, 'app/bodega.html')    

#VISTA DE REPORTE
def reporte(request):
    return render(request, 'app/reporte.html') 

 