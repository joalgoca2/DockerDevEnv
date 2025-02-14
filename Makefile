default:
	@echo ""
	@echo "Uso: make set-network"
	@echo "Uso: make down-network"
	@echo ""
	@echo "Servicios: "
	@echo "   - development-network"
	@echo ""

set-network: ## Inicializar contenedor de hello y levantar red de desarrollo
	cd ./development-network && sudo docker-compose up -d

down-network: ## Bajar contenedor hello y eliminar red de desarrollo
	cd ./development-network && sudo docker-compose down

# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'