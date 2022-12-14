{ config, pkgs, ... }:
{
  imports =
    [ # Harware drivers
      ./drivers/amdgpu.nix
      ./drivers/nvidia.nix
      # Enable nvidia prime offload may cause x11 crash (wayland is ok)
      # ./drivers/nvidia-offload.nix  
      ./drivers/r9000p-edid/r9000p-edid.nix
      # Packages
      ./packages/prime-run.nix
    ];
}

