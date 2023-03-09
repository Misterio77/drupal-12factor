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
can use; there's a lot environment variables if you want to use a different
database or more granular control over the state locations.

**Important**: the project, by default, uses the `data` directory next to your
webroot to store any state (including a SQLite database). This can be
overwritten by changing the `DRUPAL_DATA_PATH` environment variable. The
`bin/serve` script sets it to `$(pwd)/data` by default, which is slightly
different (it is relative to where you called it from, not the project root).

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

Then run `bin/serve` (this script exists because of the caveat of having to
run `php` as well as another file server). It will be accessible at
`localhost:8080`.

You can alternatively run `php -S localhost:8080 -t web/` and `webfs -F -p 8081
-r data/public/` (or any other file server program) manually.

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

### Building and running

You can build the site with `nix build .`. The output will be an immutable
directory (containing `web` and `vendor`) linked at `result`.

The output also contains the `bin/serve`, but this version has a few cool
tricks.

It provides the full dependencies (no need to install anything nor enter the dev
shell) and, as it is located inside it, uses the _fully built_ package (that
is, you don't need to `composer install` first). You can run it more
conveniently by using `nix run .`.

To run drush, use `nix run .#drush`. Same as above, it acts on the built
website artifact.

You actually don't even need the repository cloned to build and run with nix!
Try replacing the `.` argument with `github:misterio77/drupal-12factor`. For
example:

```
nix run github:misterio77/drupal-12factor#serve
```

# TODO

- [ ] Perhaps add a `docker compose` and/or Kubernetes examples as well? A
    single container works fine, though.
- [ ] Add a NixOS VM definition? Again, a single `nix run` works fine, but
    should be interesting as an example.
