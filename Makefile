start:
	docker-compose up -d --build

stop:
	docker-compose down

pull:
	docker-compose pull

restart: stop start
update: stop pull start
