# Generated by Django 4.0.4 on 2023-03-16 02:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_usuario_rut_usuario'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='id_tipo_usuario',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, to='app.tipo_usuario'),
            preserve_default=False,
        ),
    ]
