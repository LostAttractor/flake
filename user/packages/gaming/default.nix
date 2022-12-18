{ config, pkgs, ... }:
{
  programs.mangohud.enable = true;
  programs.mangohud.enableSessionWide = true;
  
  home.packages = with pkgs; [
    # osu-lazer #体验很差 建议使用flatpak版
    # lunar-client
    protonup-ng
  ];
  
  # MANGOHUD=1 gamemoderun DXVK_ASYNC=1 %command% -novid -high +fps_max 144
  # gamemoderun DXVK_ASYNC=1 %command%
}