# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # desktop platform
      ./platform/desktop.nix
      ./desktop/gnome
      # modules
      # basic
      ./modules/time.nix
      ./modules/network.nix
      ./modules/fonts.nix
      ./modules/filesystems.nix
      ./modules/shell.nix
      # nix
      ./modules/nix/optimise-store.nix
      ./modules/nix/substituters.nix
      # features/system
      ./modules/features/system/mobiledevice.nix
      ./modules/features/system/ssh.nix
      # features
      ./modules/features/flatpak.nix
      ./modules/features/gamepad.nix
      ./modules/features/virtualisation.nix
      ./modules/features/docker.nix
      # secrets
      ./secrets
      # package
      ./packages
      ./tests
      # user config
      ./user
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = lib.mkDefault "auto";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 180;
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
  # boot.tmp.cleanOnBoot = false;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
    "electron-22.3.27"
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" "ca-derivations" ];

  nix.settings.trusted-users = [ "root" "@wheel" ];

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.05"; # Did you read the comment?

}

