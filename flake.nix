{
  description = "Run hchuck release from GitHub";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        src = if pkgs.stdenv.isDarwin then
          pkgs.fetchzip {
            url = "https://github.com/aeldar/hchuck/releases/download/v0.1.0.1/hchuck-v0.1.0.1-macos.zip";
            sha256 = "sha256-AsRU4cYINtUdTYh/TwUsI90YXCE5OtW48pGI/EuDG6g=";
          }
        else
          pkgs.fetchzip {
            url = "https://github.com/aeldar/hchuck/releases/download/v0.1.0.1/hchuck-v0.1.0.1-ubuntu.zip";
            sha256 = "sha256-FRdqo1LWPZfi7Xf5/iZ9TRnXUHdN5qE2K1MwpaARUOY=";
          };
        hchuck = pkgs.stdenvNoCC.mkDerivation {
          pname = "hchuck";
          version = "0.1.0.1";
          src = src;
          installPhase = ''
            mkdir -p $out/bin
            cp hchuck $out/bin/
          '';
        };
      in {
        packages.default = hchuck;
        apps.default = {
          type = "app";
          program = "${hchuck}/bin/hchuck";
        };
      }
    );
}