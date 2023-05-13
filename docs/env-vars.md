# Available environment variables

- State:
  - `DRUPAL_DATA_PATH`: Defaults to `data` directory in the project root.
  - `DRUPAL_xxx_DATA_PATH`: Where `xxx` is the site name (e.g. `default`). Defaults to `${DRUPAL_DATA_PATH}/sites/xxx`. All others are derived from this one.
    - `DRUPAL_xxx_FILE_PUBLIC_PATH`: Where Drupal will place aggregated assets and public user uploaded files. Defaults to `${DRUPAL_xxx_DATA_PATH}/public`.
    - `DRUPAL_xxx_FILE_PRIVATE_PATH`: Where Drupal will place private user uploaded files. Defaults to `${DRUPAL_xxx_DATA_PATH}/private`.
    - `DRUPAL_xxx_HASH_SALT_PATH`: Where Drupal will generate to and read from the private key/salt. Defaults to`${DRUPAL_xxx_DATA_PATH}/salt.key`.
    - `DRUPAL_xxx_CONFIG_SYNC_DIRECTORY`: Where (I think) Drupal will place configuration dumps. Defaults to `${DRUPAL_xxx_DATA_PATH}/sync`.
    - `DRUPAL_xxx_CONFIG_DIRECTORY_NAME`: Where Drupal will place configurations, if you're not using the database for that. Defaults to `${DRUPAL_xxx_DATA_PATH}/config`.
- Database related:
  - `DRUPAL_xxx_DB_DRIVER`: The database backend to use (either `mysql`, `pgsql`, or `sqlite`). Defaults to `sqlite`.
  - `DRUPAL_xxx_DB_DATABASE`: The database path (if using `sqlite`) or name (for `mysql` or `pgsql`). Defaults to `${DRUPAL_xxx_DATA_PATH}/database.sl3`.
  - `DRUPAL_xxx_DB_PREFIX`: String to prefix the table names with. Defaults to empty.
  - These all default to empty and are only relevant for `mysql` or `pgsql`:
    - `DRUPAL_xxx_DB_USERNAME`: The database username.
    - `DRUPAL_xxx_DB_PASSWORD`: The database password.
    - `DRUPAL_xxx_DB_HOST`: The database hostname. If it's empty, it will try to use `localhost`.
    - `DRUPAL_xxx_DB_PORT`: The database port. If it's empty, `pgsql` will try `5432` and `mysql` will try `3306`
