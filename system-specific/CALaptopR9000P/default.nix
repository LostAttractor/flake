{ ... }:
{
  networking.hostName = "CALaptopR9000P"; # Define hostname.

  imports = [
    ./modules/features/rathole
    ./modules/features/gpu-paththrough
  ];
}