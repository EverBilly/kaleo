FROM python:3.11-slim

# Dependencias básicas para desarrollo
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gcc \
        python3-dev \
        zlib1g-dev \
        libpng-dev \
        libjpeg-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Directorio de trabajo
WORKDIR /app

# Copiar requirements.txt primero
COPY requirements.txt .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar resto del código
COPY . .

# Puerto dinámico asignado por Railway
ENV PORT=8000

# Comando de inicio
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "booking_project.wsgi:application"]
