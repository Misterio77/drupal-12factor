{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
in
  pkgs.writeShellApplication {
    name = "serve";
    runtimeInputs = with pkgs; [
      phpPackages.composer
      php
      sqlite
      webfs
    ];
    text = ''
      # Run serve.sh
      # Using current directory as data path
      # And pointing to the package (built artifact) as project path
      DRUPAL_DATA_PATH="$(pwd)/data" \
      DRUPAL_PROJECT_PATH="${mainPkg}" \
      ${../serve.sh} "$@"
    '';
  }
