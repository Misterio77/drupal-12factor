{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages = {
      default = pkgs.php81.buildComposerProject rec {
        pname = "drupal-12factor";
        version = "0.1";
        src = ./.;
        vendorHash = "sha256-r02U4yThstgaPhUelI8I9dT4ZnyJxWYuPKgUL9WZbJY=";
        composerNoScripts = false;
        composerNoPlugins = false;

        nativeBuildInputs = [ pkgs.php81 pkgs.caddy pkgs.sqlite ];
        installPhase = ''
          runHook preInstall
          app=$out/share/php/${pname}
          makeWrapper $app/bin/serve $out/bin/${pname} --prefix PATH : ${pkgs.lib.makeBinPath nativeBuildInputs}
          makeWrapper $app/bin/drush $out/bin/drush --prefix PATH : ${pkgs.lib.makeBinPath nativeBuildInputs}
          runHook postInstall
        '';
      };
    };
  });
}
