{ callPackage }:

let
  composerProject = callPackage ./composer-project.nix { } ../.;
in
  composerProject.overrideAttrs(oldAttrs: {
    installPhase = ''
      mkdir -p $out
      cp -r web vendor composer.json composer.lock $out
    '';
  })
