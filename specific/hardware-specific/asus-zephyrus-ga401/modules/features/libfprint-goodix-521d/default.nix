{ pkgs, ... }:
with pkgs;
{
  services.fprintd.enable = true;
  services.fprintd.package = fprintd.override {
    libfprint = pkgs.libfprint.overrideAttrs (oldAttrs: {
      pname = "libfprint-goodix-521d";
      version = "unstable";

      src = pkgs.fetchFromGitHub {
        owner = "lostattractor";
        repo = "libfprint";
        rev = "abf8dffabfcc7373d4562c151d41a6c7e087ee41";
        sha256 = "sha256-TEU/c3IfNL53vvEbA/ZSfq6ZKuo1g3alBIF1957ZVec=";
      };

      buildInputs = oldAttrs.buildInputs or [ ] ++ [ openssl ];
    });
  };
}
