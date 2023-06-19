from django.shortcuts import render, redirect, get_object_or_404
from django.conf import settings
from .models import *
from .forms import *
from django.contrib import messages
from django.core.mail import EmailMultiAlternatives
from django.template.loader import get_template
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.decorators import user_passes_test
from django.contrib.auth import authenticate, login
from rest_framework import viewsets
from .serializers import MedicamentoSerializer
from django.shortcuts import render
from django.http import HttpResponse
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import landscape, letter
from reportlab.lib import colors
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph
from reportlab.lib.styles import getSampleStyleSheet
import googlemaps

#VISTA DE LAS VIEWSETS
class MedicamentoViewset(viewsets.ModelViewSet):
    queryset = Medicamentos.objects.all()
    serializer_class = MedicamentoSerializer

def group_check(user):
    return user.groups.filter(name__in=['PACIENTE', 'PROFESIONAL']).exists()

def group_check1(user):
    return user.groups.filter(name__in=['PROFESIONAL']).exists()

#VISTA DEL HOME
def home(request):
    return render(request, 'app/home.html')

def send_correo(mail):

    context = {'mail': mail}

    template = get_template('app/correo_contacto.html')
    content = template.render(context)

    email = EmailMultiAlternatives(
        'Notificacion de Contacto',
        'CONTACTO',
        settings.EMAIL_HOST_USER,
        [mail]
    )  
    email.attach_alternative (content, 'text/html')
    email.send()

#VISTA DEL CONTACTO
def contacto(request):
    data = {
        'form': ContactoForm()
    }
    if request.method == 'POST':
        mail = request.POST.get('mail')
        send_correo(mail)
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
@login_required
def bodega(request):
    return render(request, 'app/bodega.html')    

#VISTA DE REPORTE
@user_passes_test(group_check1)
@login_required
def reportes(request):
    return render(request, 'app/reporte.html') 


#VISTA DE AGREGAR MEDICAMENTO
@user_passes_test(group_check1)
@login_required
def agregar_medicamento(request):
    data = {
        'form' : MedicamentoForm()
    }
    if request.method == 'POST':
        formulario = MedicamentoForm(data=request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            messages.success(request, "Medicamento Registrado")
        else:
            data["form"] = formulario    
    return render(request, 'app/medicamentos/agregar.html', data) 

#VISTA DE LISTAR


@user_passes_test(group_check)
@login_required
def listar_medicamentos(request):
    medicamentos = Medicamentos.objects.all()
    data = {
        'medicamentos' :  medicamentos
    }
    return render(request, 'app/medicamentos/listar.html', data)
    
#VISTA DE MODIFICAR


@user_passes_test(group_check1)
@login_required
def modificar_medicamento(request, id):
    
    medicamentos = get_object_or_404(Medicamentos, id_medicamento=id)
    
    data = {
        'form' : MedicamentoForm(instance=medicamentos)
    }

    if request.method == 'POST':
        formulario = MedicamentoForm(data=request.POST, instance=medicamentos, files=request.FILES)
        if  formulario.is_valid():
            formulario.save()
            messages.success(request, "Modificado Correctamente")
            return redirect(to="listar_medicamento")
        data["form"] = formulario 

    return render(request, 'app/medicamentos/modificar.html', data) 

#VISTA DE ELIMINAR
@user_passes_test(group_check1)
@login_required
def eliminar_medicamento(request, id):
    messages.success(request, "Eliminado correctamente")
    medicamento = get_object_or_404(Medicamentos, id=id)
    medicamento.delete()
    return redirect(to="listar_medicamento")

#VISTA DE REGISTRO
#def registro(request):
#    data = {
#        'form': CustomUserCreationForm()
#    }
#
#    if request.method == 'POST':
#        formulario = CustomUserCreationForm(data=request.POST)
#        if formulario.is_valid():
#            formulario.save()
#            user = authenticate(username=formulario.cleaned_data["password1"])
#            login(request, user)
#            messages.success(request, "Te has registrado correctamente")
#            #redirigir al home
#            return redirect(to="home")
#        data["form"] = formulario
#
#    return render(request, 'registration/registro.html',data)


# VISTA DE ENFERMERA
def enfermera(request):
    data = {
        'form' : PacienteRecetaForm()
    }
    if request.method == 'POST':
        formulario = PacienteRecetaForm(data=request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            messages.success(request, "Receta Registrada")
        else:
            data["form"] = formulario    
    return render(request, 'app/enfermera.html', data)

#VISTA DE PROFESIONAL
@user_passes_test(group_check1)
@login_required
def profesional(request):
    profesional = ProfesionalPaciente.objects.all()
    data = {
        'profesional' :  profesional
    }
    return render(request, 'app/profesional.html', data)


def send_email(mail):

    context = {'mail': mail}

    template = get_template('app/correo.html')
    content = template.render(context)

    email = EmailMultiAlternatives(
        'Notificacion de Receta',
        'CodigoFacilito',
        settings.EMAIL_HOST_USER,
        [mail]
    )  
    email.attach_alternative (content, 'text/html')
    email.send()



#VISTA DE AGREGAR MEDICAMENTO
@user_passes_test(group_check1)
@login_required
def agregar_receta(request):
    data = {
        'form' : PacienteRecetaForm()
    }
    if request.method == 'POST':
        mail = request.POST.get('mail')
        send_email(mail)
        formulario = PacienteRecetaForm(data=request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            messages.success(request, "Receta Registrada")
        else:
            data["form"] = formulario    
    return render(request, 'app/recetas/agregar_receta.html', data) 

#VISTA DE LISTAR
#@permission_required('app.view_recetas')
@login_required
def listar_receta(request):
    medicamentos = PacienteReceta.objects.filter(nombres_paciente=request.user)
    data = {
        'medicamentos' :  medicamentos
    }
    return render(request, 'app/recetas/listar_receta.html', data) 

def is_admin(user):
    return user.is_superuser

@login_required
@user_passes_test(is_admin)
def listar_receta_emitida(request):
    medicamentos = PacienteReceta.objects.all()
    data = {
        'medicamentos': medicamentos
    }
    return render(request, 'app/recetas/listar_recetas_emitidas.html', data)

#VISTA DE MODIFICAR
@user_passes_test(group_check1)
@login_required
def modificar_receta(request, id):
    
    medicamentos = get_object_or_404(PacienteReceta, id_receta_usuario=id)
    
    data = {
        'form' : PacienteRecetaForm(instance=medicamentos)
    }

    if request.method == 'POST':
        formulario = PacienteRecetaForm(data=request.POST, instance=medicamentos, files=request.FILES)
        if  formulario.is_valid():
            formulario.save()
            messages.success(request, "Modificado Correctamente")
            return redirect(to="listar_receta")
        data["form"] = formulario 

    return render(request, 'app/recetas/modificar_receta.html', data) 

#VISTA DE ELIMINAR
@user_passes_test(group_check1)
@login_required
def eliminar_receta(request, id_receta_usuario):
    medicamentos = get_object_or_404(PacienteReceta, id_receta_usuario=id_receta_usuario)
    medicamentos.delete()
    messages.success(request, "Receta eliminada correctamente.")
    return redirect('eliminar_receta')

# TABLA DE PDF PARA MEDICAMENTO
@user_passes_test(group_check1)
@login_required
def render_to_pdf(data):
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="ingresos_medicamentos.pdf"'
    
    p = canvas.Canvas(response)

    # Encabezado del documento
    p.drawString(100, 750, "Ingresos de Medicamentos")

    # Obtener los datos de ingresos de medicamentos
    ingresos = Medicamentos.objects.all()

    # Generar contenido del PDF
    y = 700
    for ingreso in ingresos:
        p.drawString(100, y, "Medicamento: {}".format(str(ingreso)))
        y -= 20

    p.showPage()
    p.save()

    return response

@user_passes_test(group_check1)
@login_required
def generar_pdf(request):
    pdf = render_to_pdf(None)
    return pdf


# TABLA DE PDF PARA RECETAS
@user_passes_test(group_check1)
@login_required
def render_recetas_to_pdf(data):
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="recetas_pacientes.pdf"'

    doc = SimpleDocTemplate(response, pagesize=landscape(letter))
    elements = []

    # Estilos
    styles = getSampleStyleSheet()
    style = styles['Title']

    # Encabezado del documento
    elements.append(Paragraph("Recetas de Pacientes", style))

    # Obtener las recetas de pacientes
    recetas = PacienteReceta.objects.all()

    # Crear la tabla y establecer el estilo
    data = [['Fecha', 'Paciente', 'Medicamento', 'Tiempo de tratamiento', 'Frecuencia']]
    for receta in recetas:
        data.append([
            receta.fecha_receta,
            str(receta.nombres_paciente),
            str(receta.nombre_comercial),
            receta.tiempo_tratamiento_dias,
            receta.frecuencia_dosis_diaria
        ])

    table = Table(data)
    style = TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('FONTSIZE', (0, 0), (-1, 0), 12),
        ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
        ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
    ])
    table.setStyle(style)

    elements.append(table)
    doc.build(elements)

    return response

@user_passes_test(group_check1)
@login_required
def generar_recetas_pdf(request):
    pdf = render_recetas_to_pdf(None)
    return pdf

# VISTA DE GOOGLE MAPS

def google_maps(request, id):
    gmaps = googlemaps.Client(key=settings.GOOGLE_MAPS_API_KEY)

    # Obtener la instancia del objeto UsuarioFicha o mostrar un error 404 si no existe
    usuario_ficha = get_object_or_404(UsuarioFicha, id=id)

    address = usuario_ficha.dirreccion_usuario

    # Realizar la solicitud de geocodificación
    geocode_result = gmaps.geocode(address)

    # Obtener la latitud y longitud de la respuesta
    if geocode_result:
        lat = geocode_result[0]['geometry']['location']['lat']
        lng = geocode_result[0]['geometry']['location']['lng']
    else:
        lat = None
        lng = None

    return render(request, 'app/maps.html', {'lat': lat, 'lng': lng})