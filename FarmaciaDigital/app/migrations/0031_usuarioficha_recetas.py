# Generated by Django 4.1 on 2023-06-21 21:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0030_usuarioficha_imagen"),
    ]

    operations = [
        migrations.AddField(
            model_name="usuarioficha",
            name="recetas",
            field=models.ManyToManyField(
                related_name="paciente_recetas", to="app.pacientereceta"
            ),
        ),
    ]
