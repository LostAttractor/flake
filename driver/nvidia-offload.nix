{ config, pkgs, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
{
	environment.systemPackages = [ nvidia-offload ];
	hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;

  hardware.nvidia.prime = {
    offload.enable = true;
    sync.enable = false; # 类似显卡直通

    # Bus ID of the AMD GPU. You can find it using lspci, either under 3D or VGA
    amdgpuBusId = "PCI:6:0:0";

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:1:0:0";
  };
}