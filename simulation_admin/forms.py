#!/usr/bin/env python
from django.forms import ModelForm, forms


# 给表单副样式
def __new__(cls, *args, **kwargs):
    # print(cls.base_fields)
    for field_name in cls.base_fields:
        field = cls.base_fields[field_name]
        print("field", field)
        # print("field repr",field_name,field.__repr__())
        attr_dic = {'class': 'form-control'}
        if field_name in cls.admin_obj_list.readonly_fields:
            attr_dic['disabled'] = True

        field.widget.attrs.update(attr_dic)

    return ModelForm.__new__(cls)


def create_dynamic_modelform(model_class, admin_obj_list):
    class Meta:
        model = model_class
        fields = "__all__"

    def default_clean(self):
        '''
        验证时会先执行default_clean， 这里主要是检查只读数据是否有修改过
        :param self:
        :return:
        '''
        for field in self.admin_obj_list.readonly_fields:
            # change 页面里给类赋的instance
            if hasattr(self.instance, field):
                field_val_in_db = getattr(self.instance, field)
                # change 页面 post请求的数据
                new_val = self.cleaned_data.get(field)
                field_type = self.instance._meta.get_field(field).get_internal_type()
                if field_type == 'ManyToManyField':
                    field_val_in_db = field_val_in_db.all()
                    field_val_in_db = [obj.id for obj in field_val_in_db]
                    new_val = [obj.id for obj in new_val]
                # 判断俩个列表
                if field_val_in_db != new_val:
                    self.add_error(field, "Readonly Field: field should be '{value}' ,not '{new_value}' ". \
                                   format(**{'value': field_val_in_db, 'new_value': new_val}))

    # 动态生成form类
    dynamic_modelform = type("DynamicModelForm",
                             (ModelForm,),
                             {'Meta': Meta, '__new__': __new__, 'clean': default_clean,
                              'admin_obj_list': admin_obj_list})
    return dynamic_modelform
