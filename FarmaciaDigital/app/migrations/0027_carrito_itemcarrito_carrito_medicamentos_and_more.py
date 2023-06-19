# Generated by Django 4.1 on 2023-06-19 18:15

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0026_rename_id_usuario_usuarioficha_id"),
    ]

    operations = [
        migrations.CreateModel(
            name="Carrito",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="ItemCarrito",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("cantidad", models.IntegerField(default=1)),
                (
                    "carrito",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="app.carrito"
                    ),
                ),
                (
                    "medicamento",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="app.medicamentos",
                    ),
                ),
            ],
        ),
        migrations.AddField(
            model_name="carrito",
            name="medicamentos",
            field=models.ManyToManyField(
                through="app.ItemCarrito", to="app.medicamentos"
            ),
        ),
        migrations.AddField(
            model_name="carrito",
            name="usuario",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL
            ),
        ),
    ]
