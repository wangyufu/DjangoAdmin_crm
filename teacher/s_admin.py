#!/usr/bin/env python

from simulation_admin import admin_base
from teacher import models

admin_base.site.register(models.TeacherTest)
