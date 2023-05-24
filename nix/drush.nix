{ callPackage, writeShellApplication, php, sqlite }:

let
  mainPkg = callPackage ./default.nix { };
in
  writeShellApplication {
    name = "drush";
    runtimeInputs = [ php sqlite ];
    text = ''
      # Run drush, pointing to the built package as project path, and $(pwd)/data as state
      DRUPAL_DATA_PATH="''${DRUPAL_DATA_PATH:-"$(pwd)/data"}" \
      ${mainPkg}/vendor/bin/drush --root "${mainPkg}" "$@"
    '';
  }
