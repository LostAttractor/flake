_:
{
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Papirus";
      cursor-theme = "breeze_cursors";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
  };
}