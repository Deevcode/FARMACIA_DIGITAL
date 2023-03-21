from django.contrib import admin
from .models import Region, Provincia, Comuna, Laboratorio, PrincipioActivo, ViaAdminstracion, Farmacia, Medicamentos, MedicamentosDescuento, MedicamentoFichaTecnica, Tipo_usuario, Usuario, UsuarioFicha, PacienteReceta, PacienteFamiliar, FamiliarPacienteUsuario, CESFAM, QuimicoFarmaceuticoEncargado, FarmaciaSucursal, FarmaciaCESFAM, Diabetes, Hipertension, PacienteFichaClinica, Contacto
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

class UserAdmin(BaseUserAdmin): 
    list_display = ('id','id_TipoUsuario','username','password', 'email', 'rut_usuario', 'first_name','last_name') 
    list_filter = ('email',) 
    fieldsets = ( 
        (None,{'fields': ('username','email', 'password')}), 
        ('Informacion personal', {'fields': ( 'first_name', 'last_name', 'id_TipoUsuario','rut_usuario')}), 
        ('Permisos Django', {'fields': ('is_staff', 'is_active', 'is_superuser', 'groups')})  
    ) 
 
    add_fieldsets = (
        (None, {
            'classes':('wide',),
            'fields':('id_TipoUsuario','rut_usuario'  ,'username', 'email', 'first_name', 'last_name', 'password1', 'password2')
        }
    ),  # <-- add this comma!
    )

#ADMIN DE REGION
class RegionAdmin(admin.ModelAdmin):
    list_display = ("id_region","nombre_region")
    search_fields = ["nombre_region"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE PROVINCIA
class ProvinciaAdmin(admin.ModelAdmin):
    list_display = ("id_provincia" ,"nombre_provincia")
    search_fields = ["nombre_provincia"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE COMUNA
class ComunaAdmin(admin.ModelAdmin):
    list_display = ("id_comuna","nombre_comuna")
    search_fields = ["nombre_comuna"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE LABORATORIO
class LaboratorioAdmin(admin.ModelAdmin):
    list_display = ("id_laboratorio","nombre_laboratorio")
    search_fields = ["nombre_laboratorio"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE PRINCIPIO ACTIVO
class PrincipioActivoAdmin(admin.ModelAdmin):
    list_display = ("id_principio_activo","nombre_princio_activo")
    search_fields = ["nombre_princio_activo"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE VIA ADMINISTRACION
class ViaAdministracionAdmin(admin.ModelAdmin):
    list_display = ("id_via_administracion","nombre_via_administracion")
    search_fields = ["nombre_via_administracion"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO FARMACIA
class FarmaciaAdmin(admin.ModelAdmin):
    list_display = ("id_farmacia", "marca_farmacia")
    search_fields = ["marca_farmacia"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO MEDICAMENTOS
class MedicamentosAdmin(admin.ModelAdmin):
    list_display = ("id_medicamento", "id_laboratorio", "id_principio_activo", "nombre_comercial",  "gramaje", "cantidad", "presentacion",  "lote", "id_via_administracion", "fecha_vencimento")
    search_fields = ["nombre_comercial", "id_medicamento", "id_laboratorio"]
#-----------------------------------------------------------------------------------------------------------------#
class MedicamentosDescuentoAdmin(admin.ModelAdmin):
    list_display = ("id_descuento", "id_medicamento", "id_farmacia", "fecha_inicio_descuento",  "fecha_termino_descuento", "descuento_porcentaje")
    search_fields = ["id_descuento", "id_medicamento", "id_farmacia", "fecha_inicio_descuento",  "fecha_termino_descuento", "descuento_porcentaje"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE MEDICAMENTO FICHA TECNICA
class MedicamentoFichaTecnicaAdmin(admin.ModelAdmin):
    list_display = ("id_ficha_medicamento", "nombre_comercial", "url_ficha")
    search_fields = ["id_ficha_medicamento", "nombre_comercial", "url_ficha"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO USUARIO
class Tipo_usuarioAdmin(admin.ModelAdmin):
    list_display = ("id_TipoUsuario", "nombre_tipo_usuario")
    search_fields = ["nombre_tipo_usuario"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE USUARIO
#class UsuarioAdmin(admin.ModelAdmin):
#    list_display = ('id_TipoUsuario','username','password', 'email', 'rut_usuario', 'first_name','last_name')
#    search_fields = ['id_TipoUsuario','username','password','first_name','last_name', 'email', 'rut_usuario']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE USUARIO FICHA ADMIN
class UsuarioFichaAdmin(admin.ModelAdmin):
    list_display = ('id_usuario', 'rut_usuario', 'nombres_usuario','apellido_paterno_usuario', 'appelido_materno_usuario', 'dirreccion_usuario', 'email_usuario', 'telefono_usuario')
    search_fields = ['id_usuario', 'rut_usuario', 'nombres_usuario','apellido_paterno_usuario', 'appelido_materno_usuario', 'dirreccion_usuario', 'email_usuario', 'telefono_usuario']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE USUARIO RECETA
class PacienteRecetaAdmin(admin.ModelAdmin):
    list_display = ('id_receta_usuario', 'timestamp', 'id_usuario', 'id_medicamento','tiempo_tratamiento', 'frecuencia_dosis', 'descripcion')
    search_fields = ['id_receta_usuario', 'timestamp', 'id_usuario', 'id_medicamento','tiempo_tratamiento', 'frecuencia_dosis', 'descripcion']
#-----------------------------------------------------------------------------------------------------------------#
#TABLA DE USUARIO FAMILIAR
class PacienteFamiliarAdmin(admin.ModelAdmin):
    list_display  = ('id_usuario_familiar','num_run_familiar', 'nombre_familiar', 'apellido_familiar', 'email_familiar', 'telefono_familiar', 'whatsapp_familiar', 'celular_familiar', 'telegram_familiar', 'parentesco', 'direccion_familiar','id_comuna')
    search_fields = ['id_usuario_familiar', 'nombre_familiar', 'apellido_familiar', 'email_familiar', 'parentesco']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE USUARIO FARMACO VIGILANGIA
class FamiliarPacienteUsuarioAdmin(admin.ModelAdmin):
    list_display  = ('id_familiar_paciente', 'nombre_tipo_usuario', 'parentesco', 'nombres_usuario')
    search_fields = ['id_familiar_paciente', 'nombre_tipo_usuario', 'parentesco', 'nombres_usuario']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE CESFAM
class CESFAMAdmin(admin.ModelAdmin):
    list_display = ('id_cesfam', 'nombre_CESFAM', 'direccion_CESFAM', 'email_CESFAM', 'telefono_CESFAM', 'id_comuna')
    search_fields = ['id_cesfam', 'nombre_CESFAM', 'direccion_CESFAM', 'email_CESFAM', 'telefono_CESFAM', 'id_comuna']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE ENCARGADO QUIMICO FARMACEUTICO
class QuimicoFarmaceuticoEncargadoAdmin(admin.ModelAdmin):
    list_display = ('id_quimico_farmaceutio', 'id_tipo_usuario', 'registro_sanitario_QF')
    search_fields = ['id_quimico_farmaceutio', 'id_tipo_usuario', 'registro_sanitario_QF']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO FARMACIA SUCURSAL
class FarmaciaSucursalAdmin(admin.ModelAdmin):
    list_display = ("id_sucursal", "id_farmacia", "id_comuna", "id_region", "id_provincia", "direccion_sucursal", "telefono_sucursal", "email")
    search_fields = ["direccion_sucursal", "id_farmacia", "id_sucursal", "telefono_sucursal", "email"]
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO FARMACIA CESFAM
class FarmaciaCESFAMAdmin(admin.ModelAdmin):
    list_display = ('id_farmacia_CESFAM', 'id_cesfam', 'nombre_farmacia_CESFAM', 'direccion_farmacia_CESFAM', 'email_farmacia_CESFAM', 'telefono_farmacia_CESFAM', 'id_comuna')
    search_fields = ['id_farmacia_CESFAM', 'id_cesfam', 'nombre_farmacia_CESFAM', 'direccion_farmacia_CESFAM', 'email_farmacia_CESFAM', 'telefono_farmacia_CESFAM', 'id_comuna']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE DIABETES
class DiabetesAdmin(admin.ModelAdmin):
    list_display = ('id_diabetes', 'tipo_diabetes')
    search_fields = ['id_diabetes', 'tipo_diabetes']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE HIPERTENSION
class HipertensionAdmin(admin.ModelAdmin):
    list_display = ('id_hipertension', 'tipo_hipertension')
    search_fields = ['id_hipertension', 'tipo_hipertension']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE USUARIO FARMACO VIGILANGIA
class PacienteFichaClinicaAdmin(admin.ModelAdmin):
    list_display  = ('id_usuario', 'nombre_tipo_usuario', 'tipo_diabetes', 'tipo_hipertension', 'fecha_nacimiento')
    search_fields = ['id_usuario', 'nombre_tipo_usuario', 'tipo_diabetes', 'tipo_hipertension', 'fecha_nacimiento']
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE CONTACTO
class ContactoAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'email', 'tipo_consulta', 'timestamp', 'mensaje')
    search_fields = ['nombre', 'email', 'tipo_consulta', 'timestamp', 'mensaje']
#-----------------------------------------------------------------------------------------------------------------#
admin.site.register(Region, RegionAdmin)
admin.site.register(Provincia, ProvinciaAdmin)
admin.site.register(Comuna, ComunaAdmin)
admin.site.register(Laboratorio, LaboratorioAdmin)
admin.site.register(PrincipioActivo, PrincipioActivoAdmin)
admin.site.register(ViaAdminstracion, ViaAdministracionAdmin)
admin.site.register(Farmacia, FarmaciaAdmin)
admin.site.register(Medicamentos, MedicamentosAdmin)
admin.site.register(MedicamentosDescuento, MedicamentosDescuentoAdmin)
admin.site.register(MedicamentoFichaTecnica, MedicamentoFichaTecnicaAdmin)
admin.site.register(Tipo_usuario, Tipo_usuarioAdmin)
admin.site.register(Usuario, UserAdmin)
admin.site.register(UsuarioFicha, UsuarioFichaAdmin)
admin.site.register(PacienteReceta, PacienteRecetaAdmin)
admin.site.register(PacienteFamiliar, PacienteFamiliarAdmin)
admin.site.register(FamiliarPacienteUsuario, FamiliarPacienteUsuarioAdmin)
admin.site.register(CESFAM, CESFAMAdmin)
admin.site.register(QuimicoFarmaceuticoEncargado, QuimicoFarmaceuticoEncargadoAdmin)
admin.site.register(FarmaciaSucursal, FarmaciaSucursalAdmin)
admin.site.register(FarmaciaCESFAM, FarmaciaCESFAMAdmin)
admin.site.register(Diabetes, DiabetesAdmin)
admin.site.register(Hipertension, HipertensionAdmin)
admin.site.register(PacienteFichaClinica, PacienteFichaClinicaAdmin)
admin.site.register(Contacto, ContactoAdmin)
#-----------------------------------------------------------------------------------------------------------------#