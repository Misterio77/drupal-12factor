<?php

# This configuration is my attempt to make it possible to separate state from a
# built Drupal website artifact (source code + dependencies).

# This helps with packaging the website for Docker, Nix, etc.

# Everything has sane defaults, and is configurable through environment variables.
# I did as much as I could to avoid mixing source code (such as this) with secrets and data.

# Mutable data path
# Default to a "data" directory in the project root path
$root_data = getenv('DRUPAL_DATA_PATH') ?: realpath('../') . '/data';
# Site-specific data dir
$data = getenv("DRUPAL_{$site}_DATA_PATH") ?: "$root_data/sites/$site";

# Use sqlite by default, it's a lot more convenient for local development
# For production, using mysql or postgres is preferrable.
$databases['default']['default'] = array(
  'driver' =>   getenv("DRUPAL_{$site}_DB_DRIVER")   ?: 'sqlite',
  'database' => getenv("DRUPAL_{$site}_DB_DATABASE") ?: "$data/database.sl3",
  'username' => getenv("DRUPAL_{$site}_DB_USERNAME") ?: '',
  'password' => getenv("DRUPAL_{$site}_DB_PASSWORD") ?: '',
  'prefix' =>   getenv("DRUPAL_{$site}_DB_PREFIX")   ?: '',
  'host' =>     getenv("DRUPAL_{$site}_DB_HOST")     ?: '',
  'port' =>     getenv("DRUPAL_{$site}_DB_PORT")     ?: '',
);

# Location to keep the actual public files on
# If we change this away from the webroot, Drupal will not serve them
# So we'll keep the default and symlink this to it.
$file_public_path_real = getenv("DRUPAL_{$site}_FILE_PUBLIC_PATH") ?: "$data/public";

$settings = array(
  'config_sync_directory' => getenv("DRUPAL_{$site}_CONFIG_SYNC_DIRECTORY") ?: "$data/sync",
  'config_directory_name' => getenv("DRUPAL_{$site}_CONFIG_DIRECTORY_NAME") ?: "$data/config",
  'file_private_path' =>     getenv("DRUPAL_{$site}_FILE_PRIVATE_PATH")     ?: "$data/private",
  'hash_salt' =>             getenv("DRUPAL_{$site}_HASH_SALT_PATH")        ?: "$data/salt.key",
  'file_public_path' =>      "sites/$site/files",
);

# Create the directories, public files symlink, and hash_salt, as needed.

use Drupal\Component\Utility\Crypt;

if (!is_dir($data)) {
  mkdir($data, recursive: true);
}
if (!is_dir($settings['file_private_path'])) {
  mkdir($settings['file_private_path']);
}
if (!is_dir($settings['config_sync_directory'])) {
  mkdir($settings['config_sync_directory']);
}
if (!is_dir($settings['config_directory_name'])) {
  mkdir($settings['config_directory_name']);
}
if (!is_dir($file_public_path_real)) {
  mkdir($file_public_path_real);
}

if (!is_link($settings['file_public_path'])) {
  symlink($file_public_path_real, $settings['file_public_path']);
}

if (!file_exists($settings['hash_salt'])) {
  file_put_contents($settings['hash_salt'], Crypt::randomBytesBase64(55));
}
