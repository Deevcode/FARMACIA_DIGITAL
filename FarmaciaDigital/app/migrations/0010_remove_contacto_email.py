# Generated by Django 4.1 on 2023-06-13 04:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0009_alter_profesionalpaciente_identificacion_profesional"),
    ]

    operations = [
        migrations.RemoveField(model_name="contacto", name="email",),
    ]
