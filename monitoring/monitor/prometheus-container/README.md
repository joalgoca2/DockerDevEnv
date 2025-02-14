# Prometheus con Docker Compose

Este proyecto configura y ejecuta **Prometheus** con Docker Compose para recopilar y visualizar métricas del sistema y servicios monitoreados.

## 📂 Estructura del Proyecto
```
prometheus-docker/
│── config/
│   ├── prometheus.yml
├── docker-compose.yml
│── README.md
│── .env
```

## 🚀 Instalación y Uso

### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/tu_usuario/prometheus-docker.git
cd prometheus-docker
```

### 2️⃣ Configurar variables de entorno
Edita el archivo `.env` para ajustar la configuración:

```env
PROMETHEUS_PORT=9090
```

### 3️⃣ Levantar Prometheus
```bash
cd docker
docker-compose up -d
```

### 4️⃣ Acceder a la interfaz web
Abre un navegador y visita:
```
http://localhost:9090
```

## 🔄 Comandos útiles

- **Ver logs**  
  ```bash
  docker logs -f prometheus-container
  ```
- **Detener el servicio**  
  ```bash
  docker-compose down
  ```
- **Actualizar Prometheus**  
  ```bash
  docker-compose pull && docker-compose up -d --force-recreate
  ```

## 🛠 Requisitos
- **Docker** y **Docker Compose** instalados.
- Archivo de configuración `prometheus.yml` en `config/`.
- Puerto `9090` disponible para la interfaz web.

## 📌 Notas
- Prometheus almacena sus datos en el volumen `prometheus-data` para persistencia.
- El `healthcheck` verifica que Prometheus esté funcionando correctamente en `http://localhost:9090/-/healthy`.
- Puedes personalizar `prometheus.yml` para agregar nuevas métricas y targets de monitoreo.

---

