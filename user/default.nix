{ user, ... }:
{
  users.users.${user} = {
    description = "ChaosAttractor";
    isNormalUser = true;
    extraGroups = [ "wheel" "tss" "networkmanager" "docker" "libvirtd" "adbusers" ];  # Enable ‘sudo’ for the user.
    initialHashedPassword = "$6$ER3vW7b0o74VUb5S$MhA3IXzTJpJMkfLXZiPjVHQdmHRQX9Axfi2G5nLJIS/Hm98rw7.Pd39JeVDgPrvWUUJZAH8BfSdHLMyJI2zLu/"; # Set passwd directly
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL2q0QKgzBS1DFGxmMEvzpz1X05GMidvmulyH/pd8zQA lostattractor@gmail.com" ];
  };
}