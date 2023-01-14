{ config, pkgs, ... }:
{
  boot.supportedFilesystems = [ "ntfs" ]; # ntfs-3g
  # services.udev.extraRules = ''
  #   SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="ntfs", ENV{ID_FS_TYPE}="ntfs3"
  # '';
}
