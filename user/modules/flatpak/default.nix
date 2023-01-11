{ config, pkgs, ... }:
{
  home.file.".local/share/flatpak/overrides/global".text = ''
    [Context]
    filesystems=/nix/store:ro;/run/current-system/sw/share/X11/fonts:ro;/run/current-system/sw/share/icons:ro;~/.local/share/fonts:ro;~/.local/share/icons:ro;/usr/share/fonts:ro;/usr/share/icons:ro
  '';
}