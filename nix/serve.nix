{ callPackage, writeShellApplication, php, sqlite }:

let
  mainPkg = callPackage ./default.nix { };
in
  writeShellApplication {
    name = "serve";
    runtimeInputs = [ php sqlite ];
    text = ''
      DRUPAL_DATA_PATH="''${DRUPAL_DATA_PATH:-"$(pwd)/data"}" \
      php -S localhost:8000 -t "${mainPkg}/web" "$@"
    '';
  }
