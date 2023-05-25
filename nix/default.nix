{ callPackage, caddy, php, phpPackages, sqlite }:

let
  composerProject = callPackage ./composer-project.nix { } ../.;
in
  composerProject.overrideAttrs(oldAttrs: {
    buildInputs = oldAttrs.buildInputs ++ [
      caddy
      php
      phpPackages.composer
      sqlite
    ];
    installPhase = ''
      cp . $out
    '';
  })
