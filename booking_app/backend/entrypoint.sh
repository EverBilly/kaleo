#!/bin/sh

set -e

# Mostrar información del entorno
echo "PWD: $(pwd)"
echo "Contenido actual del directorio:"
ls -la /app/

# Crear carpeta staticfiles antes de cualquier cosa
mkdir -p /app/staticfiles

# Mostrar contenido de static/ para depuración
echo "Archivos en /app/static:"
find /app/static -type f | sort

# Recolectar archivos estáticos
echo "Collecting static files..."
python manage.py collectstatic --noinput --verbosity=3

# Aplicar migraciones
echo "Applying migrations..."
python manage.py migrate --noinput

# Iniciar servidor
echo "Starting server..."
exec gunicorn --bind 0.0.0.0:$PORT booking_project.wsgi:application
