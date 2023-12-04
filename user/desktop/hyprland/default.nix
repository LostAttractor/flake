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
  home.sessionVariables.SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh";

  imports = [
    ./config.nix
    ./waybar
  ];
}