{ config, pkgs, ... }:
{
  home.file.".local/share/flatpak/overrides/global".text = ''
    [Context]
    filesystems=/run/current-system/sw/share/X11/fonts:ro;/nix/store:ro;~/.local/share/fonts:ro
  '';
}