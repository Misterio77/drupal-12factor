<?php

# This configuration is my attempt to make it possible to separate state from a
# built Drupal website artifact (source code + dependencies).

# This helps with packaging the website for Docker, Nix, etc.

# Everything has sane defaults, and is configurable through environment variables.
# I did as much as I could to avoid mixing source code (such as this) with secrets and data.

use Drupal\Component\Utility\Crypt;

# Mutable data path
# Default to a "data" directory in the project root path
$root_data = getenv('DRUPAL_DATA_PATH') ?: realpath('../') . '/data';
# Site-specific data dir
$data = getenv("DRUPAL_{$site}_DATA_PATH") ?: "$root_data/sites/$site";
@mkdir($data, recursive: true);

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

$settings = array(
  'config_sync_directory' => getenv("DRUPAL_{$site}_CONFIG_SYNC_DIRECTORY") ?: "$data/sync",
  'config_directory_name' => getenv("DRUPAL_{$site}_CONFIG_DIRECTORY_NAME") ?: "$data/config",
  'file_private_path' =>     getenv("DRUPAL_{$site}_FILE_PRIVATE_PATH")     ?: "$data/private",
  'hash_salt' =>             getenv("DRUPAL_{$site}_HASH_SALT_PATH")        ?: "$data/salt.key",
);
# We're putting the salt in its own file, so that it is persistent, portable, can be automatically generated, and will not be written to this file by drush.
# Generate it if the file does not exist or is empty.
if (!file_exists($settings['hash_salt']) || filesize($settings['hash_salt']) == 0) {
  file_put_contents($settings['hash_salt'], Crypt::randomBytesBase64(55));
}

# Create the data directories as needed
@mkdir($settings['file_private_path']);
@mkdir($settings['config_sync_directory']);
@mkdir($settings['config_directory_name']);

# Location to keep the actual public files on
$file_public_path_real = getenv("DRUPAL_{$site}_FILE_PUBLIC_PATH") ?: "$data/public";
@mkdir($file_public_path_real);
# If we change these away from the webroot, Drupal will not serve them
# So we'll symlink our real dir to this one.
$settings['file_public_path'] = "sites/$site/files";
@symlink($file_public_path_real, $settings['file_public_path']);


# All settings are overwritable by local.settings.php at the site's data directory
# Using environment variables is preferred, though.
if (file_exists("$data/local.settings.php")) {
  include "$data/local.settings.php";
}
