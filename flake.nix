{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  };

  outputs = { nixpkgs, ... }: let
    systems = ["x86_64-linux" "aarch64-linux"];
    pkgsFor = nixpkgs.legacyPackages;
    forEachSystem = f: nixpkgs.lib.genAttrs systems (system: f system pkgsFor.${system});
  in {
    packages = forEachSystem (system: pkgs: {
      default = pkgs.callPackage ./nix/default.nix { };
    });
  };
}
