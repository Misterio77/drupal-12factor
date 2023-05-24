{ callPackage, mkShell, php, phpPackages, sqlite }:

let
  mainPkg = callPackage ./default.nix { };
in
  mkShell {
    name = "${mainPkg.name}-shell";
    buildInputs = [ php sqlite phpPackages.composer ];
  }
