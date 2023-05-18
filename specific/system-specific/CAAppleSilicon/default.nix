{ ... }:
{ 
  networking.hostName = "CAAppleSilicon"; # Define hostname.

  imports = [
    ./hardware-configuration.nix
  ];
}
