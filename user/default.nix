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
        "plugdev"
      ];
      # Set passwd directly
      initialHashedPassword = "$6$ER3vW7b0o74VUb5S$MhA3IXzTJpJMkfLXZiPjVHQdmHRQX9Axfi2G5nLJIS/Hm98rw7.Pd39JeVDgPrvWUUJZAH8BfSdHLMyJI2zLu/";
      openssh.authorizedKeys.keys = [
        # TPM-Protected Key
        "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBC5HypvbsI4xvwfd4Uw7D+SV0AevYPS/nCarFwfBwrMHKybbqUJV1cLM1ySZPxXcZD7+3m48Riiwlssh6o7WM/M= openpgp:0xDE4C24F6"
        # Generic Key
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL2q0QKgzBS1DFGxmMEvzpz1X05GMidvmulyH/pd8zQA lostattractor@gmail.com"
      ];
    };
  };
}
