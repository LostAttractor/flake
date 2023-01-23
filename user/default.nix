{ pkgs, user, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" "adbusers" ];  # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  imports = [
    ./modules/filesystems
  ];
}
