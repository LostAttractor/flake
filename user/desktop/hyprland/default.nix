{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    rofi-wayland
    mako
    nautilus
    networkmanagerapplet
  ];

  imports = [
    ./config.nix
    ./waybar
  ];
}
