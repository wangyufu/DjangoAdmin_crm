#!/usr/bin/env python
from django.shortcuts import redirect, HttpResponse

from simulation_admin import admin_base
from web import models


class CustomerAdmin(admin_base.BaseAdmin):
    list_display = ['name', 'qq', 'consultant', 'source', 'status']
    list_filter = ['consultant', 'source', 'status']
    list_search = ['name']
    filter_horizontal = ['tags', 'consult_courses']
    list_per_page = 2
    actions = ['enroll']
    readonly_fields = ['name', 'qq', 'tags', 'consultant','consult_courses']

    def enroll(request,querysets):
        querysets.update(status=0)


class AccountAdmin(admin_base.BaseAdmin):
    list_display = ['email', 'name']


admin_base.site.register(models.Customer, CustomerAdmin)
admin_base.site.register(models.Course)
admin_base.site.register(models.ClassList)
admin_base.site.register(models.Account, AccountAdmin)
