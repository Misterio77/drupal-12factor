FROM alpine:3.18.2
USER root
RUN apk add --no-cache \
  patch \
  caddy \
  sqlite \
  composer \
  php81 \
  php81-dom \
  php81-fpm \
  php81-gd \
  php81-opcache \
  php81-pdo_mysql \
  php81-pdo_pgsql \
  php81-pdo_sqlite \
  php81-session \
  php81-simplexml \
  php81-tokenizer \
  php81-xml \
  php81-xmlwriter

RUN ln -s /usr/sbin/php-fpm81 /usr/sbin/php-fpm

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
COPY php-fpm.conf Caddyfile serve.sh /app/

# We won't mutate anything, so create a user to drop privileges
RUN adduser -D -h /data drupal
USER drupal

ENV DRUPAL_DATA_PATH=/data
VOLUME /data

ENV DRUPAL_WEB_PORT=8080
EXPOSE 8080

ENV PATH="${PATH}:/app:/app/vendor/bin"

CMD ["/app/serve.sh"]
