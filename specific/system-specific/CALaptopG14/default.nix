{ user, ... }:
{
  networking.hostName = "CALaptopG14"; # Define hostname.

  programs.rog-control-center.enable = true;
  programs.rog-control-center.autoStart = true;

  services.asusd.enable = true;

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';

  home-manager.users.${user}.dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      speed = 0.2;
    };
  };

  nix.settings.cores = 15; # Reserve one core to prevent the system from freezing

  # Enable ZRAM
  zramSwap.enable = true;

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/features/luks
    ./modules/features/rathole
  ];
}