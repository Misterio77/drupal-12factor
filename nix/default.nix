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
      cp -r . $out
      makeWrapper $out/bin/serve $out/bin/${binName} \
        --prefix PATH : ${lib.makeBinPath finalAttrs.buildInputs}
    '';
  })
