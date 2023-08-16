# You need kvm-intel / kvm-amd kernelModule for virtualisation
_:
{
  boot.kernelParams = [ "amd_iommu=on" ];  # Enable IOMMU
  boot.extraModprobeConfig = "options kvm_amd nested=1"; # nested virtualization
}