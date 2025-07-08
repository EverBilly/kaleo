# Imagen base
FROM python:3.11-slim

# Instalar dependencias necesarias
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

# Copiar requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código fuente
COPY . .

# Servir archivos estáticos con whitenoise
ENV PYTHONPATH=/app

# Entrada del contenedor
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
