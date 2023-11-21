{ user, ... }:
{
  networking.hostName = "CALaptopG14"; # Define hostname.

  programs.rog-control-center.enable = true;
  programs.rog-control-center.autoStart = true;

  # Btrfs stub
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  # Vamillo Kerborad
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';

  # Torchpad is so slow
  home-manager.users.${user}.dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      speed = 0.2;
    };
  };

   # Reserve one core to prevent the system from freezing
  nix.settings.cores = 15;

  # Enable ZRAM
  zramSwap.enable = true;

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Featrues
    ./modules/features/rathole
  ];
}