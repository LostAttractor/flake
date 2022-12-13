{ config, pkgs, ... }:
{
  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.opengl.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
  };

  # environment.sessionVariables = {
  #   __NV_PRIME_RENDER_OFFLOAD = "1";
  #   __VK_LAYER_NV_optimus = "NVIDIA_only"; 
  #   __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  # };

  # Optionally, you may need to select the appropriate driver version for your specific GPU.
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
}
