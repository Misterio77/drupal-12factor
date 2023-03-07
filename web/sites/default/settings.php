<?php

# This configuration is my attempt to make it possible to separate state from a
# built drupal website artifact (source code + dependencies).
#
# This helps with packaging the website for Docker, Nix, etc.

# Root path (above webroot)
$project_path = getenv('DRUPAL_PROJECT_PATH') ?: realpath('../');
error_log("Project path is $project_path\n");

# Mutable data path
$data_path = getenv('DRUPAL_DATA_PATH') ?: $project_path . '/data';
# Make sure it exists
if (!file_exists($data_path)) {
    mkdir($data_path, 0755, true);
}

$databases['default']['default'] = array(
  # Use sqlite by default, it's a lot more convenient for local development
  'driver' =>   getenv('DRUPAL_DB_DRIVER')   ?: 'sqlite',
  'database' => getenv('DRUPAL_DB_DATABASE') ?: ($data_path . '/database.sl3'),
  'host' =>     getenv('DRUPAL_DB_HOST')     ?: '',
  'port' =>     getenv('DRUPAL_DB_PORT')     ?: '',
  'username' => getenv('DRUPAL_DB_USER')     ?: '',
  'password' => getenv('DRUPAL_DB_PASS')     ?: '',
  'prefix' =>   getenv('DRUPAL_DB_PREFIX')   ?: '',
  'collation' => 'utf8mb4_0900_ai_ci'
);

$settings = array(
  'file_public_base_url' => getenv("DRUPAL_FILE_PUBLIC_BASE_URL")   ?: "http://localhost:8081",
  'file_public_path' => getenv("DRUPAL_FILE_PUBLIC_PATH")           ?: $data_path . '/public',
  'file_private_path' => getenv("DRUPAL_FILE_PRIVATE_PATH")         ?: $data_path . '/private',
  'config_sync_directory' => getenv("DRUPAL_CONFIG_SYNC_DIRECTORY") ?: $data_path . '/sync',
  'config_directory_name' => getenv("DRUPAL_CONFIG_DIRECTORY_NAME") ?: $data_path . '/config',
  # Generate a random salt every time, if one is not pre-configured
  'hash_salt' => getenv('DRUPAL_HASH_SALT') ?: random_bytes(2048)
);

# All settings are overwritable by local.settings.php at the project root
if (file_exists($project_path. '/local.settings.php')) {
  include $project_path. '/local.settings.php';
}
