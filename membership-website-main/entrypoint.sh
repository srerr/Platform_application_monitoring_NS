#!/bin/sh
python manage.py makemigrations --no-input
python manage.py migrate --no-input
python manage.py makemigrations accounts
python manage.py migrate accounts
python manage.py sync_cassandra --database=videos
gunicorn  job.wsgi:application --bind 0.0.0.0:8000
