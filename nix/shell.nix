{pkgs ? import <nixpkgs> {}}: let
  mainPkg = pkgs.callPackage ./default.nix {};
in
  pkgs.mkShell {
    name = "${mainPkg.name}-shell";
    buildInputs = with pkgs; [
      php81
      sqlite
      webfs
      php81Packages.composer
      # Alias 'drush' to 'composer exec drush'
      (writeShellScriptBin "drush" ''composer exec drush "$@"'')
    ];
  }
