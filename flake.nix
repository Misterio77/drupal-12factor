{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  };

  outputs = { nixpkgs, ... }: let
    systems = ["x86_64-linux" "aarch64-linux"];
    forEachSystem = f: nixpkgs.lib.genAttrs systems (sys: f sys nixpkgs.legacyPackages.${sys});
  in {
    packages = forEachSystem (system: pkgs: {
      default = pkgs.callPackage ./nix { };
    });
  };
}
