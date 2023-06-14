# Generated by Django 4.1 on 2023-06-13 11:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0023_delete_contacto"),
    ]

    operations = [
        migrations.CreateModel(
            name="Contacto",
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
                ("repetir_email", models.EmailField(max_length=254)),
                ("nombre", models.CharField(max_length=100)),
                (
                    "tipo_consulta",
                    models.IntegerField(
                        choices=[
                            [0, "Consulta"],
                            [1, "Cotizacion"],
                            [2, "Sugerencia"],
                            [3, "Felicitaciones"],
                            [4, "Reclamo"],
                        ],
                        null=True,
                    ),
                ),
                ("telefono", models.IntegerField()),
                ("mensaje", models.TextField()),
                ("timestamp", models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
