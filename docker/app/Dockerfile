ARG NEXTCLOUD_MAJOR_VERSION
FROM nextcloud:${NEXTCLOUD_MAJOR_VERSION}-fpm-alpine

# change uid/gid
RUN apk --no-cache add shadow
ARG PUID=82
ARG PGID=82
RUN usermod -u $PUID www-data
RUN groupmod -g $PGID www-data

# movies and PDF support
RUN apk add --no-cache \
  ffmpeg \
  ghostscript

# HEIC support
# https://eplt.medium.com/5-minutes-to-install-imagemagick-with-heic-support-on-ubuntu-18-04-digitalocean-fe2d09dcef1
RUN apk add --no-cache git build-base autoconf automake libtool libjpeg-turbo-dev libpng-dev libxml2-dev opencl-headers

RUN git clone https://github.com/strukturag/libde265.git /usr/src/libde265
RUN git clone https://github.com/strukturag/libheif.git /usr/src/libheif
RUN git clone https://github.com/ImageMagick/ImageMagick.git /usr/src/imagemagick

WORKDIR /usr/src/libde265
RUN git checkout v1.0.8
RUN ./autogen.sh
RUN ./configure
RUN make -j`nproc`
RUN make install

WORKDIR /usr/src/libheif
RUN git checkout v1.12.0
RUN ./autogen.sh
RUN ./configure
RUN make -j`nproc`
RUN make install

WORKDIR /usr/src/imagemagick
# must be same as the version from `php -i | grep 'Imagick compiled'`
RUN git checkout 7.0.11-13
RUN ./configure
RUN make -j`nproc`
RUN make install

WORKDIR /var/www/html

RUN rm -rf /usr/src/libde265 /usr/src/libheif /usr/src/imagemagick

# Additonal fonts
#COPY fonts/SourceHanSans.ttc /usr/share/fonts/

# optimize PHP
COPY php.ini /usr/local/etc/php/conf.d/zz-custom.ini

# optimize PHP-FPM
COPY fpm.conf /usr/local/etc/php-fpm.d/zz-custom.conf