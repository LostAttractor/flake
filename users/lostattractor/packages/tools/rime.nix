{ config, pkgs, ... }:
{
  xdg.configFile."ibus/rime".recursive = true;
  xdg.configFile."ibus/rime".source = pkgs.fetchFromGitHub ({
    owner = "LostAttractor";
    repo = "ca-rime-config";
    rev = "b19df49b924a8d5e6ff5f35e987954382fd23755";
    sha256 = "sha256-qqjTgwSEILuj6PRuK0wnI6ehZwNjML9fFFzFC4My++8=";
  });
}