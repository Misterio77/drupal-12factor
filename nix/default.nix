{pkgs ? import <nixpkgs> {}}: let
  include = allowList: (path: type: builtins.any (pattern: (builtins.match "(.*/)?${pattern}(/.*)?" path) != null) allowList);
  project = pkgs.callPackage ./composer-project.nix {} (builtins.path {
    name = "source";
    path = ../.;
    filter = include [ "web" "composer.json" "composer.lock" ];
  });
in
  project.overrideAttrs (oldAttrs: {
    installPhase = ''
      # We're only interested in the libweb dir (the one we're currently in), move it to $out
      cp . $out -r
    '';
  })
