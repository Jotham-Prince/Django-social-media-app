release: python manage.py migrate
release: python manage.py collectstatic
web: gunicorn social_book.wsgi --log-file -