default:
	@echo ""
	@echo "Uso: make set-network"
	@echo "Uso: make up-[servicio] "
	@echo "Uso: make down-[servicio] "
	@echo "Uso: make stop-[servicio] "
	@echo ""
	@echo "Servicios: "
	@echo "   - tensorflow"
	@echo ""


up-tensorflow: ## Inicializar contenedor de tensorflow
	cd ./tensorflow-container && sudo docker-compose up -d

stop-tensorflow: ## Detener contenedor de tensorflow
	cd ./tensorflow-container && sudo docker-compose stop

down-tensorflow: ## Bajar contenedor de tensorflow
	cd ./tensorflow-container && sudo docker-compose down

# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'