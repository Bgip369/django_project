#!/bin/bash

# Chạy migrations khi triển khai
python manage.py migrate

# Chạy Gunicorn
exec gunicorn --bind 0.0.0.0:8000 --workers 3 home.wsgi:application