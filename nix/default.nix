{pkgs ? import <nixpkgs> {}}: let
  include = allowList: (path: type:
    builtins.any
    (pattern: (builtins.match "(.*/)?${pattern}(/.*)?" path) != null)
    allowList);
  src = builtins.path {
    name = "source";
    path = ../.;
    filter = include ["web" "composer.json" "composer.lock"];
  };
  project =
    pkgs.callPackage ./composer-project.nix {
      php = pkgs.php81;
      phpPackages = pkgs.php81Packages;
    }
    src;
in
  project.overrideAttrs (oldAttrs: {
    installPhase = ''
      # We're only interested in the libweb dir (the one we're currently in), move it to $out
      cp . $out -r
    '';
  })
