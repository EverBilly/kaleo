#!/bin/sh

set -e

echo "Collecting static files..."
python manage.py collectstatic --noinput

# Aplicar migraciones
echo "Aplicando migraciones..."
python manage.py migrate --noinput

# Iniciar servidor
echo "Iniciando servidor..."
exec gunicorn --bind 0.0.0.0:$PORT booking_project.wsgi:application
