<?php

use Drupal\Component\Utility\Crypt;

if (!function_exists('mkdir_p')) {
  function mkdir_p($path, $mode = 0755) {
    if (!file_exists($path)) {
        mkdir($path, $mode, true);
    }
  }
}

# This configuration is my attempt to make it possible to separate state from a
# built drupal website artifact (source code + dependencies).
#
# This helps with packaging the website for Docker, Nix, etc.

# Root directory containing vendor and web
$project_path = getenv('DRUPAL_PROJECT_PATH') ?: realpath('../');

# Mutable data path (by default is a "data" directory inside root path)
$data_path = getenv('DRUPAL_DATA_PATH') ?: $project_path . '/data';
# Make sure it exists
mkdir_p($data_path);

# Use sqlite by default, it's a lot more convenient for local development
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
  'file_public_base_url' =>  getenv("DRUPAL_FILE_PUBLIC_BASE_URL")  ?: "http://localhost:8081",
  'config_sync_directory' => getenv("DRUPAL_CONFIG_SYNC_DIRECTORY") ?: $data_path . '/sync',
  'config_directory_name' => getenv("DRUPAL_CONFIG_DIRECTORY_NAME") ?: $data_path . '/config',
  'file_private_path' =>     getenv("DRUPAL_FILE_PRIVATE_PATH")     ?: $data_path . '/private',
  'file_public_path' =>      getenv("DRUPAL_FILE_PUBLIC_PATH")      ?: $data_path . '/public',
  'hash_salt' =>             getenv('DRUPAL_HASH_SALT')             ?: Crypt::randomBytesBase64(55)
);

mkdir_p($settings['file_public_path']);
mkdir_p($settings['file_private_path']);
mkdir_p($settings['config_sync_directory']);
mkdir_p($settings['config_directory_name']);

# All settings are overwritable by local.settings.php at the project root
if (file_exists($project_path. '/local.settings.php')) {
  include $project_path. '/local.settings.php';
}
