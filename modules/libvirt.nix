{ config, pkgs, ... }:
{
  # programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModprobeConfig = "options kvm_amd nested=1"; # 启用 KVM
  # 如果使用 Intel 的芯片，将上行代码中的 kvm_amd 改为 kvm_intel
}