#!/bin/sh

set -e

# Crear carpeta staticfiles antes de que Whitenoise la busque
mkdir -p /app/staticfiles

# Mostrar contenido de static/ para depuración
echo "Archivos en static/:"
ls -R /app/static/

# Recolectar archivos estáticos
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Aplicar migraciones
echo "Applying migrations..."
python manage.py migrate --noinput

# Iniciar servidor
echo "Starting server..."
exec gunicorn --bind 0.0.0.0:$PORT booking_project.wsgi:application
