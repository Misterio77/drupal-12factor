#!/usr/bin/env bash

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

# Default to where this script is (probably where the code is)
DRUPAL_PROJECT_PATH="${DRUPAL_PROJECT_PATH:-"$(dirname "$(realpath -s "$0")")"}"
# Default to where the runner is (probably where they want to store data)
DRUPAL_DATA_PATH="${DRUPAL_DATA_PATH:-"$(pwd)/data"}"

# Change to the project path, to use composer and drush without having to specify it every time
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

# Serve public data files with webfs
webfsd -F -p $files_port -r "$DRUPAL_DATA_PATH/public" &
DRUPAL_FILE_PUBLIC_BASE_URL="http://localhost:$files_port"
echo "File server running ($DRUPAL_FILE_PUBLIC_BASE_URL)"

# Start drupal application, export the variables to it
export DRUPAL_PROJECT_PATH DRUPAL_DATA_PATH DRUPAL_FILE_PUBLIC_BASE_URL;
php -S "localhost:$main_port" -t "$DRUPAL_PROJECT_PATH/web/" &


# Go back to where we were
popd

# Kill both backgrounded jobs when exiting
trap 'kill $(jobs -p -r)' SIGINT
# Wait backgrounded jobs to finish
wait
