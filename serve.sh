#!/usr/bin/env bash

files_port=8081
php_port=8080

export DRUPAL_PROJECT_PATH="$(dirname "$(realpath -s "$0")")"
export DRUPAL_FILE_PUBLIC_BASE_URL="http://localhost:$files_port"
export DRUPAL_FILE_PUBLIC_PATH="$DRUPAL_PROJECT_PATH/data/public"

if [ ! -d "$DRUPAL_FILE_PUBLIC_PATH" ]; then
  echo "You must install the site first. Try running 'drush si'"
  exit 1
fi

webfsd -F -p $files_port -r data/public/ &
php -S "localhost:$php_port" -t web/ &

wait
