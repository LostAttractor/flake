{ config, pkgs, ... }:
{
    imports = [
        <home-manager/nixos>
        ./fish/fish.nix
        ./software/steam.nix
        ./software/vscode/vscode.nix
    ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.chaosattractor = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];  # Enable ‘sudo’ for the user.
    };

    home-manager.useUserPackages = true;

    home-manager.users.chaosattractor = { pkgs, ... }: {
        programs.home-manager.enable = true;

        home.stateVersion = "22.05";
        imports = [ ./home-manager/software.nix ];
    };

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
}