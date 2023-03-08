{pkgs ? import <nixpkgs> {}}: let
  project = pkgs.callPackage ./composer-project.nix {} ../.;
in
  project.overrideAttrs (oldAttrs: {
    buildInputs = oldAttrs.buildInputs ++ [pkgs.sqlite];
    # Export php package
    php = builtins.head oldAttrs.buildInputs;
    # Export binaries from dependencies
    utils = pkgs.runCommand "${oldAttrs.name}-utils" {} ''
      mkdir -p $out
      ln -s ${project}/libexec/*/vendor/bin $out/
    '';

    installPhase = ''
      rm composer.* flake.* serve.sh
      rm nix -r
      # Move libweb to root, as we're not interested in binaries
      cp . $out -r
    '';
  })
