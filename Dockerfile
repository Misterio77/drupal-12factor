FROM composer:2.5.4 AS builder
WORKDIR /app
COPY composer.json composer.lock /app/
RUN composer install --no-interaction --no-progress --download-only
COPY web /app/web
RUN composer install --no-interaction --no-progress --optimize-autoloader

FROM trafex/php-nginx:3.0.0
USER root
RUN apk add --no-cache \
  sqlite \
  php81-simplexml \
  php81-tokenizer \
  php81-pdo_mysql \
  php81-pdo_sqlite \
  php81-pdo_pgsql
# Make sure nginx can access data
RUN addgroup nginx nobody
USER nobody
ENV PATH="$PATH:/app/vendor/bin"
WORKDIR /app
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY --chown=nginx --from=builder /app /app
