{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
  php = builtins.head mainPkg.buildInputs;
in
  pkgs.writeShellApplication {
    name = "serve";
    runtimeInputs = [
      phpPackages.composer
      webfs
      php
    ];
    text = ''
      DRUPAL_DATA_PATH="$(pwd)/data" \
      ${mainPkg}/serve.sh "$@"
    '';
  }
