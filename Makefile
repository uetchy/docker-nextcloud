start:
	docker-compose up -d --build

stop:
	docker-compose down --remove-orphans

pull:
	docker-compose pull

git-update:
	git pull --rebase

restart: stop start
update: stop git-update pull start
