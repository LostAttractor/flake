{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    papirus-icon-theme
    adw-gtk3
  ])++ (with pkgs.gnome; [
    gnome-tweaks
    dconf-editor
    gnome-todo
    gnome-sound-recorder
    gnome-power-manager
    polari
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    gsconnect
    blur-my-shell
    dock-from-dash
    openweather
    caffeine
    tiling-assistant
    pano
    burn-my-windows
    vitals
    kimpanel
  ]);
}