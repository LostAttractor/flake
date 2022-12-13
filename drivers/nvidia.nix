{ config, pkgs, ... }:
{
  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.opengl.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = true;
    };
  };

  # Optionally, you may need to select the appropriate driver version for your specific GPU.
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
}
