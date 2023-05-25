# Available environment variables

- `DRUPAL_DATA_PATH`: Defaults to `data` directory in the project root.
- `DRUPAL_DB_DRIVER`: The database backend to use (either `mysql`, `pgsql`, or `sqlite`). Defaults to `sqlite`.
- `DRUPAL_DB_DATABASE`: The database path (if using `sqlite`) or name (for `mysql` or `pgsql`). Defaults to `${DRUPAL_DATA_PATH}/database.sl3`.
- `DRUPAL_DB_PREFIX`: String to prefix the table names with. Defaults to empty.
- These all default to empty and are only relevant for `mysql` or `pgsql`:
  - `DRUPAL_DB_USERNAME`: The database username.
  - `DRUPAL_DB_PASSWORD`: The database password.
  - `DRUPAL_DB_HOST`: The database hostname. If it's empty, it will try to use `localhost`.
  - `DRUPAL_DB_PORT`: The database port. If it's empty, `pgsql` will try `5432` and `mysql` will try `3306`
