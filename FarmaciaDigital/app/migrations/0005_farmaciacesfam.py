# Generated by Django 4.0.4 on 2023-03-07 16:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0004_encargadoquimicofarmaceutico'),
    ]

    operations = [
        migrations.CreateModel(
            name='FarmaciaCESFAM',
            fields=[
                ('id_farmacia_CESFAM', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_farmacia_CESFAM', models.CharField(max_length=200)),
                ('direccion_farmacia_CESFAM', models.CharField(max_length=200)),
                ('email_farmacia_CESFAM', models.CharField(max_length=200)),
                ('telefono_farmacia_CESFAM', models.CharField(max_length=200)),
                ('id_cesfam', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.cesfam')),
                ('id_comuna', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.comuna')),
                ('id_provincia', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.provincia')),
                ('id_region', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.region')),
            ],
        ),
    ]
