{ config, pkgs, user, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" "adbusers" ];  # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  fileSystems."/mnt/Windows" =
    { device = "/dev/disk/by-uuid/40E6AD00E6ACF6F6";
      fsType = "ntfs3"; 
      options = [ "rw" "uid=1000" ];
    };

  fileSystems."/mnt/Files" =
    { device = "/dev/disk/by-uuid/D246F12146F1074F";
      fsType = "ntfs3"; 
      options = [ "rw" "uid=1000" ];
    };
}
