{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };

  hardware.nvidia.modesetting.enable = true;
  hardware.opengl.enable = true;
}
