{ config, pkgs, ... }:
{
    programs.xwayland.enable = true;
    environment.sessionVariables = {
        # NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
        QT_QPA_PLATFORM="wayland;xcb";
    };
}