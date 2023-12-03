{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    hyprpaper
    rofi-wayland
    mako
    gnome.nautilus
    networkmanagerapplet
  ];

  imports = [
    ./config.nix
    ./waybar
  ];
}