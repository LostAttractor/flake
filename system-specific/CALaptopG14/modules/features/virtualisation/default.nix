# You need kvm-intel / kvm-amd kernelModule for virtualisation
{ pkgs, config, ... }:
{
  boot.kernelParams = [ "amd_iommu=pt" ];  # Enable IOMMU
  boot.extraModprobeConfig = "options kvm_amd nested=1"; # nested virtualization
}