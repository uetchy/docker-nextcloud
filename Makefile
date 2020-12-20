start:
	docker-compose up -d

stop:
	docker-compose down

pull:
	docker-compose pull

build:
	docker-compose build --pull

restart: stop start
update: stop pull build start
