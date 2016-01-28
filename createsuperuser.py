#!/usr/bin/python
import os
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "blog.settings.production")
django.setup()

from django.contrib.auth import get_user_model
print('Updating superuser info')
u = get_user_model().objects.get(username='admin')
u.set_password('admin')
u.is_superuser = True
u.is_staff = True
u.save()
