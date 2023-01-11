{ config, pkgs, ... }:
{
  home.file.".local/share/flatpak/overrides/global".text = ''
    [Context]
    filesystems=/usr/share/fonts:ro;/usr/share/icons:ro
  '';
}