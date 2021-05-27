update: build pull backup start

restart: stop start

backup:
	cp -rp data data-backup-$$(date +%s)

start:
	docker-compose up -d

stop:
	docker-compose down

pull:
	docker-compose pull

build:
	docker-compose build --pull

applypatches:
	bash ./patches/apply.sh

logs:
	docker-compose logs -f --tail=100 app

fixweb:
	docker-compose stop web
	docker-compose start web
