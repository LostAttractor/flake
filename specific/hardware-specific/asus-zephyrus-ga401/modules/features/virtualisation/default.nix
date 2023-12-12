# You need kvm-intel / kvm-amd kernelModule for virtualisation
_:
{
  # AMD IOMMU is enabled by default
  # https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Enabling_IOMMU
  boot.extraModprobeConfig = "options kvm_amd nested=1"; # nested virtualization
}