{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
in
  pkgs.writeShellApplication {
    name = "serve";
    inputsFrom = [mainPkg];
    runtimeInputs = with pkgs; [
      phpPackages.composer
      webfs
    ];
    text = ''
      DRUPAL_DATA_PATH="$(pwd)/data" \
      DRUPAL_PROJECT_PATH="${mainPkg}" \
      ${../serve.sh} "$@"
    '';
  }
