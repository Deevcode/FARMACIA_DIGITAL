from django.contrib import admin
from .models import Region, Provincia, Comuna, Laboratorio, PrincipioActivo, ViaAdminstracion, Farmacia, Medicamentos, MedicamentosDescuento, MedicamentoFichaTecnica, Tipo_usuario, Usuario,Enfermera, UsuarioFicha, MedicamentoFraccionamiento, PacienteReceta, PacienteFamiliar, FamiliarPacienteUsuario, CESFAM, QuimicoFarmaceuticoEncargado, FarmaciaSucursal, FarmaciaCESFAM, Diabetes, Hipertension, PacienteFichaClinica, Contacto
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

class UserAdmin(BaseUserAdmin): 
    list_display = ('id','id_TipoUsuario','username','password', 'email', 'rut_usuario', 'first_name','last_name') 
    list_filter = ('email',)
    list_editable = ('password',) 
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

admin.site.register(Usuario, UserAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE REGION
class RegionAdmin(admin.ModelAdmin):
    list_display = ("id_region","nombre_region")
    search_fields = ["nombre_region"]

admin.site.register(Region, RegionAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE PROVINCIA
class ProvinciaAdmin(admin.ModelAdmin):
    list_display = ("id_provincia" ,"nombre_provincia")
    search_fields = ["nombre_provincia"]

admin.site.register(Provincia, ProvinciaAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE COMUNA
class ComunaAdmin(admin.ModelAdmin):
    list_display = ("id_comuna","nombre_comuna")
    search_fields = ["nombre_comuna"]

admin.site.register(Comuna, ComunaAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE LABORATORIO
class LaboratorioAdmin(admin.ModelAdmin):
    list_display = ("id_laboratorio","nombre_laboratorio")
    search_fields = ["nombre_laboratorio"]

admin.site.register(Laboratorio, LaboratorioAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE PRINCIPIO ACTIVO
class PrincipioActivoAdmin(admin.ModelAdmin):
    list_display = ("id_principio_activo","nombre_princio_activo")
    search_fields = ["nombre_princio_activo"]

admin.site.register(PrincipioActivo, PrincipioActivoAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE VIA ADMINISTRACION
class ViaAdministracionAdmin(admin.ModelAdmin):
    list_display = ("id_via_administracion","nombre_via_administracion")
    search_fields = ["nombre_via_administracion"]

admin.site.register(ViaAdminstracion, ViaAdministracionAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO FARMACIA
class FarmaciaAdmin(admin.ModelAdmin):
    list_display = ("id_farmacia", "marca_farmacia")
    search_fields = ["marca_farmacia"]

admin.site.register(Farmacia, FarmaciaAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO MEDICAMENTOS
class MedicamentosAdmin(admin.ModelAdmin):
    list_display = ("id_medicamento", "id_laboratorio", "id_principio_activo", "nombre_comercial",  "gramaje", "cantidad_stock", "presentacion_medicamento", "id_via_administracion")
    search_fields = ["nombre_comercial", "id_medicamento", "id_laboratorio"]

admin.site.register(Medicamentos, MedicamentosAdmin)
#-----------------------------------------------------------------------------------------------------------------#
class MedicamentosDescuentoAdmin(admin.ModelAdmin):
    list_display = ("id_descuento", "id_medicamento", "id_farmacia", "fecha_inicio_descuento",  "fecha_termino_descuento", "descuento_porcentaje")
    search_fields = ["id_descuento", "id_medicamento", "id_farmacia", "fecha_inicio_descuento",  "fecha_termino_descuento", "descuento_porcentaje"]

admin.site.register(MedicamentosDescuento, MedicamentosDescuentoAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE MEDICAMENTO FICHA TECNICA
class MedicamentoFichaTecnicaAdmin(admin.ModelAdmin):
    list_display = ("id_ficha_medicamento", "nombre_comercial", "url_ficha")
    search_fields = ["id_ficha_medicamento", "nombre_comercial", "url_ficha"]

admin.site.register(MedicamentoFichaTecnica, MedicamentoFichaTecnicaAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO USUARIO
class Tipo_usuarioAdmin(admin.ModelAdmin):
    list_display = ("id_TipoUsuario", "nombre_tipo_usuario")
    search_fields = ["nombre_tipo_usuario"]

admin.site.register(Tipo_usuario, Tipo_usuarioAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE ENFERMERA
class EnfermeraAdmin(admin.ModelAdmin):
    list_display = ('id_enfermera', 'id_TipoUsuario','nombres_enfermera', 'apellidos_enfermera', 'direccion_enfermera', 'id_comuna', 'celular_usuario')
    search_fields = ['id_enfermera', 'id_TipoUsuario','nombres_enfermera', 'apellidos_enfermera', 'direccion_enfermera', 'id_comuna', 'celular_usuario']

admin.site.register(Enfermera, EnfermeraAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE USUARIO FICHA ADMIN
class UsuarioFichaAdmin(admin.ModelAdmin):
    list_display = ('id_usuario', 'rut_usuario', 'nombres_usuario','apellido_paterno_usuario', 'appelido_materno_usuario', 'dirreccion_usuario', 'email_usuario', 'telefono_usuario')
    search_fields = ['id_usuario', 'rut_usuario', 'nombres_usuario','apellido_paterno_usuario', 'appelido_materno_usuario', 'dirreccion_usuario', 'email_usuario', 'telefono_usuario']

admin.site.register(UsuarioFicha, UsuarioFichaAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#TABLA DE FRACCIONAMIENTO DE MEDICAMENTOS
class MedicamentoFraccionamientoAdmin(admin.ModelAdmin):
    list_display = ('id_fraccion', 'fraccion', 'descripcion_fraccion')
    search_fields = ['id_fraccion', 'fraccion', 'descripcion_fraccion']
admin.site.register(MedicamentoFraccionamiento, MedicamentoFraccionamientoAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE USUARIO RECETA
class PacienteRecetaAdmin(admin.ModelAdmin):
    list_display = ('id_receta_usuario', 'fecha_receta', 'nombres_paciente','id_enfermera', 'nombre_comercial','tiempo_tratamiento_dias', 'frecuencia_dosis_diaria', 'horario_1','horario_2','horario_3','horario_4','horario_5','horario_6', 'descripcion')
    search_fields = ['id_receta_usuario', 'fecha_receta', 'nombres_paciente','id_enfermera', 'nombre_comercial', 'tiempo_tratamiento_dias', 'frecuencia_dosis_diaria', 'horario_1','horario_2','horario_3','horario_4','horario_5','horario_6', 'descripcion']

admin.site.register(PacienteReceta, PacienteRecetaAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#TABLA DE USUARIO FAMILIAR
class PacienteFamiliarAdmin(admin.ModelAdmin):
    list_display  = ('id_usuario_familiar','num_run_familiar', 'nombre_familiar', 'apellido_familiar', 'email_familiar', 'telefono_familiar', 'whatsapp_familiar', 'celular_familiar', 'telegram_familiar', 'parentesco', 'direccion_familiar','id_comuna')
    search_fields = ['id_usuario_familiar', 'nombre_familiar', 'apellido_familiar', 'email_familiar', 'parentesco']

admin.site.register(PacienteFamiliar, PacienteFamiliarAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE USUARIO FARMACO VIGILANGIA
class FamiliarPacienteUsuarioAdmin(admin.ModelAdmin):
    list_display  = ('id_familiar_paciente', 'nombre_tipo_usuario', 'parentesco', 'nombres_usuario')
    search_fields = ['id_familiar_paciente', 'nombre_tipo_usuario', 'parentesco', 'nombres_usuario']

admin.site.register(FamiliarPacienteUsuario, FamiliarPacienteUsuarioAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE CESFAM
class CESFAMAdmin(admin.ModelAdmin):
    list_display = ('id_cesfam', 'nombre_CESFAM', 'direccion_CESFAM', 'email_CESFAM', 'telefono_CESFAM', 'id_comuna')
    search_fields = ['id_cesfam', 'nombre_CESFAM', 'direccion_CESFAM', 'email_CESFAM', 'telefono_CESFAM', 'id_comuna']

admin.site.register(CESFAM, CESFAMAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE ENCARGADO QUIMICO FARMACEUTICO
class QuimicoFarmaceuticoEncargadoAdmin(admin.ModelAdmin):
    list_display = ('id_quimico_farmaceutio', 'id_tipo_usuario', 'registro_sanitario_QF')
    search_fields = ['id_quimico_farmaceutio', 'id_tipo_usuario', 'registro_sanitario_QF']

admin.site.register(QuimicoFarmaceuticoEncargado, QuimicoFarmaceuticoEncargadoAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO FARMACIA SUCURSAL
class FarmaciaSucursalAdmin(admin.ModelAdmin):
    list_display = ("id_sucursal", "id_farmacia", "id_comuna", "id_region", "id_provincia", "direccion_sucursal", "telefono_sucursal", "email")
    search_fields = ["direccion_sucursal", "id_farmacia", "id_sucursal", "telefono_sucursal", "email"]

admin.site.register(FarmaciaSucursal, FarmaciaSucursalAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE TIPO FARMACIA CESFAM
class FarmaciaCESFAMAdmin(admin.ModelAdmin):
    list_display = ('id_farmacia_CESFAM', 'id_cesfam', 'nombre_farmacia_CESFAM', 'direccion_farmacia_CESFAM', 'email_farmacia_CESFAM', 'telefono_farmacia_CESFAM', 'id_comuna')
    search_fields = ['id_farmacia_CESFAM', 'id_cesfam', 'nombre_farmacia_CESFAM', 'direccion_farmacia_CESFAM', 'email_farmacia_CESFAM', 'telefono_farmacia_CESFAM', 'id_comuna']

admin.site.register(FarmaciaCESFAM, FarmaciaCESFAMAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE DIABETES
class DiabetesAdmin(admin.ModelAdmin):
    list_display = ('id_diabetes', 'tipo_diabetes')
    search_fields = ['id_diabetes', 'tipo_diabetes']

admin.site.register(Diabetes, DiabetesAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE HIPERTENSION
class HipertensionAdmin(admin.ModelAdmin):
    list_display = ('id_hipertension', 'tipo_hipertension')
    search_fields = ['id_hipertension', 'tipo_hipertension']

admin.site.register(Hipertension, HipertensionAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE USUARIO FARMACO VIGILANGIA
class PacienteFichaClinicaAdmin(admin.ModelAdmin):
    list_display  = ('id_usuario', 'nombre_tipo_usuario', 'tipo_diabetes', 'tipo_hipertension', 'fecha_nacimiento')
    search_fields = ['id_usuario', 'nombre_tipo_usuario', 'tipo_diabetes', 'tipo_hipertension', 'fecha_nacimiento']

admin.site.register(PacienteFichaClinica, PacienteFichaClinicaAdmin)
#-----------------------------------------------------------------------------------------------------------------#
#ADMIN DE CONTACTO
class ContactoAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'email', 'tipo_consulta', 'timestamp', 'mensaje')
    search_fields = ['nombre', 'email', 'tipo_consulta', 'timestamp', 'mensaje']


admin.site.register(Contacto, ContactoAdmin)
#-----------------------------------------------------------------------------------------------------------------#