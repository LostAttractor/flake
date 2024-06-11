{ config, ... }:
{
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
