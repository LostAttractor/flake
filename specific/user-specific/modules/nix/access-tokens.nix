{ config, ...}:
{
  nix.extraOptions = ''
    !include ${config.sops.templates."nix-access-tokens".path}
  '';

  sops.templates."nix-access-tokens" = {
    content = ''
      access-tokens = github.com=${config.sops.placeholder."nix/access-tokens/github"}
    '';
    group = "wheel";
    mode = "0440";
  };

  sops.secrets."nix/access-tokens/github" = {};
}