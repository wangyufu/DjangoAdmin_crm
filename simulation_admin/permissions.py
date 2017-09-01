from simulation_admin import perm_custom_funcs

# 这个字典可以存在数据库中 ，[] 可以FK {} 也可以FK
perm_dic = {
    'web_table_index': ['app_index', 'GET', [], {}, ],  # 可以查看CRM APP里所有数据库表
    # 'web_table_list': ['customer_list', 'GET', [], {}],  # 可以查看每张表里所有的数据
    'web_table_list_filter': ['customer_list', 'GET', [], {},perm_custom_funcs.only_view_own_customers ],  # 可以查看每张表里所有的数据
    'web_table_list_view': ['customer_list_change', 'GET', [], {}],  # 可以访问表里每条数据的修改页
    'web_table_list_change': ['customer_list_change', 'POST', ["source"], {}],  # 可以对表里的每条数据进行修改
}
