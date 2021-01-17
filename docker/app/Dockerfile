FROM nextcloud:fpm-alpine

# PDF and Movie support
RUN apk add --no-cache \
  ffmpeg \
  ghostscript

# optimize PHP-FPM
COPY fpm.conf /usr/local/etc/php-fpm.d/zz-pm.conf

# HEIC support
# https://eplt.medium.com/5-minutes-to-install-imagemagick-with-heic-support-on-ubuntu-18-04-digitalocean-fe2d09dcef1
RUN apk add --no-cache git build-base autoconf automake libtool libjpeg-turbo-dev libpng-dev libxml2-dev opencl-headers

RUN git clone https://github.com/strukturag/libde265.git /usr/src/libde265
RUN git clone https://github.com/strukturag/libheif.git /usr/src/libheif
RUN git clone https://github.com/ImageMagick/ImageMagick.git /usr/src/imagemagick

WORKDIR /usr/src/libde265
RUN ./autogen.sh
RUN ./configure
RUN make -j`nproc`
RUN make install

WORKDIR /usr/src/libheif
RUN ./autogen.sh
RUN ./configure
RUN make -j`nproc`
RUN make install

WORKDIR /usr/src/imagemagick
RUN git checkout 7.0.10-56
RUN ./configure
RUN make -j`nproc`
RUN make install

WORKDIR /var/www/html

RUN rm -rf /usr/src/libde265 /usr/src/libheif /usr/src/imagemagick