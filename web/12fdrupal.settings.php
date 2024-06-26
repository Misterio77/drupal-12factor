<?php

# This configuration is my attempt to make it possible to separate state from a
# built Drupal website artifact (source code + dependencies).

# This helps with packaging the website for Docker, Nix, etc.

# Everything has sane defaults, and is configurable through environment variables.
# I did as much as I could to avoid mixing source code (such as this) with secrets and data.

# Mutable data path
# Default to a "data" directory in the project root path
$data = getenv('DRUPAL_DATA_PATH') ?: getenv('PWD') . '/data';

# Use sqlite by default, it's a lot more convenient for local development
# For production, using mysql or postgres is preferrable.
$databases['default']['default'] = array(
  'driver' =>   getenv("DRUPAL_DB_DRIVER")   ?: 'sqlite',
  'database' => getenv("DRUPAL_DB_DATABASE") ?: "$data/database.sl3",
  'username' => getenv("DRUPAL_DB_USERNAME") ?: '',
  'password' => getenv("DRUPAL_DB_PASSWORD") ?: '',
  'prefix' =>   getenv("DRUPAL_DB_PREFIX")   ?: '',
  'host' =>     getenv("DRUPAL_DB_HOST")     ?: '',
  'port' =>     getenv("DRUPAL_DB_PORT")     ?: '',
);

$settings = array(
  'file_public_path' =>      "$data/public/files",
  'file_public_base_url' =>  "/files",
  'file_private_path' =>     "$data/private",
  'config_sync_directory' => "$data/sync",
  'hash_salt' =>             "$data/salt.key",
);

# Create the directories and salt as needed.

use Drupal\Component\Utility\Crypt;

if (!is_dir($data)) {
  mkdir($data);
}
if (!is_dir($settings['file_public_path'])) {
  mkdir($settings['file_public_path'], recursive: true);
}
if (!is_dir($settings['file_private_path'])) {
  mkdir($settings['file_private_path'], recursive: true);
}
if (!is_dir($settings['config_sync_directory'])) {
  mkdir($settings['config_sync_directory'], recursive: true);
}

if (!file_exists($settings['hash_salt'])) {
  mkdir(dirname($settings['hash_salt']), recursive: true);
  file_put_contents($settings['hash_salt'], Crypt::randomBytesBase64(55));
}

$extra_settings_file = getenv('DRUPAL_EXTRA_SETTINGS_FILE') ?: "$data/settings.local.php";
if (file_exists($extra_settings_file)) {
  require $extra_settings_file;
}
