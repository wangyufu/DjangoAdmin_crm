#!/usr/bin/env python
from django.template import Library
# mark_safe 可以返回safe html代码
from django.utils.safestring import mark_safe

register = Library()


@register.simple_tag
def get_model_verbose_name(admin_class):
    # print(admin_class.model)
    return admin_class.model._meta.verbose_name


@register.simple_tag
def build_table_row(row, admin_class):
    '''
    1、循环list_display,反射出每个字段的值

    :param row:
    :param admin_class:
    :return:
    '''
    row_ele = "<tr><td><input class='row_checkbox' name='_selected_obj' value='{id}' type='checkbox'></td>".format(id=row.id)

    # index的号码对应的列，对某列自定义
    for index, column_name in enumerate(admin_class.list_display):
        # row 是model对象 ，可以拿到该对象的字段信息
        field_obj = row._meta.get_field(column_name)
        # 判读是否是choices字段
        if field_obj.choices:
            column_display_func = getattr(row, 'get_%s_display' % column_name)
            column_val = column_display_func()
        else:
            column_val = getattr(row, column_name)
        if index == 0:
            td_ele = "<td><a href='{id}/change/'>{column_val}</a></td>".format(id=row.id, column_val=column_val)
        else:
            td_ele = "<td>{column_val}</td>".format(column_val=column_val)
        row_ele += td_ele
    return mark_safe(row_ele)


@register.simple_tag
def build_search_ele(admin_obj_list):
    return mark_safe("<input type='text' class='form-control' placeholder='%s'>" % '、'.join(admin_obj_list.list_search))


@register.simple_tag
def build_filter_ele(filter_column, admin_obj_list, filter_condtions):
    # list_filter 这里只能填外键和
    # field_obj 为了拿到get_choices()的列表
    field_obj = admin_obj_list.model._meta.get_field(filter_column)
    select_ele = "<select class='form-control' name=%s>" % filter_column
    # 1.None 代表没有对这个字段过滤，2.有值，选中的具体的option的val
    filter_option = filter_condtions.get(filter_column)
    if filter_option:
        for choice in field_obj.get_choices():
            if filter_option == str(choice[0]):
                selected = 'selected'
            else:
                selected = ''
            option_ele = "<option value=%s %s>%s</option>" % (choice[0], selected, choice[1])
            select_ele += option_ele
    else:
        for choice in field_obj.get_choices():
            option_ele = "<option value=%s>%s</option>" % (choice[0], choice[1])
            select_ele += option_ele

    select_ele += '</select>'
    return mark_safe(select_ele)


@register.simple_tag
def generate_orderby_icon(new_order_key):
    if new_order_key.startswith('-'):
        icon_ele = """<i class="fa fa-angle-down" aria-hidden="true"></i>"""
    else:
        icon_ele = """<i class="fa fa-angle-up" aria-hidden="true"></i>"""
    return mark_safe(icon_ele)


@register.simple_tag
def get_m2m_objects(admin_class, field_name, selected_objs):
    """
    1.根据field_name从admin_class.model反射出字段对象
    2.拿到关联表的所有数据
    3.返回数据
    :param admin_class:
    :param field_name:
    :return:
    """
    # models.Customer.tags 但没法查到关联表中的对象
    # 所以要使用rel.to.objects.all()方法
    field_obj = getattr(admin_class.model, field_name)
    all_objects = field_obj.rel.to.objects.all()
    return set(all_objects) - set(selected_objs)


@register.simple_tag
def get_selected_m2m_objects(form_obj, field_name):
    '''
    1.根据field_name反射出form_obj.instance里的字段对象
    2.拿到该字段的所有数据
    :param form_obj:
    :param field_name:
    :return:
    '''

    if form_obj.instance.id:
        field_obj = getattr(form_obj.instance, field_name)
        return field_obj.all()
    else:
        # ?
        return []


@register.simple_tag
def get_add_or_change(page_info):
    print('page', page_info)
    if page_info.endswith('change/'):
        return True
    else:
        return False


@register.simple_tag
def object_delete(model_obj):
    """
    1.通过model_obj.realted_objects拿到所有其它表关联obj的关联对象列表；
    2.循环关联对象列表，调用i.get_accessor_name() 拿到反向查询的model属性名；
    3.反射：model_obj.属性名，得到关联表的对象reverse_lookup_field；
    4.reverse_lookup_field.all(),取得关联的query_set列表;
    5.循环这个reverse_lookup_field.all()，将对象传到object_delete(o)递归,如果o_meta.related_objects不再递归
    ×关联的表，字段也会被删掉
    :param model_obj:
    :return:
    """
    ele = '<ul>'
    # 多对多不用递归，多对多只会删除自己id的那条不影响源数据
    local_m2m = model_obj._meta.local_many_to_many
    if local_m2m:
        for m2m_field in local_m2m:
            m2m_objs = getattr(model_obj, m2m_field.name).all()
            for m2m_obj in m2m_objs:
                ele += '<li>%s:%s</li>' % (m2m_obj.name, m2m_obj)

    for i in model_obj._meta.related_objects:  # setp1
        reverse_lookup_key = i.get_accessor_name()  # setp2
        # 异常是处理 django.db.models.fields.related_descriptors.RelatedObjectDoesNotExist: Customer has no account.
        try:
            reverse_lookup_field = getattr(model_obj, reverse_lookup_key)  # setp3
            query_set = reverse_lookup_field.all()  # setp4

            for o in query_set:
                ele += '<li>%s:%s</li>' % (o._meta.verbose_name, o)
                if o._meta.related_objects:  # 代表还有下一层
                    ele += object_delete(o)  # setp5
        except Exception as e:
            print(e)

    return mark_safe(ele + '</ul>')


@register.simple_tag
def get_back_page(request, del_id):
    if request.path_info.split('/')[1] == 'crm':
        url = request.path_info.split('/')[1:3]
        return '/' + '/'.join(url)
    return '/' + request.path_info.strip(del_id+'/delete/')


@register.simple_tag
def get_object_del_url(request, app_name, model_name,del_id):
    print(request.path_info.split('/'))
    url = request.path_info.split('/')[1:3]
    return '/' + '/'.join(url) + '/' + model_name + '/' + str(del_id) + '/delete/'
