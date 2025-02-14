# ELK Stack con Docker Compose

Este proyecto configura y ejecuta **Elasticsearch, Kibana y Logstash** con Docker Compose para gestionar y visualizar datos de logs.

## 📂 Estructura del Proyecto
```
elk-container/
│── data/
│   ├── titanic.csv
│── pipeline/
│   ├── pipeline.conf
├── docker-compose.yml
│── README.md
│── .env
```

## 🚀 Instalación y Uso

### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/tu_usuario/elk-docker.git
cd elk-docker
```

### 2️⃣ Configurar variables de entorno
Edita el archivo `.env` para ajustar la configuración:

```env
ELASTIC_IMAGE_TAG=8.11.2
KIBANA_IMAGE_TAG=8.11.2
LOGSTASH_IMAGE_TAG=8.11.2

ELASTIC_PORT=9200
KIBANA_PORT=5601
LOGSTASH_PORT=5044

ELASTIC_PASSWORD=SuperSeguro123
ELASTIC_SECURITY=true
ES_JAVA_OPTS=-Xms1g -Xmx1g

KIBANA_USER=kibana_user
KIBANA_PASSWORD=OtraClaveSegura

LOGSTASH_USER=logstash_user
LOGSTASH_PASSWORD=ClaveLogstashSegura
```

### 3️⃣ Levantar ELK Stack
```bash
cd docker
docker-compose up -d
```

### 4️⃣ Acceder a los servicios
- **Elasticsearch:** `http://localhost:9200`
- **Kibana:** `http://localhost:5601`
- **Logstash:** Escucha en el puerto `${LOGSTASH_PORT}`

## 🔄 Comandos útiles

- **Ver logs de un contenedor**  
  ```bash
  docker logs -f elasticsearch-container
  ```
- **Detener todos los servicios**  
  ```bash
  docker-compose down
  ```
- **Actualizar ELK Stack**  
  ```bash
  docker-compose pull && docker-compose up -d --force-recreate
  ```

## 🛠 Requisitos
- **Docker** y **Docker Compose** instalados.
- Archivo de configuración de Logstash en `pipeline/pipeline.conf`.
- Puerto `9200`, `5601` y `5044` disponibles para uso.

## 📌 Notas
- **Elasticsearch** almacena sus datos en `elasticsearch-data` para persistencia.
- **Kibana** y **Logstash** utilizan credenciales configuradas en variables de entorno.
- Se crean automáticamente los usuarios para Kibana y Logstash al iniciar Elasticsearch.
- Puedes modificar `pipeline.conf` para personalizar el procesamiento de logs en Logstash.

---

