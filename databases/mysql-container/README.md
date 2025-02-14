# Mysql con Docker Compose

Este proyecto proporciona una configuración de Mysql utilizando Docker Compose. 
Incluye volúmenes para persistencia de datos y configuración de secretos para mayor seguridad.

## 📌 Requisitos
- Docker
- Docker Compose

## 📂 Estructura del Proyecto
```
./
├── docker-compose.yml
├── config/
│   └── my.cnf
├── db/
│   ├── backups/
└── secrets/
    └── db-root-password.txt
```

## 🚀 Instalación y Uso

### 1️⃣ Configurar Variables de Entorno
Crea un archivo `.env` con las siguientes variables:
```
MYSQL_IMAGE_TAG=11.6.2
MYSQL_PORT=3307
MYSQL_DATABASE=mi_base_de_datos
MYSQL_CHARSET=utf8mb4
```

### 2️⃣ Configurar el Secreto de la Contraseña Root
Asegúrate de tener un archivo `./secrets/db-root-password.txt` con la contraseña del root de Mysql.
```bash
echo "tu_contraseña_segura" > ./secrets/db-root-password.txt
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
docker exec -it mysql-container mysql -uroot -p
```

### 6️⃣ Detener y Eliminar los Contenedores
```bash
docker compose down
```

## 📌 Notas
- Los datos se almacenan en el volumen `mysql-data` dentro de Docker.
- Los backups se guardan en `./db/backups/`.
- La configuración personalizada se encuentra en `./config/my.cnf`.

## 🔍 Debugging
Si Mysql no inicia correctamente, revisa los logs con:
```bash
docker logs mysql-container
```

## 📜 Licencia
Este proyecto está bajo la licencia MIT.
