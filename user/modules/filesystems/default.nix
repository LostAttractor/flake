{ user, ... }:
{
  fileSystems."/run/media/${user}/Files" =
    { device = "/dev/disk/by-uuid/f177fc67-c5a4-4ab9-abd1-6d9ec94ed446";
      fsType = "btrfs";
      options = [ "compress=zstd" ];
    };
}
