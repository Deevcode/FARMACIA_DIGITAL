# Generated by Django 4.1.6 on 2023-04-06 20:40

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0001_initial"),
    ]

    operations = [
        migrations.AlterField(
            model_name="profesionalpaciente",
            name="identificacicion_usuario",
            field=models.ForeignKey(
                limit_choices_to=models.Q(("id_tipo_user_id", 3)),
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                related_name="Rpaciente",
                to=settings.AUTH_USER_MODEL,
            ),
        ),
        migrations.AlterField(
            model_name="profesionalpaciente",
            name="identificacion_profesional",
            field=models.ForeignKey(
                limit_choices_to=models.Q(
                    ("id_tipo_user_id", 2), ("id_tipo_user_id", 6), _connector="OR"
                ),
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                related_name="Rprofesional",
                to=settings.AUTH_USER_MODEL,
            ),
        ),
        migrations.DeleteModel(name="ProfesionalSalud",),
    ]