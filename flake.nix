{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-22.11";
    };
    composer2nix = {
      url = "github:svanderburg/composer2nix";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    composer2nix,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux"];
    forEachSystem = f: nixpkgs.lib.genAttrs systems (sys: f sys nixpkgs.legacyPackages.${sys});
  in {
    packages = forEachSystem (system: pkgs: {
      default = pkgs.callPackage ./php-packages.nix {
        composerEnv = pkgs.callPackage "${composer2nix}/src/Composer2Nix/composer-env.nix" {};
      };
    });
  };
}
