{ config, lib, pkgs, ... }:

{
  # May cause Edid Firmware loading to fail
  # [drm:drm_load_edid_firmware [drm]] *ERROR* Requesting EDID firmware "edid/edid.bin" failed (err=-2)
  # boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
    amdvlk
  ];

  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

  hardware.opengl = {
    driSupport = lib.mkDefault true;
    driSupport32Bit = lib.mkDefault true;
  };

  environment.variables.AMD_VULKAN_ICD = lib.mkDefault "RADV";
}
