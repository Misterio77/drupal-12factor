FROM alpine:3.19.1
USER root
RUN apk add --no-cache \
  patch \
  caddy \
  sqlite \
  curl \
  php81 \
  php81-curl \
  php81-dom \
  php81-fpm \
  php81-gd \
  php81-mbstring \
  php81-iconv \
  php81-opcache \
  php81-pdo_mysql \
  php81-pdo_pgsql \
  php81-pdo_sqlite \
  php81-phar \
  php81-session \
  php81-simplexml \
  php81-tokenizer \
  php81-xml \
  php81-xmlwriter

RUN ln -sf /usr/sbin/php-fpm81 /usr/sbin/php-fpm
RUN ln -sf /usr/bin/php81 /usr/bin/php

# Set up composer
RUN curl -s https://raw.githubusercontent.com/composer/getcomposer.org/9f6b66d/web/installer | php -- --version="2.7.3" --filename="/usr/bin/composer"

# First download deps but don't do anything
# This makes it so that the cache does not depend on "web"
WORKDIR /app
COPY composer.json composer.lock /app/
RUN composer install --no-interaction --no-progress --download-only
# Then, copy web and do the scaffolding
COPY web /app/web
COPY patches /app/patches
RUN composer install --no-interaction --no-progress --optimize-autoloader && rm ~/.composer/cache -r
# Copy everything else
COPY php-fpm.conf Caddyfile /app/
COPY bin /app/bin

# Make read-only
RUN chmod -R a-w /app
# We won't mutate anything, so create a user to drop privileges
RUN adduser -D -h /data drupal
USER drupal

ENV DRUPAL_DATA_PATH=/data
VOLUME /data

ENV DRUPAL_WEB_PORT=8080
EXPOSE 8080

ENV PATH="${PATH}:/app/vendor/bin:/app/bin"

CMD ["/app/bin/serve"]
