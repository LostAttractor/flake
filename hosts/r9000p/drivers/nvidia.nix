{ lib, pkgs, ... }:

{
  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
  ];

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
}
