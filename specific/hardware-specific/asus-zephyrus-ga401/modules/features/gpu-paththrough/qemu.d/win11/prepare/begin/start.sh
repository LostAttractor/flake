#!/run/current-system/sw/bin/bash
set -x

# Xpad affects the work of the xbox controller and its wireless adapter
# The xpad will shake hands with the handle/wireless adapter when it is plugged in. At this time, 
# if you pass the usb device directly to the virtual machine, the xbox handle will not re-handshake with the root of windows,
# which will eventually cause it to fail to work.
# I can't find a way to make the usb device passthrough into the virtual machine from before/when it is plugged in,
# so I suggest you disable this driver if you need to use the gamepad in virtual machine
modprobe -r xpad

# dGPU PCI slots
pci_slot="01:00"

# Determine whether the graphics card has been used by VFIO kernel modules
if [ -z "$(lspci -k -s $pci_slot | grep vfio_pci)" ]; then
    # Determine whether nvidia kernel modules has been loaded
    lsmod_result=$(lsmod | grep nvidia)
    if [ -n "$lsmod_result" ]; then
        # Stop display manager
        systemctl stop display-manager

        sleep 2

        # Unload NVIDIA kernel modules
        modprobe -r nvidia_drm nvidia_modeset nvidia_uvm nvidia

        # Unload AMD kernel module
        # modprobe -r amdgpu
    fi

    # Detach GPU devices from host
    # Use your GPU and HDMI Audio PCI host device
    virsh nodedev-detach pci_0000_01_00_0
    virsh nodedev-detach pci_0000_01_00_1

    # Load vfio module
    modprobe vfio_pci

    if [ -n "$lsmod_result" ]; then
        # Restart Display Manager
        systemctl start display-manager
    fi
fi