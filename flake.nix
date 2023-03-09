{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  };

  outputs = {nixpkgs, ...}: let
    systems = ["x86_64-linux" "aarch64-linux"];
    forEachSystem = f: nixpkgs.lib.genAttrs systems (sys: f sys nixpkgs.legacyPackages.${sys});
  in rec {
    packages = forEachSystem (system: pkgs: {
      default = pkgs.callPackage ./nix/default.nix {};
      serve = pkgs.callPackage ./nix/serve.nix {};
      drush = pkgs.callPackage ./nix/drush.nix {};
    });
    devShells = forEachSystem (system: pkgs: {
      default = pkgs.callPackage ./nix/shell.nix {};
    });

    apps = forEachSystem (system: pkgs: {
      default = {
        type = "app";
        program = "${packages.${system}.serve}/bin/serve";
      };
    });
  };
}
