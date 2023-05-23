{ ... }:
{
  specialisation."NvidiaOpen".configuration = {
    system.nixos.tags = [ "Nvidia-Open-Driver" ];

    hardware.nvidia.open = true;
  };
}