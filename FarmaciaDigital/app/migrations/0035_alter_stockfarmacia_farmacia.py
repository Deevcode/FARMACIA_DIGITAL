# Generated by Django 4.1 on 2023-06-23 08:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0034_stockfarmacia"),
    ]

    operations = [
        migrations.AlterField(
            model_name="stockfarmacia",
            name="farmacia",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.PROTECT, to="app.farmaciasucursal"
            ),
        ),
    ]
