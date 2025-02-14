# Nginx con Docker Compose

Este proyecto proporciona una configuración de Nginx utilizando Docker Compose. 
Incluye volúmenes para configuración personalizada, logs y archivos web.

## 📌 Requisitos
- Docker
- Docker Compose

## 📂 Estructura del Proyecto
```
./
├── docker-compose.yml
├── config/
│   ├── nginx.conf
│   ├── globals/
│   ├── sites-available/
│   ├── sites-enabled/
│   ├── dhparams-4096.pem
├── logs/
├── www/
├── .env
```

## 🚀 Instalación y Uso

### 1️⃣ Configurar Variables de Entorno
Crea un archivo `.env` con las siguientes variables:
```
NGINX_IMAGE_TAG=latest
```

### 2️⃣ Construir y Levantar el Contenedor
```bash
docker compose up -d --build
```

### 3️⃣ Verificar que el Contenedor está Corriendo
```bash
docker ps
```

### 4️⃣ Verificar Logs de Nginx
```bash
docker logs nginx-container
```

### 5️⃣ Detener y Eliminar los Contenedores
```bash
docker compose down
```

## 📌 Notas
- La configuración de Nginx se encuentra en `./config/nginx.conf`.
- Los archivos de sitios están en `./config/sites-available` y `./config/sites-enabled`.
- Los logs se almacenan en `./logs/`.
- Los archivos estáticos y de la web se encuentran en `./www/`.

## 🔍 Debugging
Si Nginx no inicia correctamente, revisa los logs con:
```bash
docker logs nginx-container
```

## 📜 Licencia
Este proyecto está bajo la licencia MIT.

