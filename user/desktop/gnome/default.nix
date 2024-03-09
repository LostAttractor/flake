{ pkgs, ... }:
{
  home.packages = (with pkgs.gnome; [
    gnome-tweaks
    dconf-editor
    gnome-sound-recorder
    gnome-power-manager
    polari
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    gsconnect
    blur-my-shell
    dock-from-dash
    caffeine
    pano
    vitals
    kimpanel
    # Extensions that no longer in use
    # openweather
    # tiling-assistant
    # burn-my-windows
  ]);

  imports = [
    ./dconf/display/hidpi.nix
    ./theme.nix
  ];
}