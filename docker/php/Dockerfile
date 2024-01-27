
# Not authorized for use outside the EPAM challage.
#
# Copyright Mario Yepes <marioy47@gmail.com> 2024

FROM php:8.2-apache

# Required Linux Packages
RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    ghostscript \
    vim \
    zip \
    unzip \
    sudo \
    rsync \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libmagickwand-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev

# PHP Extensions
RUN set -ex; \
  docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp ; \
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

RUN set -eux; \
	docker-php-ext-enable opcache; \
	{ \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini


RUN set -eux; \
  a2enmod rewrite expires ;

COPY sugar-installer.sh /usr/local/bin/
ENTRYPOINT ["sugar-installer.sh"]
CMD ["apache2-foreground"]
