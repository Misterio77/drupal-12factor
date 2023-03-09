#!/usr/bin/env bash

# Serves the website. By default, will serve the PHP app at localhost:8080 and
# the public files at localhost:8081

# DRUPAL_PROJECT_PATH and DRUPAL_DATA_PATH have sane defaults and are overridable.

set -euo pipefail

main_port="${1:-"8080"}"
files_port="${2:-"8081"}"

function require_cmd() {
  if ! which $1 &> /dev/null; then
    echo "You need $1 to run this script."
    exit 1
  fi
}

require_cmd "webfsd"
require_cmd "php"

# Fallback to where this script is (probably where the code is)
DRUPAL_PROJECT_PATH="${DRUPAL_PROJECT_PATH:-"$(dirname "$(realpath -s "$0")")"}"
# Fallback to where the runner is (probably where they want to store data)
DRUPAL_DATA_PATH="${DRUPAL_DATA_PATH:-"$(pwd)/data"}"

if [ ! -d "$DRUPAL_PROJECT_PATH/vendor" ]; then
  echo "Vendor dir $DRUPAL_PROJECT_PATH/vendor does not exist."
  echo "Run 'composer install' first."
  exit 1
fi

# Serve public data files with webfs, if DRUPAL_FILE_PUBLIC_BASE_URL is not already set.
if [ -z "${DRUPAL_FILE_PUBLIC_BASE_URL:-}" ]; then
  webfsd -F -p $files_port -r "$DRUPAL_DATA_PATH/public" &
  DRUPAL_FILE_PUBLIC_BASE_URL="http://localhost:$files_port"
  echo "File server running ($DRUPAL_FILE_PUBLIC_BASE_URL)"
fi

export DRUPAL_PROJECT_PATH DRUPAL_DATA_PATH DRUPAL_FILE_PUBLIC_BASE_URL;
php -S "localhost:$main_port" -t "$DRUPAL_PROJECT_PATH/web/" &

trap 'kill $(jobs -p -r)' SIGINT
wait
