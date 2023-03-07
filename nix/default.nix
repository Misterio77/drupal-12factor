{pkgs ? import <nixpkgs> {}}: let
  project = pkgs.callPackage ./composer-project.nix {} ../.;
in
  project.overrideAttrs (oldAttrs: {
    buildInputs = oldAttrs.buildInputs ++ [ pkgs.sqlite ];
    installPhase = ''
      rm composer.* flake.*
      rm nix -r
      # Move libweb to root, as we're not interested in binaries
      cp . $out -r
    '';
  })
