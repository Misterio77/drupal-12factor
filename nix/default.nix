{pkgs ? import <nixpkgs> {}}: let
  include = allowList: (path: type:
    builtins.any
    (pattern: (builtins.match "(.*/)?${pattern}(/.*)?" path) != null)
    allowList);
  src = builtins.path {
    name = "source";
    path = ../.;
    filter = include ["bin" "web" "composer.json" "composer.lock"];
  };
  project =
    pkgs.callPackage ./composer-project.nix {
      php = pkgs.php81;
      phpPackages = pkgs.php81Packages;
    }
    src;
in
  project.overrideAttrs (oldAttrs: rec {
    nativeBuildInputs = [pkgs.makeWrapper];
    buildInputs =
      oldAttrs.buildInputs
      ++ (with pkgs; [
        sqlite
        webfs
        coreutils
        which
      ]);
    installPhase = ''
      # We're only interested in the libweb dir (the one we're currently in), move it to $out
      cp . $out -r
      # Wrap the script
      wrapProgram $out/bin/serve --set PATH ${pkgs.lib.makeBinPath buildInputs}
    '';
    meta = {
      mainProgram = "serve";
    };
  })
