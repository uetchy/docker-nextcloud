# nextcloud/docker

Based on https://github.com/nextcloud/docker.

# bootstrap

```
cp db.env.sample db.env
cp .env.sample .env
make
```

# occ

```
./occ
```

# Tweak PHP

```
/usr/local/etc/php
/usr/local/etc/php/conf.d/docker-php-ext-apcu.ini,
/usr/local/etc/php/conf.d/docker-php-ext-bcmath.ini,
/usr/local/etc/php/conf.d/docker-php-ext-exif.ini,
/usr/local/etc/php/conf.d/docker-php-ext-gd.ini,
/usr/local/etc/php/conf.d/docker-php-ext-gmp.ini,
/usr/local/etc/php/conf.d/docker-php-ext-imagick.ini,
/usr/local/etc/php/conf.d/docker-php-ext-intl.ini,
/usr/local/etc/php/conf.d/docker-php-ext-ldap.ini,
/usr/local/etc/php/conf.d/docker-php-ext-memcached.ini,
/usr/local/etc/php/conf.d/docker-php-ext-opcache.ini,
/usr/local/etc/php/conf.d/docker-php-ext-pcntl.ini,
/usr/local/etc/php/conf.d/docker-php-ext-pdo_mysql.ini,
/usr/local/etc/php/conf.d/docker-php-ext-pdo_pgsql.ini,
/usr/local/etc/php/conf.d/docker-php-ext-redis.ini,
/usr/local/etc/php/conf.d/docker-php-ext-sodium.ini,
/usr/local/etc/php/conf.d/docker-php-ext-zip.ini,
/usr/local/etc/php/conf.d/memory-limit.ini,
/usr/local/etc/php/conf.d/opcache-recommended.ini,
/usr/local/etc/php/conf.d/redis-session.ini

/usr/local/php/php/fpm
/usr/local/etc/php-fpm.d
/usr/local/etc/php-fpm.conf

php-fpm -i

upload_max_filesize=10G
post_max_size=10G
memory_limit=20G
```

# CSRF check failed issue

Add this lines to `config/config.php`:

```
'overwrite.cli.url' => 'https://<domain>',
'overwriteprotocol' => 'https',
```

# Fix permissions

```
chown -R www-data:root data/app
```

# Large files

https://docs.nextcloud.com/server/13/admin_manual/configuration_files/big_file_upload_configuration.html

# Reset locked state

```
./occ maintenance:mode --on
dc exec db bash
mysql -u root -p
use cloud_db
delete from oc_file_locks where 1;
./occ maintenance:mode --off
```

# Monkeypatch

Additional thumbnail generation capability.

- PDF
- Affinity Photo
- Affinity Design

```bash
# after installation
./patches/apply.sh
```
