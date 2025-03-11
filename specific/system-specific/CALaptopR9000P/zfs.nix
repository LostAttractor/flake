{
  config,
  lib,
  pkgs,
  ...
}:

let
  zfsCompatibleKernelPackages = lib.filterAttrs (
    name: kernelPackages:
    (builtins.match "linux_[0-9]+_[0-9]+" name) != null
    && (builtins.tryEval kernelPackages).success
    && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
  ) pkgs.linuxKernel.packages;
  latestKernelPackage = lib.last (
    lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
      builtins.attrValues zfsCompatibleKernelPackages
    )
  );
in
{
  boot = {
    # Note this might jump back and forth as kernels are added or removed.
    kernelPackages = latestKernelPackage;
    supportedFilesystems = [ "zfs" ];
    zfs.package = pkgs.zfs_unstable;
    kernelParams = [
      # https://github.com/openzfs/zfs/issues/9910
      "init_on_alloc=0"
    ];
  };

  services.zfs = {
    autoScrub.enable = true;
    autoSnapshot.enable = true;
  };

  networking.hostId = "007f0200";
}