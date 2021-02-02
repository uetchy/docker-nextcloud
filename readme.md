# Docker Nextcloud

Based on [evertramos/docker-nextcloud-letsencrypt](https://github.com/evertramos/docker-nextcloud-letsencrypt), plus:

- build-time uid/gid conversion
- thumbnail generation for PDF, Affinity Photo, and Affinity Design
- built-in collabora server (https://<domain>/collabora)
- performance improvements

# usage

## installation

```bash
cp .env.sample .env
vim .env # fill the blank variables
make # pull, build, start
make applypatches # run only once
```

## logging

```
docker-compose logs -f app
tail -f <data_dir>/nextcloud.log | jq .
```

## occ

```
./occ
```

# configuration

## monkeypatch

Adds thumbnail generation capability for:

- PDF `.pdf`
- Affinity Photo `.afphoto`
- Affinity Design `.afdesign`

```bash
# after installation
./patches/apply.sh
```

```php config.php
'enabledPreviewProviders' =>
  array (
    1 => 'OC\\Preview\\PDF',
    2 => 'OC\\Preview\\Affinity',
    ...
  ),
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
