# You need kvm-intel / kvm-amd kernel module for virtualisation
{ pkgs, ... }:
{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
  };

  # https://www.reddit.com/r/NixOS/comments/ulzr88/creating_a_windows_11_vm_on_nixos_secure_boot/
  # https://linustechtips.com/topic/1379063-windows-11-in-virt-manager/
  # https://blog.csdn.net/qq_36393978/article/details/118390233
  # https://discourse.nixos.org/t/enable-secure-boot-for-qemu/15718/6
  # <loader readonly="yes" secure="yes" type="pflash">/etc/ovmf/edk2-x86_64-secure-code.fd</loader>
  # <nvram>/etc/ovmf/edk2-i386-vars.fd</nvram>
}