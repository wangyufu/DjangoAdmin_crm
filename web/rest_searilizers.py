#!/usr/bin/env python
from rest_framework import serializers
from web import models


# Serializers define the API representation.
class AccountSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = models.Account
        fields = ('email', 'name', 'role', 'customer')