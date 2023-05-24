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

Check `web/12fdrupal.settings.php` for more info. All the options to
install a site are configured with sane defaults and can be overwritten through
environment variables, I try to ensure that Drupal does not need to write a
single line to it during installation. If an escape hatch is needed, you can
add a `local.settings.php` in the state folder, it will be read after the
default one.

# Usage

Check [this doc](./docs/env-vars.md) for the relevant environment variables you
can use; there are a lot of environment variables if you want to use a
different database or more granular control over the state locations.

The gist is that this project, by default, uses the `data` directory (right
here on your project root) to store any state (including a SQLite database).
This can be overwritten by changing the `DRUPAL_DATA_PATH` environment
variable.

## Manually

### Dependencies

Install `php`, `composer`, `sqlite` through your preferred package manager.

With `apt` (debian-based):
```bash
sudo apt install php composer sqlite
```

With `pacman` (arch-based):
```bash
sudo pacman -S php composer sqlite
```

If you have [Nix](./docs/nix.md), you can get a shell with everything you need:
```bash
nix develop
```

### Build and run

Run `composer install` to get the dependencies and scaffold the webroot files.

Then run PHP dev server with `php -S localhost:8000 -t web`

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

The database defaults to a SQLite located at the data directory (this makes it
possible to run it with a single container). See [environment variables
docs](./docs/env-vars.md) if you want to use PostgreSQL or MySQL instead.

If you want to persist the data outside the container, add a volume argument to
`docker run`. You can either use a named volume: `-v drupal-data:/app/data`; or
bind to a host directory: `-v ./data:/app/data` (for the latter, be sure to
`mkdir -p data && chmod 777 data` so that the container user can write to it;
rest assured, the files themselves won't be 777, just the parent dir).

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

Through `nix run`, you can easily spawn a script that runs `php -S` for you on
the buit package. No need to build it first.

To run drush, use `nix run .#drush`. Same as above, it acts on the built
website artifact.

You actually don't even need the repository cloned to build and run with nix!
Try replacing the `.` argument with `github:misterio77/drupal-12factor`. For
example:

```
nix run github:misterio77/drupal-12factor#serve
```

## TODO

- Investigate possibility of having source code out of webroot entirely ([drupal-paranoia](https://github.com/drupal-composer/drupal-paranoia)?)
