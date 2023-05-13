# Base image
FROM python:slim-buster

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SUPERUSER_USERNAME=Administrator
ENV DJANGO_SUPERUSER_EMAIL=administrator34@gmail.com
ENV DJANGO_SUPERUSER_PASSWORD=jotham

# Set working directory
WORKDIR /socialapp

# Install psycopg2 for postgres DB authentication
RUN pip3 install --index-url=https://pypi.python.org/simple/ psycopg2-binary

# Install nginx
RUN apt-get update && apt-get install -y nginx

# Copy nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Copy project requirements
COPY requirements.txt requirements.txt

# Install project dependencies
RUN pip install -r requirements.txt

# Copy project files
COPY . .

# Make runserver.sh executable
RUN chmod +x runserver.sh

# Run migrations and create superuser on container startup
CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py createsuperuser --noinput && sh runserver.sh"]