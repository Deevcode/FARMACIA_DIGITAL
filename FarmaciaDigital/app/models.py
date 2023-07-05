from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models import CheckConstraint, Q, F
from django.utils import timezone

################################################################################################################################################
#TABLA DE REGION
class Region(models.Model):
    id_region = models.AutoField(primary_key=True)
    nombre_region = models.CharField(max_length=45,null=False, blank=False)

    def __str__(self):
        return self.nombre_region
################################################################################################################################################  
#TABLA DE PROVINCIA
class Provincia(models.Model):
    id_provincia = models.AutoField(primary_key=True)
    nombre_provincia = models.CharField(max_length=100,null=False, blank=False)
    id_region =models.ForeignKey(Region, on_delete=models.PROTECT)

    def __str__(self):
        return self.nombre_provincia   
################################################################################################################################################
#TABLA DE COMUNA
class Comuna(models.Model):
    id_comuna = models.AutoField(primary_key=True)
    nombre_comuna = models.CharField(max_length=100,null=False, blank=False)
    id_provincia = models.ForeignKey(Provincia, on_delete=models.PROTECT)

    def __str__(self):
        return self.nombre_comuna
################################################################################################################################################
#TABLA LABORATORIO
class Laboratorio(models.Model):
    id_laboratorio = models.AutoField(primary_key=True)
    nombre_laboratorio = models.CharField(max_length=100,null=False, blank=False)

    def __str__(self):
        return self.nombre_laboratorio
################################################################################################################################################
#TABLA DE PRINCIPIO ACTIVO
class PrincipioActivo(models.Model):
    id_principio_activo= models.AutoField(primary_key=True)
    nombre_princio_activo = models.CharField(max_length=100,null=False, blank=False)

    def __str__(self):
        return self.nombre_princio_activo        
################################################################################################################################################
#TABLA DE ADMINISTRACION MEDICAMENTO
class ViaAdminstracion(models.Model):
    id_via_administracion = models.AutoField(primary_key=True)
    nombre_via_administracion = models.CharField(max_length=100,null=False, blank=False)

    def __str__(self):
        return self.nombre_via_administracion
################################################################################################################################################
#TABLA DE FARMACIA
class Farmacia(models.Model):
    id_farmacia = models.AutoField(primary_key=True)
    marca_farmacia = models.CharField(max_length=200,null=False, blank=False)

    def __str__(self):
        return self.marca_farmacia
################################################################################################################################################
#TABLA DE MEDICAMENTOS
class Medicamentos(models.Model):
    id_medicamento = models.AutoField(primary_key=True)
    id_laboratorio = models.ForeignKey(Laboratorio, on_delete=models.PROTECT)
    id_principio_activo = models.ForeignKey(PrincipioActivo, on_delete=models.PROTECT)
    nombre_comercial = models.CharField(max_length=100, null=False, blank=False)
    gramaje = models.CharField(max_length=50, null=False, blank=False)
    presentacion_medicamento = models.CharField(max_length=100, null=False, blank=False)
    id_via_administracion = models.ForeignKey(ViaAdminstracion, on_delete=models.PROTECT)
    imagen = models.ImageField(upload_to="medicamentos", null=True)

    def __str__(self):
        return str(self.nombre_comercial) + " " + str(self.gramaje)
################################################################################################################################################  
#TABLA DE DESCUENTOS MEDICAMENTOS
class MedicamentosDescuento(models.Model):
    id_descuento = models.AutoField(primary_key=True)
    medicamento_desc = models.ForeignKey(Medicamentos, on_delete=models.PROTECT)
    id_farmacia = models.ForeignKey(Farmacia, on_delete=models.PROTECT)
    fecha_inicio_descuento = models.DateField(null=False)
    fecha_termino_descuento = models.DateField(null=False)
    descuento_porcentaje = models.IntegerField(null=False)

    def __str__(self):
        return str(self.medicamento_desc)+" con un %"+str(self.descuento_porcentaje)
################################################################################################################################################
#TABLA DE MEDICAMENTO FICHA TECNICA
class MedicamentoFichaTecnica(models.Model):
    id_ficha_medicamento = models.AutoField(primary_key=True)
    laboratorio_ficha = models.ForeignKey(Laboratorio, on_delete=models.PROTECT)
    nombre_comercial = models.ForeignKey(Medicamentos, on_delete=models.PROTECT)
    url_ficha = models.CharField(max_length=700,null=False, blank=False)

    def __str__(self):
        return str(self.url_ficha)
################################################################################################################################################
#TABLA TIPO DE USURIO
class Tipo_usuario(models.Model):
    id_TipoUsuario = models.AutoField(primary_key=True)
    nombre_tipo_usuario =models.CharField(max_length=100,null=False, blank=False)
    def __str__(self):
        return self.nombre_tipo_usuario  
################################################################################################################################################
#TABLA USUARIO
class Usuario(AbstractUser):

    rut_usuario = models.CharField(max_length=12,null=False, blank=False)
    tipo_usuario = models.ForeignKey(Tipo_usuario, on_delete=models.PROTECT,null=True)

    def __str__(self):
        return str(self.first_name)+" "+str(self.last_name)+" "+str(self.rut_usuario)+" | "+str(self.tipo_usuario)
################################################################################################################################################
opciones_fraccionamiento = [
    [0,"1 Una pastilla entera"],
    [1,"1/4 Un quarto de pastilla"],
    [2,"1/2 Media Pastilla"],
    [3,"3/4 Tres cuartos de pastilla"],
    [4,"1/8 Un octavo de pastilla"]
]
#TABLA DE USUARIO RECETA
class PacienteReceta(models.Model):
    id_receta_usuario = models.AutoField(primary_key=True)
    fecha_receta = models.DateField(null=False)
    nombres_paciente = models.ForeignKey(Usuario, on_delete=models.SET_NULL,null=True,related_name="RRPaciente",limit_choices_to=Q(tipo_usuario_id=2))
    nombre_comercial = models.ForeignKey(Medicamentos, on_delete=models.SET_NULL,null=True)
    tiempo_tratamiento_dias = models.CharField(max_length=100,null=False, blank=False)
    frecuencia_dosis_diaria = models.CharField(max_length=100,null=False, blank=False)
    horario_1 = models.TimeField(null=True)
    fracionamiento_1 = models.IntegerField(choices=opciones_fraccionamiento, null=True)
    horario_2 = models.TimeField(blank=True ,null=True)
    fracionamiento_2 = models.IntegerField(choices=opciones_fraccionamiento,blank=True, null=True)
    horario_3 = models.TimeField(blank=True ,null=True)
    fracionamiento_3 = models.IntegerField(choices=opciones_fraccionamiento,blank=True, null=True)
    horario_4 = models.TimeField(blank=True ,null=True)
    fracionamiento_4 = models.IntegerField(choices=opciones_fraccionamiento,blank=True, null=True)
    horario_5 = models.TimeField(blank=True ,null=True)
    fracionamiento_5 = models.IntegerField(choices=opciones_fraccionamiento,blank=True, null=True)
    horario_6 = models.TimeField(blank=True ,null=True)
    fracionamiento_6 = models.IntegerField(choices=opciones_fraccionamiento,blank=True, null=True)
    descripcion = models.TextField()

    def __str__ (self):
        return str(self.nombres_paciente)+": "+str(self.nombre_comercial)+" Tratamiento por:"+str(self.tiempo_tratamiento_dias)+ "Dosis diaria"+str(self.frecuencia_dosis_diaria)
################################################################################################################################################
#TABLA DE FAMILIAR
class PacienteFamiliar(models.Model):
    id_usuario_familiar = models.AutoField(primary_key=True)
    identificacion_usuario = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True,related_name="PacienteUser",limit_choices_to=Q(tipo_usuario_id=2))
    identificacion_familiar = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True,related_name="PacienteFamiliar",limit_choices_to=Q(tipo_usuario_id=3))
    parentesco = models.CharField(max_length=100,null=False, blank=False)

    def __str__ (self):
        return  str(self.identificacion_familiar)+": "+str(self.parentesco)
################################################################################################################################################
#TABLA DE CESFAM
class CESFAM(models.Model):
    id_cesfam = models.AutoField(primary_key=True)
    identificacion_cesfam = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, related_name="CESFAM",limit_choices_to=Q(tipo_usuario_id=5))
    email_CESFAM = models.CharField(max_length=200,null=False, blank=False)
    telefono_CESFAM = models.CharField(max_length=200,null=False, blank=False)
    direccion_CESFAM = models.CharField(max_length=200,null=False, blank=False)
    nombre_comuna = models.ForeignKey(Comuna, on_delete=models.PROTECT)

    def __str__ (self):
        return str(self.identificacion_cesfam)+" "+str(self.direccion_CESFAM)+" "+str(self.nombre_comuna)+" tel:"+str(self.telefono_CESFAM)

################################################################################################################################################
#TABLA DE QUIMICO FARMACEUTICO
class QuimicoFarmaceuticoEncargado(models.Model):
    id_quimico_farmaceutio = models.AutoField(primary_key=True)
    identificacion_QF = models.ForeignKey(Usuario, on_delete=models.SET_NULL,null=True,related_name="QUIMICO",limit_choices_to=Q(tipo_usuario_id=4))
    registro_sanitario_QF = models.CharField(max_length=200,null=False, blank=False)

    def __str__(self):
        return str(self.identificacion_QF)
################################################################################################################################################
#TABLA DE SUCURSAL FARMACIA
class FarmaciaSucursal(models.Model):
    id_sucursal = models.AutoField(primary_key=True)
    nombre_farmacia = models.ForeignKey(Farmacia, on_delete=models.PROTECT)
    id_quimico_farmaceutio = models.ForeignKey(QuimicoFarmaceuticoEncargado ,on_delete= models.PROTECT)
    nombre_comuna = models.ForeignKey(Comuna, on_delete=models.PROTECT)
    direccion_sucursal = models.CharField(max_length=200,null=False, blank=False)
    telefono_sucursal = models.IntegerField(null=False)
    email = models.EmailField(null=False)
    lat = models.CharField(max_length=200,default='')
    lng = models.CharField(max_length=200,default='')

    def __str__(self):
        return str(self.nombre_farmacia)+" | "+str(self.direccion_sucursal)
################################################################################################################################################
#TABLA DE FARMACIA CESFAM
class FarmaciaCESFAM(models.Model):
    id_farmacia_CESFAM = models.AutoField(primary_key=True)
    identificacion_cesfam = models.ForeignKey(CESFAM, on_delete= models.PROTECT)
    

    def __str__(self):
        return str(self.identificacion_cesfam)
################################################################################################################################################
#TABLA DE STOCK FARMACIA
class StockFarmacia(models.Model):
    id_stock = models.AutoField(primary_key=True)
    medicamento = models.ForeignKey(Medicamentos, on_delete=models.PROTECT)
    farmacia = models.ForeignKey(FarmaciaSucursal, on_delete=models.PROTECT)
    fecha_vencimiento = models.DateField(null=False)
    cantidad = models.IntegerField(null=False, blank=False)
    precio = models.IntegerField(default=0)

    def __str__(self):
        return str(self.farmacia)+": "+str(self.medicamento)+" "+str(self.precio)
################################################################################################################################################
opciones_diabetes = [
    [0,"No padezco esta enfermedad"],
    [1,"Prediabetes"],
    [2,"Diabetes tipo 1"],
    [3,"Diabetes tipo 2"],
    [4,"Diabetes gestacional"]
]
#-----------------------------------------------------------------------------------------------------------------#
opciones_hipertension = [
    [0,"No padezco esta enfermedad"],
    [1,"Hipertensión grado 1"],
    [2,"Hipertensión grado 2"],
    [3,"Hipertensión grado 3"]
]
#-----------------------------------------------------------------------------------------------------------------#

#TABLA DEL PACIENTE FICHA CLINICA
class PacienteFichaClinica(models.Model):
    id_paciente_ficha = models.AutoField(primary_key=True)
    identificacion_paciente = models.ForeignKey(Usuario, on_delete=models.PROTECT,related_name="FCPaciente",limit_choices_to=Q(tipo_usuario_id=2))
    tipo_diabetes = models.IntegerField(choices=opciones_diabetes, null=True)
    tipo_hipertension = models.IntegerField(choices=opciones_hipertension, null=True)
    fecha_nacimiento = models.DateField(null=False)

    def __str__ (self):
        return str(self.identificacion_paciente)+ ": Diabetes:"+str(self.tipo_diabetes)+", Hipertension:"+str(self.tipo_hipertension)
################################################################################################################################################
#OPCIONES DE CONSULTA EN CONTACTO
opciones_consulta = [
    [0,"Consulta"],
    [1,"Cotizacion"],
    [2,"Sugerencia"],
    [3,"Felicitaciones"],
    [4,"Reclamo"]
]
################################################################################################################################################
#TABLA DE CONTACTO
class Contacto(models.Model):
    repetir_email = models.EmailField(null=False, blank=False)
    nombre = models.CharField(max_length=100,null=False, blank=False)
    tipo_consulta = models.IntegerField(choices=opciones_consulta, null=True)
    telefono = models.IntegerField(null=False, blank=False)
    mensaje = models.TextField(null=False)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.nombre)+" email: "+str(self.repetir_email)
################################################################################################################################################
#OPCIONES DE CONSULTA EN CONTACTO
opciones_horario = [
    [0,"Mañana"],
    [1,"Tarde"],
    [2,"Madrugada"],
    [3,"24 Horas"]
]
################################################################################################################################################
#TABLA PACIENTE PROFESIONALES
class ProfesionalPaciente(models.Model):
    identificacicion_usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE,null=True ,related_name="Rpaciente",limit_choices_to=Q(tipo_usuario_id=2))
    identificacion_profesional = models.ForeignKey(Usuario, on_delete=models.CASCADE,null=True, related_name="Rprofesional",limit_choices_to=Q(tipo_usuario_id=6))#| Q(tipo_usuario_id=6))
    horario_turno = models.IntegerField(choices=opciones_horario, null=True)
    def __str__(self):
        return str(self.identificacion_profesional)+ ": Horario:"+str(self.horario_turno)
################################################################################################################################################
#TABLA DE FICHA TODOS LOS USUARIOS
class UsuarioFicha (models.Model):
    id = models.AutoField(primary_key=True)
    identificacion_usuario = models.ForeignKey(Usuario, on_delete=models.SET_NULL,null=True)
    dirreccion_usuario = models.CharField(max_length=150,null=False, blank=False)
    telefono_usuario = models.IntegerField(null=False)
    celular_usuario = models.IntegerField(null=False)
    id_comuna = models.ForeignKey(Comuna, on_delete=models.SET_NULL,null=True)
    imagen = models.ImageField(upload_to="perfil_usuario", null=True)
    ficha_clinica = models.OneToOneField(PacienteFichaClinica, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return str(self.identificacion_usuario)+" "+str(self.telefono_usuario)
       