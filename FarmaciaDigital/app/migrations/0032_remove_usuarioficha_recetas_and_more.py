# Generated by Django 4.1 on 2023-06-21 21:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0031_usuarioficha_recetas"),
    ]

    operations = [
        migrations.RemoveField(model_name="usuarioficha", name="recetas",),
        migrations.AddField(
            model_name="usuarioficha",
            name="ficha_clinica",
            field=models.OneToOneField(
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                to="app.pacientefichaclinica",
            ),
        ),
    ]
