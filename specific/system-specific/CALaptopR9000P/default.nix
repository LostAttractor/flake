{ ... }:
{
  networking.hostName = "CALaptopR9000P"; # Define hostname.

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';
}