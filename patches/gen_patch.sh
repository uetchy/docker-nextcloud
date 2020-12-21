#!/bin/sh

docker run --rm -v $PWD/data/app/lib:/local_lib:ro -w /local_lib -it nextcloud:fpm-alpine diff -ruN /usr/src/nextcloud/lib/ . > patches/mod.patch