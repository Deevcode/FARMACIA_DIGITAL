# Generated by Django 4.1 on 2023-06-23 07:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0032_remove_usuarioficha_recetas_and_more"),
    ]

    operations = [
        migrations.RemoveField(model_name="medicamentos", name="cantidad_stock",),
        migrations.RemoveField(model_name="medicamentos", name="precio",),
    ]