{ pkgs, config, ... }:
{
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.ovmf.packages = [ (pkgs.OVMFFull.override { secureBoot = true; tpmSupport = true; }).fd ];
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelParams = [ "amd_iommu=on" ];  # Enable IOMMU
  boot.extraModprobeConfig = "options kvm_amd nested=1"; # nested virtualization

  # https://www.reddit.com/r/NixOS/comments/ulzr88/creating_a_windows_11_vm_on_nixos_secure_boot/
  # https://linustechtips.com/topic/1379063-windows-11-in-virt-manager/
  # https://blog.csdn.net/qq_36393978/article/details/118390233
  # <loader readonly="yes" secure="yes" type="pflash">/etc/ovmf/edk2-x86_64-secure-code.fd</loader>
  # <nvram>/etc/ovmf/edk2-i386-vars.fd</nvram>
  environment.etc = {
    "ovmf/edk2-x86_64-secure-code.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
    };

    "ovmf/edk2-i386-vars.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
      mode = "0644";
      user = "libvirtd";
    };
  };

  imports = [ ./gpu-paththrough.nix ];
}