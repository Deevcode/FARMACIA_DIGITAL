from django.contrib import admin
from .models import Laboratorio, Principio, ViaAdminstracion, Medicamentos, Contacto
# Register your models here.

#class MedicamentosAdmin(admin.ModelAdmin):
#    list_display = ["laboratorio", "principio", "nombre", "dosis", "cantidad", "presentacion", "lote", "ingesta","fecha_vencimento"]
#    search_fields = ["nombre"]
    


admin.site.register(Laboratorio)
admin.site.register(Principio)
admin.site.register(ViaAdminstracion)
admin.site.register(Medicamentos)
admin.site.register(Contacto)
