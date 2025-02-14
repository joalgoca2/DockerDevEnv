default:
	@echo ""
	@echo "Uso: make set-network"
	@echo "Uso: make up-[servicio] "
	@echo "Uso: make down-[servicio] "
	@echo "Uso: make stop-[servicio] "
	@echo ""
	@echo "Servicios: "
	@echo "   - nginx"
	@echo ""

up-nginx: ## Inicializar contenedor de nginx
	cd ./nginx-container && sudo docker-compose up -d

stop-nginx: ## Detener contenedor de nginx
	cd ./nginx-container && sudo docker-compose stop

down-nginx: ## Bajar contenedor de nginx
	cd ./nginx-container && sudo docker-compose down

# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'