# Generated by Django 2.1.7 on 2019-03-30 22:30

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('speaker', '0004_guiinfo'),
    ]

    operations = [
        migrations.RenameField(
            model_name='guiinfo',
            old_name='msg1',
            new_name='english',
        ),
        migrations.RenameField(
            model_name='guiinfo',
            old_name='msg2',
            new_name='german',
        ),
    ]
