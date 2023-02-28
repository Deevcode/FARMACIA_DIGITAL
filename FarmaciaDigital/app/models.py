from django.db import models

#TABLA DE REGION
class Region(models.Model):
    nombre_region = models.CharField(max_length=45)
    def __str__(self):
        return self.nombre_region
    
#TABLA DE PROVINCIA
class Provincia(models.Model):
    nombre_provincia = models.CharField(max_length=100)
    nombre_region =models.ForeignKey(Region, on_delete=models.PROTECT )
    def __str__(self):
        return self.nombre_provincia    
    
#TABLA DE COMUNA
class Comuna(models.Model):
    nombre_comuna = models.CharField(max_length=100)
    nombre_provincia = models.ForeignKey(Provincia, on_delete=models.PROTECT)
    def __str__(self):
        return self.nombre_comuna

#TABLA TIPO DE USURIO
class Tipo_usuario(models.Model):
    nombre_tipo_usuario =models.CharField(max_length=100)
    def __str__(self):
        return self.nombre_tipo_usuario    


#TABLA LABORATORIO
class Laboratorio(models.Model):
    nombre_laboratorio = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre_laboratorio

#TABLA DE PRINCIPIO ACTIVO
class Principio(models.Model):
    nombre_princio_activo = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre_princio_activo        

#TABLA DE ADMINISTRACION MEDICAMENTO
class ViaAdminstracion(models.Model):
    nombre_via_administracion = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre_via_administracion


#TABLA DE MEDICAMENTOS
class Medicamentos(models.Model):
    laboratorio = models.ForeignKey(Laboratorio, on_delete=models.PROTECT)
    nombre_princio_activo = models.ForeignKey(Principio, on_delete=models.PROTECT)
    nombre_comercial = models.CharField(max_length=100)
    dosis = models.CharField(max_length=50)
    cantidad =models.IntegerField()
    presentacion =models.CharField(max_length=100)
    lote = models.CharField(max_length=200)
    ingesta = models.ForeignKey(ViaAdminstracion, on_delete=models.PROTECT)
    fecha_vencimento = models.DateField()
    #imagen = models.ImageField(upload_to="medicamentos", null=True)

    def __str__(self):
        return self.nombre_comercial
    
#TABLA DE RECETA
class Receta(models.Model):
    fecha_receta = models.DateField()
    horario_recordatorio = models.DateTimeField()
    descripcion_receta = models.CharField(max_length=500)
    def __date__ (self):
        return self.descripcion_receta
    
#TABLA DE RECORDATORIO
class Recordatorio(models.Model):
    nombre_recordatorio = models.CharField(max_length=100)
    hora_recordatorio = models.DateTimeField()
    descripcion_receta = models.ForeignKey(Receta, on_delete=models.PROTECT)
    def __str__(self):
        return self.nombre_recordatorio

    
#TABLA DE FAMILIAR
class Familiar(models.Model):
    num_run_familiar = models.CharField(max_length=12)
    nombre_familiar = models.CharField(max_length=100)
    apellido_familiar = models.CharField(max_length=100)
    direccion_familiar = models.CharField(max_length=100)
    email_familiar = models.EmailField()
    telefono_familiar = models.IntegerField()
    whatsapp_familiar = models.IntegerField()
    celular_familiar = models.IntegerField()
    telegram_familiar = models.IntegerField()
    nombre_comuna = models.ForeignKey(Comuna, on_delete=models.PROTECT)
    nombre_provincia = models.ForeignKey(Provincia, on_delete=models.PROTECT)
    def __str__ (self):
        return self.nombre_familiar


#TABLA USUARIO
class Usuario (models.Model):
    num_run_usuario = models.CharField(max_length=12)
    nombres_usuario = models.CharField(max_length=100)
    apellido_paterno_usuario = models.CharField(max_length=100)
    appelido_materno_usuario = models.CharField(max_length=100)
    dirreccion_usuario = models.CharField(max_length=150)
    email_usuario = models.EmailField()
    telefono_usuario = models.IntegerField()
    celular_usuario = models.IntegerField()
    whatsapp_usuario = models.IntegerField()
    nombre_comuna = models.ForeignKey(Comuna, on_delete=models.PROTECT)
    nombre_familiar = models.ForeignKey(Familiar, on_delete=models.PROTECT)
    nombre_comercial = models.ForeignKey(Medicamentos, on_delete=models.PROTECT)
    def __str__(self):
        return self.nombres_usuario

#MARCA DEL MEDICAMENTO
#class MarcaMedicamento(models.Model):
#    nombre = models.CharField(max_length=50)
#
#    def __str__(self):
#        return self.nombre



#OPCIONES DE CONSULTA EN CONTACTO
opciones_consulta = [
    [0,"Consulta"],
    [1,"Cotizacion"],
    [2,"Sugerencia"],
    [3,"Felicitaciones"],
    [4,"Reclamo"]
]

#CLASE DE CONTACTO
class Contacto(models.Model):
    nombre = models.CharField(max_length=100)
    email = models.EmailField()
    tipo_consulta = models.IntegerField(choices=opciones_consulta)
    mensaje = models.TextField()
    def __str__(self):
        return self.nombre





