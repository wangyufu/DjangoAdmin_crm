from django.shortcuts import render, redirect, HttpResponse
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from web import models
# django 内置验证、登录、登出
from django.contrib.auth import authenticate, login, logout
# Create your views here.
# rest
from rest_framework.decorators import api_view
from web import rest_searilizers
from rest_framework import status
from rest_framework.response import Response

from simulation_admin import views as admin_views
from simulation_admin.perm_handle import check_permission


@login_required(login_url='/crm/login/')
def index(request):
    return render(request, 'index.html')


def account_logout(request):
    logout(request)
    return redirect('/crm/')


def account_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        # django自带验证用户名密码
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            return redirect(request.GET.get('next') or '/crm/')

    return render(request, 'login.html')


@api_view(['GET', 'POST'])
def account_list(request):
    """
    List all snippets, or create a new snippet.
    """
    if request.method == 'GET':
        account_obj = models.Account.objects.all()
        serializer = rest_searilizers.AccountSerializer(account_obj, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        print("request", request.data)
        serializer = rest_searilizers.AccountSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'PUT', 'DELETE'])
@csrf_exempt
def account_detail(request, pk):
    """
    Retrieve, update or delete a snippet instance.

    """
    # pk 跟 id 是一样的
    try:
        account_obj = models.Account.objects.get(pk=pk)
    except account_obj.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = rest_searilizers.AccountSerializer(account_obj)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = rest_searilizers.AccountSerializer(account_obj, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        account_obj.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@check_permission
def customer_list(request):
    app_name = 'web'
    model_name = 'customer'
    view_data = admin_views.model_table_list(request, app_name, model_name, no_render=True)
    # action
    if request.method == 'POST':
        return redirect(request.path_info)
    return render(request, 'crm/customer_list.html', view_data)


@check_permission
def customer_list_change(request, obj_id):
    app_name = 'web'
    model_name = 'customer'
    view_data = admin_views.table_obj_change(request, app_name, model_name, obj_id, no_render=True)
    # if request.method == 'POST':
    #     return redirect(request.path_info)
    return render(request, 'crm/customer_list_change.html', view_data)


@check_permission
def customer_list_delete(request, model_name, obj_id):
    app_name = 'web'
    # model_name = 'customer'
    view_data = admin_views.table_object_del(request, app_name, model_name, obj_id, no_render=True)
    if request.method == 'POST':
        url = request.path_info.split('/')[1:3]
        return redirect('/' + '/'.join(url))
    return render(request, 'crm/customer_list_delete.html', view_data)


@check_permission
def customer_list_add(request):
    app_name = 'web'
    model_name = 'customer'
    view_data = admin_views.table_obj_add(request, app_name, model_name, no_render=True)
    if request.method == 'POST':
        print(request.path_info.strip('add/'))
        return redirect('/' + request.path_info.strip('add/'))
    return render(request, 'crm/customer_list_change.html', view_data)


def status_403(request):
    return render(request, 's_admin/403.html')