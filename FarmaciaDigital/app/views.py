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
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Image, Spacer
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from datetime import datetime
import googlemaps
from django.db import connection


################################################################################################################################################
#VISTA DE LAS VIEWSETS

class MedicamentoViewset(viewsets.ModelViewSet):
    queryset = Medicamentos.objects.all()
    serializer_class = MedicamentoSerializer

def group_check(user):
    return user.groups.filter(name__in=['PACIENTE', 'PROFESIONAL']).exists()

def group_check1(user):
    return user.groups.filter(name__in=['PROFESIONAL']).exists()
################################################################################################################################################
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
################################################################################################################################################
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
################################################################################################################################################
#VISTA DE MEDICAMENTOS
@login_required
def medicamentos(request):
    medicamentos = Medicamentos.objects.all()
    data = {
        'medicamentos' :  medicamentos

    }
    return render(request, 'app/medicamentos.html',data)    
################################################################################################################################################
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
################################################################################################################################################
#VISTA DE LISTAR

@user_passes_test(group_check)
@login_required
def listar_medicamentos(request):
    medicamentos = Medicamentos.objects.all()
    data = {
        'medicamentos' :  medicamentos
    }
    return render(request, 'app/medicamentos/listar.html', data)
################################################################################################################################################
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
################################################################################################################################################
#VISTA DE ELIMINAR

@user_passes_test(group_check1)
@login_required
def eliminar_medicamento(request, id):
    messages.success(request, "Eliminado correctamente")
    medicamento = get_object_or_404(Medicamentos, id=id)
    medicamento.delete()
    return redirect(to="listar_medicamento")
################################################################################################################################################
# VISTA DE ENFERMERA

@login_required
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
################################################################################################################################################
#VISTA DE PROFESIONAL

@user_passes_test(group_check1)
@login_required
def profesional(request):
    profesional = ProfesionalPaciente.objects.all()
    data = {
        'profesional' :  profesional
    }
    return render(request, 'app/profesional.html', data)
################################################################################################################################################
#VISTA DE ENVIAR CORREOS

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
################################################################################################################################################
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
################################################################################################################################################
#VISTA DE LISTAR RECETA

@login_required
def listar_receta(request):
    medicamentos = PacienteReceta.objects.filter(nombres_paciente=request.user)
    data = {
        'medicamentos' :  medicamentos
    }
    return render(request, 'app/recetas/listar_receta.html', data) 

def is_admin(user):
    return user.is_superuser

#VISTA DE LISTAR RECETA EMITIDA

@login_required
@user_passes_test(is_admin)
def listar_receta_emitida(request):
    medicamentos = PacienteReceta.objects.all()
    data = {
        'medicamentos': medicamentos
    }
    return render(request, 'app/recetas/listar_recetas_emitidas.html', data)
################################################################################################################################################
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
################################################################################################################################################
#VISTA DE ELIMINAR

@user_passes_test(group_check1)
@login_required
def eliminar_receta(request, id_receta_usuario):
    medicamentos = get_object_or_404(PacienteReceta, id_receta_usuario=id_receta_usuario)
    medicamentos.delete()
    messages.success(request, "Receta eliminada correctamente.")
    return redirect('eliminar_receta')
################################################################################################################################################
# TABLA DE PDF PARA MEDICAMENTO
@user_passes_test(group_check1)
@login_required
def render_to_pdf(data):
    current_date = datetime.now().strftime("%d-%m-%Y")
    filename = f"Medicamentos_Registrados_{current_date}.pdf"
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="{filename}"'

    doc = SimpleDocTemplate(response, pagesize=letter)

    # Estilos
    styles = getSampleStyleSheet()
    title_style = styles['Title']
    content_style = styles['Normal']

    elements = []

    # Agregar logo del negocio en la parte superior
    logo_path = 'app/static/app/img/123.png'  # Ruta de la imagen del logo
    logo = Image(logo_path, width=200, height=200)
    elements.append(logo)

    # Encabezado del documento
    title = Paragraph("Listado de Medicamentos Registrados", title_style)
    elements.append(title)

    # Agregar fecha del reporte
    current_date_formatted = datetime.now().strftime("%d de %B de %Y")
    date_style = ParagraphStyle(content_style, fontSize=14)
    date = Paragraph(f"Fecha del reporte: {current_date_formatted}", date_style)
    elements.append(date)

    elements.append(Spacer(1, 0.5 * inch))

    # Obtener los datos de ingresos de medicamentos
    ingresos = StockFarmacia.objects.all()

    # Generar contenido del PDF en forma de tabla vertical
    table_data = [["Medicamentos", "Farmacia", "Cantidad"]]  # Título de la tabla
    for ingreso in ingresos:
        medicamento = str(ingreso.medicamento)
        farmacia = str(ingreso.farmacia)
        cantidad = str(ingreso.cantidad)
        table_data.append([medicamento, farmacia, cantidad])

    table = Table(table_data, colWidths=[3 * inch, 3 * inch, 1 * inch])
    table.setStyle(TableStyle([
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
        ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('FONTSIZE', (0, 0), (-1, 0), 12),
        ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
    ]))

    elements.append(table)

    doc.build(elements)

    return response
################################################################################################################################################
# VISTA DE GENERAR PDF

@user_passes_test(group_check1)
@login_required
def generar_pdf(request):
    if request.method == 'POST':
        pdf = render_to_pdf(request)
        return pdf
    else:
        return redirect('generar_pdf')
################################################################################################################################################
# TABLA DE PDF PARA RECETAS

@user_passes_test(group_check1)
@login_required
def render_recetas_to_pdf(data):
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="Recetas_Emitidas_{datetime.now().strftime("%d-%m-%Y")}.pdf"'

    doc = SimpleDocTemplate(response, pagesize=landscape(letter))
    elements = []

    styles = getSampleStyleSheet()
    style = styles['Title']

    logo_path = 'app/static/app/img/123.png'  
    logo = Image(logo_path, width=200, height=200)
    elements.append(logo)
    elements.append(Paragraph("Recetas de Pacientes", style))

    current_date = datetime.now().strftime("%d-%m-%Y")
    elements.append(Paragraph(f"Fecha de generación: {current_date}"))

    elements.append(Spacer(1, 0.5 * inch))

    recetas = PacienteReceta.objects.all()

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
################################################################################################################################################
# VISTA DE GENERAR PDF DE MEDICAMENTOS

@user_passes_test(group_check1)
@login_required
def generar_recetas_pdf(request):
    if request.method == 'POST':
        pdf = render_recetas_to_pdf(request)
        return pdf
    else:
        return redirect('generar_recetas_pdf')
################################################################################################################################################
# VISTA DE GOOGLE MAPS UBICACIONES FARMACIAS
@login_required
def map_view(request):
    if request.method == 'POST':
        form = AddressForm(request.POST)
        if form.is_valid():
            address = form.cleaned_data['address']
            gmaps = googlemaps.Client(key=settings.GOOGLE_MAPS_API_KEY)
            geocode_result = gmaps.geocode(address)
            if geocode_result:
                lat = geocode_result[0]['geometry']['location']['lat']
                lng = geocode_result[0]['geometry']['location']['lng']
                context = {'form': form, 'lat': lat, 'lng': lng}
            else:
                context = {'form': form, 'error': 'No se encontró la dirección'}
    else:
        form = AddressForm()
        context = {'form': form}

    return render(request, 'app/maps.html', context)
################################################################################################################################################
# VISTA DE PERFIL DE USUARIO

@login_required
def perfil_usuario(request):
    usuario_ficha = UsuarioFicha.objects.get(identificacion_usuario=request.user)
    context = {
        'usuario_ficha': usuario_ficha
    }
    return render(request, 'app/perfil_usuario.html', context)
################################################################################################################################################
# VISTA DE LA FICHA CLINICA

@login_required
def paciente_ficha_clinica_list(request):
    # Obtener el usuario autenticado actualmente
    usuario = request.user

    # Filtrar las fichas clínicas del usuario actual
    fichas = PacienteFichaClinica.objects.filter(identificacion_paciente=usuario)

    return render(request, 'app/paciente_ficha_clinica_list.html', {'fichas': fichas})
################################################################################################################################################
# VISTA DEL STOCK DE LA FARMACIA

@login_required
def stock_farmacia(request):
    nombre_comercial = request.GET.get('nombre_comercial')
    stocks = StockFarmacia.objects.filter(medicamento__nombre_comercial=nombre_comercial)
    return render(request, 'app/stock_farmacia.html', {'stocks': stocks})

################################################################################################################################################
# VISTA DEL STOCK DE LA FARMACIA

@login_required
def ficha_tecnica(request):
    nombre_comercial = request.GET.get('nombre_comercial')
    medicamento = get_object_or_404(Medicamentos, nombre_comercial=nombre_comercial)
    stocks = MedicamentoFichaTecnica.objects.filter(nombre_comercial=medicamento)
    return render(request, 'app/ficha_tecnica.html', {'stocks': stocks})
################################################################################################################################################
# VISTA DE LA FARMACIA

@login_required
def farmacia_sucursal(request):
    sucursales = FarmaciaSucursal.objects.all()
    return render(request, 'app/farmacia_sucursal.html', {'sucursales': sucursales})
################################################################################################################################################
# VISTA DEL DASHBOARD

@user_passes_test(group_check1)
@login_required
def dashboard(request):
    total_medicamentos = Medicamentos.objects.count()
    total_recetas = PacienteReceta.objects.count()
    total_stock = StockFarmacia.objects.aggregate(total_stock=models.Sum('cantidad'))['total_stock']
    medicamentos_recientes = Medicamentos.objects.order_by('-id_medicamento')[:5]
    recetas_recientes = PacienteReceta.objects.order_by('-id_receta_usuario')[:5]
    
    nombre_medicamento = Medicamentos.objects.filter(stockfarmacia__isnull=False).values('nombre_comercial').distinct()

    context = {
        'total_medicamentos': total_medicamentos,
        'total_recetas': total_recetas,
        'total_stock': total_stock,
        'medicamentos_recientes': medicamentos_recientes,
        'recetas_recientes': recetas_recientes,
        'nombre_medicamento': nombre_medicamento,
    }

    return render(request, 'app/dashboard.html', context)
################################################################################################################################################
# VISTA DEL PRODECIMIENTO ALMACENADO

@user_passes_test(group_check1)
@login_required
def ejecutar_procedimiento(request):
    if request.method == 'POST':
        p_fecha_vencimiento = request.POST.get('fecha_vencimiento')
        p_cantidad = request.POST.get('cantidad')
        p_precio = request.POST.get('precio')
        p_farmacia_id = request.POST.get('farmacia_id')
        p_medicamento_id = request.POST.get('medicamento_id')

        with connection.cursor() as cursor:
            cursor.callproc('insertar_stock_farmacia', [
                p_fecha_vencimiento,
                p_cantidad,
                p_precio,
                p_farmacia_id,
                p_medicamento_id
            ])

            cursor.execute('COMMIT')

        return HttpResponse('Procedimiento ejecutado correctamente.')

    return render(request, 'app/procedimiento.html')