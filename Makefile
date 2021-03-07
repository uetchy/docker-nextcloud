update: build pull backup start

restart: stop start

backup:
	cp -rp data data-bkup-$(date +%s)

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

