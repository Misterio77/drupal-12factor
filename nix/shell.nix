{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
in
  pkgs.mkShell {
    inputsFrom = [mainPkg];
    buildInputs = with pkgs; [
      phpPackages.composer
      drush
      sqlite
    ];
  }
