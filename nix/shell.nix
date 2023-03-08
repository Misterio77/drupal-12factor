{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
in
  pkgs.mkShell {
    name = "${mainPkg.name}-shell";
    inputsFrom = [mainPkg];
    buildInputs = with pkgs; [
      phpPackages.composer
      webfs
      (writeShellScriptBin "drush" ''composer exec drush "$@"'')
    ];
  }
