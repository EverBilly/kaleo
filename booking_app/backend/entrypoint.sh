#!/bin/sh

set -e

echo "PWD: $(pwd)"
echo "Contenido de /app:"
ls -la /app/

# Verificar que manage.py exista
if [ ! -f "/app/manage.py" ]; then
    echo "❌ ¡Error!: manage.py no encontrado en /app"
    exit 1
fi

# Crear carpeta staticfiles
mkdir -p /app/staticfiles

# Mostrar contenido de static/
echo "Archivos en /app/static:"
find /app/static -type f | sort || echo "No hay archivos en static/"

# Recolectar archivos estáticos
echo "🔄 Ejecutando collectstatic..."
python manage.py collectstatic --noinput --verbosity=3

# Aplicar migraciones
echo "🔄 Ejecutando migraciones..."
python manage.py migrate --noinput

# Iniciar servidor
echo "✅ Iniciando servidor Gunicorn..."
exec gunicorn --bind 0.0.0.0:$PORT booking_project.wsgi:application
