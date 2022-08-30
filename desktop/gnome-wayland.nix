{ config, pkgs, ... }:
{
    services.xserver.displayManager.gdm.wayland = true;
}