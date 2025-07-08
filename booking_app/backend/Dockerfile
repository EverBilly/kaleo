# Usa una imagen oficial de Python
FROM python:3.11-slim

# Directorio de trabajo
WORKDIR /app

# Copiar requirements.txt primero
COPY requirements.txt .

# Instalar dependencias directamente sin entorno virtual
RUN pip install --no-cache-dir -r requirements.txt

# Copiar resto del código
COPY . .

# Puerto dinámico asignado por Railway
EXPOSE $PORT

# Comando de inicio (ajusta según tu app)
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "booking_project.wsgi:application"]
