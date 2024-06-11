{ config, user, ... }:
let
  looking-glass-client-config = ''
    [app]
    shmFile=/dev/kvmfr0

    [win]
    fullScreen=yes

    [input]
    escapeKey=97

    [spice]
    captureOnStart=yes
  '';
in
{
  boot = {
    kernelModules = [ "kvmfr" ];
    extraModulePackages = with config.boot.kernelPackages; [ kvmfr ];
    extraModprobeConfig = ''
      options kvmfr static_size_mb=64
    '';
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="kvmfr", OWNER="${user}", GROUP="kvm", MODE="0660"
  '';

  virtualisation.libvirtd.qemu.verbatimConfig = ''
    namespaces = []
    cgroup_device_acl = [
      "/dev/null", "/dev/full", "/dev/zero",
      "/dev/random", "/dev/urandom",
      "/dev/ptmx", "/dev/kvm",
      "/dev/kvmfr0"
    ]
  '';

  environment.etc."looking-glass-client.ini".text = looking-glass-client-config;
}
