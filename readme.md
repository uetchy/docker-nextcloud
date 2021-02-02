# nextcloud/docker

Based on https://github.com/nextcloud/docker, plus:

- support for nginx-proxy + let's encrypt companion stack
- build-time uid/gid conversion
- optimal for a server with large memory and performant cpus
- thumbnail generation for PDF, Affinity Photo, and Affinity Design
- built-in collabora server (https://<domain>/collabora)

# setup

## installation

```
cp .env.sample .env
vim .env
make
```

## monkeypatch

Adds thumbnail generation capability for:

- PDF `.pdf`
- Affinity Photo `.afphoto`
- Affinity Design `.afdesign`

```bash
# after installation
./patches/apply.sh
```

# configuration

## occ

```
./occ
```

## logging

```
docker-compose logs -f app
tail -f <data_dir>/nextcloud.log | jq .
```

## Tweak PHP

```
/usr/local/etc/php/conf.d/*
/usr/local/php/php/fpm

php -r 'phpinfo();'
php-fpm -i
```

## CSRF check failed issue

Add this lines to `config/config.php`:

```
'overwrite.cli.url' => 'https://<domain>',
'overwriteprotocol' => 'https',
```

## Reset locked state

```
./occ maintenance:mode --on
docker-compose exec db bash
```

```
mysql -u root -p
use cloud_db
delete from oc_file_locks where 1;
```

```
./occ maintenance:mode --off
```
