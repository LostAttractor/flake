_:
{
  networking.hostName = "CALaptopR9000P"; # Define hostname.

  nix.settings.cores = 15; # Reserve one core to prevent the system from freezing

  imports = [
    ../../general/linux/zram.nix
    ../../general/keyboard/vamillo.nix
  ];
}