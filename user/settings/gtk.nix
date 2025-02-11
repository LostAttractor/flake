{ pkgs, ... }:
{
  home.packages = with pkgs; [
    adw-gtk3
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "adw-gtk3-dark";
    };
  };
}
