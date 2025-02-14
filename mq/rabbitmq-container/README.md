# RabbitMQ con Docker Compose

Este proyecto proporciona una configuración de Docker Compose para instalar y ejecutar RabbitMQ con persistencia de datos, autenticación y la interfaz de gestión habilitada.

## 📌 Requisitos
- Docker instalado.
- Docker Compose instalado.

## 📂 Estructura del Proyecto
```
./
├── docker-compose.yml
├── .env
├── config/
    └── rabbitmq.conf
```

## 🚀 Instalación y Uso

### 1️⃣ Configurar Variables de Entorno
Crea un archivo `.env` con las siguientes variables:
```
RABBITMQ_IMAGE_TAG=3.11-management
RABBITMQ_PORT=5672
RABBITMQ_MANAGEMENT_PORT=15672
RABBITMQ_DEFAULT_USER=admin
RABBITMQ_DEFAULT_PASS=mysecurepassword
```

### 2️⃣ Configura el archivo rabbitmq.conf

Crea un archivo rabbitmq.conf en la carpeta config con la siguiente configuración:

### Habilitar el plugin de gestión
management.listener.port = 15672
management.listener.ssl = false

### 3️⃣ Levantar el Contenedor
Ejecuta el siguiente comando para iniciar el contenedor de RabbitMQ:
```bash
docker-compose up -d
```

### 4️⃣ Verificar que el Contenedor está Corriendo
```bash
docker ps
```

### 5️⃣ Verifica que el plugin de gestión esté habilitado

Conéctate al contenedor y verifica que el plugin de gestión (rabbitmq_management) esté habilitado:

docker exec -it rabbitmq-container bash
rabbitmq-plugins list

Deberías ver algo como esto:

[E*] rabbitmq_management                # El asterisco (*) indica que el plugin está habilitado

Si el plugin no está habilitado, actívalo manualmente:

rabbitmq-plugins enable rabbitmq_management

### 6️⃣ Accede a la interfaz de gestión

Abre tu navegador y accede a la interfaz de gestión de RabbitMQ:

http://localhost:15672

- Usuario: admin (o el valor de ${RABBITMQ_DEFAULT_USER}).

- Contraseña: mysecurepassword (o el valor de ${RABBITMQ_DEFAULT_PASS}).


### Comandos útiles
- Iniciar el contenedor:

    docker-compose up -d

- Detener el contenedor:

    docker-compose down

- Ver logs del contenedor:

    docker logs rabbitmq-container

- Conectarse al contenedor:

    docker exec -it rabbitmq-container bash

## 📌 Notas
- Si no puedes acceder a la interfaz de gestión en http://localhost:15672, verifica que los puertos no estén siendo bloqueados por un firewall o alguna otra regla de red.
- Asegúrate de que el archivo rabbitmq.conf esté correctamente configurado para tu caso de uso.

## 📜 Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.