
FROM php:8.2-apache

# persistent dependencies
RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    ghostscript \
    vim \
    zip \
    unzip \
    sudo \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libmagickwand-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev

# install the PHP extensions we need (https://make.wordpress.org/hosting/handbook/handbook/server-environment/#php-extensions)
RUN set -ex; \
  docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
    --with-webp \
  ; \
  docker-php-ext-install -j "$(nproc)" \
    bcmath \
    exif \
    gd \
    intl \
    mysqli \
    zip \
  ; \
  pecl install imagick-3.6.0; \
  docker-php-ext-enable imagick; \
  rm -r /tmp/pear

COPY apache.conf /etc/apache2/conf-available/sugar.conf
COPY php.ini /usr/local/etc/php/conf.d/sugar.ini

RUN set -eux; \
  a2enmod rewrite expires ; \
  a2enconf sugar

COPY docker-entrypoint.sh /usr/local/bin/ 

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
