# Generated by Django 2.2.5 on 2019-11-04 12:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Life', '0003_auto_20191104_1233'),
    ]

    operations = [
        migrations.AddField(
            model_name='department',
            name='desc',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='dept',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Life.Department'),
        ),
    ]
