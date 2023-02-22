# Generated by Django 4.0.4 on 2023-02-22 16:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Laboratorio',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Principio',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='ViaAdminstracion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Medicamentos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('dosis', models.CharField(max_length=50)),
                ('cantidad', models.IntegerField()),
                ('presentacion', models.CharField(max_length=100)),
                ('lote', models.CharField(max_length=200)),
                ('fecha_vencimento', models.DateField()),
                ('ingesta', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.viaadminstracion')),
                ('laboratorio', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.laboratorio')),
                ('principio', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.principio')),
            ],
        ),
    ]
