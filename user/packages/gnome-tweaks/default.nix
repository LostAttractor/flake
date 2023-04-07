{ pkgs, ... }:
{
  home.packages = (with pkgs.gnome; [
    gnome-tweaks
    gnome-todo
    dconf-editor
    gnome-power-manager
    gnome-sound-recorder
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    gsconnect
    # clipboard-history
    blur-my-shell
    dock-from-dash
    openweather
    ibus-tweaker
    caffeine
  ]);
}