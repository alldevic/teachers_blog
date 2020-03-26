#!/usr/bin/env python

from os import environ as env
import sys

if __name__ == "__main__":
    env.setdefault("DJANGO_SETTINGS_MODULE", "mysite.settings.dev")

    from django.core.management import execute_from_command_line
    from django.conf import settings

    if settings.DEBUG and \
            (env.get('RUN_MAIN') or env.get('WERKZEUG_RUN_MAIN')):
        import ptvsd
        ptvsd.enable_attach(address=('0.0.0.0', 5678))
        print("Attached remote debugger")
    execute_from_command_line(sys.argv)
