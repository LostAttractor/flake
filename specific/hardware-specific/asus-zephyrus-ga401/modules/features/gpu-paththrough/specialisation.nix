# https://astrid.tech/2022/09/22/0/nixos-gpu-vfio/
let
  # RTX 3060 Laptop
  # IOMMU Group 8:
  # 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA106M [GeForce RTX 3060 Mobile / Max-Q] [10de:2520] (rev a1)
  # 01:00.1 Audio device [0403]: NVIDIA Corporation GA106 High Definition Audio Controller [10de:228e] (rev a1)
  gpuIDs = [
    "10de:2520" # Graphics
    "10de:228e" # Audio
  ];
in 
{ lib, ... }:
{
  specialisation."GPUPaththrough".configuration = {
    system.nixos.tags = [ 
      "Nvidia-GPU-VFIO"
      # "NoXpad"
      ];

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
      ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs) # vfio devices
    ];

    # Xpad affects the work of the xbox controller and its wireless adapter
    # The xpad will shake hands with the handle/wireless adapter when it is plugged in. At this time, 
    # if you pass the usb device directly to the virtual machine, the xbox handle will not re-handshake with the root of windows,
    # which will eventually cause it to fail to work.
    # I can't find a way to make the usb device passthrough into the virtual machine from before/when it is plugged in,
    # so I suggest you disable this driver if you need to use the gamepad in virtual machine

    # Now using libvirt hooks to unload xpad dynamicly
    # boot.blacklistedKernelModules = [ "xpad" ];
  };
}