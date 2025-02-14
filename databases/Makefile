#-------------------------------------

default:
	@echo ""
	@echo "Uso: make set-network"
	@echo "Uso: make up-[servicio] "
	@echo "Uso: make down-[servicio] "
	@echo "Uso: make stop-[servicio] "
	@echo ""
	@echo "Servicios: "
	@echo "   - mariadb"
	@echo "   - mongodb"
	@echo "   - mysql"
	@echo "   - postgres"
	@echo "   - redis"
	@echo ""

# -------------------------------------

up-mariadb: ## Levantar contenedor de mariadb
	cd ./mariadb-container && sudo docker-compose up -d

stop-mariadb: ## Detener contenedor de mariadb
	cd ./mariadb-container && sudo docker-compose stop

down-mariadb: ## Bajar y eliminar contenedor de mariadb
	cd ./mariadb-container && sudo docker-compose down

up-mongodb: ## Levantar contenedor de mongodb
	cd ./mongodb-container && sudo docker-compose up -d

stop-mongodb: ## Detener contenedor de mongodb
	cd ./mongodb-container && sudo docker-compose stop

down-mongodb: ## Bajar y eliminar contenedor de mongodb
	cd ./mongodb-container && sudo docker-compose down

up-mysql: ## Levantar contenedor de mysql
	cd ./mysql-container && sudo docker-compose up -d

stop-mysql: ## Detener contenedor de mysql
	cd ./mysql-container && sudo docker-compose stop

down-mysql: ## Bajar y eliminar contenedor de mysql
	cd ./mysql-container && sudo docker-compose down

up-redis: ## Levantar contenedor de redis
	cd ./redis-container && sudo docker-compose up -d

stop-redis: ## Detener contenedor de redis
	cd ./redis-container && sudo docker-compose stop

down-redis: ## Bajar y eliminar contenedor de redis
	cd ./redis-container && sudo docker-compose down

# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
