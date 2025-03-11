{ lib, ... }:
{
    fileSystems."/" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [ "mode=755" ];
  };

  fileSystems."/persistent".neededForBoot = true;

  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/nvme0n1";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          size = "512M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };
        luks = {
          end = "-${lib.toString 32+320}G";
          content = {
            type = "luks";
            name = "crypted";
            passwordFile = "/tmp/secret.key"; # Interactive
            settings.allowDiscards = true;
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "/persistent" = {
                  mountpoint = "/persistent";
                  mountOptions = [ "compress=zstd" "discard=async" ];
                };
                "/root" = {
                  mountpoint = "/root";
                  mountOptions = [ "compress=zstd" "discard=async" ];
                };
                "/home" = {
                  mountpoint = "/home";
                  mountOptions = [ "compress=zstd" "discard=async" ];
                };
                "/nix" = {
                  mountpoint = "/nix";
                  mountOptions = [ "compress=zstd" "discard=async" "noatime" ];
                };
              };
            };
          };
        };
        encryptedSwap = {
          end = "-320G";
          content = {
            type = "swap";
            randomEncryption = true;
            discardPolicy = "both";
          };
        };
      };
    };
  };

  services.beesd.filesystems.root = {
    spec = "/dev/mapper/crypted";
    hashTableSizeMB = 128; # 128K extent size for 1TB
    verbosity = "crit";
    extraOptions = [ "--loadavg-target" "5.0" ];
  };
}