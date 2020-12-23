FROM nextcloud:fpm-alpine

RUN apk add --no-cache \
  ffmpeg \
  ghostscript

COPY fpm.conf /usr/local/etc/php-fpm.d/zz-pm.conf