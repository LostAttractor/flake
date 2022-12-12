{ config, pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.opengl.driSupport = true;
  
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
    # rocm-opencl-icd
  ];
  # environment.variables.VK_ICD_FILENAMES =
  #   "/run/opengl-driver/share/vulkan/icd.d/amd_icd64.json";
}