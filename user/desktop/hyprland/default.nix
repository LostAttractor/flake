{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    hyprpaper
    rofi-wayland
    mako
    gnome.nautilus
    networkmanagerapplet
  ];

  programs.kitty = {
    enable = true;
    theme = "Adwaita dark";
    settings.background_opacity = "0.95";
  };

  imports = [
    ./config.nix
    ./waybar
  ];
}