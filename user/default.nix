{ pkgs, user, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "tss" "networkmanager" "docker" "libvirtd" "adbusers" ];  # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
    initialHashedPassword = "$6$ER3vW7b0o74VUb5S$MhA3IXzTJpJMkfLXZiPjVHQdmHRQX9Axfi2G5nLJIS/Hm98rw7.Pd39JeVDgPrvWUUJZAH8BfSdHLMyJI2zLu/";
  };
}
