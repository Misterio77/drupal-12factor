<?php

# This configuration is my attempt to make it possible to separate state from a
# built drupal website artifact (source code + dependencies).

# This helps with packaging the website for Docker, Nix, etc.

# Everything has sane defaults, and is configurable through environment variables.
# I did as much as I could to avoid mixing source code (such as this) with secrets and data.

use Drupal\Component\Utility\Crypt;

# Mutable data path
# Default to a "data" directory in the project root path
$data_path = getenv('DRUPAL_DATA_PATH') ?: realpath('../') . '/data';
# Make sure it exists, ignore errors
@mkdir($data_path);

# Use sqlite by default, it's a lot more convenient for local development
# For production, using mysql or postgres is preferrable.
$databases['default']['default'] = array(
  'driver' =>   getenv('DRUPAL_DB_DRIVER')   ?: 'sqlite',
  'database' => getenv('DRUPAL_DB_DATABASE') ?: $data_path . '/database.sl3',
  'username' => getenv('DRUPAL_DB_USERNAME') ?: '',
  'password' => getenv('DRUPAL_DB_PASSWORD') ?: '',
  'prefix' =>   getenv('DRUPAL_DB_PREFIX')   ?: '',
  'host' =>     getenv('DRUPAL_DB_HOST')     ?: '',
  'port' =>     getenv('DRUPAL_DB_PORT')     ?: '',
);

$settings = array(
  # Caveat: as we've moved public files to outside the webroot, we must serve them separately.
  # By default, let's look for them at localhost:8081.
  # For production, we should set nginx to serve at a subdirectory or domain.
  'file_public_base_url' =>  getenv("DRUPAL_FILE_PUBLIC_BASE_URL")  ?: "http://localhost:8081",
  'config_sync_directory' => getenv("DRUPAL_CONFIG_SYNC_DIRECTORY") ?: $data_path . '/sync',
  'config_directory_name' => getenv("DRUPAL_CONFIG_DIRECTORY_NAME") ?: $data_path . '/config',
  'file_private_path' =>     getenv("DRUPAL_FILE_PRIVATE_PATH")     ?: $data_path . '/private',
  'file_public_path' =>      getenv("DRUPAL_FILE_PUBLIC_PATH")      ?: $data_path . '/public',
  'hash_salt' =>             getenv('DRUPAL_HASH_SALT_PATH')        ?: $data_path . '/salt.key',
);
# We're putting the salt in its own file, so that it is persistent, portable, can be automatically generated, and will not be written to this file by drush.
# Generate it if the file does not exist or is empty.
if (!file_exists($settings['hash_salt']) || filesize($settings['hash_salt']) == 0) {
  file_put_contents($settings['hash_salt'], Crypt::randomBytesBase64(55));
}

# Create the data directories as needed, ignore errors
@mkdir($settings['file_public_path']);
@mkdir($settings['file_private_path']);
@mkdir($settings['config_sync_directory']);
@mkdir($settings['config_directory_name']);

# All settings are overwritable by local.settings.php at the data directory
# Using environment variables is preferred, though.
if (file_exists($data_path. '/local.settings.php')) {
  include $data_path. '/local.settings.php';
}
