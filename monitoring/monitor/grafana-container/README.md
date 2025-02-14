# Grafana con Docker Compose

Este proyecto configura y ejecuta **Grafana** con Docker Compose para la visualización de métricas y monitoreo.

## 📂 Estructura del Proyecto
```
grafana-docker/
│── config/
│   ├── grafana.ini
│   ├──redis-dashboard-for-prometheus-redis-exporter-1-x_rev3.json
├── docker-compose.yml
│── README.md
│── .env
```

## 🚀 Instalación y Uso

### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/tu_usuario/grafana-docker.git
cd grafana-docker
```

### 2️⃣ Configurar variables de entorno
Edita el archivo `.env` para ajustar la configuración:

```env
GRAFANA_IMAGE_TAG=latest
GRAFANA_PORT=3000
```

### 3️⃣ Configurar Grafana
Edita el archivo `config/grafana.ini` para personalizar la configuración.

### 4️⃣ Levantar Grafana
```bash
cd docker
docker-compose up -d
```

### 5️⃣ Acceder a la interfaz web
Abre un navegador y visita:
```
http://localhost:3000
```

Usuario y contraseña por defecto:
```
Usuario: admin
Contraseña: admin
```

## 🔄 Comandos útiles

- **Ver logs**  
  ```bash
  docker logs -f grafana-container
  ```
- **Detener el servicio**  
  ```bash
  docker-compose down
  ```
- **Actualizar Grafana**  
  ```bash
  docker-compose pull && docker-compose up -d --force-recreate
  ```

## 🛠 Requisitos
- **Docker** y **Docker Compose** instalados.
- Archivo de configuración `grafana.ini` en `config/`.
- Puerto `3000` disponible para la interfaz web.
- Red `prometheus` configurada y accesible.

## 📌 Notas
- Grafana almacena sus datos en el volumen `grafana-data` para persistencia.
- El `healthcheck` verifica que Grafana esté funcionando correctamente en `http://localhost:3000/api/health`.
- Puedes cambiar las credenciales de administrador en las variables de entorno `GF_SECURITY_ADMIN_USER` y `GF_SECURITY_ADMIN_PASSWORD`.

---

