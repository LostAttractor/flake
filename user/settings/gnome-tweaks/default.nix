_:
{
  dconf.enable = true;
  dconf.settings = {
    "org.gnome.desktop.interface" = {
      gtk-theme = "adw-gtk3-dark";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
  };
}