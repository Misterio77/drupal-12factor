{ callPackage }:

let
  composerProject = callPackage ./composer-project.nix { } ../.;
in
  composerProject.overrideAttrs(oldAttrs: {
    installPhase = "cp . $out";
  })
