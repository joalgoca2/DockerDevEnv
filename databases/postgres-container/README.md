# PostgreSQL con Docker Compose

Este proyecto proporciona una configuración de PostgreSQL utilizando Docker Compose. 
Incluye volúmenes para persistencia de datos y configuración de secretos para mayor seguridad.

## 📌 Requisitos
- Docker
- Docker Compose

## 📂 Estructura del Proyecto
```
./
├── docker-compose.yml
├── config/
│   └── postgresql.conf
├── db/
│   ├── backups/
├── logs/
└── secrets/
    └── db-root-password.txt
```

## 🚀 Instalación y Uso

### 1️⃣ Configurar Variables de Entorno
Crea un archivo `.env` con las siguientes variables:
```
POSTGRES_IMAGE_TAG=17.2-alpine3.21
POSTGRES_PORT=5432
POSTGRES_USER=myuser
POSTGRES_CHARSET=utf8mb4
POSTGRES_DATABASE=postgres
```

### 2️⃣ Configurar el Secreto de la Contraseña
Asegúrate de tener un archivo `./secrets/db-password.txt` con la contraseña del usuario de PostgreSQL.
```bash
echo "tu_contraseña_segura" > ./secrets/db-password.txt
```

### 3️⃣ Levantar el Contenedor
```bash
docker-compose up -d
```

### 4️⃣ Verificar que el Contenedor está Corriendo
```bash
docker ps
```

### 5️⃣ Conectarse a la Base de Datos
Desde la terminal:
```bash
docker exec -it postgres-container psql -U myuser -d postgres
```

### 6️⃣ Detener y Eliminar los Contenedores
```bash
docker compose down
```

## 📌 Notas
- Los datos se almacenan en el volumen `postgres-data` dentro de Docker.
- Los backups se guardan en `./db/backups/`.
- La configuración personalizada se encuentra en `./config/postgresql.conf`.

## 🔍 Debugging
Si PostgreSQL no inicia correctamente, revisa los logs con:
```bash
docker logs postgres-container
```

## 📜 Licencia
Este proyecto está bajo la licencia MIT.
