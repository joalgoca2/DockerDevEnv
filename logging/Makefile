default:
	@echo ""
	@echo "Uso: make help"
	@echo "Uso: make up-[servicio] "
	@echo "Uso: make down-[servicio] "
	@echo "Uso: make stop-[servicio] "
	@echo ""
	@echo "Servicios: "
	@echo "   - elk (Elastichsearch, logstash, kibana)"


# --------------------------------
# Despliegue de elk
# --------------------------------

up-elk: ## Despliegue de elk
	cd ./elk && sudo docker-compose up -d
	docker ps

stop-elk: ## Parar contenedor de elk
	cd ./elk && sudo docker-compose stop

down-elk: ## Detener contenedor de elk
	@echo "=> Bajando contenedor de elasticsearch"
	cd ./elk && sudo docker-compose down
	@echo "=> Lista de contenedores activos"
	docker ps
	@echo "=> Lista de imagenes"
	docker images

# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'