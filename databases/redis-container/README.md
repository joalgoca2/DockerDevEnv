# Redis con Docker Compose

Este proyecto proporciona una configuración de Redis utilizando Docker Compose.
Incluye volúmenes para persistencia de datos y una configuración personalizada.

## 📌 Requisitos
- Docker
- Docker Compose

## 📂 Estructura del Proyecto
```
./
├── docker-compose.yml
├── config/
│   └── redis.conf
│── data/
│── logs/
│── .env
```

## 🚀 Instalación y Uso

### 1️⃣ Configurar Variables de Entorno
Crea un archivo `.env` con las siguientes variables:
```
REDIS_IMAGE_TAG=7.4.2-alpine
REDIS_PORT_NUMBER=6379
REDIS_REPLICATION_MODE=master
```

### 2️⃣ Levantar el Contenedor
```bash
docker compose up -d
```

### 3️⃣ Verificar que el Contenedor está Corriendo
```bash
docker ps
```

### 4️⃣ Conectarse a Redis CLI
Desde la terminal:
```bash
docker exec -it redis-container redis-cli
```

### 5️⃣ Detener y Eliminar los Contenedores
```bash
docker compose down
```

## 📌 Notas
- Los datos se almacenan en el volumen `redis-data` dentro de Docker.
- La configuración personalizada se encuentra en `./config/redis.conf`.

## 🔍 Debugging
Si Redis no inicia correctamente, revisa los logs con:
```bash
docker logs redis-container
```

## 📜 Licencia
Este proyecto está bajo la licencia MIT.


# Password

El password se encuentra en ./config/redis.conf
password = mysecurepassword

