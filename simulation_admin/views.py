from django.db.models import Q
from django.shortcuts import render, HttpResponse, redirect
from simulation_admin import app_config
from simulation_admin.admin_base import site
from web import page
from simulation_admin import forms
from simulation_admin.perm_handle import check_permission

# Create your views here.

print("注册的admin list:", site.registered_admins)


@check_permission
def app_index(request):
    return render(request, 's_admin/admin_index.html', {'site': site})


@check_permission
def table_obj_change(request, app_name, model_name, obj_id, no_render=False):
    if app_name in site.registered_admins:
        if model_name in site.registered_admins[app_name]:
            admin_obj_list = site.registered_admins[app_name][model_name]
            table_obj = admin_obj_list.model.objects.get(id=obj_id)
            form = forms.create_dynamic_modelform(admin_obj_list.model, admin_obj_list)
            if request.method == 'GET':
                form_obj = form(instance=table_obj)
            elif request.method == 'POST':
                print('post')
                form_obj = form(instance=table_obj, data=request.POST)
                if form_obj.is_valid():
                    form_obj.save()
    if no_render:
        return locals()
    return render(request, 's_admin/table_object_change.html', locals())


@check_permission
def table_obj_add(request, app_name, model_name, no_render=False):
    if app_name in site.registered_admins:
        if model_name in site.registered_admins[app_name]:
            admin_obj_list = site.registered_admins[app_name][model_name]
            form = forms.create_dynamic_modelform(admin_obj_list.model, admin_obj_list)
            if request.method == 'GET':
                form_obj = form()
            elif request.method == 'POST':
                form_obj = form(data=request.POST)
                if form_obj.is_valid():
                    form_obj.save()
                return redirect(request.path.rstrip('add/'))

    if no_render:
        return locals()
    return render(request, 's_admin/table_object_change.html', locals())


def table_object_del(request, app_name, model_name, del_id, no_render=False):
    if app_name in site.registered_admins:
        if model_name in site.registered_admins[app_name]:
            admin_obj_list = site.registered_admins[app_name][model_name]
            model_obj = admin_obj_list.model.objects.get(id=del_id)
            if request.method == 'POST':
                model_obj.delete()
                return redirect("/simulation_admin/%s/%s/" % (app_name, model_name))

    if no_render:
        return locals()
    return render(request, 's_admin/table_object_delete.html', locals())


# {#注册的admin list: {'web': {'classlist': <class 'simulation_admin.admin_base.BaseAdmin'>, 'course': <class 'simulation_admin.admin_base.BaseAdmin'>, 'customer': <class 'web.s_admin.CustomerAdmin'>}, 'teacher': {'teachertest': <class 'simulation_admin.admin_base.BaseAdmin'>}}#}
@check_permission
def model_table_list(request, app_name, model_name, no_render=False):
    if app_name in site.registered_admins:
        if model_name in site.registered_admins[app_name]:
            admin_obj_list = site.registered_admins[app_name][model_name]
            if request.method == 'POST': # admin action
                print(request.POST)
                action_func_name = request.POST.get('admin_action')
                # 得到admin action 自定义函数
                action_func = getattr(admin_obj_list, action_func_name)
                # get 列表
                selected_obj_ids = request.POST.getlist("_selected_obj")
                model_objs = admin_obj_list.model.objects.filter(id__in=selected_obj_ids)
                print()
                action_res = action_func(request, model_objs)
                if action_res:
                    return action_res

                return redirect(request.path_info)
            else:
                queryset, filter_condtions, all_filter = get_filter_objs(request, admin_obj_list)
                queryset, q_val = get_search_objs(request, queryset, admin_obj_list)
                queryset, new_order_key, order_column, last_orderby_key = get_orderby_objs(request, queryset)
                # print(type(filter_condtions))
                all_count = queryset.count()
                page_info = page.PageInfo(request.GET.get('p'), admin_obj_list.list_per_page, all_count, request.path_info,
                                          all_filter, q_val, last_orderby_key)
                user_list = queryset[page_info.start():page_info.end()]

    if no_render:
        return locals()
    else:
        return render(request, 's_admin/model_table_list.html', locals())


def get_orderby_objs(request, queryset):
    '''
    1.获取_o的值
    2.调用order_by(_o的值)
    3.处理正负号，来确定下次的排序的顺序
    4.返回 数据库对象，新_o值， 去负号的值， 分页的key
    :param request:
    :param queryset:
    :return:
    '''
    orderby_key = request.GET.get('_o')
    #
    last_orderby_key = orderby_key or ''
    if orderby_key:
        orderby_column = orderby_key.strip('-')
        orderby_results = queryset.order_by(orderby_key)
        if orderby_key.startswith('-'):
            new_order_key = orderby_key.strip('-')
        else:
            new_order_key = '-%s' % orderby_key
        # print(orderby_results, new_order_key, orderby_column, last_orderby_key)
        return orderby_results, new_order_key, orderby_column, last_orderby_key
    else:
        # print(last_orderby_key)
        return queryset, None, None, last_orderby_key


def get_search_objs(request, queryset, admin_obj_list):
    '''
    1.拿到_q的值
    2.拼接Q查询条件
    3.调用filter（Q条件）查询
    4.返回查询结果
    :param request:
    :param queryset:
    :param admin_obj_list:
    :return:
    '''
    q_val = request.GET.get('_q')  # _q没有就是none，所以下面就要对q_val做判断
    if q_val:
        # 创建Q对象实例
        q_obj = Q()
        # 对实例添加（与或非）
        q_obj.connector = 'OR'
        # contains是模糊匹配
        for serach_field in admin_obj_list.list_search:
            # (字段，值)
            q_obj.children.append(("%s__contains" % serach_field, q_val))
        # print(q_obj)
        serach_results = queryset.filter(q_obj)
    else:
        serach_results = queryset
        return serach_results, ''
    return serach_results, q_val


def get_filter_objs(request, admin_obj_list):
    filter_condtions = {}
    all_filter = {}

    for k, v in request.GET.items():
        if k in ('p', '_q', '_o'):
            continue
        if v:
            filter_condtions[k] = v
        all_filter[k] = v

    queryset = admin_obj_list.model.objects.filter(**filter_condtions)
    # print(filter_condtions)
    # print(all_filter)
    return queryset, filter_condtions, all_filter
