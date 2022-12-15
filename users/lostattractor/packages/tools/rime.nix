{ config, pkgs, ... }:
{
  xdg.configFile."ibus/rime".recursive = true;
  xdg.configFile."ibus/rime".source = pkgs.fetchFromGitHub ({
    owner = "LostAttractor";
    repo = "ca-rime-config";
    rev = "a6d34628e4c5cb55ea47ed00b61da434ece77f13";
    sha256 = "sha256-o9X8eLuvvYnUxfeNQp7iTVTbIJwED4s7+ZbHxq5jJqQ=";
  });
}