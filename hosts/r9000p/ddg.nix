{ config, pkgs, ... }:
{
  imports =
    [ # Harware drivers
      ./drivers/nvidia.nix
      ./drivers/r9000p-edid/r9000p-edid.nix
      # Packages
    ];
}

