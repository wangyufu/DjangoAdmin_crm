from simulation_admin import permissions
# url resolve方法 可以取到url_name
from django.core.urlresolvers import resolve
from django.shortcuts import redirect, render
from django.conf import settings


def perm_check(*args, **kwargs):
    '''
    1.判断用户是否已认证
        1.1 根据原生的url，获取到相对的url_name
        1.2 根据url_name，这里循环 permission_dic, 正常循环数据库，找到对应条目
            1.2.1 判断 request.method、请求参数都匹配上，拿到当前数据
            1.2.2 判断用户是否有上面匹配数据的权限
            1.2.4 如果有，放行
            1.2.5 没有 返回403
        1.3 找不到权限条目， 403
    2.没登录，拒绝
    :param args:
    :param kwargs:
    :return:
    '''
    request = args[0]
    print('request',request.GET)
    resolve_url_obj = resolve(request.path)
    # 当前url的url_name
    current_url_name = resolve_url_obj.url_name
    match_key = None
    match_results = [None]
    print(len(request.GET))

    if not request.user.is_authenticated():
        return redirect(settings.LOGIN_URL)

    for permission_key, permission_val in permissions.perm_dic.items():
        if len(request.GET) != 0:
            perm_url_name = permission_val[0]
            perm_method = permission_val[1]
            perm_args = permission_val[2]
            perm_kwargs = permission_val[3]
            # 第五个就是函数，没有就是None
            custom_func_hook = None if len(permission_val) == 4 else permission_val[4]

            if perm_url_name == current_url_name:
                if perm_method == request.method:
                    args_matched = False
                    for item in perm_args:
                        request_method_func = getattr(request, perm_method)
                        if request_method_func.get(item, None):  # request字典中有此参数，没有就返回None
                            args_matched = True
                        else:
                            args_matched = False
                            break   # 有一个参数不能匹配成功，则判定为假，退出该循环。
                    else:
                        args_matched = True

                    # 匹配有特定值的参数
                    kwargs_matched = False
                    print(perm_kwargs)
                    for k, v in perm_kwargs.items():
                        request_method_func = getattr(request, perm_method)
                        arg_val = request_method_func.get(k, None)  # request字典中有此参数，没有就返回None
                        if arg_val == str(v):   # 匹配上了特定的参数 及对应的 参数值， 比如，需要request 对象里必须有一个叫 user_id=3的参数
                            kwargs_matched = True
                        else:
                            kwargs_matched = False
                            break  # 有一个参数不能匹配成功，则判定为假，退出该循环。
                    else:
                        kwargs_matched = True

                    func_hook_passed = True
                    if custom_func_hook:  # 设置了自定义函数
                        print(custom_func_hook)
                        func_res = custom_func_hook(request, *args, **kwargs)
                        if func_res:
                            func_hook_passed = True

                    match_results = [args_matched, kwargs_matched, func_hook_passed]
                    if all(match_results):
                        match_key = permission_key
                        break
        else:
            args_matched, kwargs_matched, func_hook_passed = True, True, True
            match_results = [args_matched, kwargs_matched, func_hook_passed]
            match_key = permission_key

    print(match_results)
    if all(match_results):  # 要确定循环是因为匹配上然后跳出了，还是循环结束了，但没有匹配上
        app_name, *perm_name = match_key.split('_')
        #  u1.has_perm('web.tag') perm_obj就是这样的字符串
        perm_obj = '%s.%s' % (app_name, match_key)
        # django自定义用户的has_perm方法判断当前用户是否有这条权限
        if request.user.has_perm(perm_obj):
            print('当前用户有此权限')
            return True
        else:
            print('当前用户没有该权限')
            return False
    else:   # 权限没有匹配的
        print("未匹配到权限项，当前用户无权限")


def check_permission(func):
    def wrapper(*args, **kwargs):
        request = args[0]
        if perm_check(*args, **kwargs):
            return func(*args, *kwargs)
        else:
            return redirect('/status/403/')

    return wrapper