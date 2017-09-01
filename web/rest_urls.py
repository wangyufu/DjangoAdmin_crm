from django.conf.urls import url, include
from rest_framework import routers
from web.rest_views import *
from web.views import account_list, account_detail

# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r'account', AccountViewSet)


# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^account_list/$', account_list),
    url(r'^account_detail/(\d+)/$', account_detail),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]




