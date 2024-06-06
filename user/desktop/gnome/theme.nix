{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.breeze-qt5;
    name = "breeze_cursors";
    gtk.enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };
}