from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'pb&e*sg4!9hdb@x=w4_gof(5ye40!w5gmi$x5f=nt++74#0env'

ALLOWED_HOSTS = ['*']

INSTALLED_APPS += ['django_sass', ]

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

WAGTAIL_CACHE = False

try:
    from .local_settings import *
except ImportError:
    pass
