{ config, pkgs, ... }:

{
  hardware.nvidia = {
    prime = {
      offload.enable = true;
      # sync.enable = true; # sync mode
      # sync.allowExternalGpu = true;

      # Bus ID of the AMD GPU. You can find it using lspci, either under 3D or VGA
      amdgpuBusId = "PCI:6:0:0";

      # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
      nvidiaBusId = "PCI:1:0:0";
    };
    # powerManagement.finegrained = true;
  };
}