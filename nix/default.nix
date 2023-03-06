{pkgs ? import <nixpkgs> {}}: let
  project = pkgs.callPackage ./composer-project.nix {} ../.;
in
  project.overrideAttrs (oldAttrs: {
    installPhase = ''
      rm composer.* flake.*
      rm nix -r
      cp . $out -r
    '';
  })
