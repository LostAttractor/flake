# https://astrid.tech/2022/09/22/0/nixos-gpu-vfio/
let
  # RTX 3070 Laptop
  # IOMMU Group 12:
	# 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA104M [GeForce RTX 3070 Mobile / Max-Q] [10de:24dd] (rev a1)
	# 01:00.1 Audio device [0403]: NVIDIA Corporation GA104 High Definition Audio Controller [10de:228b] (rev a1)
  gpuIDs = [
    "10de:24dd" # Graphics
    "10de:228b" # Audio
  ];
in 
{ lib, ... }:
{
  specialisation."GPUPaththrough".configuration = {
    system.nixos.tags = [ "Nvidia-GPU-vfio" "NoXpad" ];

    # The vfio modules before the nvidia modules is very intentional because it lets vfio claim my GPU before nvidia does.
    boot.initrd.kernelModules = [
      # vifo
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
      # Built into kernel at linux 6.2
      # "vfio_virqfd"
      # If you load nvidia driver in initrd, you need specific vfio load before nvidia driver
      # "nvidia"
      # "nvidia_modeset"
      # "nvidia_uvm"
      # "nvidia_drm"
    ];
    boot.kernelParams = [ 
      ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs) # vfio-pci
    ];
    # Xpad affects the work of the xbox controller and its wireless adapter
    # The xpad will shake hands with the handle/wireless adapter when it is plugged in. At this time, 
    # if you pass the usb device directly to the virtual machine, the xbox handle will not re-handshake with the root of windows,
    # which will eventually cause it to fail to work.
    # I can't find a way to make the usb device passthrough into the virtual machine from before/when it is plugged in,
    # so I suggest you disable this driver if you need to use the gamepad in virtual machine
    boot.blacklistedKernelModules = [ "xpad" ];
  };
}