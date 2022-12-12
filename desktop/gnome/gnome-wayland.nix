{ config, pkgs, ... }:
{
    programs.xwayland.enable = true;
    environment.sessionVariables = {
        QT_QPA_PLATFORM = "wayland;xcb";
        NIXOS_OZONE_WL = "1";
    };
}