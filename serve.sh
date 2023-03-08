#!/usr/bin/env bash

main_port="${1:-"8080"}"
files_port="${2:-"8081"}"

if ! command -v webfsd &> /dev/null; then
  echo "You need webfsd to run this. Try 'nix develop'."
  exit 1
fi

if ! command -v php &> /dev/null; then
  echo "You need php to run this. Try 'nix develop'."
  exit 1
fi

export DRUPAL_PROJECT_PATH="${DRUPAL_PROJECT_PATH:-"$(dirname "$(realpath -s "$0")")"}"
export DRUPAL_DATA_PATH="${DRUPAL_DATA_PATH:-"$DRUPAL_PROJECT_PATH/data"}"

if [ ! -d "$DRUPAL_DATA_PATH" ]; then
  echo "Data dir $DRUPAL_DATA_PATH does not exist."
  echo "Running 'drush site:install' for you."
  drush --root "$DRUPAL_PROJECT_PATH" si
fi

webfsd -F -p $files_port -r "$DRUPAL_DATA_PATH/public" &

export DRUPAL_FILE_PUBLIC_BASE_URL="http://localhost:$files_port"
echo "File server running ($DRUPAL_FILE_PUBLIC_BASE_URL)"

php -S "localhost:$main_port" -t "$DRUPAL_PROJECT_PATH/web/" &

trap 'kill $(jobs -p -r)' SIGINT
wait
