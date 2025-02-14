default:
	@echo ""
	@echo "Uso: make set-network"
	@echo "Uso: make up-[servicio]-[dev|prod] "
	@echo "Uso: make build-[servicio] "
	@echo "Uso: make down-[servicio]-[dev|prod]  "
	@echo "Uso: make stop-[servicio]-[dev|prod]  "
	@echo ""
	@echo "Servicios: "
	@echo "   - nebular-dev"
	@echo ""

up-nebular: ## Inicializar contenedor de nebular
	cd ./.docker && docker-compose up -d

build-nebular: ## Construir contenedor de nebular
	cd ./.docker && docker-compose build

up-nebular-prod: ## Inicializar contenedor de nebular
	cd ./.docker && docker-compose up -d

stop-nebular: ## Detener contenedor de nebular
	cd ./.docker && docker-compose stop

down-nebular: ## Bajar contenedor de nebular
	cd ./.docker && docker-compose down

# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'