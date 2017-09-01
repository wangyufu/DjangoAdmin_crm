#!/usr/bin/env python


class BaseAdmin(object):
    list_display = []
    list_filter = []
    list_search = []
    list_per_page = 5
    filter_horizontal = []
    default_actions = ["delete_obj"]
    actions = []
    readonly_fields = []

    def delete_obj(request, queryset):
        print('default....', request, queryset)


class AdminSite(object):
    def __init__(self):
        self.registered_admins = {}

    def register(self, model_or_iterable, admin_class=None, **options):
        '''
        admin_class 是table显示 自定义字段的类
        :param model_or_iterable:
        :param admin_class:
        :param options:
        :return:
        '''
        if admin_class is None:
            # 每个实例是独立 ， 直接对这个类赋值了
            admin_class = BaseAdmin()
        admin_class.model = model_or_iterable  # 把model装到了admin class,以供simple tags调用

        # 这个表属于那个app
        app_label = model_or_iterable._meta.app_label
        if app_label not in self.registered_admins:
            self.registered_admins[app_label] = {}
        self.registered_admins[app_label][model_or_iterable._meta.model_name] = admin_class


site = AdminSite()
