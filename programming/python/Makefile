PROJECT_NAME = app-python
CONTAINER_NAME = ${PROJECT_NAME}-container

default:
	@echo "Bienvenido a ${PROJECT_NAME}"

up: ## Inicializar contenedor de nebular
	cd ./.docker && docker-compose up

down: ## Bajar contenedor de nebular
	cd ./.docker && docker-compose down

stop: ## Detiene el contenedor
	@docker stop ${CONTAINER_NAME}

logs: ## Muestra los logs cuando el contenedor esta activo
	@docker logs -f ${CONTAINER_NAME}

status: ## Muestra los contenedores activos e inactivos
	@docker ps -a

shell: ## Ingresa al shell del contenedor activo
	@docker exec -it $(CONTAINER_NAME) sh

first-install: ## Levanta el proyecto en local
	$(MAKE) install-env-docker 
	$(MAKE) build-debug

destroy:  ## Limpia el proyecto completo
	$(MAKE) node-env-clear
	$(MAKE) docker-prune
	$(MAKE) clean-env-docker
	$(MAKE) clean-images

# --------------------------------

clean-images:
	@docker image ls --filter "dangling=true" --quiet | xargs --no-run-if-empty docker image rm

docker-prune:
	@docker system prune -f --volumes --filter "label=com.docker.compose.project=${PROJECT_NAME}"
	@docker image ls --filter "reference=*${PROJECT_NAME}*" --quiet | xargs --no-run-if-empty docker image rm

install-env-docker:
	@cp -f .docker/.env.sample .docker/.env

clean-env-docker:
	@if [ -f ./.docker/.env ]; then echo "Eliminando .docker/.env..."; rm -f ./.docker/.env; fi

python-env-clear:
	@if [ -f /.docker/.env ]; then 	echo "- Detiene el contenedor $(CONTAINER_NAME)"; @docker stop ${CONTAINER_NAME};\
		echo "- Elimina el contenedor $(CONTAINER_NAME)"; @docker rm -f ${CONTAINER_NAME}; fi


# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'