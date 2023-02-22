from django.urls import path
from .views import home, contacto, medicamentos

urlpatterns = [
    path('', home, name="home"),
    path('contacto/', contacto, name="contacto"),
    path('medicamentos/', medicamentos, name="medicamentos"),
    path('bodega/', medicamentos, name="bodega"),
    path('reportes/', medicamentos, name="reportes"),
]