{ pkgs, ... }:
{
  home.packages =
    (with pkgs; [
      gnome-tweaks
      dconf-editor
      gnome-sound-recorder
      gnome-power-manager
    ])
    ++ (with pkgs.gnomeExtensions; [
      appindicator
      gsconnect
      blur-my-shell
      dock-from-dash
      caffeine
      pano
      astra-monitor
      miniview
      wiggle
      kimpanel
      # Extensions that no longer in use
      # openweather
      # tiling-assistant
      # burn-my-windows
    ]);

  imports = [
    ./dconf/gnome.nix
    ./dconf/fonts.nix
    ./dconf/display/hidpi.nix
    ./dconf/display/vrr.nix
    ./theme.nix
  ];
}
