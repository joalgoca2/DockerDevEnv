# Redis Exporter con Docker Compose

Este proyecto configura y ejecuta **Redis Exporter** con Docker Compose para monitorear Redis mediante **Prometheus**.

## 📂 Estructura del Proyecto
```
redis-exporter-container/
├── .env
├── docker-compose.yml
│── README.md
```

## 🚀 Instalación y Uso

### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/tu_usuario/redis-exporter-docker.git
cd redis-exporter-container
```

### 2️⃣ Configurar variables de entorno
Edita el archivo `.env` dentro de la carpeta `config/` para ajustar la configuración:

```env
REDIS_EXPORTER_IMAGE_TAG=latest
REDIS_EXPORTER_PORT_NUMBER=9121
```

### 3️⃣ Levantar Redis Exporter
```bash
cd docker
docker-compose up -d
```

### 4️⃣ Acceder a la interfaz web
Abre un navegador y visita:
```
http://localhost:9121/metrics
```

## 🔄 Comandos útiles

- **Ver logs**  
  ```bash
  docker logs -f redis-exporter
  ```
- **Detener el servicio**  
  ```bash
  docker-compose down
  ```
- **Actualizar Redis Exporter**  
  ```bash
  docker-compose pull && docker-compose up -d --force-recreate
  ```

## 🛠 Requisitos
- **Docker** y **Docker Compose** instalados.
- Redis ejecutándose en la red `redis_monitor`.
- Prometheus configurado en la red `prometheus` para recopilar métricas.

## 📌 Notas
- Redis Exporter permite monitorear el estado y rendimiento de Redis.
- Asegúrate de que los valores en `.env` coincidan con la configuración de tu entorno.
- Si Redis tiene autenticación, revisa `REDIS_USER` y `REDIS_PASSWORD` en el `docker-compose.yml`.

---

