from django.contrib import admin
from .models import Region, Provincia, Comuna, Tipo_usuario, Laboratorio, Principio, ViaAdminstracion, Medicamentos, Receta, Recordatorio, Familiar, Usuario, Contacto
# Register your models here.

#ADMIN DE REGION
class RegionAdmin(admin.ModelAdmin):
    list_display = ["nombre_region"]
    search_fields = ["nombre_region"]

#ADMIN DE PROVINCIA
class ProvinciaAdmin(admin.ModelAdmin):
    list_display = ["nombre_provincia"]
    search_fields = ["nombre_provincia"]

#ADMIN DE COMUNA
class ComunaAdmin(admin.ModelAdmin):
    list_display = ["nombre_comuna"]
    search_fields = ["nombre_comuna"]

#ADMIN DE TIPO USUARIO
class Tipo_usuarioAdmin(admin.ModelAdmin):
    list_display = ["nombre_tipo_usuario"]
    search_fields = ["nombre_tipo_usuario"]
    
#ADMIN DE LABORATORIO
class LaboratorioAdmin(admin.ModelAdmin):
    list_display = ["nombre_laboratorio"]
    search_fields = ["nombre_laboratorio"]


#ADMIN DE PRINCIPIO ACTIVO
class PrincipioAdmin(admin.ModelAdmin):
    list_display = ["nombre_princio_activo"]
    search_fields = ["nombre_princio_activo"]

#ADMIN DE VIA ADMINISTRACION
class ViaAdministracionAdmin(admin.ModelAdmin):
    list_display = ["nombre_via_administracion"]
    search_fields = ["nombre_via_administracion"]

#ADMIN DE MEDICAMENTOS
class MedicamentosAdmin(admin.ModelAdmin):
    list_display = ["laboratorio","nombre_princio_activo","nombre_comercial", "dosis", "cantidad", "presentacion","lote", "ingesta", "fecha_vencimento"]
    search_fields = ["nombre_via_administracion"]
    list_editable = ["laboratorio","nombre_princio_activo","nombre_comercial", "dosis", "cantidad", "presentacion","lote", "ingesta", "fecha_vencimento"]

#ADMIN DE CONTACTO
class ContactoAdmin(admin.ModelAdmin):
    list_display = ["nombre", "email", "tipo_consulta", "mensaje"]
    search_fields = ["email"]

admin.site.register(Region)
admin.site.register(Provincia)
admin.site.register(Comuna)
admin.site.register(Tipo_usuario)
admin.site.register(Laboratorio)
admin.site.register(Principio)
admin.site.register(ViaAdminstracion)
admin.site.register(Medicamentos)
admin.site.register(Contacto)
admin.site.register(Receta)
admin.site.register(Recordatorio)
admin.site.register(Familiar)
admin.site.register(Usuario)
