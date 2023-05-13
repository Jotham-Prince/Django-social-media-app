#!/bin/bash

# Collect static files
python manage.py collectstatic --noinput

# Start Gunicorn server
gunicorn social_book.wsgi:application --bind 0.0.0.0:8000 &

# Start Nginx server
nginx -g "daemon off;"