{ ... }:
{
  imports = [
    ../../general/amd/virtualisation.nix
    ../../general/nvidia/open.nix
    # ../../general/nvidia/specialisation.nix
    ./modules/features/gpu-paththrough
  ];
}