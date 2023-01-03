{ config, pkgs, ... }:
{
  home.packages = (with pkgs; [ 
    papirus-icon-theme
    adw-gtk3
    # (pkgs.callPackage ./layan-cursors { })
  ]) ++ (with pkgs.gnome; [
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
    hibernate-status-button
    ibus-tweaker
  ]);

  dconf = {
    enable = true;
    settings = {
      "org.gnome.desktop.interface" = {
        gtk-theme = "adw-gtk3-dark";
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
      };
    };
  };

  # environment.sessionVariables = { //GTK4
  #     GTK_THEME = "adw-gtk3-dark";
  # };
}