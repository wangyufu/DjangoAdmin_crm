# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-08-08 09:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0003_auto_20170718_1945'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='account',
            options={'permissions': (('web_table_index', '可以查看所有的luffyadmin的app'), ('web_table_list', '可以查看每张表里所有的数据'), ('web_table_list_view', '可以访问表里每条数据的修改页'), ('web_table_list_change', '可以对表里的每条数据进行修改'))},
        ),
        migrations.AddField(
            model_name='account',
            name='is_staff',
            field=models.BooleanField(default=True, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status'),
        ),
    ]
