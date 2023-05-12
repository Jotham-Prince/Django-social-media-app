# Base image
FROM python:slim-buster

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SUPERUSER_USERNAME=Administrator
ENV DJANGO_SUPERUSER_EMAIL=administrator34@gmail.com
ENV DJANGO_SUPERUSER_PASSWORD=jotham

# Set working directory
WORKDIR /socialapp

# Copy project files
COPY requirements.txt requirements.txt
COPY . .

# Install project dependencies
RUN pip3 install --index-url=https://pypi.python.org/simple/ psycopg2-binary
RUN pip install -r requirements.txt

# Install nginx
RUN apt-get update && apt-get install -y nginx

# Copy nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Copy runserver.sh
COPY runserver.sh runserver.sh
RUN chmod +x runserver.sh

# Run migrations and create superuser on container startup
CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py createsuperuser --noinput && sh runserver.sh"]