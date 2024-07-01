{ pkgs, ... }:
{
  services.gnome.gnome-keyring.enable = true;
  services.dbus.packages = [ pkgs.gcr ];
}
