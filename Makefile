start:
	docker-compose up -d --force

stop:
	docker-compose down

pull:
	docker-compose pull

build:
	docker-compose build --pull

logs:
	docker-compose logs -f --tail=100 app

restart: stop start
update: build pull start
