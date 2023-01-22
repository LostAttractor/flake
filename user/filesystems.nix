_:
{
  fileSystems."/mnt/Windows" =
   { device = "/dev/disk/by-uuid/88103C73103C69F8";
     fsType = "ntfs3"; #ntfs(ntfs-3g) ntfs3
     options = [ "rw" "uid=1000" ];
     noCheck = true;
   };

  fileSystems."/mnt/Files" =
   { device = "/dev/disk/by-uuid/D246F12146F1074F";
     fsType = "ntfs3"; 
     options = [ "rw" "uid=1000" ];
     noCheck = true;
   };
}
