default:
	@echo ""
	@echo "Uso: make set-network"
	@echo "Uso: make up-[servicio] "
	@echo "Uso: make down-[servicio] "
	@echo "Uso: make stop-[servicio] "
	@echo ""
	@echo "Servicios: "
	@echo "   - monitor (Redis, redis exporter, prometheus, grafana)"
	@echo "   - cAdvisor"
	@echo ""

up-monitor: ## Despliegue de Redis, redis exporter, prometheus, grafana
	cd ./monitor/prometheus-container && sudo docker-compose up -d
	cd ./monitor/grafana-container && sudo docker-compose up -d
	cd ./monitor/redis-monitor-container && sudo docker-compose up -d
	cd ./monitor/redis-exporter-container && sudo docker-compose up -d
	sudo docker ps

stop-monitor: ## Detener Redis, redis exporter, prometheus, grafana
	cd ./monitor/prometheus-container && sudo docker-compose stop
	cd ./monitor/grafana-container && sudo docker-compose stop
	cd ./monitor/redis-monitor-container && sudo docker-compose stop
	cd ./monitor/redis-exporter-container && sudo docker-compose stop

down-monitor: ## Bajar Redis, redis exporter, prometheus, grafana
	cd ./monitor/redis-monitor-container && sudo docker-compose down
	cd ./monitor/redis-exporter-container && sudo docker-compose down
	cd ./monitor/prometheus-container && sudo docker-compose down
	cd ./monitor/grafana-container && sudo docker-compose down
	sudo docker ps

up-cAdvisor: ## Despliegue de cAdvisor
	cd ./cAdvisor-container && sudo docker-compose up -d
	sudo docker ps

stop-cAdvisor: ## Detener de cAdvisor
	cd ./cAdvisors-container && sudo docker-compose stop

down-cAdvisor: ## Bajar de cAdvisor
	cd ./cAdvisor-container && sudo docker-compose down
	sudo docker ps


# -------------------------------------
.PHONY: help
help: ## Comando de ayuda
	@fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'