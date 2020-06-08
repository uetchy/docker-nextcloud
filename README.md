# nextcloud/docker

https://github.com/nextcloud/docker

# docker-compose.yml example

https://github.com/nextcloud/docker/blob/master/.examples/docker-compose/with-nginx-proxy/mariadb/apache/docker-compose.yml

# occ

```
docker-compose exec --user www-data cloud-app php occ
```

# CSRF check failed issue

Add this lines to `config/config.php`:

```
'overwrite.cli.url' => 'https://cloud.uechi.io',
'overwriteprotocol' => 'https',
```

# Fix permissions

```
chown -R www-data:root data/cloud
```

# Large files

https://docs.nextcloud.com/server/13/admin_manual/configuration_files/big_file_upload_configuration.html

add lines to cond.d/uploadsize.conf

```
fastcgi_request_buffering off;
proxy_read_timeout 3600;
proxy_send_timeout 3600;
fastcgi_read_timeout 3600;
fastcgi_send_timeout 3600;
```
