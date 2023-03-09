# Available environment variables

- `DRUPAL_DATA_PATH`: Used to derive most other state location variables. If
    you want to store state elsewhere, this is the most convenient way.
- Database related:
  - `DRUPAL_DB_DRIVER`: The database backend to use (either `mysql`, `pgsql`,
      or `sqlite`). Defaults to `sqlite`.
  - `DRUPAL_DB_DATABASE`: The database path (if using `sqlite`) or name (for
      `mysql` or `pgsql`). Defaults to `${DRUPAL_DATA_PATH}/database.sl3`.
  - `DRUPAL_DB_PREFIX`: String to prefix the table names with. Defaults to empty.
  - These all default to empty and are only relevant for `mysql` or `pgsql`:
    - `DRUPAL_DB_USERNAME`: The database username.
    - `DRUPAL_DB_PASSWORD`: The database password.
    - `DRUPAL_DB_HOST`: The database hostname. If it's empty, it will try to
        use `localhost`.
    - `DRUPAL_DB_PORT`: The database port. If it's empty, `pgsql` will try
        `5432` and `mysql` will try `3306`
- State related (these paths should be shared between instances, if load
    balancing):
  - `DRUPAL_FILE_PUBLIC_PATH`: Where Drupal will place aggregated assets and
      public user uploaded files. Defaults to `${DRUPAL_DATA_PATH}/public`.
    - A caveat of moving this outside the webroot is that you need to serve
        these files separately (webfsd, separate nginx location, etc.) and set
        `DRUPAL_FILE_PUBLIC_BASE_URL` to match it.
  - `DRUPAL_FILE_PRIVATE_PATH`: Where Drupal will place private user uploaded
      files. Defaults to `${DRUPAL_DATA_PATH}/private`.
  - `DRUPAL_HASH_SALT_PATH`: Where Drupal will generate to and read from the
      private key/salt. Defaults to`${DRUPAL_DATA_PATH}/salt.key`.
  - `DRUPAL_CONFIG_SYNC_DIRECTORY`: Where (I think) Drupal will place
      configuration dumps. Defaults to `${DRUPAL_DATA_PATH}/sync`.
  - `DRUPAL_CONFIG_DIRECTORY_NAME`: Where Drupal will place configurations, if
      you're not using the database for that. Defaults to
      `${DRUPAL_DATA_PATH}/config`.
