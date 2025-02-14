# MongoDB con Docker Compose

Este proyecto proporciona una configuración de MongoDB utilizando Docker Compose. 
Incluye volúmenes para persistencia de datos y configuración de secretos para mayor seguridad.

## 📌 Requisitos
- Docker
- Docker Compose

## 📂 Estructura del Proyecto
```
./
├── docker-compose.yml
├── config/
│   └── mongod.conf
└── secrets/
    └── mongodb-root-password.txt
```

## 🚀 Instalación y Uso

### 1️⃣ Configurar Variables de Entorno
Crea un archivo `.env` con las siguientes variables:
```
MONGODB_IMAGE_TAG=6.0
MONGODB_PORT=27017
MONGO_INITDB_ROOT_USERNAME=root
```

### 2️⃣ Configurar el Secreto de la Contraseña
Asegúrate de tener un archivo `./secrets/mongodb-root-password.txt` con la contraseña del usuario root de MongoDB.
```bash
echo "tu_contraseña_segura" > ./secrets/mongodb-root-password.txt
```

### 3️⃣ Levantar el Contenedor
```bash
docker compose up -d
```

### 4️⃣ Verificar que el Contenedor está Corriendo
```bash
docker ps
```

### 5️⃣ Conectarse a la Base de Datos
Desde la terminal:
```bash
docker exec -it mongodb-container mongosh -u admin -p --authenticationDatabase admin
```

### 6️⃣ Detener y Eliminar los Contenedores
```bash
docker compose down
```

## 📌 Notas
- Los datos se almacenan en el volumen `mongodb-data` dentro de Docker.
- La configuración personalizada se encuentra en `./config/mongod.conf`.

## 🔍 Debugging
Si MongoDB no inicia correctamente, revisa los logs con:
```bash
docker logs mongodb-container
```

## 📜 Licencia
Este proyecto está bajo la licencia MIT.
