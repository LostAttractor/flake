_:
{
  # Let Gnome use font in fontconfig
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      font-antialiasing = "rgba";
      font-name = "Sans 11";
      document-font-name = "Sans 11";
      monospace-font-name = "Monospace 10";
    };
    "org/gnome/desktop/wm/preferences" = {
      titlebar-font = "Sans Bold 11";
    };
  };
}