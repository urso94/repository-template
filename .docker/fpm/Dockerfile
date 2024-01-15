FROM php:8.2-fpm-alpine  AS base

ENV NEWUSER='dev'

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY config/php/memory.ini /usr/local/etc/php/conf.d/memory.ini
COPY config/crontasks /var/spool/cron/crontabs/root
COPY config/fpm/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY config/supervisor/start.ini /etc/supervisor.d/start.ini

RUN apk add --no-cache $PHPIZE_DEPS oniguruma-dev sudo supervisor
RUN adduser -D -g "${NEWUSER}" $NEWUSER
RUN echo "$NEWUSER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$NEWUSER && chmod 0440 /etc/sudoers.d/$NEWUSER
RUN docker-php-ext-install pdo_mysql mbstring bcmath

FROM base as dev

COPY config/php/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN apk add --no-cache openssl-dev linux-headers
RUN pecl install xdebug-3.2.2
RUN docker-php-ext-enable xdebug


FROM base as prod

COPY config/opcache.ini /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

RUN docker-php-ext-install opcache
RUN docker-php-ext-configure opcache --enable-opcache
RUN docker-php-ext-enable opcache

