# "Stateless" Drupal Example

The idea here is to correctly separate Drupal's state from source code and dependencies. Following the [12 factor app format](https://12factor.net/).

# About

This makes it easier to correctly package Drupal with tools such as Docker and Nix.

An example would be building a Docker image that fully contains the software artifacts (custom and vendor code), and then run a container that is configurable entirely by environment variables and has an explicitly separate path for state. This brings a series of advantages:
- Backing up and overall reasoning about the state is much easier, as it has a dedicated location.
- The configuration parameters related to each deployed site do not need to be committed, or present on files at all, as they can be configured through environment variables. Configuration can be changed without re-building software artifacts (e.g. same artifact for dev/prod envs).
- Files originating from dependencies (be them located at `vendor` or `web`) do not have to be committed with the code neither backed up with the state.

Check `web/12fdrupal.settings.php` for more info. All the options to install a site are configured with sane defaults and can be overwritten through environment variables.

If you need an escape hatch, you can add a `local.settings.php` in the data directory.

# Usage

This project, by default, uses the `data` directory (in your working directory) to store any state (including a SQLite db). This can be overwritten by changing the `DRUPAL_DATA_PATH` environment variable.

Instead of SQLite, you can use a different db through `DRUPAL_DB_*` environment variables. See [12fdrupal.settings.php](./web/12fdrupal.settings.php).

## Manually

### Dependencies

Install `php`, `composer`, `caddy` and `sqlite` through your preferred package manager.

With `apt` (debian-based):
```bash
sudo apt install php composer caddy sqlite
```

With `pacman` (arch-based):
```bash
sudo pacman -S php composer caddy sqlite
```

If you have nix, you can get a shell with everything you need:
```bash
nix develop
```

### Build and run

Run `composer install` to get the dependencies and scaffold the webroot files.

Then run `./bin/serve` to start up caddy and php-fpm.

You can set up the site as usual; using either Drush (use `composer exec drush`), through the web interface, or by copying your existing data.

## Docker

### Build

```bash
docker build -t drupal-12f .
```

The image contains all the source code and dependencies, and runs `./bin/serve` upon starting the container.

### Run

```bash
docker run -p 8080:8080 drupal-12f
```

This will bind the port to `8080`. The format is `host:container`, so change the **first** number if you wish to bind to another port on your machine.

As mentioned in the manual setup, it will default to a SQLite database, and can e overwritten with `DRUPAL_DB_*` variables.

If you want to persist the data outside the container, add a volume argument to docker run`. You can either use a named volume: `-v drupal-data:/app/data`; or ind to a host directory: `-v ./data:/app/data`.

You can set up the site as usual; using either Drush (use `docker exec --latest it drush`), through the web interface, or by copying your existing data.

## Nix

### Development shell

You can use `nix develop` to get a development shell with the dependencies required to iterate. You can then use `composer` and `./bin/serve` as usual.

### Building and running

For a more final build (similarly to Docker), you can use Nix to package the site with `nix build`. The output will be an immutable directory (containing web`, `vendor`, and the wrapped serve script) linked at `result`:

```
nix build
./result/bin/drush si -y
./result/bin/serve
```

Alternatively try `nix shell` (it builds and puts the `result/bin` in your `PATH`):
```
nix shell
drush si -y
serve
```

You actually don't even need the repository cloned to build and run with Nix! Try it like so:

```
nix shell github:misterio77/serve
drush si -y
serve
```

## TODO

- Investigate possibility of having source code out of webroot entirely ([drupal-paranoia](https://github.com/drupal-composer/drupal-paranoia)?)
- Make caddyfile more explicit about what is served
  - Avoid depending on the PHP router to serve public files
