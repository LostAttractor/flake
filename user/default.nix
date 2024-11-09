{ user, ... }:
{
  users = {
    # Don't allow mutation of users outside of the config.
    mutableUsers = false;
    users.${user} = {
      description = "ChaosAttractor";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "tss"
        "networkmanager"
        "docker"
        "libvirtd"
        "adbusers"
      ];
      # Set passwd directly
      initialHashedPassword = "$6$ER3vW7b0o74VUb5S$MhA3IXzTJpJMkfLXZiPjVHQdmHRQX9Axfi2G5nLJIS/Hm98rw7.Pd39JeVDgPrvWUUJZAH8BfSdHLMyJI2zLu/";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL2q0QKgzBS1DFGxmMEvzpz1X05GMidvmulyH/pd8zQA lostattractor@gmail.com"
      ];
    };
  };
}
