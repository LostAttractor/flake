{ config, pkgs, ... }:
{ 
  # May cause Edid Firmware loading to fail
  # [drm:drm_load_edid_firmware [drm]] *ERROR* Requesting EDID firmware "edid/edid.bin" failed (err=-2)
  # boot.initrd.kernelModules = [ "amdgpu" ];
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