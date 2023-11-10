#!/bin/sh
#
# Simple script to run php-fpm and caddy
# It also sets DRUPAL_DATA_PATH and cd's into the project

export DRUPAL_DATA_PATH="${DRUPAL_DATA_PATH-"$(pwd)/data"}"
pushd "$(dirname -- "$0")"

php-fpm -y php-fpm.conf &
caddy run &

trap 'kill $(jobs -p)' EXIT
wait
