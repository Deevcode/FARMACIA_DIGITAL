# Generated by Django 4.1 on 2023-06-13 10:14

from django.db import migrations, models
from datetime import datetime


class Migration(migrations.Migration):

    dependencies = [
        ("app", "0016_remove_usuarioficha_telegram_usuario_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="contacto",
            name="timestamp",
            field=models.DateTimeField(auto_now_add=True, default=datetime.now),
        ),
    ]
