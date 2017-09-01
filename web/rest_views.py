#!/usr/bin/env python
from rest_framework import viewsets
from web.rest_searilizers import AccountSerializer
from web import models


# ViewSets define the view behavior.
class AccountViewSet(viewsets.ModelViewSet):
    queryset = models.Account.objects.all()
    serializer_class = AccountSerializer