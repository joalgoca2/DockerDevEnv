# cAdvisor con Docker Compose

Este proyecto configura y ejecuta **cAdvisor** con Docker Compose para monitorear contenedores de Docker.

## 📂 Estructura del Proyecto
```
cadvisor-container/
│── .env
│── docker-compose.yml
│── README.md
```

## 🚀 Instalación y Uso

### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/tu_usuario/cadvisor-docker.git
cd cadvisor-docker
```

### 2️⃣ Configurar variables de entorno
Edita el archivo `.env` dentro de la carpeta `config/` para ajustar la configuración:

```env
CADVISOR_PORT=8080
CADVISOR_REFRESH_RATE=5s
```

### 3️⃣ Levantar cAdvisor
```bash
cd docker
docker-compose up -d
```

### 4️⃣ Acceder a la interfaz web
Abre un navegador y visita:
```
http://localhost:8080
```

## 🔄 Comandos útiles

- **Ver logs**  
  ```bash
  docker logs -f cadvisor
  ```
- **Detener el servicio**  
  ```bash
  docker-compose down
  ```
- **Actualizar cAdvisor**  
  ```bash
  docker-compose pull && docker-compose up -d --force-recreate
  ```

## 🛠 Requisitos
- **Docker** y **Docker Compose** instalados.
- Permisos para acceder a `/var/run/docker.sock`.

## 📌 Notas
- cAdvisor solo monitorea contenedores en el host donde se ejecuta.
- Asegúrate de que el usuario tenga acceso a `docker.sock` si ves errores de permisos.

---

