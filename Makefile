update: build pull dbdump stop copydata start

restart: stop start

copydata:
	cp -rp data data-backup-$$(date +%s)

dbdump:
	docker-compose exec db mysqldump -u root --password=${MYSQL_ROOT_PASSWORD} nextcloud > nextcloud-$$(date +%s).dump

restore:
	docker-compose exec -T db mysql -u root --password=${MYSQL_ROOT_PASSWORD} nextcloud < nextcloud-*.dump

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
