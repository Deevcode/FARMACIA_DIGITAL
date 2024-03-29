# Generated by Django 4.1 on 2023-06-10 07:13

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0006_alter_usuarioficha_identificacion_usuario"),
    ]

    operations = [
        migrations.AlterField(
            model_name="usuarioficha",
            name="identificacion_usuario",
            field=models.ForeignKey(
                limit_choices_to=models.Q(("tipo_usuario_id", 2)),
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name="REpaciente",
                to=settings.AUTH_USER_MODEL,
            ),
        ),
    ]
