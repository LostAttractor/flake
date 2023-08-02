{ ... }:
{
  imports = [
    ./specialisation.nix
    ./hooks.nix
  ];

  boot.kernelParams = [ 
    "pcie_acs_override=downstream,multifunction" # PCI-E ACS (For paththrough iGPUs)
    # "video=efifb:off"
    # "vfio-pci.disable_vga=1" 
    # "vfio-pci.disable_idle_d3=1" 
  ];
}