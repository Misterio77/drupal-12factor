{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.default = with pkgs; php.buildComposerProject (f: {
      pname = "drupal-12factor";
      version = "0.1";
      src = ./.;
      vendorHash = "sha256-CfQYMIBiVMhbPXwVitS9yacmLxbfhQ+72igLScec8kA=";
      composerNoScripts = false;
      composerNoPlugins = false;
      installPhase = ''
        runHook preInstall

        mv $out/share/php/${f.pname} $out/app
        rm $out/share{/php,} -d
        makeWrapper $out/app/serve.sh $out/bin/${f.pname} --prefix PATH : ${lib.makeBinPath [php caddy sqlite]}

        runHook postInstall
      '';
    });
  });
}
