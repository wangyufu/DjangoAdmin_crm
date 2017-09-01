#!/usr/bin/env python

from django.conf.urls import url
from simulation_admin import views

urlpatterns = [
    url(r'^$', views.app_index, name='app_index'),
    url(r'^(\w+)/(\w+)/$', views.model_table_list, name='model_table_list'),
    url(r'^(\w+)/(\w+)/(\d+)/change/$', views.table_obj_change),
    url(r'^(\w+)/(\w+)/add/$', views.table_obj_add),
    url(r'^(\w+)/(\w+)/(\d+)/delete/$', views.table_object_del, name='object_del'),
]