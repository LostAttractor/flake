{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    hyprpaper
    rofi-wayland
    mako
    gnome.nautilus
    networkmanagerapplet
  ];

  services.gnome-keyring.enable = true;

  imports = [
    ./config.nix
    ./waybar
  ];
}