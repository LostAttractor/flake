{ config, pkgs, lib, ... }:
{
  services.power-profiles-daemon.enable = lib.mkForce false;
  services.tlp.enable = true;
  powerManagement.powertop.enable = true;
}
