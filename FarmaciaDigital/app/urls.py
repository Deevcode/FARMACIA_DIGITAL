from django.urls import path
from .views import home, contacto, medicamentos, bodega, reportes, agregar_medicamento, listar_medicamentos, modificar_medicamento

urlpatterns = [
    path('', home, name="home"),
    path('contacto/', contacto, name="contacto"),
    path('medicamentos/', medicamentos, name="medicamentos"),
    path('bodega/', bodega, name="bodega"),
    path('reportes/', reportes, name="reportes"),
    path('agregar-medicamento/', agregar_medicamento, name="agregar_medicamento"),
    path('listar-medicamento/', listar_medicamentos, name="listar_medicamento"),
    path('modificar-medicamento/', modificar_medicamento, name="modificar_medicamento"),
]