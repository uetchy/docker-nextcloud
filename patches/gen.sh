#!/bin/sh

docker run --rm -v $PWD/data/app/lib:/local_lib:ro -w /local_lib -it nextcloud:${NEXTCLOUD_MAJOR_VERSION}-fpm-alpine diff -r -N /usr/src/nextcloud/lib/ . > patches/lib.patch
docker run --rm -v $PWD/data/app/resources:/local_resources:ro -w /local_resources -it nextcloud:${NEXTCLOUD_MAJOR_VERSION}-fpm-alpine diff -r -N /usr/src/nextcloud/resources/ . > patches/resources.patch
docker run --rm -v $PWD/data/app/core:/local_resources:ro -w /local_resources -it nextcloud:${NEXTCLOUD_MAJOR_VERSION}-fpm-alpine diff -r -N /usr/src/nextcloud/core/ . > patches/core.patch