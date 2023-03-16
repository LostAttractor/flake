# You need kvm-intel / kvm-amd kernel module for virtualisation
{ pkgs, config, lib, ... }:
{
  virtualisation.libvirtd.enable = true;
  # virtualisation.libvirtd.qemu.ovmf.packages = lib.singleton (pkgs.OVMFFull.override { csmSupport = false; }).fd;
  virtualisation.libvirtd.qemu.ovmf.packages = [ (pkgs.OVMFFull.override { csmSupport = false; }).fd ];
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  hardware.opengl.enable = true;

  # https://www.reddit.com/r/NixOS/comments/ulzr88/creating_a_windows_11_vm_on_nixos_secure_boot/
  # https://linustechtips.com/topic/1379063-windows-11-in-virt-manager/
  # https://blog.csdn.net/qq_36393978/article/details/118390233
  # https://discourse.nixos.org/t/enable-secure-boot-for-qemu/15718/6
  # <loader readonly="yes" secure="yes" type="pflash">/etc/ovmf/edk2-x86_64-secure-code.fd</loader>
  # <nvram>/etc/ovmf/edk2-i386-vars.fd</nvram>
  # environment.etc = {
  #   "ovmf/edk2-x86_64-secure-code.fd" = {
  #     source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
  #   };

  #   "ovmf/edk2-i386-vars.fd" = {
  #     source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
  #     mode = "0644";
  #     user = "libvirtd";
  #   };
  # };
}