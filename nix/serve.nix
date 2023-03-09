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
      # Use current directory as data path
      # And point to the package as project (built artifact) path
      DRUPAL_DATA_PATH="$(pwd)/data" \
      DRUPAL_PROJECT_PATH="${mainPkg}" \
      ${../serve.sh} "$@"
    '';
  }
