{
  description = "Run hchuck release from GitHub";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      hchuck = pkgs.stdenvNoCC.mkDerivation {
        pname = "hchuck";
        version = "0.1.0.1";
        src = pkgs.fetchzip {
          url = "https://github.com/aeldar/hchuck/releases/download/v0.1.0.1/hchuck-v0.1.0.1-ubuntu.zip";
          sha256 = "0000000000000000000000000000000000000000000000000000"; # <-- Replace after first build!
        };
        installPhase = ''
          mkdir -p $out/bin
          cp hchuck $out/bin/
        '';
      };
    in hchuck;

    apps.x86_64-linux.default = {
      type = "app";
      program = "${self.packages.x86_64-linux.default}/bin/hchuck";
    };
  };
}