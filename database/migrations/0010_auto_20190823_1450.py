# Generated by Django 2.2.1 on 2019-08-23 20:50

import django.contrib.postgres.fields.jsonb
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('database', '0009_remove_para_content1'),
    ]

    operations = [
        migrations.AlterField(
            model_name='para',
            name='content',
            field=django.contrib.postgres.fields.jsonb.JSONField(),
        ),
    ]
