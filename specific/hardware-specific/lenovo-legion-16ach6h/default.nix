{ config, pkgs, ... }:
{
  imports = [
    ../../general/amd/virtualisation.nix
    ../../general/nvidia/cuda.nix
    ../../general/nvidia/beta.nix
  ];

  boot.extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];

  environment.systemPackages = with pkgs; [ lenovo-legion ];
}
