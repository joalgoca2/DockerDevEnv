# DockerDevEnv - Entorno de Desarrollo con Docker

DockerDevEnv es un entorno de desarrollo basado en Docker que integra múltiples herramientas y servicios esenciales para AI, bases de datos, logging, monitoreo, colas de mensajes, programación y servidores web.

## 📂 Estructura del Proyecto
```
DockerDevEnv/
│── ai/
│   ├── ollama/
│── databases/
│   ├── mariadb/
│   ├── mongodb/
│   ├── mysql/
│   ├── postgres/
│   ├── redis/
│── logging/
│   ├── elk/ (Elasticsearch, Logstash, Kibana)
│── monitoring/
│   ├── cAdvisor/
│   ├── grafana/
│   ├── prometheus/
│   ├── redis-exporter/
│── mq/
│   ├── rabbitmq/
│── programming/
│   ├── node/
│   │   ├── nestjs/
│   │   ├── nebular/
│── webserver/
│   ├── nginx/
│── docker-compose.yml
│── .env
│── README.md
```

## 🚀 Instalación y Uso

### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/tu_usuario/DockerDevEnv.git
cd DockerDevEnv
```

## 📌 Notas
- Cada grupo de servicios cuenta con un archivo make para una instalación más sencilla.

