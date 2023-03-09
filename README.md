# "Stateless" Drupal Example

The idea here is to correctly separate Drupal's state from source code and
dependencies. Following the [12 factor app format](https://12factor.net/).

# About

This makes it easier to correctly package Drupal with tools such as Docker and
Nix, bringing a lot of advantages to the table.

An example would be a Docker image that fully contains the software artifacts
(custom and vendor code), and then run a container that is configurable
entirely by environment variables and has an explicitly separate path for
state. This brings a series of advantages:
- Backing up and overall reasoning about the state is much easier, as it has a
    dedicated location.
- The configuration parameters related to each deployment site do not need to
    be committed, or present on files at all, as they can be configured through
    environment variables. Configurations can be changed without re-uploading
    software artifacts.
- Files originating from dependencies (be them located at `vendor` or `web`) do
    not have to be committed with the code or backed up with the
    state.

Check `web/sites/default/settings.php` for more info. All the options to
install a site are configured with sane defaults and can be overwritten through
environment variables, this is to ensure that `drush si` does not need to write
a single line to it. If an escape hatch is needed, you can add a
`local.settings.php` to the root of the project, it will be read after the
default one.

# Usage

Check [this doc](./docs/env-vars.md) for the relevant environment variables you
can use.

Long story short: the default config uses the current directory as the project
root, and a `data` directory inside it to store any state (including a SQLite
database).

## Manually

### Dependencies

Install `php8`, `composer`, `sqlite`, `webfs` through your preferred package manager.

With `apt`:
```bash
sudo apt install php8 sqlite3 webfs
# Sadly composer is not available with apt, so let's download the installer:
wget -O composer-setup.php https://getcomposer.org/installer
# The hash output should be equal to this one: https://composer.github.io/installer.sig
sha384sum composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

With `pacman`:
```bash
sudo pacman -S php composer sqlite webfs
```

If you [use Nix](./docs/nix.md) or NixOS, you can get a shell with everything
you need:
```bash
nix develop
```

### Build and run

Run `composer install` to get the dependencies and scaffold the webroot files.

Then run `./serve.sh` (this script exists because of the caveat of having to
run `php` as well as another file server). It will be accessible at
`localhost:8080`.

You can alternatively run `php -S localhost:8080 -t web/` and `webfs -F -p 8081
-r data/public/` (or any other file server) manually.

You can set up the site as usual; using either Drush (use `composer exec
drush`), through the web interface, or by copying your existing data.

## Docker

### Build

```bash
docker build .
```

The image contains all the source code and dependencies, and has `nginx` +
`php-fpm` setup to serve everything.

The code and dependencies are set up in different layers, so changing the
source code rebuilding does not redownload dependencies.

### Run

```bash
docker run -p 8080:8080 $(docker build . -q)
```

This will bind the port to `8080`. The format is `host:container`, so change
the first number if you want to bind to another host port.

As previously [mentioned](./docs/env-vars.md), the database defaults to a
SQLite located at the data directory (this makes it possible to run it with a
single container). Set the `DRUPAL_DB_*` environment variables if you want to
use PostgreSQL or MySQL instead.

If you want to persist the data outside the container, add a volume argument to
`docker run`. You can either use a named volume: `-v drupal-data:/app/data`; or
bind to a host directory: `-v ./data:/app/data`.

You can set up the site as usual; using either Drush (use `docker exec --latest
-it drush`), through the web interface, or by copying your existing data.

## Nix

For more info on Nix and how to set it up, see [this doc](./docs/nix.md).

### Development shell

As mentioned, you can use `nix develop .` to get a development shell with
everything you need. This method uses the local files for developing, as usual.

### Building

You can build the site with `nix build .`. The output will be an immutable
directory (containing `web` and `vendor`) linked at `result`.

### Scripts/apps

You can quickly serve the website (with `php -S` and `webfs`) using `nix run
.#serve` (or just `nix run .`). It will be accessible on `localhost:8080`.

It is similar to `./serve.sh`, but already provides the dependencies (no need
to install anything nor enter the shell) and uses the website as it is built by
nix (for example, you don't need to `composer install` first).

To run drush, use `nix run .#drush`. Same as above, it acts on the nix build
output.

Both of these have a slight difference to local development (be it with the
shell or when stuff is manually installed) that they act on the same output
that is produced by `nix build`; that means, for example, that you don't need
to `composer install` first, or even have php or webfs available. Awesome!

Both of these and use `$(pwd)/data` as the default data storage, this can be
overwritten with `DRUPAL_DATA_PATH`.

### Flake ref

All of these commands take a nix flake reference, that is, a directory or repository that contains a `flake.nix`. In the examples we use `.` to refer to the current directory, but you can run all of them without even cloning the repo by using `github:misterio77/drupal-12factor` as ref instead. For example:
```
nix run github:misterio77/drupal-12factor#serve
```

# TODO

- [ ] Perhaps add a `docker compose` and/or Kubernetes examples as well? A
    single container works fine, though.
- [ ] Add a NixOS VM definition? Again, a single `nix run` works fine, but
    should be interesting as an example.
