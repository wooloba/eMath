# Generated by Django 2.2.1 on 2019-10-16 18:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('presentation', '0003_auto_20191016_1209'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='level',
            name='author',
        ),
        migrations.AddField(
            model_name='level',
            name='author',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='author', to='presentation.Person'),
        ),
        migrations.RemoveField(
            model_name='level',
            name='contributor',
        ),
        migrations.AddField(
            model_name='level',
            name='contributor',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='contributors', to='presentation.Person'),
        ),
    ]
