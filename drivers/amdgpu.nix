{ config, pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    # extraPackages = with pkgs; [
    #   # amdvlk
    #   # rocm-opencl-icd
    # ];
  };
}