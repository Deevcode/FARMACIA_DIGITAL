from django.db import models

#TABLA LABORATORIO
class Laboratorio(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre

#TABLA DE PRINCIPIO ACTIVO
class Principio(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre        

#TABLA DE ADMINISTRACION MEDICAMENTO
class ViaAdminstracion(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre

#MARCA DEL MEDICAMENTO
#class MarcaMedicamento(models.Model):
#    nombre = models.CharField(max_length=50)
#
#    def __str__(self):
#        return self.nombre

#TABLA DE MEDICAMENTOS
class Medicamentos(models.Model):
    laboratorio = models.ForeignKey(Laboratorio, on_delete=models.PROTECT)
    principio = models.ForeignKey(Principio, on_delete=models.PROTECT)
    nombre = models.CharField(max_length=100)
    dosis = models.CharField(max_length=50)
    cantidad =models.IntegerField()
    presentacion =models.CharField(max_length=100)
    lote = models.CharField(max_length=200)
    ingesta = models.ForeignKey(ViaAdminstracion, on_delete=models.PROTECT)
    fecha_vencimento = models.DateField()
    #imagen = models.ImageField(upload_to="medicamentos", null=True)

    def __str__(self):
        return self.nombre

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
