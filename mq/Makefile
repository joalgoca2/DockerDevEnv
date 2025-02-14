default:
	@echo ""
	@echo "Uso: make set-network"
	@echo "Uso: make up-[servicio] "
	@echo "Uso: make down-[servicio] "
	@echo "Uso: make stop-[servicio] "
	@echo ""
	@echo "Servicios: "
	@echo "   - rabbitmq"
	@echo ""

set-network:
	cd ./development-network && sudo docker-compose up -d

up-rabbitmq: ## Inicializar contenedor de nginx
	cd ./rabbitmq-container && sudo docker-compose up -d

stop-rabbitmq: ## Detener contenedor de nginx
	cd ./rabbitmq-container && sudo docker-compose stop

down-rabbitmq: ## Bajar contenedor de nginx
	cd ./rabbitmq-container && sudo docker-compose down

# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'