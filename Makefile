.PHONY: up down logs sh-filebeat init-kibana init-filebeat
up:
	docker-compose up -d --build
down:
	docker-compose down -v
logs:
	docker-compose logs
sh-filebeat:
	docker-compose exec filebeat bash
init-kibana:
	curl -XPOST -D- 'http://localhost:5601/api/saved_objects/index-pattern' \
		-H 'Content-Type: application/json' \
		-H 'kbn-version: 7.9.2' \
		-d '{"attributes":{"title":"logstash-*","timeFieldName":"@timestamp"}}'
init-filebeat: ## Init kibana/elasticsearch
	docker-compose exec filebeat filebeat -e -strict.perms=false setup
