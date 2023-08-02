#!/run/current-system/sw/bin/bash
set -x

# Xpad affects the work of the xbox controller and its wireless adapter
# The xpad will shake hands with the handle/wireless adapter when it is plugged in. At this time, 
# if you pass the usb device directly to the virtual machine, the xbox handle will not re-handshake with the root of windows,
# which will eventually cause it to fail to work.
# I can't find a way to make the usb device passthrough into the virtual machine from before/when it is plugged in,
# so I suggest you disable this driver if you need to use the gamepad in virtual machine
modprobe -r xpad

# Stop display manager
systemctl stop display-manager

sleep 5

# Unbind VTconsoles: might not be needed
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI Framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

sleep 3

# Unload NVIDIA kernel modules
modprobe -r nvidia_drm nvidia_modeset nvidia_uvm nvidia

# Unload AMD kernel module
modprobe -r amdgpu

# Detach GPU devices from host
# Use your GPU and HDMI Audio PCI host device
virsh nodedev-detach pci_0000_01_00_0
virsh nodedev-detach pci_0000_01_00_1
virsh nodedev-detach pci_0000_04_00_0
virsh nodedev-detach pci_0000_04_00_1

# Load vfio module
modprobe vfio_pci