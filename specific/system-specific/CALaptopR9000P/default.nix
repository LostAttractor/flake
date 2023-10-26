_:
{
  networking.hostName = "CALaptopR9000P"; # Define hostname.

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';

  nix.settings.cores = 15; # Reserve one core to prevent the system from freezing
}