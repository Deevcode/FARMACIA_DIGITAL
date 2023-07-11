from django.urls import path, include
from .views import *
from django.contrib import admin
from rest_framework import routers

router = routers.DefaultRouter()
router.register('medicamentos',MedicamentoViewset)

urlpatterns = [
    path('', home, name="home"),
    path('contacto/', contacto, name="contacto"),
    path('medicamentos/', medicamentos, name="medicamentos"),
    path('agregar-medicamento/', agregar_medicamento, name="agregar_medicamento"),
    path('listar-medicamento/', listar_medicamentos, name="listar_medicamento"),
    path('modificar-medicamento/<id>/', modificar_medicamento, name="modificar_medicamento"),
    path('eliminar-medicamento/<id>/', eliminar_medicamento, name="eliminar_medicamento"),
    path('enfermera/', enfermera, name="enfermera"),
    path('agregar-receta/', agregar_receta, name="agregar_receta"),
    path('listar-receta/', listar_receta, name="listar_receta"),
    path('listar-receta-emitida/', listar_receta_emitida, name="listar_receta_emitida"),
    path('modificar-receta/<id>/', modificar_receta, name="modificar_receta"),
    path('eliminar-receta/<id_receta_usuario>/', eliminar_receta, name="eliminar_receta"),
    path('profesional/', profesional, name="profesional"),
    path('admin/', admin.site.urls),
    path('generar-pdf/', generar_pdf, name='generar_pdf'),
    path('generar-recetas-pdf/', generar_recetas_pdf, name='generar_recetas_pdf'),
    path('api/', include(router.urls)),
    path('map_view/', map_view, name='map_view'),
    path('perfil/', perfil_usuario, name='perfil'),
    path('paciente-fichaclinica/', paciente_ficha_clinica_list, name='paciente_ficha_clinica_list'),
    path('farmacia_sucursal/', farmacia_sucursal, name='farmacia_sucursal'),
    path('stock_farmacia/', stock_farmacia, name='stock_farmacia'),
    path('dashboard/', dashboard, name='dashboard'),
    path('ejecutar-procedimiento/', ejecutar_procedimiento, name='ejecutar_procedimiento'),
    path('ficha_tecnica/', ficha_tecnica, name='ficha_tecnica'),
]