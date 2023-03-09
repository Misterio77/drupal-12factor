{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
in
  pkgs.mkShell {
    name = "${mainPkg.name}-shell";
    buildInputs = with pkgs; [
      phpPackages.composer
      php
      sqlite
      webfs
      # Alias 'drush' to 'composer exec drush'
      (writeShellScriptBin "drush" ''composer exec drush "$@"'')
    ];
  }
