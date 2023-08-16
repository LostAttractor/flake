_:
{
  boot.initrd.luks.devices = {
    lvm-encrypted = {
      device = "/dev/disk/by-uuid/468b2786-745a-4937-9123-4f4e5ba58d12";
      allowDiscards = true;
    };
  };

  # Use systemd-cryptenroll to auto unlock luks partition
  boot.initrd.systemd.enable = true;
  boot.initrd.kernelModules = [ "tpm" "tpm_tis" "tpm_crb"];

  security.tpm2.enable = true;
  security.tpm2.tctiEnvironment.enable = true;
}
