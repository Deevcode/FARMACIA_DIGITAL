# Generated by Django 4.0.4 on 2023-03-28 13:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0005_alter_enfermera_celular_usuario'),
    ]

    operations = [
        migrations.AlterField(
            model_name='enfermera',
            name='celular_usuario',
            field=models.IntegerField(),
        ),
    ]
