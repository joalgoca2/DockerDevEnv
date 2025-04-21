# Makefile para gestionar el entorno de desarrollo de LLMs con Docker Compose

# Evita conflictos con archivos llamados igual que los targets
.PHONY: help up down stop logs build clean shell pull list-models

# Target por defecto: muestra la ayuda
.DEFAULT_GOAL := help

# Ayuda: Muestra los comandos disponibles
help:
	@echo "Gestión del Entorno de Desarrollo LLM:"
	@echo "---------------------------------------"
	@echo "Uso: make [comando]"
	@echo ""
	@echo "Comandos disponibles:"
	@echo "  up           - Inicia los contenedores (construye si es necesario) en segundo plano."
	@echo "  down         - Detiene y elimina los contenedores y redes."
	@echo "  stop         - Detiene los contenedores sin eliminarlos."
	@echo "  logs         - Muestra y sigue los logs de todos los servicios."
	@echo "  build        - Construye o reconstruye las imágenes Docker."
	@echo "  clean        - Detiene y elimina contenedores, redes Y VOLÚMENES (¡elimina modelos!)."
	@echo "  shell        - Accede a un shell bash dentro del contenedor 'llm_dev_container'."
	@echo "  shell-ollama - Accede a un shell bash dentro del contenedor 'ollama_container'."
	@echo "  list-models  - Lista los modelos descargados por el servicio Ollama."
	@echo "  pull model=<name> - Descarga un modelo usando Ollama (ej: make pull model=phi3:mini)."
	@echo "  help         - Muestra este mensaje de ayuda."

# Iniciar el entorno
up:
	@echo "Levantando el entorno Docker Compose (con build si es necesario)..."
	docker-compose up --build -d
	@echo "Entorno iniciado. Accede a Jupyter Lab en http://localhost:8888"

# Detener y eliminar contenedores/redes (sin eliminar volúmenes)
down:
	@echo "Deteniendo y eliminando contenedores y redes..."
	docker-compose down

# Solo detener contenedores
stop:
	@echo "Deteniendo contenedores..."
	docker-compose stop

# Ver logs
logs:
	@echo "Mostrando logs (Presiona Ctrl+C para detener)..."
	docker-compose logs -f

# Construir/reconstruir imágenes
build:
	@echo "Construyendo imágenes Docker..."
	docker-compose build

# Limpieza completa (incluyendo volúmenes - ¡CUIDADO!)
clean: down # Asegura que esté detenido antes de limpiar volúmenes
	@echo "Limpiando todo: contenedores, redes y volúmenes (¡se borrarán los modelos descargados!)..."
	docker-compose down -v --remove-orphans
	@echo "Limpieza completa finalizada."

# Acceder al shell del contenedor de desarrollo
shell:
	@echo "Accediendo al shell del contenedor 'llm_dev_container'..."
	docker-compose exec llm_dev_container bash

# Acceder al shell del contenedor de desarrollo de ollama
shell-ollama:
	@echo "Accediendo al shell del contenedor 'ollama_container'..."
	docker-compose exec ollama_container bash

# Listar modelos descargados por Ollama
list-models:
	@echo "Listando modelos en el servicio Ollama..."
	docker-compose exec ollama_container ollama list

# Descargar un modelo con Ollama (requiere pasar el nombre del modelo)
# Uso: make pull model=nombre-del-modelo:tag
pull:
ifndef model
	$(error Por favor, especifica el modelo a descargar. Uso: make pull model=<nombre>:<tag>)
endif
	@echo "Descargando modelo '$(model)' usando Ollama..."
	docker-compose exec ollama_container ollama pull $(model)
	@echo "Comando de descarga para '$(model)' ejecutado."