{ config, pkgs, user, ... }:
{
  fileSystems."/mnt/Windows" =
   { device = "/dev/disk/by-uuid/40E6AD00E6ACF6F6";
     fsType = "ntfs"; #ntfs(ntfs-3g) ntfs3
     options = [ "rw" "uid=1000" ];
     noCheck = true;
   };

  fileSystems."/mnt/Files" =
   { device = "/dev/disk/by-uuid/D246F12146F1074F";
     fsType = "ntfs"; 
     options = [ "rw" "uid=1000" ];
     noCheck = true;
   };
}
