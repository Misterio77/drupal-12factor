{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
  # Grab php from mainPkg
  php = builtins.head mainPkg.buildInputs;
  # Grab drush from mainPkg
  drush = pkgs.runCommand "drush" {} ''
    mkdir -p $out/bin
    ln -s ${mainPkg}/vendor/bin/drush $out/bin/drush
  '';
in
  pkgs.mkShell {
    inputsFrom = [mainPkg];
    buildInputs = [
      pkgs.phpPackages.composer
      pkgs.webfs
      php
      drush
    ];
  }
