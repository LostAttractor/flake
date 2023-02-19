{ pkgs, ... }:
{
  networking.hostName = "CALaptop"; # Define hostname.

  programs.rog-control-center.enable = true;
  programs.rog-control-center.autoStart = true;

  services.asusd.enable = true;

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';
}