# nextcloud/docker

https://github.com/nextcloud/docker

# bootstrap

```
cp db.env.sample db.env
cp .env.sample .env
make
```

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

Add thumbnail generation capability for PDF.

```
patch data/app/lib/prviate/Preview/PDF.php < patches/PDF.patch
patch data/app/lib/prviate/PreviewManager.php < patches/PreviewManager.patch
```