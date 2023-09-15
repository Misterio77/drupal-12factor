{ lib, callPackage, caddy, php, phpPackages, sqlite, makeWrapper }:

let
  composerProject = callPackage ./composer-project.nix { } ../.;
in
  composerProject.overrideAttrs(finalAttrs: prevAttrs: {
    # Runtime deps
    buildInputs = prevAttrs.buildInputs ++ [
      php
      caddy
      sqlite
    ];
    # Build deps
    nativeBuildInputs = [
      php
      phpPackages.composer
      makeWrapper
    ];

    installPhase = let
      binName = finalAttrs.meta.mainProgram or finalAttrs.pname or finalAttrs.name;
    in ''
      mkdir -p $out
      cp -r . $out/app
      makeWrapper $out/app/serve.sh $out/bin/${binName} --prefix PATH : ${lib.makeBinPath finalAttrs.buildInputs} \
    '';
  })
