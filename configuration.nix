# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports = [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ./driver/amd.nix
        ./driver/nvidia.nix
        ./driver/nvidia-offload.nix
        ./driver/r9000p/r9000p.nix
        ./platform/desktop.nix
        ./desktop/gnome.nix
        ./desktop/gnome-tweaks.nix
        ./module/basic.nix
        ./module/fish.nix
        ./module/language.nix
        ./module/substituters.nix
        ./module/wayland.nix
        ./module/develop.nix
        ./module/docker.nix
        ./module/libvirt.nix
        ./module/flatpak.nix
        ./users/software/software.nix
        ./users/chaosattractor/user.nix
    ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_zen; #使用Linux-zen内核

    networking.hostName = "CALaptop"; # Define your hostname.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    system.autoUpgrade.enable = true; # 自动更新
    nix.settings.auto-optimise-store = true; # 使用硬链接优化store

    nix.extraOptions = ''
        experimental-features = nix-command flakes
    '';

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    networking.firewall.enable = false; #关闭防火墙,部分软件会因为防火墙无法正常工作

    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # system.copySystemConfiguration = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leavec
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.05"; # Did you read the comment?

}

