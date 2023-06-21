# Dependency builder
FROM composer:2.5.4 AS builder
# First download deps but don't do anything
# This makes it so that the cache does not depend on "web"
WORKDIR /app
COPY composer.json composer.lock /app/
RUN composer install --no-interaction --no-progress --download-only
# Then, copy web and do the scaffolding
COPY web /app/web
RUN composer install --no-interaction --no-progress --optimize-autoloader

# Running environment
FROM alpine:3.18.2
USER root
RUN apk add --no-cache \
  caddy \
  sqlite \
  php81 \
  php81-dom \
  php81-fpm \
  php81-gd \
  php81-pdo_mysql \
  php81-pdo_pgsql \
  php81-pdo_sqlite \
  php81-session \
  php81-simplexml \
  php81-tokenizer \
  php81-xml
RUN ln -s /usr/sbin/php-fpm81 /usr/sbin/php-fpm

# Copy everything (as root)
ENV DRUPAL_PROJECT_ROOT=/app
COPY --from=builder /app /app
COPY php-fpm.conf Caddyfile /app/
COPY bin/* /app/bin/

# We won't mutate anything, so drop privileges
RUN adduser -D -h /data drupal
USER drupal

VOLUME /data
ENV DRUPAL_DATA_PATH=/data

# Add our scripts to PATH
ENV PATH="$PATH:/app/bin"

ENV DRUPAL_WEB_PORT=8080
EXPOSE 8080

CMD ["/app/bin/serve"]
