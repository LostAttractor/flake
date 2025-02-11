{ config, ... }:
{
  xdg.dataFile."flatpak/overrides/global".text = ''
    [Context]
    filesystems=/nix/store:ro;${config.xdg.dataHome}/fonts:ro;${config.home.homeDirectory}/.icons:ro;xdg-config/gtk-3.0;xdg-config/gtk-4.0
  '';
}
