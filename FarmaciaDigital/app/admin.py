from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
################################################################################################################################################
from import_export import resources
from import_export.admin import ImportExportModelAdmin

################################################################################################################################################
#ADMIN DE REGION
class RegionAdmin(admin.ModelAdmin):
    list_display = ("id_region","nombre_region")
    search_fields = ["nombre_region"]

admin.site.register(Region, RegionAdmin)
################################################################################################################################################
#ADMIN DE PROVINCIA
class ProvinciaAdmin(admin.ModelAdmin):
    list_display = ("id_provincia" ,"nombre_provincia")
    search_fields = ["nombre_provincia"]

admin.site.register(Provincia, ProvinciaAdmin)
################################################################################################################################################
#ADMIN DE COMUNA
class ComunaAdmin(admin.ModelAdmin):
    list_display = ("id_comuna","nombre_comuna")
    search_fields = ["nombre_comuna"]

admin.site.register(Comuna, ComunaAdmin)
################################################################################################################################################
#ADMIN DE LABORATORIO
class LaboratorioAdmin(admin.ModelAdmin):
    list_display = ("id_laboratorio","nombre_laboratorio")
    search_fields = ["nombre_laboratorio"]

admin.site.register(Laboratorio, LaboratorioAdmin)
################################################################################################################################################
#ADMIN DE PRINCIPIO ACTIVO
class PrincipioActivoAdmin(admin.ModelAdmin):
    list_display = ("id_principio_activo","nombre_princio_activo")
    search_fields = ["nombre_princio_activo"]

admin.site.register(PrincipioActivo, PrincipioActivoAdmin)
################################################################################################################################################
#ADMIN DE VIA ADMINISTRACION
class ViaAdministracionAdmin(admin.ModelAdmin):
    list_display = ("id_via_administracion","nombre_via_administracion")
    search_fields = ["nombre_via_administracion"]

admin.site.register(ViaAdminstracion, ViaAdministracionAdmin)
################################################################################################################################################
#ADMIN DE TIPO FARMACIA
class FarmaciaAdmin(admin.ModelAdmin):
    list_display = ("id_farmacia", "marca_farmacia")
    search_fields = ["marca_farmacia"]

admin.site.register(Farmacia, FarmaciaAdmin)
################################################################################################################################################
#ADMIN DE TIPO MEDICAMENTOS
class MedicamentosAdmin(admin.ModelAdmin):
    list_display = ("id_medicamento", "id_laboratorio", "id_principio_activo", "nombre_comercial",  "gramaje", "presentacion_medicamento", "id_via_administracion")
    search_fields = ["nombre_comercial"]

admin.site.register(Medicamentos, MedicamentosAdmin)
################################################################################################################################################
class MedicamentosDescuentoAdmin(admin.ModelAdmin):
    list_display = ("id_descuento", "medicamento_desc", "id_farmacia", "fecha_inicio_descuento",  "fecha_termino_descuento", "descuento_porcentaje")

admin.site.register(MedicamentosDescuento, MedicamentosDescuentoAdmin)
################################################################################################################################################
#ADMIN DE MEDICAMENTO FICHA TECNICA
class MedicamentoFichaTecnicaAdmin(admin.ModelAdmin):
    list_display = ("id_ficha_medicamento", "nombre_comercial", "url_ficha")

admin.site.register(MedicamentoFichaTecnica, MedicamentoFichaTecnicaAdmin)
################################################################################################################################################
#ADMIN DE TIPO USUARIO
class Tipo_usuarioAdmin(admin.ModelAdmin):
    list_display = ("id_TipoUsuario", "nombre_tipo_usuario")
    search_fields = ["nombre_tipo_usuario"]

admin.site.register(Tipo_usuario, Tipo_usuarioAdmin)
################################################################################################################################################
#ADMIN DE USUARIO
class UserAdmin(BaseUserAdmin): 
    list_display = ('id','tipo_usuario','username','password', 'email', 'rut_usuario', 'first_name','last_name') 
    list_filter = ('email',)
    list_editable = ('password',) 
    fieldsets = ( 
        (None,{'fields': ('username','email', 'password')}), 
        ('Informacion personal', {'fields': ( 'first_name', 'last_name', 'tipo_usuario','rut_usuario')}), 
        ('Permisos Django', {'fields': ('is_staff', 'is_active', 'is_superuser', 'groups')})  
    ) 
 
    add_fieldsets = (
        (None, {
            'classes':('wide',),
            'fields':('tipo_usuario','rut_usuario'  ,'username', 'email', 'first_name', 'last_name', 'password1', 'password2')
        }
    ),  # <-- AGREGAR LA COMA
    )
admin.site.register(Usuario, UserAdmin)
################################################################################################################################################
#ADMIN DE USUARIO FICHA ADMIN
class UsuarioFichaAdmin(admin.ModelAdmin):
    list_display = ('id', 'identificacion_usuario', 'dirreccion_usuario', 'telefono_usuario', 'celular_usuario','id_comuna')

admin.site.register(UsuarioFicha, UsuarioFichaAdmin)
################################################################################################################################################
#ADMIN DE USUARIO RECETA
class PacienteRecetaAdmin(admin.ModelAdmin):
    list_display = ('id_receta_usuario', 'fecha_receta', 'nombres_paciente', 'nombre_comercial','tiempo_tratamiento_dias', 'frecuencia_dosis_diaria','fracionamiento_1' , 'horario_1','fracionamiento_2','horario_2','horario_3','fracionamiento_3','horario_4','fracionamiento_4','horario_5','fracionamiento_5','horario_6','fracionamiento_6', 'descripcion')

admin.site.register(PacienteReceta, PacienteRecetaAdmin)
################################################################################################################################################
#ADMIN DE USUARIO FAMILIAR
class PacienteFamiliarAdmin(admin.ModelAdmin):
    list_display  = ('id_usuario_familiar','identificacion_usuario' ,'identificacion_familiar','parentesco')
    search_fields = ['parentesco']

admin.site.register(PacienteFamiliar, PacienteFamiliarAdmin)
################################################################################################################################################
#ADMIN DE CESFAM
class CESFAMAdmin(admin.ModelAdmin):
    list_display = ('id_cesfam', 'identificacion_cesfam', 'email_CESFAM', 'telefono_CESFAM', 'direccion_CESFAM', 'nombre_comuna')
    search_fields = ['email_CESFAM']

admin.site.register(CESFAM, CESFAMAdmin)
################################################################################################################################################
#ADMIN DE ENCARGADO QUIMICO FARMACEUTICO
class QuimicoFarmaceuticoEncargadoAdmin(admin.ModelAdmin):
    list_display = ('id_quimico_farmaceutio', 'identificacion_QF', 'registro_sanitario_QF')
    search_fields = ['registro_sanitario_QF']

admin.site.register(QuimicoFarmaceuticoEncargado, QuimicoFarmaceuticoEncargadoAdmin)
################################################################################################################################################
#ADMIN DE TIPO FARMACIA SUCURSAL
class FarmaciaSucursalAdmin(admin.ModelAdmin):
    list_display = ("id_sucursal", "nombre_farmacia", "id_quimico_farmaceutio", "nombre_comuna", "direccion_sucursal", "telefono_sucursal", "email",'lat','lng')
    search_fields = ["direccion_sucursal"]

admin.site.register(FarmaciaSucursal, FarmaciaSucursalAdmin)
################################################################################################################################################
#ADMIN DE TIPO FARMACIA CESFAM
class FarmaciaCESFAMAdmin(admin.ModelAdmin):
    list_display = ('id_farmacia_CESFAM', 'identificacion_cesfam')
    search_fields = ['id_farmacia_CESFAM']

admin.site.register(FarmaciaCESFAM, FarmaciaCESFAMAdmin)
################################################################################################################################################
#ADMIN DE STOCK FARMACIA
class StockFarmaciaAdmin(admin.ModelAdmin):
    list_display = ('id_stock', 'medicamento','farmacia','fecha_vencimiento','cantidad','precio')

admin.site.register(StockFarmacia, StockFarmaciaAdmin)
################################################################################################################################################
#ADMIN DE USUARIO FARMACO VIGILANGIA
class PacienteFichaClinicaAdmin(admin.ModelAdmin):
    list_display  = ('id_paciente_ficha', 'identificacion_paciente','tipo_diabetes','tipo_hipertension', 'fecha_nacimiento')
    search_fields = ['id_paciente_ficha']

admin.site.register(PacienteFichaClinica, PacienteFichaClinicaAdmin)
################################################################################################################################################
#ADMIN DE CONTACTO
class ContactosAdmin(admin.ModelAdmin):
    list_display = ('repetir_email','nombre', 'tipo_consulta', 'telefono', 'mensaje','timestamp')
    search_fields = ['timestamp']
admin.site.register(Contacto, ContactosAdmin)
################################################################################################################################################
#ADMIN DE PACIENTE PROFESIONAL
class ProfesionalPacienteAdmin(admin.ModelAdmin):
    list_display = ('identificacicion_usuario','identificacion_profesional','horario_turno')
    
admin.site.register(ProfesionalPaciente, ProfesionalPacienteAdmin)