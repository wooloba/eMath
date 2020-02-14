# Generated by Django 2.2.1 on 2020-02-14 04:40

import django.contrib.postgres.fields.jsonb
from django.db import migrations, models
import django.db.models.deletion
import presentation.models


class Migration(migrations.Migration):

    dependencies = [
        ('presentation', '0015_auto_20200213_2140'),
    ]

    operations = [
        migrations.AlterField(
            model_name='level',
            name='root',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='presentation.RootLevel'),
        ),
        migrations.AlterField(
            model_name='rootlevel',
            name='author_index',
            field=django.contrib.postgres.fields.jsonb.JSONField(default=presentation.models.default_dict),
        ),
        migrations.AlterField(
            model_name='rootlevel',
            name='glossary',
            field=django.contrib.postgres.fields.jsonb.JSONField(default=presentation.models.default_dict),
        ),
        migrations.AlterField(
            model_name='rootlevel',
            name='symbol_index',
            field=django.contrib.postgres.fields.jsonb.JSONField(default=presentation.models.default_dict),
        ),
    ]
