{ config, pkgs, ... }:
{
  programs.mangohud.enable = true;
  programs.mangohud.enableSessionWide = true;
  
  home.packages = with pkgs; [
    osu-lazer-bin
    # lunar-client
    protonup-ng
  ];
  
  # MANGOHUD=1 gamemoderun DXVK_ASYNC=1 %command% -novid -high +fps_max 144
  # gamemoderun DXVK_ASYNC=1 %command%
}