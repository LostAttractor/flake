_: {
  # This module is broken now
  services.fprintd.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      libfprint = prev.libfprint.overrideAttrs (
        oldAttrs: with prev; {
          pname = "libfprint-goodix-521d";
          version = "unstable";

          src = fetchFromGitHub {
            owner = "lostattractor";
            repo = "libfprint";
            rev = "abf8dffabfcc7373d4562c151d41a6c7e087ee41";
            sha256 = "sha256-TEU/c3IfNL53vvEbA/ZSfq6ZKuo1g3alBIF1957ZVec=";
          };

          buildInputs = oldAttrs.buildInputs or [ ] ++ [ openssl ];
        }
      );
    })
  ];
}
