default:
	@echo ""
	@echo "Uso: make set-network"
	@echo "Uso: make up-[servicio]-[dev|prod] "
	@echo "Uso: make build-[servicio] "
	@echo "Uso: make down-[servicio]-[dev|prod]  "
	@echo "Uso: make stop-[servicio]-[dev|prod]  "
	@echo ""
	@echo "Servicios: "
	@echo "   - nestjs-dev"
	@echo ""

up-nestjs-dev: ## Inicializar contenedor de nestjs
	cd ./.docker && docker-compose up -d

build-nestjs: ## Construir contenedor de nestjs
	cd ./.docker && docker-compose build

up-nestjs-prod: ## Inicializar contenedor de nestjs
	cd ./.docker && docker-compose up -d

stop-nestjs: ## Detener contenedor de nestjs
	cd ./.docker && docker-compose stop

down-nestjs: ## Bajar contenedor de nestjs
	cd ./.docker && docker-compose down

# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'