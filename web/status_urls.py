from django.conf.urls import url, include
from web import views

# Routers provide an easy way of automatically determining the URL conf.



# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    url(r'^403/$', views.status_403),
]




