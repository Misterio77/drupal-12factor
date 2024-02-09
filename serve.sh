#!/bin/sh

export DRUPAL_APP_ROOT=${DRUPAL_APP_ROOT:-"$(dirname -- "$0")"}

php-fpm -y "$DRUPAL_APP_ROOT/php-fpm.conf" &
caddy run --config "$DRUPAL_APP_ROOT/Caddyfile" &

trap 'kill $(jobs -p)' EXIT
wait
