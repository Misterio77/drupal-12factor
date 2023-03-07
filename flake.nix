{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    systems = ["x86_64-linux" "aarch64-linux"];
    forEachSystem = f: nixpkgs.lib.genAttrs systems (sys: f sys nixpkgs.legacyPackages.${sys});
  in rec {
    packages = forEachSystem (system: pkgs: rec {
      default = pkgs.callPackage ./nix/default.nix {};
      serve = pkgs.writeShellScriptBin "serve" ''
        ${pkgs.php}/bin/php -S localhost:8000 -t ${default}/web "$@"
      '';
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
