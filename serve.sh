#!/usr/bin/env bash

set -e

main_port="${1:-"8080"}"
files_port="${2:-"8081"}"

function require_cmd() {
  if ! which $1 &> /dev/null; then
    echo "You need $1 to run this script."
  fi
}

require_cmd "webfsd"
require_cmd "php"

here="$(dirname "$(realpath -s "$0")")"
DRUPAL_PROJECT_PATH="${DRUPAL_PROJECT_PATH:-$here}"
DRUPAL_DATA_PATH="${DRUPAL_DATA_PATH:-"$DRUPAL_PROJECT_PATH/data"}"

pushd "$DRUPAL_PROJECT_PATH"

if [ ! -d "$DRUPAL_PROJECT_PATH/vendor" ]; then
  echo "Vendor dir $DRUPAL_PROJECT_PATH/vendor does not exist."
  echo "Running 'composer install'..."
  composer install
fi

if [ ! -d "$DRUPAL_DATA_PATH" ]; then
  echo "Data dir $DRUPAL_DATA_PATH does not exist."
  echo "Running 'drush si'..."
  composer exec drush si
fi


webfsd -F -p $files_port -r "$DRUPAL_DATA_PATH/public" &
DRUPAL_FILE_PUBLIC_BASE_URL="http://localhost:$files_port"
echo "File server running ($DRUPAL_FILE_PUBLIC_BASE_URL)"

export DRUPAL_PROJECT_PATH DRUPAL_DATA_PATH DRUPAL_FILE_PUBLIC_BASE_URL;
php -S "localhost:$main_port" -t "$DRUPAL_PROJECT_PATH/web/" &


popd
trap 'kill $(jobs -p -r)' SIGINT
wait
