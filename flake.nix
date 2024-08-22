{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in rec {
    packages.default = pkgs.php81.buildComposerProject rec {
      pname = "drupal-12f";
      version = "0.1";
      src = ./.;
      vendorHash = "sha256-u9rlPcpir2GXld0tmL6OtURBTTs9ya+9GR4yTEZt0Is=";
      composerNoScripts = false;
      composerNoPlugins = false;

      buildInputs = [ pkgs.php81 pkgs.sqlite pkgs.caddy ];
      postInstall = ''
        app=$out/share/php/$pname
        makeWrapper $app/bin/serve $out/bin/serve \
          --prefix PATH : ${pkgs.lib.makeBinPath buildInputs}
        makeWrapper $app/vendor/bin/drush $out/bin/drush \
          --prefix PATH : ${pkgs.lib.makeBinPath buildInputs} \
          --add-flags "--root=$app"
      '';
      meta.mainProgram = "serve";
    };
    devShells.default = pkgs.mkShell {
      name = "drupal-12f";
      inputsFrom = [ packages.default ];
      shellHook = ''
        export PATH=$PATH:$(pwd)/bin
      '';
    };
  });
}
