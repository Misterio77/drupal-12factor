{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
in
  pkgs.mkShell {
    name = "${mainPkg.name}-shell";
    inputsFrom = [mainPkg];
    buildInputs = [
      pkgs.phpPackages.composer
      pkgs.webfs
      mainPkg.php
      mainPkg.utils
    ];
  }
