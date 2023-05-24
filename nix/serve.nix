{ callPackage, writeShellApplication, php, sqlite }:

let
  mainPkg = callPackage ./default.nix { };
in
  writeShellApplication {
    name = "serve";
    runtimeInputs = [ php sqlite ];
    text = ''
      php -S localhost:8000 -t ${mainPkg} "$@"
    '';
  }
