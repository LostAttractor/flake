{ pkgs, ... }:
{
  services.fprintd.enable = true;
  services.fprintd.package = (pkgs.fprintd.override { 
    libfprint = pkgs.libfprint.overrideAttrs (oldAttrs: rec {
      pname = "libfprint-goodix-521d";
      version = "unstable";

      src = pkgs.fetchFromGitHub {
        owner = "infinytum";
        repo = "libfprint";
        rev = "5e14af7f136265383ca27756455f00954eef5db1";
        sha256 = "sha256-MFhPsTF0oLUMJ9BIRZnSHj9VRwtHJxvWv0WT5zz7vDY=";
      };

      installCheckPhase = ''
        runHook preInstallCheck
        runHook postInstallCheck
      '';
      
      buildInputs = oldAttrs.buildInputs or [] ++ [
        pkgs.openssl
      ];
    });
  });
}
