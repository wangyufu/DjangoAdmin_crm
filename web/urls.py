#!/usr/bin/env python
from django.conf.urls import url, include
from web import views


# 通用的视图，名字没有起好，下次项目注意
urlpatterns = [
    url(r'^$', views.index, name='app_index'),
    url(r'^login/$', views.account_login),
    url(r'^logout/$', views.account_logout, name='logout'),
    url(r'^customer_list/$', views.customer_list, name="customer_list"),
    url(r'^customer_list/(\d+)/change/$', views.customer_list_change, name="customer_list_change"),
    url(r'^customer_list/add/$', views.customer_list_add, name="customer_list_add"),
    url(r'^customer_list/(\w+)/(\d+)/delete/$', views.customer_list_delete, name="customer_list_delete"),
]