from django.shortcuts import render
from .models import Medicamentos
from .forms import ContactoForm, MedicamentoForm


#VISTA DEL HOME
def home(request):
    return render(request, 'app/home.html')

#VISTA DEL CONTACTO
def contacto(request):
    data = {
        'form': ContactoForm()
    }
    if request.method == 'POST':
        formulario = ContactoForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
            data["mensaje"] = "Contacto Guardado"
        else:
            data["form"] = formulario
    return render(request, 'app/contacto.html', data)   

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
def reportes(request):
    return render(request, 'app/reporte.html') 

#VISTA DE AGREGAR MEDICAMENTO
def agregar_medicamento(request):
    data = {
        'form' : MedicamentoForm()
    }
    if request.method == 'POST':
        formulario = MedicamentoForm(data=request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            data["mensaje"] = "Guardado Correctamente"
        else:
            data["form"] = formulario    
    return render(request, 'app/medicamentos/agregar.html', data) 

#VISTA DE LISTAR
def listar_medicamentos(request):
    medicamentos = Medicamentos.objects.all()
    data = {
        'medicamentos' :  medicamentos
    }
    return render(request, 'app/medicamentos/listar.html', data) 

#VISTA DE MODIFICAR
 