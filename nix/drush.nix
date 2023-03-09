{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
in
  pkgs.writeShellApplication {
    name = "serve";
    runtimeInputs = with pkgs; [ php81 sqlite ];
    text = ''
      # Run drush
      # Pointing to the built package as project path, and $(pwd)/data as state
      DRUPAL_DATA_PATH="''${DRUPAL_DATA_PATH:-"$(pwd)/data"}" \
      ${mainPkg}/vendor/bin/drush --root "${mainPkg}" "$@"
    '';
  }
