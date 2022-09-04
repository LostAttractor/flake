{ config, pkgs, ... }:

let
    nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
        __NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"
    '';
in
{
	environment.systemPackages = [ nvidia-offload ];
    # hardware.nvidia.powerManagement.enable = true;

    hardware.nvidia.prime = {
        offload.enable = true;
        # sync.enable = true; # 类似显卡直通

        # Bus ID of the AMD GPU. You can find it using lspci, either under 3D or VGA
        amdgpuBusId = "PCI:6:0:0";

        # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
        nvidiaBusId = "PCI:1:0:0";
    };
}