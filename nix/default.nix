{pkgs ? import <nixpkgs> {}}: let
  project = pkgs.callPackage ./composer-project.nix {} ../.;
in
  project.overrideAttrs (oldAttrs: {
    buildInputs = oldAttrs.buildInputs ++ [pkgs.sqlite];
    installPhase = ''
      rm composer.* flake.* serve.sh
      rm nix -r
      # Move libweb to root
      cp . $out -r
      ln -s $out/vendor/bin $out/bin
    '';
  })
