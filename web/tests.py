from django.test import TestCase

# Create your tests here.

a={'status': '0', 'consultant': '1'}

l = []
for k,v in a.items():
    l.append(k+'='+v)

print('&'.join(l))