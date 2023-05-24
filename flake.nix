{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  };

  outputs = { nixpkgs, ... }: let
    inherit (nixpkgs.lib) getExe genAttrs;
    systems = ["x86_64-linux" "aarch64-linux"];
    pkgsFor = nixpkgs.legacyPackages;
    forEachSystem = f: genAttrs systems (system: f system pkgsFor.${system});
  in rec {
    packages = forEachSystem (system: pkgs: {
      # Drupal website
      default = pkgs.callPackage ./nix/default.nix { };
      # Script to serve the app
      serve = pkgs.callPackage ./nix/serve.nix { };
      # Script to run drush
      drush = pkgs.callPackage ./nix/drush.nix { };
    });
    apps = forEachSystem (system: pkgs: {
      default = { type = "app"; program = getExe packages.${system}.serve; };
    });
    devShells = forEachSystem (system: pkgs: {
      default = pkgs.callPackage ./nix/shell.nix { };
    });
  };
}
