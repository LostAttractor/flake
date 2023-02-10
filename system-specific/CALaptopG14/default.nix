{ pkgs, ... }:
{
  networking.hostName = "CALaptop"; # Define hostname.

  programs.rog-control-center.enable = true;
  programs.rog-control-center.autoStart = true;

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';
}