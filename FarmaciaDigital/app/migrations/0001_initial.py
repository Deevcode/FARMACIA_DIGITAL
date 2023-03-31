# Generated by Django 4.0.4 on 2023-03-31 01:49

from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('rut_usuario', models.CharField(max_length=12)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='CESFAM',
            fields=[
                ('id_cesfam', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_CESFAM', models.CharField(max_length=200)),
                ('direccion_CESFAM', models.CharField(max_length=200)),
                ('email_CESFAM', models.CharField(max_length=200)),
                ('telefono_CESFAM', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Comuna',
            fields=[
                ('id_comuna', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_comuna', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Contacto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('email', models.EmailField(max_length=254)),
                ('tipo_consulta', models.IntegerField(choices=[[0, 'Consulta'], [1, 'Cotizacion'], [2, 'Sugerencia'], [3, 'Felicitaciones'], [4, 'Reclamo']])),
                ('timestamp', models.CharField(max_length=100)),
                ('mensaje', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Diabetes',
            fields=[
                ('id_diabetes', models.AutoField(primary_key=True, serialize=False)),
                ('tipo_diabetes', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Enfermera',
            fields=[
                ('id_enfermera', models.AutoField(primary_key=True, serialize=False)),
                ('nombres_enfermera', models.CharField(max_length=200)),
                ('apellidos_enfermera', models.CharField(max_length=200)),
                ('direccion_enfermera', models.CharField(max_length=200)),
                ('celular_usuario', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Farmacia',
            fields=[
                ('id_farmacia', models.AutoField(primary_key=True, serialize=False)),
                ('marca_farmacia', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Hipertension',
            fields=[
                ('id_hipertension', models.AutoField(primary_key=True, serialize=False)),
                ('tipo_hipertension', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Laboratorio',
            fields=[
                ('id_laboratorio', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_laboratorio', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='MedicamentoFraccionamiento',
            fields=[
                ('id_fraccion', models.AutoField(primary_key=True, serialize=False)),
                ('fraccion', models.CharField(max_length=4)),
                ('descripcion_fraccion', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Medicamentos',
            fields=[
                ('id_medicamento', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_comercial', models.CharField(max_length=100)),
                ('gramaje', models.CharField(max_length=50)),
                ('cantidad_stock', models.IntegerField()),
                ('presentacion_medicamento', models.CharField(max_length=100)),
                ('id_laboratorio', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.laboratorio')),
            ],
        ),
        migrations.CreateModel(
            name='PrincipioActivo',
            fields=[
                ('id_principio_activo', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_princio_activo', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Region',
            fields=[
                ('id_region', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_region', models.CharField(max_length=45)),
            ],
        ),
        migrations.CreateModel(
            name='Tipo_usuario',
            fields=[
                ('id_TipoUsuario', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_tipo_usuario', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='ViaAdminstracion',
            fields=[
                ('id_via_administracion', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_via_administracion', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='UsuarioFicha',
            fields=[
                ('id_usuario', models.AutoField(primary_key=True, serialize=False)),
                ('dirreccion_usuario', models.CharField(max_length=150)),
                ('email_usuario', models.EmailField(max_length=254)),
                ('telefono_usuario', models.IntegerField()),
                ('celular_usuario', models.IntegerField()),
                ('whatsapp_usuario', models.IntegerField()),
                ('telegram_usuario', models.IntegerField()),
                ('id_comuna', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.comuna')),
                ('identificacion_usuario', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='QuimicoFarmaceuticoEncargado',
            fields=[
                ('id_quimico_farmaceutio', models.AutoField(primary_key=True, serialize=False)),
                ('registro_sanitario_QF', models.CharField(max_length=200)),
                ('tipo_usuario', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.tipo_usuario')),
            ],
        ),
        migrations.CreateModel(
            name='Provincia',
            fields=[
                ('id_provincia', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_provincia', models.CharField(max_length=100)),
                ('id_region', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.region')),
            ],
        ),
        migrations.CreateModel(
            name='PacienteReceta',
            fields=[
                ('id_receta_usuario', models.AutoField(primary_key=True, serialize=False)),
                ('fecha_receta', models.DateField()),
                ('tiempo_tratamiento_dias', models.CharField(max_length=100)),
                ('frecuencia_dosis_diaria', models.CharField(max_length=100)),
                ('horario_1', models.TimeField()),
                ('horario_2', models.TimeField(blank=True, null=True)),
                ('horario_3', models.TimeField(blank=True, null=True)),
                ('horario_4', models.TimeField(blank=True, null=True)),
                ('horario_5', models.TimeField(blank=True, null=True)),
                ('horario_6', models.TimeField(blank=True, null=True)),
                ('descripcion', models.TextField()),
                ('fracionamiento_1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app.medicamentofraccionamiento')),
                ('nombre_comercial', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app.medicamentos')),
                ('nombre_enfermera', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app.enfermera')),
                ('nombres_paciente', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='PacienteFichaClinica',
            fields=[
                ('id_paciente_ficha', models.AutoField(primary_key=True, serialize=False)),
                ('fecha_nacimiento', models.DateField()),
                ('identificacion_paciente', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to=settings.AUTH_USER_MODEL)),
                ('tipo_diabetes', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.diabetes')),
                ('tipo_hipertension', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.hipertension')),
            ],
        ),
        migrations.CreateModel(
            name='PacienteFamiliar',
            fields=[
                ('id_usuario_familiar', models.AutoField(primary_key=True, serialize=False)),
                ('num_run_familiar', models.CharField(max_length=12)),
                ('nombre_familiar', models.CharField(max_length=100)),
                ('apellido_familiar', models.CharField(max_length=100)),
                ('email_familiar', models.EmailField(max_length=254)),
                ('telefono_familiar', models.IntegerField()),
                ('whatsapp_familiar', models.IntegerField()),
                ('celular_familiar', models.IntegerField()),
                ('telegram_familiar', models.IntegerField()),
                ('parentesco', models.CharField(max_length=100)),
                ('direccion_familiar', models.CharField(max_length=100)),
                ('id_comuna', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.comuna')),
                ('nombre_tipo_usuario', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.tipo_usuario')),
            ],
        ),
        migrations.CreateModel(
            name='MedicamentosDescuento',
            fields=[
                ('id_descuento', models.AutoField(primary_key=True, serialize=False)),
                ('fecha_inicio_descuento', models.DateField()),
                ('fecha_termino_descuento', models.DateField()),
                ('descuento_porcentaje', models.IntegerField()),
                ('id_farmacia', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.farmacia')),
                ('medicamento_desc', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.medicamentos')),
            ],
        ),
        migrations.AddField(
            model_name='medicamentos',
            name='id_principio_activo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.principioactivo'),
        ),
        migrations.AddField(
            model_name='medicamentos',
            name='id_via_administracion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.viaadminstracion'),
        ),
        migrations.CreateModel(
            name='MedicamentoFichaTecnica',
            fields=[
                ('id_ficha_medicamento', models.AutoField(primary_key=True, serialize=False)),
                ('url_ficha', models.CharField(max_length=700)),
                ('laboratorio_ficha', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.laboratorio')),
                ('nombre_comercial', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.medicamentos')),
            ],
        ),
        migrations.CreateModel(
            name='FarmaciaSucursal',
            fields=[
                ('id_sucursal', models.AutoField(primary_key=True, serialize=False)),
                ('direccion_sucursal', models.CharField(max_length=200)),
                ('telefono_sucursal', models.IntegerField()),
                ('email', models.EmailField(max_length=254)),
                ('id_comuna', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.comuna')),
                ('id_provincia', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.provincia')),
                ('id_quimico_farmaceutio', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.quimicofarmaceuticoencargado')),
                ('id_region', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.region')),
                ('nombre_farmacia', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.farmacia')),
            ],
        ),
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
            ],
        ),
        migrations.CreateModel(
            name='FamiliarPacienteUsuario',
            fields=[
                ('id_familiar_paciente', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_tipo_usuario', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.tipo_usuario')),
                ('nombres_usuario', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.usuarioficha')),
                ('parentesco', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.pacientefamiliar')),
            ],
        ),
        migrations.AddField(
            model_name='enfermera',
            name='id_TipoUsuario',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app.tipo_usuario'),
        ),
        migrations.AddField(
            model_name='enfermera',
            name='id_comuna',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.comuna'),
        ),
        migrations.AddField(
            model_name='comuna',
            name='id_provincia',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.provincia'),
        ),
        migrations.AddField(
            model_name='cesfam',
            name='id_comuna',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.comuna'),
        ),
        migrations.AddField(
            model_name='usuario',
            name='id_TipoUsuario',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app.tipo_usuario'),
        ),
        migrations.AddField(
            model_name='usuario',
            name='user_permissions',
            field=models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions'),
        ),
    ]
