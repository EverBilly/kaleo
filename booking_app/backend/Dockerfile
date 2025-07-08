# Fase 1: Construir frontend
FROM node:18 as frontend
WORKDIR /frontend
COPY frontend/ .
RUN npm install && npm run build

# Fase 2: Backend Python
FROM python:3.11-slim

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

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar archivos estáticos del frontend
COPY --from=frontend /frontend/dist /app/static

# Copiar backend
COPY . .

ENV PORT=8000
ENV PYTHONPATH=/app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
