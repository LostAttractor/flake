{ config, pkgs, ... }:
{
    services.flatpak.enable = true;
    #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}