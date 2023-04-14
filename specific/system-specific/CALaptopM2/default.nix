{ ... }:
{ 
  networking.hostName = "CALaptopM2"; # Define hostname.

  imports = [
    ./hardware-configuration.nix
  ];
}
