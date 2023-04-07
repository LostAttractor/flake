{ ... }:
{
  networking.hostName = "CALaptopR9000P"; # Define hostname.

  imports = [
    ./modules/features/virtualisation
    ./modules/features/gpu-paththrough
  ];

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';
}