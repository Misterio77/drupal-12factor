# Nix/NixOS

This repo has all the boilerplate needed for building, developing, and
deploying with Nix.

[Nix](https://nixos.org/guides/how-nix-works.html) is a package manager based
on functional programming ideas, and offers awesome features such as
reproducible, isolated, per-project developer environments (like virtualenv,
but for anything!.

[NixOS](https://nixos.org/guides/how-nix-works.html#nixos) is a Linux
distribution that uses Nix not only for packages, but for generating and
managing configuration files and services. It offers cool features such as
declarative service configuration, atomic updates, and rollbacks.

You can leverage all this (including building NixOS VMs) in your existing Linux
or MacOS distribution. Just download Nix (the package manager):

```bash
sh <(curl -L https://nixos.org/nix/install)
```

The features in these repos depend on `flakes` and the `nix-command` which are
currently marked as experimental (but deemed feature complete and commonly used
in production). You can enable these in the following ways:

- When calling nix, add the flag `--experimental-features 'nix-command flakes'`.
- Setting an environment variable `export NIX_CONFIG="experimental-features = nix-command flakes"`.
- Edit `~/.config/nix/nix.conf` and add `experimental-features = nix-command flakes`.
- If using NixOS, set `nix.settings.experimental-features = [ "nix-command" "flakes" ];`.
