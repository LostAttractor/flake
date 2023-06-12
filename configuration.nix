# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # desktop platform
      ./platform/desktop.nix
      ./desktop/gnome
      # modules
      # basic
      ./modules/i18n.nix
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
      ./modules/features/xone.nix
      ./modules/features/virtualisation.nix
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
  boot.loader.timeout = 180; # 3min
  boot.bootspec.enable = true;
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_zen; #Linux-zen
  # boot.cleanTmpDir = false;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1u"
  ];

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

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

